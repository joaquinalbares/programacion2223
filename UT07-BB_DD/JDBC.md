# CONEXIÓN A BASE DE DATOS USANDO JDBC

Una base de datos consiste en datos organizados; es decir, los datos en sí y un esquema que proporciona estructuras de datos. Hoy en día, la mayoría de las bases de datos están organizadas en tablas que consisten en filas y columnas. Esta es una forma natural de organizar los datos, y probablemente estés familiarizado con ellos a través del uso de hojas de cálculo. Puede definir las características de la tabla independientemente de los datos reales que va a almacenar en ella. Un campo es un elemento de datos individual dentro de una tabla que corresponde a la intersección de una fila y una columna. Se pueden especificar una o más columnas como claves únicas para identificar a cada empleado. Para este propósito, puede usar una de las columnas mencionadas anteriormente o la combinación de nombre, apellido y fecha de nacimiento. La clave única utilizada  preferentemente sobre las demás se llama la clave principal o primaria de una tabla.

Casi cualquier aplicación no trivial contiene algún tipo de base de datos. Algunas aplicaciones utilizan una base de datos en memoria, mientras que otras utilizan un sistema tradicional de gestión de bases de datos relacionales (RDBMS). En cualquier caso, es esencial que todos los desarrolladores de Java tengan algunas habilidades para trabajar con bases de datos. A lo largo de los años, la API de conectividad de bases de datos Java (JDBC) ha evolucionado bastante, y en las últimas dos versiones, ha habido algunos avances importantes.

Este capítulo cubre los conceptos básicos del uso de JDBC para trabajar con bases de datos. Aprendes a realizar todas las operaciones estándar de la base de datos y algunas técnicas avanzadas para manipular datos.

## Instalación de MYSQL

Damos por hecho que MySQL está instalado en el equipo, si no es asi, procedemos a instalarlo.

## Creación de la base de datos de muestra

En primer lugar, definimos una base de datos simple llamada apressBooks con dos tablas:  Recipes y publications. El diseño lógico de la base de datos se muestra en la Tabla 12-1 y la Tabla 12-2, caracterizado por el nombre, la longitud, el tipo de datos y las restricciones (es decir, un campo es una clave primaria y otro no debe ser nulo).

![2123f0147378e017e40e661ac613c60c.png](_resources/2123f0147378e017e40e661ac613c60c.png)

![9a1dd321bcc3237f81a956aa4b793f02.png](_resources/9a1dd321bcc3237f81a956aa4b793f02.png)

Las sentencias SQL para la creación de la base de datos, los permisos y las tablas son las siguientes:

```sql
DROP DATABASE IF EXISTS `apressBooks`;
CREATE DATABASE `apressBooks`;
CREATE TABLE `apressBooks`.`recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recipe_number` varchar(10) NOT NULL,
  `recipe_name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;
 
insert into apressBooks.recipes values(1, 
'12-1',
'Installing MySQL',
'Downloading and installation of a MySQL Database'); 
 
insert into apressBooks.recipes values(2, 
'12-2',
'Connecting to a Database',
'DriverManager and DataSource Implementations');

insert into apressBooks.recipes values(3,
'12-3',
'Handling SQL Exceptions',
'Using SQLException');

insert into apressBooks.recipes values(4,
'12-4',
'Querying a Database and Retrieving Results',
'Obtaining and using data from a DBMS');

CREATE TABLE `apressBooks`.`publication` (
  `id` int NOT NULL AUTO_INCREMENT,
  `book_title` varchar(500) NOT NULL,
  `publish_date` date DEFAULT NULL,
  `publish_co` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

insert into apressBooks.publication values (
1,
'Java 17 Recipes',
date('2021-12-01'),
'APRESS');

insert into apressBooks.publication values (
2,
'Beginning Jakarta EE Web Development',
date('2021-04-03'),
'APRESS');


CREATE USER 'usuario3PAW'@'localhost' IDENTIFIED BY 'P@ssw0rd';

GRANT ALL PRIVILEGES ON apressBooks.* TO 'usuario3PAW'@'localhost';

FLUSH PRIVILEGES;
```

## Pasos para la conectividad entre el programa Java y la base de datos

### 1. Importar los paquetes

Para la conexión de Java con la base de datos usamos un objeto de conexión JDBC para obtener la conexión. 

Crear una conexión JDBC implica unos pocos pasos. En primer lugar, debe determinar qué controlador de base de datos necesita. Después de determinar qué controlador necesita, descargue el archivo JAR que contiene ese controlador y colóquelo en su ruta de clase. Cada proveedor de bases de datos proporciona diferentes controladores JDBC empaquetados en archivos JAR con diferentes nombres; consulte

La documentación de su base de datos para obtener más información. Para nuestro caso (Mysql) , se puede descargar el conector en https://dev.mysql.com/downloads/connector/j/. Hay que asegurarse de que la plataforma seleccionada sea "Independiente de la plataforma": esto es importante para distribuir el software en diferentes sistemas. 

![0a9cb084e7d0c06a1627ac0f46548ba8.png](_resources/0a9cb084e7d0c06a1627ac0f46548ba8.png)

En la siguiente ventana pinchamos en el texto: 
> No thanks, just start my download.

![290f0636ce0022ea657df0cb4d059025.png](_resources/290f0636ce0022ea657df0cb4d059025.png)

obtenemos un archivo comprimido que incluye el archivo "mysql-connector-j-8.0.32.jar", la librería que vamos a importar a nuestro proyecto.

> Podemos descargar el archivo jar [pichando aqui](https://github.com/joaquinalbares/programacion2223/blob/main/UT07/_resources/mysql-connector-j-8.0.32.jar)

Este archivo lo copiamos a la carpeta "lib" de nuestro proyecto, si estamos en VSC.

![edbe536a56974839f8dd66d64f2613e7.png](_resources/edbe536a56974839f8dd66d64f2613e7.png)


### Paso 2: Establecer una conexión mediante el objeto de clase Connection

Después de cargar el controlador, establezca las conexiones como se muestra a continuación de la siguiente manera:

`Connection con = DriverManager.getConnection(url,user,password)`

Los elementos de esta instrucción son:

- **user**: Username desde el que se puede acceder a su símbolo del sistema SQL.
- **password**: contraseña desde la que se puede acceder al símbolo del sistema SQL.
- **Url**: Localizador uniforme de recursos que se crea como se muestra a continuación: `String url = “ jdbc:mysql://localhost:3306/Basededatos”` y está compuesto de los siguientes elementos:
  - `jdbc` es el conector/driver utilizado, 
  - `mysql` es la base de datos utilizada, 
  - `localhost` es la dirección IP donde se almacena una base de datos, 
  - `3306` es el número de puerto 
  - `Basededatos` es la base de datos sobre la que vamos a trabajar. 
  
  Los 3 parámetros anteriores son de tipo String y deben ser declarados por el programador antes de llamar a la función.
    
Esta sentencia devuelve un objeto de tipo **con**, una referencia a la interfaz de conexión.

### Paso 3: Crear una instrucción

La interfaz `statement` se utiliza para crear sentencias básicas SQL en Java y proporciona métodos para ejecutar consultas con la base de datos. Hay diferentes tipos de sentencias que se utilizan en JDBC de la siguiente manera:

- Crear instrucción (Create Statement)
- Declaración preparada (Prepared Statement)
- Declaración invocable (Callable Statement).

Para nuestro ejemplo, vamos a llamar al método para crear instrucción , que generalmente se usa para el acceso de propósito general a bases de datos y es útil cuando se usan instrucciones SQL estáticas en tiempo de ejecución.

Usando el elemento de conexión del paso anterior, ejecutaremos las siguiente sentencia:

`Statement st = con.createStatement();`

### Paso 4: Ejecutar la consulta

Ahora viene la parte más importante, es decir, ejecutar la consulta. La consulta aquí es una consulta SQL. Una vez creado el objeto Statement, hay tres formas de ejecutar dicha consulta:

- **boolean execute(String SQL)**: Si se recupera el objeto ResultSet, devuelve true o se devuelve false. Se utiliza para ejecutar sentencias [DDL](https://www.geeksforgeeks.org/sql-ddl-dql-dml-dcl-tcl-commands/) de SQL o para SQL dinámico.
- **int executeUpdate(String SQL)**: Devuelve el número de filas afectadas por la ejecución de la instrucción, que se utiliza cuando se necesita un número para las instrucciones INSERT, DELETE o UPDATE.
- **ResultSet executeQuery (String SQL)**: Devuelve un objeto ResultSet. Se usa de manera similar a SELECT en SQL.

Nos centraremos en la tercera de momento, pues solo vamos a recuperar datos de la base de datos. La sentencia sería la siguiente:

`ResultSet rs = st.executeQuery(query);`


### Código:
Con todo lo visto anteriormente, el código quedaría así:

```java
import java.io.*;
import java.sql.*;

class App {
    public static void main(String[] args) throws Exception {
        // detalles de la conexión (conector, servidor, puerto y base de datos)
        String url = "jdbc:mysql://localhost:3306/apressBooks";
        // Credenciales MySQL
        String username = "usuario3PAW";
        String password = "P@ssw0rd";
        

        Connection con = DriverManager.getConnection(url, username, password);
        System.out.println("Conexión Establecida con éxito");
        
        Statement st = con.createStatement();
        // Ejecutamos la consulta
        ResultSet rs = st.executeQuery(query);
        rs.next();
        // Recuperamos los datos de la tabla
        String name = rs.getString("book_title");
        // Mostramos los resultados por consola
        System.out.println(name);
        // Cerramos la consulta
        st.close();
        // Cerramos la conexión
        con.close();
        System.out.println("Conexión Cerrada....");
    }
}
```
