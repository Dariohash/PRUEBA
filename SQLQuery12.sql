/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Ccodigo]
      ,[Ncampania]
      ,[Dfecha_inicio]
      ,[Dfecha_fin]
  FROM [FERRETERIA].[dbo].[Sorteo]
      INSERT INTO Sorteo(Ccodigo, Ncampania,Dfecha_inicio, Dfecha_fin) 
VALUES
(0001,'10 Bolsas de cemento Sol','2022-01-12','2022-02-13'),
(0002,'10 Varias 1/2 Aceros Arequipa','2022-02-10','2022-03-09'),
(0003,'1 Lavacaras Karson','2021-03-25','2021-04-27'),
(0004,'50 m^2 de porcelanto Klipen','2020-11-09','2020-12-23'),
(0005,'1 rollo de Cable para eclecticidad AWS-90','2021-08-04','2021-09-05')
