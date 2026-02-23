CREATE DATABASE Colegio;
GO

USE Colegio;
GO

CREATE TABLE Estudiantes (
    id_estudiante INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    correo VARCHAR(100) UNIQUE
);

CREATE TABLE Cursos (
    id_curso INT PRIMARY KEY IDENTITY(1,1),
    nombre_curso VARCHAR(100) NOT NULL,
    creditos INT
);

CREATE TABLE Inscripciones (
    id_inscripcion INT PRIMARY KEY IDENTITY(1,1),
    id_estudiante INT,
    id_curso INT,
    fecha_inscripcion DATE,

    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

INSERT INTO Estudiantes (nombre, fecha_nacimiento, correo)
VALUES 
('Juan Perez', '2000-05-10', 'juan@email.com'),
('Maria Lopez', '1999-08-15', 'maria@email.com'),
('Carlos Ruiz', '2001-02-20', 'carlos@email.com');

INSERT INTO Cursos (nombre_curso, creditos)
VALUES
('Matematicas', 3),
('Programacion', 4),
('Base de Datos', 3);

INSERT INTO Inscripciones (id_estudiante, id_curso, fecha_inscripcion)
VALUES
(1, 1, '2024-01-10'),
(1, 2, '2024-01-12'),
(2, 3, '2024-01-15'),
(3, 1, '2024-01-18');

SELECT * FROM Estudiantes;
SELECT * FROM Cursos;
SELECT * FROM Inscripciones;

SELECT 
    Estudiantes.nombre AS Estudiante,
    Cursos.nombre_curso AS Curso,
    Inscripciones.fecha_inscripcion
FROM Inscripciones
INNER JOIN Estudiantes 
    ON Inscripciones.id_estudiante = Estudiantes.id_estudiante
INNER JOIN Cursos 
    ON Inscripciones.id_curso = Cursos.id_curso;
