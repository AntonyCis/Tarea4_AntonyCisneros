CREATE DATABASE Libreria;
USE Libreria;
-- Tabla de Clientes
CREATE TABLE Cliente (
	ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Direccion VARCHAR(255),
    Telefono VARCHAR(10)
);

-- Tabla de Autores
CREATE TABLE Autor (
	AutorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Nacionalidad VARCHAR(50),
    FechaNacimiento DATE
);

-- Tabla Libros
CREATE TABLE Libros (
	LibroID INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    FechaPublicacion DATE,
    AutorID INT,
    FOREIGN KEY (AutorID) REFERENCES Autor(AutorID)
);

-- Tabla de ventas (asociando solo un libro por venta)
CREATE TABLE Ventas (
	VentaID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    LibroID INT, -- Solo se puede registrar un libro por venta.
    Cantidad INT NOT NULL,
    FechaVenta DATE NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (LibroID) REFERENCES Libros(LibroID)
);

INSERT INTO Cliente (Nombre, Apellido, FechaNacimiento, Email, Direccion, Telefono) VALUES
('Juan', 'Pérez', '1990-05-12', 'juan.perez@example.com', 'Calle Falsa 123', '0991234567'),
('María', 'Gómez', '1985-08-20', 'maria.gomez@example.com', 'Av. Libertad 456', '0987654321'),
('Carlos', 'Lopez', '2000-01-01', 'carlos.lopez@example.com','Calle 10 de Agosto', '0976543210'),
('Ana', 'Martínez', '1995-03-15', 'ana.martinez@example.com', 'Av. América 890', '0965432109'),
('Lucía', 'Ramírez', '1988-11-30', 'lucia.ramirez@example.com', 'Av. Amazonas 567', '0954321098');

INSERT INTO Autor (Nombre, Apellido, Nacionalidad, FechaNacimiento) VALUES
('Gabriel', 'García Márquez', 'Colombiana', '1927-03-06'),
('Isabel', 'Allende', 'Chilena', '1942-08-02'),
('Jorge Luis', 'Borges', 'Argentina', '1899-08-24'),
('Mario', 'Vargas Llosa', 'Peruana', '1936-03-28'),
('Laura', 'Esquivel', 'Mexicana', '1950-09-30');

INSERT INTO Libros (Titulo, Precio, FechaPublicacion, AutorID) VALUES
('Cien años de soledad', 19.99, '1967-05-30', 1),
('La casa de los espíritus', 15.50, '1982-11-01', 2),
('Ficciones', 12.75, '1944-01-01', 3),
('La ciudad y los perros', 14.99, '1963-01-01', 4),
('Como agua para chocolate', 13.60, '1989-01-01', 5);

INSERT INTO Ventas (ClienteID, LibroID, Cantidad, FechaVenta) VALUES
(1, 1, 2, '2024-05-01'),
(2, 2, 1, '2024-05-02'),
(3, 3, 3, '2024-05-03'),
(4, 4, 1, '2024-05-04'),
(5, 5, 2, '2024-05-05');

SELECT * FROM Ventas;