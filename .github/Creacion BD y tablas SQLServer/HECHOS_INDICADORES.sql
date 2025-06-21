USE ods_tfg;
GO

--Crear la tabla de hechos (fact) hechos_indicadores

CREATE TABLE L3.hechos_indicadores (
    id_hecho INT IDENTITY(1,1) PRIMARY KEY,		--(PK) clave primaria subrogada de la tabla
    id_fact_indicador INT NOT NULL,		--(PFK) clave foranea primaria de dim_indicador
    id_fact_calendario INT NOT NULL,			--(PFK) clave foranea primaria de dim_calendario
    id_fact_autonomia INT NOT NULL,				--(PFK) clave foranea primaria de dim_autonomia
    valor DECIMAL(15,3),						--medida del indicador
);