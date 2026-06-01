-- =====================================================================
-- ARCHIVO: 01_schema.sql
-- DESCRIPCIÓN: Estructura base de la base de datos BibliotecaDAM
-- AUTOR: Profesor/a — NO MODIFICAR ESTE ARCHIVO
-- FECHA: (25/05/2026)
-- =====================================================================
-- ARCHIVO: 03_datos_ciencia.sql
-- DESCRIPCIÓN: Libros de Ciencia Ficción para la BibliotecaDAM
-- ALUMNO: javier
--  RAMA: feature/javier-scifi
-- FECHA: 25-05-2026 /
-- =====================================================================

-- Creamos la base de datos si no existe
-- IF NOT EXISTS significa: "solo créala si todavía no existe"
CREATE DATABASE IF NOT EXISTS biblioteca_dam;

-- Nos ponemos "dentro" de esa base de datos para trabajar en ella

USE biblioteca_dam;

-- -------------------------------------------------------
-- TABLA: generos
-- Almacena los géneros literarios disponibles
-- Esta tabla es la que los alumnos deben consultar para
-- saber qué número (id) corresponde a cada género
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS generos (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    -- AUTO_INCREMENT significa que el número se asigna solo (1, 2, 3...)
    -- PRIMARY KEY significa que este campo identifica de forma única cada fila
    nombre VARCHAR(50) NOT NULL UNIQUE
    -- NOT NULL: el nombre no puede estar vacío
    -- UNIQUE: no puede haber dos géneros con el mismo nombre
);

-- -------------------------------------------------------
-- TABLA: libros
-- Almacena todos los libros de la biblioteca
-- Cada alumno añadirá libros a esta tabla desde su archivo
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS libros (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    titulo     VARCHAR(150) NOT NULL,    -- El título es obligatorio
    autor      VARCHAR(100) NOT NULL,    -- El autor es obligatorio
    anio       INT,                      -- El año puede estar vacío (libros antiguos sin fecha)
    id_genero  INT,                      -- Número que enlaza con la tabla generos
    disponible BOOLEAN DEFAULT TRUE,     -- TRUE = el libro está disponible para préstamo
    FOREIGN KEY (id_genero) REFERENCES generos(id)
    -- FOREIGN KEY: este campo debe contener un id que exista en la tabla generos
);

-- Insertamos 5 libros de Ciencia Ficción

-- El formato es: (titulo, autor, anio_publicacion, id_genero)

INSERT INTO libros (titulo, autor, anio, id_genero) VALUES

    ('Dune',                    'Frank G. Herbert',    1965, 2),

    ('Neuromante',              'William Gibson',   1984, 2),

    ('El marciano',             'Andy Weir',        2011, 2),

    ('La guerra de los mundos', 'H.G. Wells',       1898, 2),

    ('Fahrenheit 451',          'Ray Bradbury',     1953, 2);

-- =====================================================================
-- AÑADIR LIBROS DE HISTORIA
-- DESCRIPCIÓN: Inserción de 5 libros de la categoría Historia
-- Alumno: Lucía Hernández Pestana. 
-- =====================================================================
INSERT INTO libros (titulo, autor, anio, id_genero) VALUES
    ('Sapiens: De animales a dioses', 'Yuval Noah Harari', 2011, 3),
    ('Armas, gérmenes y acero', 'Jared Diamond', 1997, 3),
    ('El queso y los gusanos', 'Carlo Ginzburg', 1976, 3),
    ('Postguerra: Una historia de Europa desde 1945', 'Tony Judt', 2005, 3),
    ('SPQR: Una historia de la antigua Roma', 'Mary Beard', 2015, 3);


DESCRIPCION: Libros de novela para la BibliotecaDAM
ALUMNO: Ulises.
RAMA: uli-novela
FECHA: 25/05/2026

    INSERT INTO libros (titulo, autor, anio, id_genero, disponible)
VALUES ('Cien años de soledad', 'Gabriel García Márquez', 1967, 1, TRUE);

INSERT INTO libros (titulo, autor, anio, id_genero, disponible)
VALUES ('La sombra del viento', 'Carlos Ruiz Zafón', 2001, 1, TRUE);

INSERT INTO libros (titulo, autor, anio, id_genero, disponible)
VALUES ('1984', 'George Orwell', 1949, 1, TRUE);

-- -------------------------------------------------------
-- TABLA: socios
-- Almacena las personas que son socias de la biblioteca
-- Melisa añadirá datos a esta tabla
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS socios (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(100) NOT NULL,
    email           VARCHAR(100),
    -- NOTA: En producción, este campo debería ser NOT NULL
    -- Melisa reportará esto como un Issue durante la práctica
    fecha_registro  DATE DEFAULT (CURRENT_DATE)
    -- DEFAULT (CURRENT_DATE): si no se especifica fecha, se usa la de hoy
);

-- -------------------------------------------------------
-- DATOS INICIALES: géneros literarios
-- Estos datos los inserta el profesor. Los alumnos usarán
-- los números de id para añadir sus libros.
-- -------------------------------------------------------
INSERT INTO generos (nombre) VALUES
    ('Novela'),          -- id = 1
    ('Ciencia Ficción'), -- id = 2
    ('Historia'),        -- id = 3
    ('Poesía'),          -- id = 4
    ('Terror'),          -- id = 5
    ('Aventura'),        -- id = 6
    ('Humor'),           -- id = 7
    ('Filosofía');       -- id = 8

-- -------------------------------------------------------
-- VERIFICACIÓN FINAL
-- Estas líneas muestran las tablas creadas como confirmación
-- -------------------------------------------------------
SHOW TABLES;
SELECT * FROM generos; -- Muestra la lista de géneros con sus IDs

-- Pendiente: Incluir 'Fundación' en la tabla de sci-fi / MODIFICADO POR: Javier Fernández Alonso
