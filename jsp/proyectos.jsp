<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="db.DBUtil" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Proyectos (JSP) · Fernando Quiroz</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="css/reset.css" />
  <link rel="stylesheet" href="css/styles.css" />
</head>
<body>
  <main class="section">
    <div class="container container-narrow">
      <p class="kicker">Versión con backend</p>
      <h1 class="section-title">Proyectos (generado por JSP)</h1>
      <p class="section-lead">
        Esta página consulta la tabla <code>proyectos</code> de la base de datos
        <code>portafolio_fernando</code> (ver <code>db/schema.sql</code>) usando JDBC y arma el
        HTML en el servidor. Es el equivalente dinámico de
        <code>/proyectos.html</code>, que hace lo mismo en el navegador con
        <code>js/data.js</code>.
      </p>

      <div class="row g-4 mt-2">
        <%
          // Conexión JDBC + consulta preparada: se listan los proyectos
          // almacenados en la base de datos y se renderiza una tarjeta por fila.
          try (Connection conexion = DBUtil.getConnection();
               PreparedStatement sentencia = conexion.prepareStatement(
                   "SELECT nombre, ruta, descripcion, tags, repo_url FROM proyectos ORDER BY creado_en DESC");
               ResultSet filas = sentencia.executeQuery()) {

            boolean hayResultados = false;
            while (filas.next()) {
              hayResultados = true;
              String nombre = filas.getString("nombre");
              String ruta = filas.getString("ruta");
              String descripcion = filas.getString("descripcion");
              String[] tags = filas.getString("tags").split(",");
              String repoUrl = filas.getString("repo_url");
        %>
        <div class="col-md-6">
          <article class="project-card">
            <p class="text-muted small mb-1"><%= ruta %></p>
            <h3><%= nombre %></h3>
            <p><%= descripcion %></p>
            <div class="mb-3">
              <% for (String tag : tags) { %>
                <span class="project-tag"><%= tag.trim() %></span>
              <% } %>
            </div>
            <% if (repoUrl != null && !repoUrl.isBlank()) { %>
              <a href="<%= repoUrl %>" target="_blank" rel="noopener noreferrer" class="fw-semibold text-decoration-none" style="color: var(--color-primary);">
                Visitar sitio →
              </a>
            <% } %>
          </article>
        </div>
        <%
            }
            if (!hayResultados) {
        %>
        <div class="col-12">
          <p class="section-lead">Aún no hay proyectos cargados en la base de datos.</p>
        </div>
        <%
            }
          } catch (SQLException excepcion) {
        %>
        <div class="col-12">
          <div class="alert alert-warning">
            No fue posible conectar con la base de datos. Verifica que MySQL esté activo y que
            <code>db/schema.sql</code> se haya ejecutado. Detalle: <%= excepcion.getMessage() %>
          </div>
        </div>
        <%
          }
        %>
      </div>
    </div>
  </main>
</body>
</html>
