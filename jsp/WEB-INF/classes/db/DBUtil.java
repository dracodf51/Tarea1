package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * DBUtil
 * Utilidad de conexión JDBC a la base de datos "portafolio_fernando"
 * (ver jsp/db/schema.sql). Pensada para un servlet container tipo
 * Apache Tomcat con el conector MySQL/Connector-J en el classpath.
 *
 * Compilar dentro de WEB-INF/classes (o vía un build con Maven/Gradle)
 * para que las páginas JSP puedan usar db.DBUtil.getConnection().
 */
public class DBUtil {

  private static final String URL =
      "jdbc:mysql://localhost:3306/portafolio_fernando?useSSL=false&serverTimezone=UTC";
  private static final String USUARIO = "root";
  private static final String CLAVE = "cambia_esta_clave";

  static {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
      throw new RuntimeException("No se encontró el driver JDBC de MySQL en el classpath.", e);
    }
  }

  private DBUtil() {
    // Clase de utilidad: no se instancia.
  }

  public static Connection getConnection() throws SQLException {
    return DriverManager.getConnection(URL, USUARIO, CLAVE);
  }
}
