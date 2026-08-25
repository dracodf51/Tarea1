-- =========================================================
-- Esquema de base de datos · Mi Portafolio (Fernando Quiroz)
-- Motor: MySQL 8.x
-- Uso: alimenta el contenido dinámico servido por las páginas JSP
--      (proyectos.jsp, habilidades.jsp, contacto.jsp)
-- =========================================================

CREATE DATABASE IF NOT EXISTS portafolio_fernando
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE portafolio_fernando;

-- ---------------------------------------------------------
-- Proyectos mostrados en /jsp/proyectos.jsp
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS proyectos (
  id            INT AUTO_INCREMENT PRIMARY KEY,
  nombre        VARCHAR(120)  NOT NULL,
  ruta          VARCHAR(120)  NOT NULL,
  descripcion   VARCHAR(400)  NOT NULL,
  categoria     VARCHAR(30)   NOT NULL,   -- 'frontend' | 'jsp'
  tags          VARCHAR(150)  NOT NULL,   -- separados por coma
  repo_url      VARCHAR(255)  DEFAULT '#',
  creado_en     TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------
-- Habilidades mostradas en /jsp/habilidades.jsp
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS habilidades (
  id            INT AUTO_INCREMENT PRIMARY KEY,
  nombre        VARCHAR(100) NOT NULL,
  nivel         TINYINT UNSIGNED NOT NULL CHECK (nivel BETWEEN 0 AND 100),
  orden         INT DEFAULT 0
);

-- ---------------------------------------------------------
-- Mensajes recibidos desde el formulario de /jsp/contacto.jsp
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS mensajes_contacto (
  id              INT AUTO_INCREMENT PRIMARY KEY,
  nombre          VARCHAR(120) NOT NULL,
  correo          VARCHAR(150) NOT NULL,
  telefono        VARCHAR(20),
  motivo          VARCHAR(30)  NOT NULL,
  mensaje         VARCHAR(1000) NOT NULL,
  consentimiento  BOOLEAN      NOT NULL DEFAULT FALSE,
  creado_en       TIMESTAMP    DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------------------------------------
-- Suscriptores del boletín
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS suscriptores (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  correo      VARCHAR(150) NOT NULL UNIQUE,
  creado_en   TIMESTAMP    DEFAULT CURRENT_TIMESTAMP
);

-- =========================================================
-- Datos de ejemplo
-- =========================================================
INSERT INTO proyectos (nombre, ruta, descripcion, categoria, tags, repo_url) VALUES
('Mantención página web — Narbona Consultores', '~/proyectos/narbona-consultores',
 'Mantención periódica del sitio web corporativo de Narbona Consultores (narbonaconsultores.cl): actualización de contenidos e imágenes, revisión de enlaces rotos, ajustes de estilo y verificación de que el sitio cargue rápido y se vea bien en celular.',
 'web', 'HTML/CSS,WordPress,Mantenimiento web', 'https://narbonaconsultores.cl'),
('Servicio técnico computacional', '~/servicios/soporte-tecnico',
 'Atención de soporte técnico a equipos computacionales para clientes particulares y pequeñas empresas: diagnóstico de fallas de hardware y software, formateo e instalación de sistemas operativos, mantenimiento preventivo y limpieza física de equipos.',
 'soporte', 'Hardware,Software,Soporte técnico', ''),
('Mantención de servicios en la DGAC', '~/servicios/dgac',
 'Soporte y mantención de equipos y servicios informáticos para la Dirección General de Aeronáutica Civil (DGAC): revisión periódica de estaciones de trabajo, atención de incidencias y coordinación con el equipo de TI institucional.',
 'soporte', 'Soporte TI,Redes,Sector público', '');

INSERT INTO habilidades (nombre, nivel, orden) VALUES
('HTML5 semántico', 90, 1),
('CSS3 / Diseño responsivo', 85, 2),
('Bootstrap 5', 88, 3),
('JavaScript', 75, 4),
('Java / JSP', 70, 5),
('SQL (MySQL / SQL Server)', 72, 6),
('Git / GitHub', 80, 7),
('Accesibilidad web', 68, 8);
