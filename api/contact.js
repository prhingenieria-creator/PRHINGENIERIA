const nodemailer = require("nodemailer");

function escapeHtml(str) {
  return String(str)
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;");
}

module.exports = async (req, res) => {
  if (req.method !== "POST") {
    res.setHeader("Allow", "POST");
    return res.status(405).json({ ok: false, error: "Método no permitido." });
  }

  const { nombre, empresa, email, mensaje, sitio_web } = req.body || {};

  // Honeypot: campo oculto que solo un bot completaría.
  if (sitio_web) {
    return res.status(200).json({ ok: true });
  }

  if (!nombre || !empresa || !email || !mensaje) {
    return res.status(400).json({ ok: false, error: "Faltan campos obligatorios." });
  }
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
    return res.status(400).json({ ok: false, error: "El email no es válido." });
  }

  const user = process.env.GMAIL_USER;
  const pass = process.env.GMAIL_APP_PASSWORD;
  if (!user || !pass) {
    console.error("Faltan las variables de entorno GMAIL_USER / GMAIL_APP_PASSWORD");
    return res.status(500).json({ ok: false, error: "El formulario no está configurado todavía." });
  }

  try {
    const transporter = nodemailer.createTransport({
      service: "gmail",
      auth: { user, pass },
    });

    await transporter.sendMail({
      from: `"PRH Ingeniería — Web" <${user}>`,
      to: user,
      replyTo: email,
      subject: `Consulta desde prhingenieria.com — ${empresa}`,
      text: `Nombre: ${nombre}\nEmpresa: ${empresa}\nEmail: ${email}\n\n${mensaje}`,
      html: `<p><strong>Nombre:</strong> ${escapeHtml(nombre)}</p>
<p><strong>Empresa:</strong> ${escapeHtml(empresa)}</p>
<p><strong>Email:</strong> ${escapeHtml(email)}</p>
<p><strong>Mensaje:</strong></p>
<p>${escapeHtml(mensaje).replace(/\n/g, "<br>")}</p>`,
    });

    return res.status(200).json({ ok: true });
  } catch (err) {
    console.error("Error enviando el email de contacto:", err);
    return res.status(502).json({ ok: false, error: "No se pudo enviar el mensaje. Probá de nuevo en un rato." });
  }
};
