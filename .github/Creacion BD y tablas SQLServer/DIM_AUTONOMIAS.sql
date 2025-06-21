USE ods_tfg;
GO
-- Crear la tabla autonomias
--drop table ods.dim_autonomias
CREATE TABLE ods.dim_autonomias (
   id_tabla INT IDENTITY(1,1) PRIMARY KEY,			-- Clave subrogada autoincremental
   id_autonomia INT NOT NULL UNIQUE,				-- Columna natural
   nombre_autonomia VARCHAR(100) NOT NULL,			-- Columna para el nombre de la provincia
);

-- Insertar los registros en orden alfabético sin acentos ni tildes
INSERT INTO ods.dim_autonomias (id_autonomia, nombre_autonomia)
VALUES
(1, 'Andalucia'),
(2, 'Aragon'),
(3, 'Asturias'),
(4, 'Islas Baleares'),
(5, 'Canarias'),
(6, 'Cantabria'),
(7, 'Castilla y Leon'),
(8, 'Castilla La Mancha'),
(9, 'Catalunya'),
(10, 'Comunidad Valenciana'),
(11, 'Extremadura'),
(12, 'Galicia'),
(13, 'Madrid'),
(14, 'Murcia'),
(15, 'Navarra'),
(16, 'Pais Vasco'),
(17, 'La Rioja'),
(18, 'Ceuta'),
(19, 'Melilla');