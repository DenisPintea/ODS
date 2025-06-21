USE ods_tfg;
GO

--Crear la dimension calendario
--drop table if exist dim_calendario

CREATE TABLE ods.dim_calendario (
    id_tabla INT IDENTITY(1,1) PRIMARY KEY,  -- Clave subrogada autoincremental
    anio INT NOT NULL,							--Clave natural año
    mes INT NOT NULL,							--Clave natural mes
    nombre_mes VARCHAR(20) NOT NULL
);

DECLARE @anio INT = 2018;
DECLARE @fin_anio INT = 2025;
DECLARE @mes INT;

WHILE @anio <= @fin_anio
BEGIN
    SET @mes = 1;
    WHILE @mes <= 12
    BEGIN
        INSERT INTO ods.dim_calendario (anio, mes, nombre_mes)
        VALUES (
            @anio,
            @mes,
            DATENAME(MONTH, DATEFROMPARTS(@anio, @mes, 1))
        );
        SET @mes = @mes + 1;
    END;
    SET @anio = @anio + 1;
END;
