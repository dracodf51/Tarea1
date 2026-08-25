/**
 * data.js
 * Fuente única de datos para renderizar contenido dinámico en el sitio
 * estático (proyectos.html, habilidades.html) mediante JavaScript.
 * La versión con backend equivalente vive en /jsp, donde estos mismos
 * datos se consultan desde una base de datos (ver jsp/db/schema.sql).
 */

const PROYECTOS = [
  {
    id: "narbona-consultores",
    nombre: "Mantención página web — Narbona Consultores",
    ruta: "~/proyectos/narbona-consultores",
    descripcion:
      "Mantención periódica del sitio web corporativo de Narbona Consultores (narbonaconsultores.cl): actualización de contenidos e imágenes, revisión de enlaces rotos, ajustes de estilo y verificación de que el sitio cargue rápido y se vea bien en celular.",
    categoria: "web",
    tags: ["HTML/CSS", "WordPress", "Mantenimiento web"],
    repo: "https://narbonaconsultores.cl",
    enlaceTexto: "Visitar sitio →",
  },
  {
    id: "servicio-tecnico",
    nombre: "Servicio técnico computacional",
    ruta: "~/servicios/soporte-tecnico",
    descripcion:
      "Atención de soporte técnico a equipos computacionales para clientes particulares y pequeñas empresas: diagnóstico de fallas de hardware y software, formateo e instalación de sistemas operativos, mantenimiento preventivo y limpieza física de equipos.",
    categoria: "soporte",
    tags: ["Hardware", "Software", "Soporte técnico"],
    repo: "",
  },
  {
    id: "dgac",
    nombre: "Mantención de servicios en la DGAC",
    ruta: "~/servicios/dgac",
    descripcion:
      "Soporte y mantención de equipos y servicios informáticos para la Dirección General de Aeronáutica Civil (DGAC): revisión periódica de estaciones de trabajo, atención de incidencias y coordinación con el equipo de TI institucional.",
    categoria: "soporte",
    tags: ["Soporte TI", "Redes", "Sector público"],
    repo: "",
  },
];

const HABILIDADES = [
  { nombre: "Soporte computacional", nivel: 85 },
  { nombre: "Armado y configuración", nivel: 74 },
  { nombre: "Electrónica computacional", nivel: 75 },
  { nombre: "Cambio de componentes (pantallas, memorias)", nivel: 63 },
];
