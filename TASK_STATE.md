# Estado de tareas — PRH Ingeniería

## Última tarea
Armar el sitio institucional completo (una sola página) a partir del contenido provisto por el cliente, con ajustes de redacción y diseño propio. Luego, a pedido del cliente, se sacó la sección "Quiénes somos" antes de publicar.

## Hecho
- Redacción revisada de todas las secciones (voseo, tono más directo), sin cambiar el contenido sustantivo de los 11 servicios.
- Diseño e implementación completa de `index.html` (blueprint técnico, tema claro/oscuro, responsive).
- Secciones: header/nav, hero, equipo (3 personas), "¿te pasa esto?" (5 señales), cómo trabajamos (5 pasos), qué hacemos (11 servicios + tarjeta de cierre "a medida"), contacto (formulario → mailto), footer.
- 2026-08-20: se eliminó la sección "Quiénes somos" (contenido, link de nav en header/footer y el CSS que solo usaba esa sección) a pedido del cliente, antes de publicar el sitio.
- 2026-08-20: se eliminó la sección "Equipo" completa (nombres, roles y descripciones de las 3 personas), su link de nav y el CSS que solo usaba esa sección — el cliente no quiere que aparezcan nombres del equipo en el sitio. Se ajustó también la frase de credencial del hero: "Ingenieros industriales, no una agencia de software" → "Somos ingenieros industriales."
- Formulario de contacto conectado por `mailto:` a prh.ingenieria@gmail.com (dato confirmado por el cliente el 2026-08-19; no se muestra en texto visible del sitio).
- Meta tags con dominio `prhingenieria.com` (comprado por el cliente el 2026-08-19).

## Validaciones ejecutadas
- Revisión visual en navegador (desktop ~1280px y mobile 375px): layout, tipografía, jerarquía correctos.
- Se detectó y corrigió un bug de scroll horizontal (el menú móvil, al estar oculto vía `transform`, agrandaba el `scrollWidth` del documento) — solucionado con `overflow-x:hidden` en `body`.
- Se detectó y corrigió una celda vacía en la grilla de servicios (11 ítems en grilla de 3 columnas dejaba un hueco) — se agregó una 12ª tarjeta de cierre con CTA a contacto.
- Menú móvil (hamburguesa) probado funcionalmente vía JS — abre/cierra correctamente.
- Formulario probado: genera un `mailto:` bien formado con asunto y cuerpo codificados.
- Sin errores en consola del navegador.

## Pendiente / fuera de alcance de esta tarea
- 2026-08-20: primer deploy a producción salió por error en la cuenta equivocada (`gerihertner-hue` / team `crm-inmobiliario3`) — URL `prh-ingenieria-omega.vercel.app`. El cliente aclaró que PRH Ingeniería tiene su propio team en Vercel (`vercel.com/prh`) y su propio Git separado.
- 2026-08-20: logueado en un perfil de Vercel separado (config dir `C:\Users\hertn\.vercel-prh`) con el email prh.ingenieria@gmail.com, con acceso al team `prh`. Redeployado ahí correctamente: **https://prh-ingenieria-peach.vercel.app** (proyecto `prh/prh-ingenieria`). Verificado en el navegador: carga bien, sin errores de consola, contenido actualizado.
- 2026-08-20: eliminado el proyecto viejo `crm-inmobiliario3/prh-ingenieria` (confirmado por el cliente).
- 2026-08-20: repo Git conectado — https://github.com/prhingenieria-creator/PRHINGENIERIA.git. Login de `gh` con esa cuenta (device code, autorizado por el cliente en el navegador), primer commit + push a `main` hecho con éxito.
- 2026-08-20: intenté conectar el repo al proyecto de Vercel para auto-deploy (`vercel git connect`) — falló porque la cuenta de Vercel del team `prh` no tiene todavía una "Login Connection" con GitHub; eso requiere que el cliente lo autorice manualmente desde vercel.com/prh/prh-ingenieria/settings/git. Hasta entonces, el deploy sigue siendo manual por CLI.
- Falta conectar el dominio prhingenieria.com a este deploy — necesito saber en qué registrador está comprado para guiar la configuración de DNS.
- No hay imágenes/fotos reales; los "avatares" del equipo son iniciales en un marco geométrico (decisión deliberada, no fabricar fotos de personas reales).
- No se probó el `mailto:` end-to-end abriendo un cliente de correo real (no es posible desde este entorno); se validó que la URL generada es correcta.
