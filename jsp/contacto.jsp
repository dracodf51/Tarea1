<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="db.DBUtil" %>
<%!
  // Escapa HTML básico para evitar XSS al reutilizar datos ingresados por el usuario.
  private String escapar(String texto) {
    if (texto == null) return "";
    return texto.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;");
  }
%>
<%
  String mensajeResultado = null;
  boolean exito = false;

  if ("POST".equalsIgnoreCase(request.getMethod())) {
    String nombre = request.getParameter("nombre");
    String correo = request.getParameter("correo");
    String telefono = request.getParameter("telefono");
    String motivo = request.getParameter("motivo");
    String mensaje = request.getParameter("mensaje");
    boolean consentimiento = "on".equalsIgnoreCase(request.getParameter("consentimiento"));

    // Validación en el servidor (complementa la validación HTML5 del navegador,
    // ya que esta última puede evitarse enviando la petición directamente).
    boolean datosValidos =
        nombre != null && nombre.trim().length() >= 3 &&
        correo != null && correo.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$") &&
        motivo != null && !motivo.isBlank() &&
        mensaje != null && mensaje.trim().length() >= 10 &&
        consentimiento;

    if (!datosValidos) {
      mensajeResultado = "Revisa el formulario: hay campos obligatorios incompletos o con formato inválido.";
    } else {
      try (Connection conexion = DBUtil.getConnection();
           PreparedStatement sentencia = conexion.prepareStatement(
               "INSERT INTO mensajes_contacto (nombre, correo, telefono, motivo, mensaje, consentimiento) " +
               "VALUES (?, ?, ?, ?, ?, ?)")) {

        sentencia.setString(1, nombre.trim());
        sentencia.setString(2, correo.trim());
        sentencia.setString(3, telefono == null ? "" : telefono.trim());
        sentencia.setString(4, motivo);
        sentencia.setString(5, mensaje.trim());
        sentencia.setBoolean(6, consentimiento);
        sentencia.executeUpdate();

        exito = true;
        mensajeResultado = "¡Gracias, " + escapar(nombre.trim()) + "! Tu mensaje fue guardado y te responderé pronto.";
      } catch (SQLException excepcion) {
        mensajeResultado = "No fue posible guardar tu mensaje. Intenta más tarde. (" + excepcion.getMessage() + ")";
      }
    }
  }
%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Contacto (JSP) · Fernando Quiroz</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="css/reset.css" />
  <link rel="stylesheet" href="css/styles.css" />
</head>
<body>
  <main class="section">
    <div class="container container-narrow" style="max-width: 640px;">
      <p class="kicker">Versión con backend</p>
      <h1 class="section-title">Contacto (procesado por JSP)</h1>
      <p class="section-lead">
        Este endpoint recibe el formulario de <code>/contacto.html</code>, valida los datos en
        el servidor y los guarda en la tabla <code>mensajes_contacto</code> mediante una
        sentencia preparada (JDBC), evitando inyección SQL.
      </p>

      <% if (mensajeResultado != null) { %>
      <div class="alert <%= exito ? "alert-success" : "alert-warning" %> mt-3">
        <%= mensajeResultado %>
      </div>
      <% } %>

      <div class="form-card mt-3">
        <form class="necesita-validacion" method="post" action="contacto.jsp" novalidate>
          <div class="mb-3">
            <label for="nombre" class="form-label">Nombre completo *</label>
            <input type="text" class="form-control" id="nombre" name="nombre" minlength="3" required />
          </div>
          <div class="mb-3">
            <label for="correo" class="form-label">Correo electrónico *</label>
            <input type="email" class="form-control" id="correo" name="correo" required />
          </div>
          <div class="mb-3">
            <label for="telefono" class="form-label">Teléfono (opcional)</label>
            <input type="tel" class="form-control" id="telefono" name="telefono" pattern="^\+?[0-9\s]{8,15}$" />
          </div>
          <div class="mb-3">
            <label for="motivo" class="form-label">Motivo *</label>
            <select class="form-select" id="motivo" name="motivo" required>
              <option value="" selected disabled>Selecciona una opción</option>
              <option value="proyecto">Propuesta de proyecto</option>
              <option value="academico">Consulta académica</option>
              <option value="colaboracion">Colaboración técnica</option>
              <option value="otro">Otro</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="mensaje" class="form-label">Mensaje *</label>
            <textarea class="form-control" id="mensaje" name="mensaje" rows="4" minlength="10" required></textarea>
          </div>
          <div class="mb-3 form-check">
            <input class="form-check-input" type="checkbox" id="consentimiento" name="consentimiento" required />
            <label class="form-check-label" for="consentimiento">
              Acepto que mis datos sean usados solo para responder este mensaje *
            </label>
          </div>
          <button type="submit" class="btn btn-brand">Enviar mensaje</button>
        </form>
      </div>
    </div>
  </main>
</body>
</html>
