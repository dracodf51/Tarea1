<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="db.DBUtil" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Habilidades (JSP) · Fernando Quiroz</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="css/reset.css" />
  <link rel="stylesheet" href="css/styles.css" />
</head>
<body>
  <main class="section">
    <div class="container container-narrow">
      <p class="kicker">Versión con backend</p>
      <h1 class="section-title">Habilidades (generado por JSP)</h1>
      <p class="section-lead">
        Contenido dinámico leído desde la tabla <code>habilidades</code> mediante JDBC.
        Equivalente a <code>/habilidades.html</code>.
      </p>

      <div class="skill-card mt-4">
        <%
          try (Connection conexion = DBUtil.getConnection();
               PreparedStatement sentencia = conexion.prepareStatement(
                   "SELECT nombre, nivel FROM habilidades ORDER BY orden ASC");
               ResultSet filas = sentencia.executeQuery()) {

            while (filas.next()) {
              String nombre = filas.getString("nombre");
              int nivel = filas.getInt("nivel");
        %>
        <div class="skill-row">
          <div class="skill-head">
            <span><%= nombre %></span>
            <span class="skill-percent"><%= nivel %>%</span>
          </div>
          <div class="skill-track">
            <div class="skill-fill" style="width: <%= nivel %>%;"></div>
          </div>
        </div>
        <%
            }
          } catch (SQLException excepcion) {
        %>
        <div class="alert alert-warning mb-0">
          No fue posible conectar con la base de datos. Detalle: <%= excepcion.getMessage() %>
        </div>
        <%
          }
        %>
      </div>
    </div>
  </main>
</body>
</html>
