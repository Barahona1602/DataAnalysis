-- Crear la base de datos si no existe
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'data')
BEGIN
  CREATE DATABASE data;
  PRINT 'Base de datos creada.';
END
GO

-- Utilizar la base de datos
USE data;
GO

-- Crear tabla para cada año solo si no existe
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'datossss')
BEGIN
  CREATE TABLE datossss (
    name NVARCHAR(100),
    year INT,
    quarter INT,
    count INT
  );
  PRINT 'Tabla datossss creada.';
END
GO

BULK INSERT datossss
FROM 'C:\Users\pbara\OneDrive - Facultad de Ingeniería de la Universidad de San Carlos de Guatemala\Archivos U Pablo\U 7mo Semestre\Gerenciales 1\DataAnalysis\issues.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\r\n',
    FIRSTROW = 2,
    CHECK_CONSTRAINTS
);

Use data;
GO
SELECT * FROM datossss;