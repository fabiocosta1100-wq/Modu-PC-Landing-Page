# MODU Performance — conceito SKY TWO

- Data: 2026-09-15.
- Método: ferramenta integrada image_gen; geração com referências, seguida de uma correção localizada do cooler.
- Imagem selecionada: modu-performance-sky-two-conceito.png
- Estado: esboço visual para aprovação. Ainda não integrado no site.
- Imagem gerada por IA, não fotografia de uma montagem real nem especificação técnica exata.
- As leituras do mostrador são ilustrativas, não medições nem promessas de temperaturas.
- Confirmar a compatibilidade real dos componentes antes de encomendar, incluindo altura/folga das RAMs sob o cooler e espaço entre cooler e vidro.
- Estética: caixa preta SKY TWO, cooler preto dual-tower com painel digital inspirado no Thermalright indicado, duas RAMs RGB, gráfica horizontal com faixa RGB discreta, contornos azuis nas ventoinhas, fundo azul-gelo. Sem marcas visíveis.

## Referências
- Caixa oficial: https://www.montechpc.com/sky-two
- Imagem da caixa: https://www.montechpc.com/images/362141/0/1100?stamp=1740636789
- Cooler indicado: https://www.pcdiga.com/componentes/coolers-cpu/air-cooling-cpu/air-cooler-cpu-thermalright-peerless-assassin-140-digital-preto-81425602099-2-814256020992
- Cooler isolado: https://pcdiga-prod.eu.saleor.cloud/media/thumbnails/products/PA140-D-BLACK-15002-e1750150269799_8c07ad69_thumbnail_4096.jpg
- Cooler instalado, apenas orientação: https://pcdiga-prod.eu.saleor.cloud/media/thumbnails/products/PA140-D-BLACK-15009_bc5bc6f2_thumbnail_4096.jpg
- Gráfica: perfil lateral de Gigabyte Gaming OC de três ventoinhas, apenas referência estética; não fixa um modelo comercial.
- Enquadramento e fundo: imagem aprovada modu-balance-antec-p6-neo-conceito.png.

## Prompt inicial
```text
Use case: product-mockup.
Create one photorealistic MODU Performance assembled gaming PC concept for a premium e-commerce product card. Square canvas, clean pale ice-blue #EAF2FF seamless studio backdrop and soft contact shadow. This is an original unbranded concept, not a reproduction of a retailer's advertisement.

Reference roles, in exact input order:
1. Montech SKY TWO black empty case: PRIMARY source of exact case geometry and fan placement. Populate this specific case; preserve its design.
2. Thermalright Peerless Assassin 140 Digital BLACK isolated product: source of the dual-tower black CPU cooler, black fans, fin stacks, broad flat black digital end-cap and display layout.
3. Same cooler installed in a different PC: use ONLY for cooler physical orientation relative to motherboard and GPU. Do not copy this other case, its giant lower display, its extra lights, room, or peripherals.
4. Approved MODU Balance concept: use ONLY for catalog framing, soft studio lighting, background, scale in square frame and GPU mounting realism. Do not copy its Antec case or single-tower cooler.
5. Real Gigabyte triple-fan Gaming OC GPU side profile: use for plausible finished graphite GPU side shroud and fin-stack details. Remove all visible branding. This is only aesthetic guidance, not a final parts specification.

Case design: black original Montech SKY TWO, not SKY TWO GX, not XR and not Antec. Front glass on image right and left side glass on image left; straight black corner post and square edges. Fine dark mesh wraps around the bottom PSU chamber on the side AND front. Top I/O, short black feet. 430mm depth x215mm width x490mm height proportions. Two 120mm side intake fans stacked vertically beside the motherboard tray toward the front, one 120mm rear exhaust, one horizontal 120mm intake on PSU shroud under GPU. Preserve those four supplied fans exactly, no fans mounted on front glass, no top fans, no extra radiator or liquid-cooling tubing. Case fans have DARK blades with elegant slender rounded-square illuminated frame outlines matching Montech AX/RX fans, not giant glowing bright disks.

Components and arrangement:
- Black ATX motherboard, discreet matte black heatsinks, realistic sockets and neat black sleeved cable routing.
- Large black dual-tower CPU air cooler inspired faithfully by Peerless Assassin 140 Digital, mounted correctly on CPU above GPU. Two black non-RGB fans, one at the front and one between fin stacks, with physical clearances and correct fan clips. The broad glossy black DIGITAL CAP FACES THE SIDE GLASS vertically, exactly like reference 3; do not put the screen horizontally on top of the PC or rotate the cooler to face its large fan toward the glass. Keep authentic reference 2 display proportions and angular dark edge. Small restrained softly lit seven-segment system readouts, e.g. 42°C and 18%, in ice blue/white with subtle small accent strokes, no giant text or logos. No lights on CPU fan blades. Cooler stays within case.
- Two slim black RGB RAM sticks in DIMM slots to the right of CPU. Two narrow diffused top light bars, softly glowing blue/icy blue, visible where physically possible around cooler. Do not move DIMM slots or shrink cooler unnaturally to reveal them; partial occlusion is realistic.
- A realistic premium black/graphite three-fan graphics card with full finished metal/plastic shroud, fin stack and backplate, about 300mm long, about 2.5 slots thick. Mount conventionally horizontally in PCIe slot, PCB plane parallel to floor. Rear bracket attached to expansion slots, GPU perfectly rigid and straight, no sag or twisted geometry. Long GPU edges share perspective with the PSU-shroud front-to-back edges. Three fan faces point downward, NOT toward glass: show natural side profile, not vertically mounted GPU. Add only ONE slim integrated side RGB accent strip in cool blue, modest brightness; NO glowing brand name, no RGB power cable, no rainbow fan faces. Tidy realistic black GPU power cable.

Visual direction: richer materials and more sophisticated details than the Balance but less glare, not more clutter. Matte black, deep charcoal, glass, crisp machined edges. Restrained coordinated blue illumination on the four case fan frames, two RAM bars and a thin GPU strip; neutral soft studio fill reveals dark hardware. No multicolor rainbow effect, purple neon, orange, green, oversaturation, RGB on every edge or bright haze. Keep the case exterior free of decorative light strips.

Composition: one complete tower centered, both front and glass side visible in a modest front-left three-quarter angle like reference 4, camera around CPU height, straight upright case edges and no dramatic wide-angle or low-angle distortion. Full tower and feet visible with comfortable margins, occupies roughly 90% of image height. Glass reflections subtle enough to read interior. Pure clean background, no text outside cooler display, no badges, logos, brand marks, watermark, labels, props or floating parts. Focus on physically believable assembly and consistent component perspective.
```

## Correção final do cooler
```text
Use case: precise-object-edit.
Edit Image 1 only. Preserve the exact Montech SKY TWO case, camera angle, composition, background, black materials, case fans and blue LED outlines, motherboard, RAM positions, horizontal GPU with its small blue accent, cables, shadow and feet. Change ONLY the CPU cooler assembly to more faithfully resemble the actual Thermalright Peerless Assassin 140 Digital BLACK shown in Images 2 and 3.

Image 1: edit target, existing MODU Performance concept.
Image 2: isolated real Peerless Assassin 140 Digital — exact cooler shape reference.
Image 3: manufacturer's example installed in a different case — installed orientation reference ONLY. Do not copy any other contents from Image 3.

The current cooler's narrow screen looks like a small single-tower model. Replace it with the actual broad dual-tower cooler:
- Two chunky black fin stacks arranged along the front-to-back airflow direction, a center black fan between them and a black front fan toward the RAM, correct steel retention clips.
- A single broad nearly square glossy black digital end-cap covers BOTH towers and central space, with angular black bezel, facing vertically OUT TOWARDS THE LEFT SIDE GLASS. Its aspect ratio and proportions must follow the real product in Image 2 and installed presentation in Image 3; NOT a skinny vertical strip, not a horizontal screen on top, not a second screen. Allow correct perspective foreshortening but the cap should be visibly broad, roughly comparable to fan width in perspective.
- Preserve the current cooler's height so it remains correctly scaled and fits the case. Expand its body along the case's front-to-back axis to accommodate the second tower. A natural small amount of rear-fan or RAM occlusion is acceptable; no intersection with GPU or glass.
- Refined low-brightness icy-blue/white small segmented display with two compact readout rows; maintain "42°C" and "18%" as illustrative numbers, slim understated blue accent strokes. No logos or printed brand names.
- Black non-RGB CPU fan blades and frame. This is an air cooler, NO pump/tubes/radiator.
Physically plausible mounting on CPU socket above GPU. Nothing else changes. Photorealistic, clean edge continuity and realistic material shading.
```

