--TABLAS FAO:

--1)CREAR TABLA L2_FAO_ODS_2C1
CREATE TABLE [L2].L2_FAO_ODS_2C1
(
  id_L2_fao_ods_2c1 BIGINT PRIMARY KEY IDENTITY(1,1)
, id_indicador INT
, id_calendario INT
, id_autonomia INT
, IPC DECIMAL(10,3)
)
;