/**
 * data.js
 * Fuente única de datos para renderizar contenido dinámico en el sitio
 * estático (proyectos.html, habilidades.html) mediante JavaScript.
 * La versión con backend equivalente vive en /jsp, donde estos mismos
 * datos se consultan desde una base de datos (ver jsp/db/schema.sql).
 */

const PROYECTOS = [
  {
    id: "tienda-ui",
    nombre: "VitrinaUI — Landing de E-commerce",
    ruta: "~/proyectos/vitrina-ui",
    descripcion:
      "Landing responsiva para una tienda ficticia, con catálogo filtrable, carrito visual y checkout maquetado con Bootstrap.",
    categoria: "frontend",
    tags: ["HTML5", "CSS3", "Bootstrap"],
    repo: "#",
  },
  {
    id: "gestor-tareas-jsp",
    nombre: "TaskFlow — Gestor de Tareas",
    ruta: "~/proyectos/taskflow-jsp",
    descripcion:
      "Aplicación CRUD para administrar tareas de curso, construida con JSP, Servlets y JDBC sobre una base de datos MySQL.",
    categoria: "jsp",
    tags: ["JSP", "Java", "MySQL"],
    repo: "#",
  },
  {
    id: "dashboard-clima",
    nombre: "ClimaYa — Panel del Clima",
    ruta: "~/proyectos/climaya",
    descripcion:
      "Consumo de una API pública para mostrar el pronóstico por ciudad, con gráficos simples y diseño adaptativo.",
    categoria: "frontend",
    tags: ["JavaScript", "API", "Bootstrap"],
    repo: "#",
  },
  {
    id: "reservas-salas",
    nombre: "SalaLibre — Reservas de Salas",
    ruta: "~/proyectos/salalibre",
    descripcion:
      "Sistema para reservar salas de estudio con validación de horarios y persistencia en base de datos vía JSP.",
    categoria: "jsp",
    tags: ["JSP", "SQL Server", "Java"],
    repo: "#",
  },
];

const HABILIDADES = [
  { nombre: "HTML5 semántico", nivel: 90 },
  { nombre: "CSS3 / Diseño responsivo", nivel: 85 },
  { nombre: "Bootstrap 5", nivel: 88 },
  { nombre: "JavaScript", nivel: 75 },
  { nombre: "Java / JSP", nivel: 70 },
  { nombre: "SQL (MySQL / SQL Server)", nivel: 72 },
  { nombre: "Git / GitHub", nivel: 80 },
  { nombre: "Accesibilidad web", nivel: 68 },
];
