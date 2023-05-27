/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Id]
      ,[Nombre]
      ,[Apellido]
      ,[Direccion]
      ,[Fecha_nacimiento]
  FROM [Escuela].[dbo].[Alumnos]