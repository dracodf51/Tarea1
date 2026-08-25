# Mi Portafolio — Fernando Quiroz

Sitio web de portafolio personal desarrollado para la actividad **"Mi Portafolio"** del curso
de Desarrollo Web II. Cubre RA1: diseño con HTML5/CSS, componentes Bootstrap, formularios
validados, contenido dinámico con JSP + base de datos, y control de versiones con GitHub.

## Estructura del proyecto

```
Tarea1/
├── MiPortafolio.sln       # Solución de Visual Studio (abre todo el proyecto)
├── index.html              # Inicio
├── habilidades.html        # Habilidades (render dinámico con JS)
├── proyectos.html          # Proyectos (render dinámico + filtros con JS)
├── experiencia.html        # Experiencia (línea de tiempo)
├── contacto.html           # Formularios de contacto, comentarios y boletín
├── css/
│   ├── reset.css           # CSS Reset
│   └── styles.css          # Estilos propios + diseño responsivo
├── js/
│   ├── data.js             # Datos de proyectos y habilidades
│   └── main.js             # Render dinámico, filtros, validación de formularios
└── jsp/                    # Versión con backend (JavaServer Pages + JDBC)
    ├── proyectos.jsp
    ├── habilidades.jsp
    ├── contacto.jsp
    ├── db/schema.sql
    ├── WEB-INF/
    └── META-INF/
```

## Cómo ver el sitio estático

Solo abre `index.html` en el navegador, o sírvelo con cualquier servidor estático
(Live Server de VS Code/Visual Studio, `npx serve`, etc.). No requiere instalación:
Bootstrap y las fuentes se cargan desde CDN.

## Cómo desplegar la parte JSP

Ver [`jsp/README.md`](jsp/README.md): requiere Apache Tomcat + MySQL, ya que JSP es
tecnología del lado del servidor en Java (no se ejecuta abriendo el archivo en el
navegador ni desde Visual Studio).

## Tecnologías

- **HTML5** semántico (`header`, `nav`, `main`, `section`, `article`, `footer`)
- **CSS3**: reset propio + estilos responsivos con variables CSS y media queries
- **Bootstrap 5**: navbar, grid, tarjetas, formularios, validación visual
- **JavaScript**: render dinámico de proyectos/habilidades, filtros, validación de
  formularios en el navegador
- **JavaServer Pages (JSP) + JDBC + MySQL**: versión con backend de proyectos,
  habilidades y contacto
- **Git / GitHub**: control de versiones

## Flujo de trabajo con Git y GitHub

```bash
# 1. Inicializar el repositorio (ya hecho en este proyecto)
git init

# 2. Crear un repositorio vacío en GitHub y conectarlo
git remote add origin https://github.com/<tu-usuario>/mi-portafolio.git

# 3. Subir la rama principal
git branch -M main
git push -u origin main

# 4. Trabajar por rama para cada nueva funcionalidad
git checkout -b feature/seccion-proyectos
git add .
git commit -m "Agrega filtros de proyectos"
git push -u origin feature/seccion-proyectos
# ...luego se abre un Pull Request hacia main en GitHub
```

Recomendación: haz commits pequeños y frecuentes, con mensajes claros (`feat:`, `fix:`,
`style:`, `docs:`), y usa una rama distinta por cada sección o mejora para simular
colaboración con compañeros de clase.
