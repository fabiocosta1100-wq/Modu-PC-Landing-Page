param(
    [string]$ExcelPath = (Join-Path $PSScriptRoot '..\private\MODU_PCs_Orcamento.xlsx')
)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem
$ExcelPath = [System.IO.Path]::GetFullPath($ExcelPath)
$outputPath = Join-Path $PSScriptRoot '..\js\builds.js'

if (-not (Test-Path -LiteralPath $ExcelPath)) {
    throw "Não encontrei o Excel em '$ExcelPath'. Coloca uma cópia privada do ficheiro nessa pasta ou executa: .\scripts\Atualizar-MODUBuilds.ps1 -ExcelPath 'C:\caminho\para\o\teu\ficheiro.xlsx'"
}

function Read-ZipXml {
    param([object]$Archive, [string]$Path)
    $entry = $Archive.GetEntry($Path)
    if (-not $entry) { throw "O Excel não contém '$Path'." }
    $reader = [System.IO.StreamReader]::new($entry.Open())
    try { [xml]$xml = $reader.ReadToEnd(); return $xml }
    finally { $reader.Dispose() }
}

function Get-NamespaceManager {
    param([xml]$Xml)
    $manager = [System.Xml.XmlNamespaceManager]::new($Xml.NameTable)
    $manager.AddNamespace('x', 'http://schemas.openxmlformats.org/spreadsheetml/2006/main')
    $manager.AddNamespace('r', 'http://schemas.openxmlformats.org/package/2006/relationships')
    return ,$manager
}

function Get-CellValue {
    param([xml]$SheetXml, [System.Xml.XmlNamespaceManager]$Manager, [string[]]$SharedStrings, [string]$Address)
    $cell = $SheetXml.DocumentElement.SelectSingleNode("//x:c[@r='$Address']", $Manager)
    if (-not $cell) { return $null }
    $type = $cell.GetAttribute('t')
    if ($type -eq 's') {
        $index = [int]$cell.SelectSingleNode('x:v', $Manager).InnerText
        return $SharedStrings[$index]
    }
    if ($type -eq 'inlineStr') { return $cell.SelectSingleNode('x:is/x:t', $Manager).InnerText }
    $valueNode = $cell.SelectSingleNode('x:v', $Manager)
    if ($valueNode) { return $valueNode.InnerText }
    return $null
}

function Get-RequiredText {
    param([object]$Value, [string]$Label, [string]$SheetName, [string]$Address)
    $text = ([string]$Value).Trim()
    if ([string]::IsNullOrWhiteSpace($text)) { throw "Falta preencher '$Label' na folha '$SheetName' (célula $Address)." }
    return $text
}

function Get-BuildData {
    param([xml]$SheetXml, [System.Xml.XmlNamespaceManager]$Manager, [string[]]$SharedStrings, [string]$SheetName)
    $rawPrice = Get-CellValue $SheetXml $Manager $SharedStrings 'B37'
    $priceNumber = 0.0
    if (-not [double]::TryParse([string]$rawPrice, [Globalization.NumberStyles]::Any, [Globalization.CultureInfo]::InvariantCulture, [ref]$priceNumber) -or $priceNumber -le 0) {
        throw "Falta preencher o preço de venda na folha '$SheetName' (célula B37)."
    }
    $ram = Get-RequiredText (Get-CellValue $SheetXml $Manager $SharedStrings 'B14') 'RAM' $SheetName 'B14'
    $ssd = Get-RequiredText (Get-CellValue $SheetXml $Manager $SharedStrings 'B15') 'SSD' $SheetName 'B15'
    $price = [math]::Round($priceNumber, 0).ToString('N0', [Globalization.CultureInfo]::GetCultureInfo('pt-PT'))
    return [ordered]@{
        price = "$price€"
        cpu = Get-RequiredText (Get-CellValue $SheetXml $Manager $SharedStrings 'B11') 'CPU' $SheetName 'B11'
        gpu = Get-RequiredText (Get-CellValue $SheetXml $Manager $SharedStrings 'B12') 'GPU' $SheetName 'B12'
        base = "$ram · $ssd"
    }
}

$archive = [System.IO.Compression.ZipFile]::OpenRead($ExcelPath)
try {
    $workbookXml = Read-ZipXml $archive 'xl/workbook.xml'
    $workbookManager = Get-NamespaceManager $workbookXml
    $relationsXml = Read-ZipXml $archive 'xl/_rels/workbook.xml.rels'
    $relationsManager = Get-NamespaceManager $relationsXml
    $sharedStrings = @()
    if ($archive.GetEntry('xl/sharedStrings.xml')) {
        $sharedXml = Read-ZipXml $archive 'xl/sharedStrings.xml'
        $sharedManager = Get-NamespaceManager $sharedXml
        $sharedStrings = @($sharedXml.DocumentElement.SelectNodes('//x:si', $sharedManager) | ForEach-Object { $_.InnerText })
    }

    $builds = [ordered]@{}
    foreach ($entry in @(@{ Key = 'start'; Sheet = 'MODU Start' }, @{ Key = 'balance'; Sheet = 'MODU Balance' }, @{ Key = 'performance'; Sheet = 'MODU Performance' })) {
        $sheetNode = $workbookXml.DocumentElement.SelectSingleNode("//x:sheet[@name='$($entry.Sheet)']", $workbookManager)
        if (-not $sheetNode) { throw "Não encontrei a folha '$($entry.Sheet)' no Excel." }
        $relationshipId = $sheetNode.GetAttribute('id', 'http://schemas.openxmlformats.org/officeDocument/2006/relationships')
        $relationship = $relationsXml.DocumentElement.SelectSingleNode("//r:Relationship[@Id='$relationshipId']", $relationsManager)
        if (-not $relationship) { throw "Não encontrei a ligação da folha '$($entry.Sheet)'." }
        $target = $relationship.GetAttribute('Target').Replace('\', '/')
        $sheetPath = if ($target.StartsWith('/')) { $target.TrimStart('/') } else { "xl/$target" }
        $sheetXml = Read-ZipXml $archive $sheetPath
        $sheetManager = Get-NamespaceManager $sheetXml
        $builds[$entry.Key] = Get-BuildData $sheetXml $sheetManager $sharedStrings $entry.Sheet
    }

    $json = $builds | ConvertTo-Json -Depth 3
    $content = "/* Gerado a partir do Excel privado. Não editar manualmente. */`r`nwindow.MODU_BUILDS = $json;`r`n"
    Set-Content -LiteralPath $outputPath -Value $content -Encoding UTF8
    Write-Host "Atualizado: $outputPath" -ForegroundColor Green
}
finally { $archive.Dispose() }
