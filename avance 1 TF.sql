/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Ccodigo]
      ,[Nnombre]
  FROM [FERRETERIA].[dbo].[Categoria]
    INSERT INTO Categoria(Ccodigo, Nnombre) 
VALUES
(0001,'Fierro'),
(0002,'Cemento'),
(0003,'Inodoros'),
(0004,'Pintura'),
(0005,'Piedra Pilca'),
(0006,'Cerámica'),
(0007,'Porcelanato')