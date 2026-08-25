/**
 * main.js
 * Interactividad del sitio: render dinámico de proyectos y habilidades,
 * filtros, resaltado de navegación activa y validación de formularios.
 */

document.addEventListener("DOMContentLoaded", () => {
  resaltarNavActiva();
  renderizarProyectos();
  renderizarHabilidades();
  activarValidacionFormularios();
  activarEnvioSimulado();
});

/* ---------- Navegación activa ---------- */
function resaltarNavActiva() {
  const pagina = window.location.pathname.split("/").pop() || "index.html";
  document.querySelectorAll(".navbar-portfolio .nav-link[href]").forEach((link) => {
    const href = link.getAttribute("href");
    if (href === pagina || (pagina === "" && href === "index.html")) {
      link.classList.add("active");
      link.setAttribute("aria-current", "page");
    }
  });
}

/* ---------- Proyectos (página proyectos.html) ---------- */
function renderizarProyectos(filtro = "todos") {
  const contenedor = document.getElementById("listaProyectos");
  if (!contenedor || typeof PROYECTOS === "undefined") return;

  const datos =
    filtro === "todos" ? PROYECTOS : PROYECTOS.filter((p) => p.categoria === filtro);

  contenedor.innerHTML = datos
    .map(
      (p) => `
      <div class="col-md-6 col-lg-6">
        <article class="project-card">
          <p class="text-muted small mb-1" style="font-family: var(--font-body);">${p.ruta}</p>
          <h3>${p.nombre}</h3>
          <p>${p.descripcion}</p>
          <div class="mb-3">
            ${p.tags.map((t) => `<span class="project-tag">${t}</span>`).join("")}
          </div>
          ${
            p.repo
              ? `<a href="${p.repo}" target="_blank" rel="noopener noreferrer" class="fw-semibold text-decoration-none" style="color: var(--color-primary);">
                  ${p.enlaceTexto || "Ver más →"}
                </a>`
              : ""
          }
        </article>
      </div>`
    )
    .join("");

  document.querySelectorAll(".filter-pill").forEach((btn) => {
    btn.classList.toggle("active", btn.dataset.filtro === filtro);
  });
}

document.addEventListener("click", (evento) => {
  const boton = evento.target.closest(".filter-pill");
  if (!boton) return;
  renderizarProyectos(boton.dataset.filtro);
});

/* ---------- Habilidades (página habilidades.html) ---------- */
function renderizarHabilidades() {
  const contenedor = document.getElementById("listaHabilidades");
  if (!contenedor || typeof HABILIDADES === "undefined") return;

  contenedor.innerHTML = HABILIDADES.map(
    (h) => `
      <div class="skill-row">
        <div class="skill-head">
          <span>${h.nombre}</span>
          <span class="skill-percent">${h.nivel}%</span>
        </div>
        <div class="skill-track">
          <div class="skill-fill" data-nivel="${h.nivel}"></div>
        </div>
      </div>`
  ).join("");

  const barras = contenedor.querySelectorAll(".skill-fill");
  const observador = new IntersectionObserver(
    (entradas) => {
      entradas.forEach((entrada) => {
        if (entrada.isIntersecting) {
          entrada.target.style.width = `${entrada.target.dataset.nivel}%`;
        }
      });
    },
    { threshold: 0.4 }
  );
  barras.forEach((barra) => observador.observe(barra));
}

/* ---------- Validación de formularios HTML5 + Bootstrap ---------- */
function activarValidacionFormularios() {
  document.querySelectorAll("form.necesita-validacion").forEach((form) => {
    form.addEventListener(
      "submit",
      (evento) => {
        if (!form.checkValidity()) {
          evento.preventDefault();
          evento.stopPropagation();
        }
        form.classList.add("was-validated");
      },
      false
    );
  });
}

/* ---------- Envío simulado (sitio estático de demostración) ----------
   En la versión con JSP (ver /jsp/contacto.jsp) el formulario se
   envía por POST y se procesa/guarda en el servidor. Aquí, como el
   sitio corre sin backend, solo mostramos una confirmación visual. */
function activarEnvioSimulado() {
  document.querySelectorAll("form[data-envio-simulado]").forEach((form) => {
    form.addEventListener("submit", (evento) => {
      if (!form.checkValidity()) return;
      evento.preventDefault();

      const alerta = form.querySelector(".alerta-envio");
      if (alerta) {
        alerta.classList.remove("d-none");
        alerta.textContent = form.dataset.mensajeExito || "¡Gracias! Tu información fue recibida.";
      }
      form.reset();
      form.classList.remove("was-validated");
    });
  });
}
