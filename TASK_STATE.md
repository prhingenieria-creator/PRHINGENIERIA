# Estado de tareas — PRH Ingeniería

## Última tarea
Sitio institucional armado, publicado en producción en `prhingenieria.com`, y con el formulario de contacto mandando el mail real (sin depender de `mailto:`).

## Hecho
- Redacción revisada de todas las secciones (voseo, tono más directo), sin cambiar el contenido sustantivo de los 11 servicios.
- Diseño e implementación de `index.html` (concepto "blueprint técnico", tema claro/oscuro, responsive).
- A pedido del cliente (2026-08-20): se sacaron las secciones "Quiénes somos" y "Equipo" completas (sin nombres del equipo en el sitio), y se ajustó la frase de credencial del hero a "Somos ingenieros industriales."
- Deploy a producción en Vercel, team **prh**: **https://prhingenieria.com**. Detalle del setup (cuentas separadas de Vercel/GitHub, comandos de deploy) en [PROJECT_CONTEXT.md](PROJECT_CONTEXT.md).
- Dominio prhingenieria.com (comprado en Arsys) conectado por DNS, con SSL activo.
- Repo Git conectado y con push: https://github.com/prhingenieria-creator/PRHINGENIERIA.git
- Formulario de contacto (2026-08-20): pasó de `mailto:` a un envío real server-side vía `api/contact.js` (función serverless de Vercel, nodemailer + Gmail SMTP), con honeypot antispam.

## Validaciones ejecutadas
- Revisión visual en navegador (desktop y mobile): layout, tipografía, jerarquía, menú móvil, sin errores de consola.
- Se corrigió un bug de scroll horizontal y una celda vacía en la grilla de servicios (ver commits para detalle).
- `https://prhingenieria.com` responde 200 OK por HTTPS con certificado válido (verificado con curl).
- `POST /api/contact` responde correctamente (probado con curl): devuelve el error esperado `"El formulario no está configurado todavía."` porque todavía faltan las variables de entorno — confirma que la función está deployada y andando, falta solo la config final.

## Pendiente
- **Cargar las variables de entorno en Vercel** para que el formulario mande el mail de verdad: `GMAIL_USER` y `GMAIL_APP_PASSWORD`. Instrucciones completas en [PROJECT_CONTEXT.md](PROJECT_CONTEXT.md#contacto). Después de cargarlas hace falta un redeploy (`vercel --prod --yes -Q "C:/Users/hertn/.vercel-prh" -S prh`) para que la función las tome.
- Conectar GitHub↔Vercel para auto-deploy en cada push — requiere que el cliente autorice el OAuth desde el dashboard (vercel.com/prh/prh-ingenieria/settings/git). Hasta entonces el deploy es manual por CLI.
- Probar el envío real del formulario de punta a punta una vez cargadas las credenciales.
