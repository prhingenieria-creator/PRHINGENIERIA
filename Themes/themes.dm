# Themes — PRH Ingeniería

Índice de recursos gráficos de marca (branding), separados del sitio web pero derivados de su mismo sistema visual.

## Paleta (idéntica a la del sitio, `index.html`)
- Ink / línea principal: `#1C2B3A`
- Acento (ámbar): `#F2A93C`
- Muted (texto secundario): `#5B6B7D`
- Ground: `#F1F3F5`
- Superficie: `#FFFFFF`

## Tipografía
- Isotipo ("PRH"): **IBM Plex Mono**, weight 600 — mismo criterio que las etiquetas técnicas del sitio (eyebrows, mono labels).
- Wordmark ("INGENIERÍA"): **IBM Plex Sans Condensed**, weight 700, uppercase, letter-spacing amplio — igual que los `<h1>/<h2>` y el wordmark del header del sitio.
- Firma de Gmail: **no usa IBM Plex** — los clientes de correo no cargan webfonts custom de forma confiable, así que se usan fuentes web-safe (`Arial/Helvetica` para el nombre, `Consolas/Courier New` para la línea mono-style) que se acercan al mismo carácter tipográfico sin depender de que el destinatario tenga la fuente.

## Archivos

| Archivo | Uso | Medidas | Fondo |
|---|---|---|---|
| `mark.svg` | Isotipo maestro (vector) | viewBox 200×200 | transparente |
| `lockup.svg` | Logo completo maestro (vector): isotipo + "INGENIERÍA" | viewBox 660×200 | transparente |
| `mark-512.png` | Isotipo exportado, uso general (avatares, favicons grandes, documentos) | 512×512 | transparente |
| `lockup-1200.png` | Logo completo exportado, uso general (membrete, presentaciones, firmas grandes) | 1200×364 | transparente |
| `linkedin-logo-300.png` | Logo de la página de empresa en LinkedIn | 300×300 | blanco opaco (LinkedIn no maneja bien transparencias en el logo de empresa) |
| `linkedin-cover-1128x191.png` | Portada de la página de empresa en LinkedIn | 1128×191 | ground (#F1F3F5) con grilla de fondo |
| `gmail-signature.html` | Firma de Gmail institucional (genérica, sin nombre de persona) — abrir en el navegador, copiar el bloque marcado y pegarlo en el editor de firma de Gmail | — | — |
| `signature-logo-128.png` | Logo de respaldo para insertar a mano en la firma si el copy-paste no trae la imagen | 128×128 | transparente |

## Decisiones de diseño
- El isotipo es deliberadamente simple (cuadrado + "PRH" + una línea ámbar) para que siga siendo legible a tamaños chicos (favicon, avatar circular de LinkedIn recortado). El detalle de marcas de registro tipo plano (crosshairs) se reservó para piezas grandes como la portada de LinkedIn, donde sí hay lugar para ese nivel de detalle sin perder legibilidad.
- La portada de LinkedIn deja despejado el cuadrante inferior izquierdo porque LinkedIn superpone ahí el logo circular de la empresa sobre la portada.
- El logo de empresa de LinkedIn (300×300) usa fondo blanco opaco en vez de transparente — LinkedIn compone el logo dentro de un círculo sobre su propio fondo blanco, así que un fondo opaco evita artefactos.
- La firma de Gmail es institucional/genérica (sin nombre de una persona) por pedido explícito del cliente — no reintroducir un nombre individual salvo pedido explícito, ver [PROJECT_CONTEXT.md](../PROJECT_CONTEXT.md).
- No se generaron variantes con foto de personas — consistente con la decisión ya tomada para el sitio de no usar fotos reales de las personas del equipo (ver sección "Equipo" de PROJECT_CONTEXT.md).

## Cómo regenerar / exportar otros tamaños
Los PNG se generaron rasterizando HTML/SVG con Chrome headless (`chrome.exe --headless --disable-gpu --screenshot=out.png --window-size=W,H archivo.html`), con las fuentes IBM Plex embebidas como data URI en el HTML (evita que la captura salga con la fuente de reserva si Chrome headless no llega a descargar el webfont a tiempo — problema real que apareció en el primer intento). Los archivos HTML de renderizado intermedios no se conservaron; para generar un tamaño nuevo, partir de `mark.svg` / `lockup.svg` y repetir el mismo proceso.
