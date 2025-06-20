USE ods_tfg;
GO
--drop table if exists ods.dim_calendario
-- Creamos la tabla dim_calendario
DECLARE @FechaInicio DATE = '2018-01-01'
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
