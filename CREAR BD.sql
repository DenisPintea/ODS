USE ods_tfg;
GO
-- Crear la tabla autonomias
--drop table ods.dim_autonomias
--CREATE TABLE ods.dim_autonomias (
--    ID_Autonomia INT IDENTITY(1,1) PRIMARY KEY,  -- Columna autoincremental
--    Nombre_provincia VARCHAR(100)       -- Columna para el nombre de la provincia
--);
--CREAR SCHEMA L1
--GO
create schema L1;

--CREAR SCHEMA L2
--GO
create schema L2;

-- Crear la tabla dim_autonomias
CREATE TABLE dim_autonomias (
    id_autonomia INT PRIMARY KEY,
    nombre_autonomia VARCHAR(100) NOT NULL
);

-- Insertar los registros en orden alfabético sin acentos ni tildes
INSERT INTO dim_autonomias (id_autonomia, nombre_autonomia)
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


--INSERT

--drop table if exists dim_calendario
-- Creamos la tabla dim_calendario
DECLARE @FechaInicio DATE = '2019-01-01'
DECLARE @FechaFin DATE = '2025-12-31'

;WITH Calendario AS (
    SELECT @FechaInicio AS Fecha
    UNION ALL
    SELECT DATEADD(DAY, 1, Fecha)
    FROM Calendario
    WHERE DATEADD(DAY, 1, Fecha) <= @FechaFin
)
SELECT 
    Fecha,
    YEAR(Fecha) AS Año,
    MONTH(Fecha) AS Mes,
    DATENAME(MONTH, Fecha) AS MesNombre,
    DATEPART(QUARTER, Fecha) AS Trimestre,
    DATEPART(WEEKDAY, Fecha) AS DíaSemana,
    DATENAME(WEEKDAY, Fecha) AS NombreDiaSemana,
    DAY(Fecha) AS DíaDelMes
INTO ods.dim_calendario
FROM Calendario
OPTION (MAXRECURSION 0);

-- Forzamos a que las columnas sean no null
ALTER TABLE ods.dim_calendario
ALTER COLUMN Fecha DATE NOT NULL;

ALTER TABLE ods.dim_calendario
ALTER COLUMN Año INT NOT NULL;

ALTER TABLE ods.dim_calendario
ALTER COLUMN Mes INT NOT NULL;

ALTER TABLE ods.dim_calendario
ALTER COLUMN MesNombre NVARCHAR(20) NOT NULL;

ALTER TABLE ods.dim_calendario
ALTER COLUMN Trimestre INT NOT NULL;

ALTER TABLE ods.dim_calendario
ALTER COLUMN DíaSemana INT NOT NULL;

ALTER TABLE ods.dim_calendario
ALTER COLUMN NombreDiaSemana NVARCHAR(20) NOT NULL;

ALTER TABLE ods.dim_calendario
ALTER COLUMN DíaDelMes INT NOT NULL;
