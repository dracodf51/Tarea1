# Despliegue de la parte JSP

Esta carpeta es un mini "webapp" Java independiente que demuestra el punto 5 de la
actividad (JavaServer Pages + base de datos). Visual Studio no ejecuta JSP directamente
(es tecnología Java), así que estos archivos se despliegan en un servidor de aplicaciones
Java como **Apache Tomcat**. Pasos:

## 1. Requisitos

- JDK 17+
- Apache Tomcat 10.x (usa la especificación Jakarta EE, igual que `WEB-INF/web.xml`)
- MySQL 8.x
- Conector `mysql-connector-j-*.jar` copiado en `TOMCAT_HOME/lib`

## 2. Base de datos

Ejecuta el script en tu cliente MySQL:

```bash
mysql -u root -p < db/schema.sql
```

Esto crea la base `portafolio_fernando` con las tablas `proyectos`, `habilidades`,
`mensajes_contacto` y `suscriptores`, más datos de ejemplo.

## 3. Compilar la clase de conexión

```bash
javac -d WEB-INF/classes WEB-INF/classes/db/DBUtil.java
```

(o configura el proyecto en tu IDE Java favorito — Eclipse/IntelliJ — para que compile
automáticamente `WEB-INF/classes/db/DBUtil.java`).

## 4. Configurar credenciales

Ajusta usuario/clave en:

- `WEB-INF/classes/db/DBUtil.java` (conexión directa con `DriverManager`), o
- `META-INF/context.xml` (recomendado: DataSource JNDI `jdbc/PortafolioDB`)

## 5. Desplegar en Tomcat

Copia esta carpeta (`jsp/`) dentro de `TOMCAT_HOME/webapps/portafolio/` y arranca Tomcat.
Luego visita:

- `http://localhost:8080/portafolio/proyectos.jsp`
- `http://localhost:8080/portafolio/habilidades.jsp`
- `http://localhost:8080/portafolio/contacto.jsp`

## Archivos

| Archivo | Función |
|---|---|
| `proyectos.jsp` | Lista proyectos leyendo la tabla `proyectos` vía JDBC |
| `habilidades.jsp` | Lista habilidades leyendo la tabla `habilidades` vía JDBC |
| `contacto.jsp` | Valida y guarda el formulario de contacto en `mensajes_contacto` |
| `db/schema.sql` | Esquema y datos de ejemplo |
| `WEB-INF/classes/db/DBUtil.java` | Utilidad de conexión JDBC |
| `WEB-INF/web.xml` | Descriptor del webapp |
| `META-INF/context.xml` | DataSource JNDI |
