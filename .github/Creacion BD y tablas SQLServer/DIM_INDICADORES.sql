USE ods_tfg;
GO

--Crear la dimension indicador
--drop table if exist dim_indicadores

CREATE TABLE ods.dim_indicadores (
    id_tabla INT IDENTITY(1,1) PRIMARY KEY,         -- Clave autoincremental
    id_indicador VARCHAR(10) NOT NULL UNIQUE,		-- Clave subrogada
    descripcion_indicador VARCHAR(200) NOT NULL,    -- Nombre descriptivo del indicador
    unidades VARCHAR(50) NOT NULL,                  -- Unidades de medida (%, índice, etc.)
    fuente VARCHAR(3) NOT NULL                      -- fuente de los datos (INE, FAO)
);

-- Insertar los registros en orden alfabético sin acentos ni tildes
INSERT INTO ods.dim_indicadores (id_indicador, descripcion_indicador, unidades, fuente)
VALUES
('2.4.1', 'Proporcion de la superficie agricola en que se practica una agricultura ecologica', 'Porcentaje', 'INE'),
('2.5.1', 'Recursos genéticos vegetales con material reproductivo almacenado en instalaciones de conservación a medio o largo plazo', 'Numero', 'INE'),
('2.A.2.1', 'AOD bruta destinada al sector agrícola', 'Millones de euros', 'INE'),
('2.A.2.2', 'AOD neta destinada al sector agrícola', 'Millones de euros', 'INE'),
('2.C.1.1', 'IPC en los alimentos', 'Indice', 'INE'),
('2.C.1.2', 'IPC en el pan y los cereales', 'Indice', 'INE'),
('2.A.1.1', 'Indice de orientación agrícola para el gasto publico', 'Indice', 'INE'),
('2.A.1.2', 'Valor añadido de la agricultura como porcentaje del PIB', 'Porcentaje', 'INE'),
('2.A.1.3', 'Porcentaje de la agricultura en el gasto publico', 'Porcentaje', 'INE'),
('15.2.1.1', 'Superficie forestal sostenible', 'Hectareas', 'INE'),
('15.2.1.2', 'Porcentaje de superifice forestal sostenible', 'Porcentaje', 'INE'),
('15.6.1.5', 'Total de ANTM que transfieren recursos fitogenéticos para la alimentación y la agricultura', 'Numero', 'INE'),
('15.A.1.1', 'AOD y gasto público destinados a la conservación y el uso sostenible de la biodiversidad y los ecosistemas', 'Millones de euros', 'INE'),
('15.B.1.1', 'Financiación movilizada asociada destinada a la conservación y el uso sostenible de la biodiversidad y los ecosistemas', 'Millones de euros', 'INE'),
('2.5.1.A', 'Recursos fitogenéticos para la alimentación y la agricultura preservados en instalaciones de conservación a medio y largo plazo', 'Numero', 'FAO'),
('2.1.2', 'Prevalencia de la inseguridad alimentaria moderada o grave entre la población, según la escala de experiencia de inseguridad alimentaria', 'Porcentaje', 'FAO'),
('2A.1.1', 'Indice de orientación agrícola para el gasto publico', 'Indice', 'FAO'),
('2A.1.2', 'Valor añadido de la agricultura como porcentaje del PIB', 'Porcentaje', 'FAO'),
('2A.1.3', 'Porcentaje de la agricultura en el gasto publico', 'Porcentaje', 'FAO'),
('2.C.1', 'Indicador de anomalías en los precios de los alimentos.', 'Indice', 'FAO'),
('15.2.1', 'Superficie forestal certificada conforme a un sistema de certificación verificado de forma independiente', 'Miles de hectareas', 'FAO'),
('15.6.1-5', 'Total de ANTM que transfieren recursos fitogenéticos para la alimentación y la agricultura', 'Numero', 'FAO')
;