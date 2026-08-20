# PRH Ingeniería — sitio web institucional

## Objetivo
Landing page institucional para PRH Ingeniería, consultora de ingeniería industrial (relevamiento de procesos, organización y gestión para pymes en crecimiento). Contenido base provisto por el cliente; redacción ajustada a voseo rioplatense y tono más directo, sin alterar el contenido sustantivo de los servicios.

## Stack
Sitio estático de una sola página: `index.html` con CSS y JS inline, sin build ni dependencias externas (salvo Google Fonts). No requiere backend ni hosting con server-side rendering — se puede servir desde cualquier hosting estático (Vercel, Netlify, GitHub Pages, hosting tradicional, etc.).

## Dominio y hosting
El cliente compró **prhingenieria.com** (2026-08-19). Usado como `canonical` y en meta description.

Deployado en Vercel (2026-08-20) bajo el team **prh** (vercel.com/prh), proyecto **prh-ingenieria**:
- URL de producción actual: **https://prh-ingenieria-peach.vercel.app**
- Dashboard: https://vercel.com/prh/prh-ingenieria

**Importante — perfil de auth separado:** este proyecto usa una cuenta de Vercel distinta a la de los otros proyectos (Duke Host, CRM Inmobiliario, que están bajo `gerihertner-hue` / `crm-inmobiliario3`). Para no pisar esa sesión, el login del team `prh` (email prh.ingenieria@gmail.com) se guardó en un directorio de config separado: `C:\Users\hertn\.vercel-prh`. Cualquier comando `vercel` sobre este proyecto necesita los flags:
```
vercel <comando> -Q "C:/Users/hertn/.vercel-prh" -S prh
```
Sin esos flags, el CLI usa la sesión default (`gerihertner-hue`) y falla o deploya al team equivocado — ya pasó una vez (ver más abajo).

Deploy: `vercel --prod --yes -Q "C:/Users/hertn/.vercel-prh" -S prh` desde la carpeta `prh-ingenieria/` (sitio estático, sin build step).

### Deploy fallido en cuenta equivocada (para referencia)
El primer deploy (2026-08-20) se hizo sin saber que existía un team separado para PRH, y quedó publicado por error en la cuenta `gerihertner-hue` / team `crm-inmobiliario3`, proyecto `prh-ingenieria`, URL `prh-ingenieria-omega.vercel.app`. Se corrigió deployando de nuevo bajo el team `prh` correcto. **Ese proyecto viejo en la cuenta equivocada sigue existiendo** — no se borró, queda pendiente decidir si el cliente lo quiere eliminar desde vercel.com/crm-inmobiliario3.

Pendiente: conectar el dominio prhingenieria.com al proyecto de Vercel — falta saber en qué registrador está comprado para configurar el DNS (o transferir el dominio a Vercel Domains).

## Contacto
- El sitio **no muestra** email ni teléfono en texto visible (decisión explícita del cliente: "solo formulario, sin datos visibles").
- El formulario de contacto (`#contacto`) arma un `mailto:` al enviar, dirigido a **prh.ingenieria@gmail.com** (dato confirmado por el cliente). Esto abre el cliente de correo del visitante — no hay envío server-side.
- Si en el futuro se quiere un envío real sin abrir el cliente de correo (ej. vía un servicio de formularios o backend propio), hay que reemplazar esa lógica en el `<script>` al final de `index.html`.

## Identidad visual
Concepto "plano técnico / blueprint de ingeniería": paleta ink-blue + acento "redline" (rojo de corrección de plano), tipografía IBM Plex (Sans Condensed para títulos, Sans para cuerpo, Mono para etiquetas técnicas), marcas de registro tipo plano en las esquinas, grilla de papel milimetrado de fondo. Soporta tema claro y oscuro (oscuro = cianotipo, fondo azul con líneas claras).

## Equipo
El sitio **no muestra** nombres ni información de las personas del equipo (decisión explícita del cliente, 2026-08-20 — se sacó la sección "Equipo" que originalmente listaba a las 3 personas con nombre y rol). No reintroducir nombres/roles individuales en el sitio salvo pedido explícito.

## Decisiones pendientes de confirmar con el cliente
- Hosting/despliegue del dominio prhingenieria.com.
- Si se quiere agregar información de contacto visible más adelante (el cliente eligió explícitamente no mostrarla por ahora).
