# MODU PC — Landing Page

Landing page estática para a MODU PC, com suporte para modo claro e escuro.

## Estrutura

```text
Landing Page/
├── index.html          # Estrutura e conteúdo da página
├── css/
│   └── styles.css      # Estilos, paleta e responsividade
├── js/
│   ├── builds.js       # Dados públicos das gamas (gerados pelo Excel)
│   └── main.js         # Alternância de tema e preferência guardada
├── scripts/
│   └── Atualizar-MODUBuilds.ps1 # Lê o Excel privado e atualiza builds.js
├── *.png               # Logótipos e favicon
└── .gitignore
```

## Alterações rápidas

- Textos e serviços: `index.html`
- Cores e aspeto: `css/styles.css`
- Lógica do modo claro/escuro: `js/main.js`
- Dados mostrados nos PCs MODU: `js/builds.js`

## Atualizar os PCs MODU a partir do Excel

O Excel **não vai para o GitHub**: mantém custos, margens e fornecedores privados.

1. Cria a pasta `private` dentro deste projeto e coloca aí o ficheiro com o nome `MODU_PCs_Orcamento.xlsx`.
2. Em cada folha (`MODU Start`, `MODU Balance` e `MODU Performance`), preenche:
   - `B11`: CPU
   - `B12`: GPU
   - `B14`: RAM
   - `B15`: SSD
   - `B37`: preço de venda ao cliente
3. Guarda o Excel e abre `Atualizar PCs MODU.cmd` com duplo clique.
4. Faz push do ficheiro `js/builds.js` para publicar os valores novos no site.

O ficheiro `private/` está ignorado pelo Git, por isso nunca é enviado para o repositório público.

Para pré-visualizar, abre o ficheiro `index.html` num browser.
