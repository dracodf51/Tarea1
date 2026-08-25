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
('VitrinaUI — Landing de E-commerce', '~/proyectos/vitrina-ui',
 'Landing responsiva para una tienda ficticia, con catálogo filtrable y checkout maquetado con Bootstrap.',
 'frontend', 'HTML5,CSS3,Bootstrap', '#'),
('TaskFlow — Gestor de Tareas', '~/proyectos/taskflow-jsp',
 'Aplicación CRUD para administrar tareas de curso, construida con JSP, Servlets y JDBC sobre MySQL.',
 'jsp', 'JSP,Java,MySQL', '#'),
('ClimaYa — Panel del Clima', '~/proyectos/climaya',
 'Consumo de una API pública para mostrar el pronóstico por ciudad, con diseño adaptativo.',
 'frontend', 'JavaScript,API,Bootstrap', '#'),
('SalaLibre — Reservas de Salas', '~/proyectos/salalibre',
 'Sistema para reservar salas de estudio con validación de horarios y persistencia vía JSP.',
 'jsp', 'JSP,SQL Server,Java', '#');

INSERT INTO habilidades (nombre, nivel, orden) VALUES
('HTML5 semántico', 90, 1),
('CSS3 / Diseño responsivo', 85, 2),
('Bootstrap 5', 88, 3),
('JavaScript', 75, 4),
('Java / JSP', 70, 5),
('SQL (MySQL / SQL Server)', 72, 6),
('Git / GitHub', 80, 7),
('Accesibilidad web', 68, 8);
