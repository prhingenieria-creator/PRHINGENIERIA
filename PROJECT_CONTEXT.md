# PRH Ingeniería — sitio web institucional

## Objetivo
Landing page institucional para PRH Ingeniería, consultora de ingeniería industrial (relevamiento de procesos, organización y gestión para pymes en crecimiento). Contenido base provisto por el cliente; redacción ajustada a voseo rioplatense y tono más directo, sin alterar el contenido sustantivo de los servicios.

## Stack
Sitio de una sola página: `index.html` con CSS y JS inline (sin build, sin dependencias externas salvo Google Fonts), más una función serverless en `api/contact.js` (Node.js, usa `nodemailer`) que envía el formulario de contacto por email. Requiere una plataforma que soporte funciones serverless tipo Vercel (no serviría un hosting puramente estático como GitHub Pages sin adaptar esa parte).

## Dominio y hosting
El cliente compró **prhingenieria.com** en **Arsys** (2026-08-19). Usado como `canonical` y en meta description.

Deployado en Vercel bajo el team **prh** (vercel.com/prh), proyecto **prh-ingenieria**:
- **https://prhingenieria.com** — dominio conectado y andando (2026-08-20). DNS en Arsys: registro `A @ 76.76.21.21` y `A www 76.76.21.21` (se dejaron intactos el resto de los registros del dominio — MX, SPF, DKIM, autoconfig/autodiscover/webmail — porque son del servicio de correo `serviciodecorreo.es` que usa el cliente). Certificado SSL emitido manualmente con `vercel certs issue` porque no se auto-emitió al toque para el dominio raíz.
- URL alternativa (siempre activa): https://prh-ingenieria-peach.vercel.app
- Dashboard: https://vercel.com/prh/prh-ingenieria

**Importante — perfil de auth separado:** este proyecto usa una cuenta de Vercel distinta a la de los otros proyectos (Duke Host, CRM Inmobiliario, que están bajo `gerihertner-hue` / `crm-inmobiliario3`). Para no pisar esa sesión, el login del team `prh` (email prh.ingenieria@gmail.com) se guardó en un directorio de config separado: `C:\Users\hertn\.vercel-prh`. Cualquier comando `vercel` sobre este proyecto necesita los flags:
```
vercel <comando> -Q "C:/Users/hertn/.vercel-prh" -S prh
```
Sin esos flags, el CLI usa la sesión default (`gerihertner-hue`) y falla o deploya al team equivocado — ya pasó una vez (ver más abajo).

Deploy: `vercel --prod --yes -Q "C:/Users/hertn/.vercel-prh" -S prh` desde la carpeta `prh-ingenieria/` (sitio estático, sin build step).

### Deploy fallido en cuenta equivocada (para referencia, ya resuelto)
El primer deploy (2026-08-20) se hizo sin saber que existía un team separado para PRH, y quedó publicado por error en la cuenta `gerihertner-hue` / team `crm-inmobiliario3`. Se corrigió deployando bajo el team `prh` correcto, y el proyecto viejo (`crm-inmobiliario3/prh-ingenieria`) se eliminó (2026-08-20).

## Git / control de versiones
Repo: **https://github.com/prhingenieria-creator/PRHINGENIERIA.git** (cuenta GitHub separada, `prhingenieria-creator`, dedicada a PRH — igual que el team de Vercel).

- `gh` en esta máquina también tiene esa cuenta agregada (además de `gerihertner-hue` y `crmverduleria-marta`). La cuenta **activa por default quedó en `prhingenieria-creator`** después de este trabajo (se corrió `gh auth switch --user prhingenieria-creator`) — si se vuelve a trabajar en otro proyecto (Duke Host, CRM Inmobiliario) y hay que pushear ahí, hay que `gh auth switch --user gerihertner-hue` primero, o especificar el usuario con `-u`.
- Primer commit y push (2026-08-20): sitio completo (`index.html`, `PROJECT_CONTEXT.md`, `TASK_STATE.md`, `.gitignore`), rama `main`.

### Pendiente — conectar GitHub a Vercel (requiere acción manual del dueño de la cuenta)
Intenté conectar el repo al proyecto de Vercel vía CLI (`vercel git connect`) para que quede auto-deploy en cada push, pero Vercel exige que la cuenta (`prh.ingenieria@gmail.com`, team `prh`) tenga una "Login Connection" con GitHub — es un OAuth que solo se autoriza desde el dashboard web, no por CLI. Falta que el dueño de la cuenta entre a **vercel.com/prh/prh-ingenieria/settings/git**, logueado con `prh.ingenieria@gmail.com`, y conecte el repo `prhingenieria-creator/PRHINGENIERIA` ahí. Hasta que eso pase, el deploy sigue siendo manual por CLI (`vercel --prod --yes -Q "C:/Users/hertn/.vercel-prh" -S prh`), no automático por push.

## Contacto
- El sitio **no muestra** email ni teléfono en texto visible (decisión explícita del cliente: "solo formulario, sin datos visibles").
- El formulario de contacto (`#contacto`) hace `POST /api/contact` con `fetch`. La función serverless (`api/contact.js`) manda el mail directo por Gmail SMTP (nodemailer) a **prh.ingenieria@gmail.com**, con `replyTo` seteado al email que puso la persona que escribe — así se puede responder directo desde el mail recibido. Incluye un honeypot (`sitio_web`) para filtrar bots.
- **Requiere dos variables de entorno en Vercel** (Project Settings → Environment Variables, en `vercel.com/prh/prh-ingenieria/settings/environment-variables`, Production + Preview):
  - `GMAIL_USER` = `prh.ingenieria@gmail.com`
  - `GMAIL_APP_PASSWORD` = una **contraseña de aplicación** de Google (no la contraseña normal de la cuenta) — se genera en myaccount.google.com/apppasswords, requiere tener la verificación en 2 pasos activada en esa cuenta de Gmail.
  - **Estado (2026-08-20): todavía no están cargadas.** El endpoint ya funciona y responde bien, pero devuelve `"El formulario no está configurado todavía."` hasta que se agreguen esas dos variables y se haga un redeploy.

## Identidad visual
Concepto "plano técnico / blueprint de ingeniería": paleta ink-blue + acento "redline" (rojo de corrección de plano), tipografía IBM Plex (Sans Condensed para títulos, Sans para cuerpo, Mono para etiquetas técnicas), marcas de registro tipo plano en las esquinas, grilla de papel milimetrado de fondo. Soporta tema claro y oscuro (oscuro = cianotipo, fondo azul con líneas claras).

## Equipo
El sitio **no muestra** nombres ni información de las personas del equipo (decisión explícita del cliente, 2026-08-20 — se sacó la sección "Equipo" que originalmente listaba a las 3 personas con nombre y rol). No reintroducir nombres/roles individuales en el sitio salvo pedido explícito.

## Decisiones pendientes de confirmar con el cliente
- Hosting/despliegue del dominio prhingenieria.com.
- Si se quiere agregar información de contacto visible más adelante (el cliente eligió explícitamente no mostrarla por ahora).
