/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Ccodigo]
      ,[Nnombre]
      ,[Napellido]
      ,[Nespecialidad]
      ,[NUMdni]
  FROM [FERRETERIA].[dbo].[Asesor]
  INSERT INTO Asesor(Ccodigo, Nnombre,Napellido, Nespecialidad, NUMdni) 
VALUES
(0001,'Raul','Cueva Vilca', 'Consturcci�n','78953654'),
(0002,'Cesar','Purizaca Ruesta', 'Electicista','75548814'),
(0003,'Joan','Pulache Alvarado', 'Construcci�n','72356846'),
(0004,'Daniela','Benito Aliva', 'Gafiteria','78652493'),
(0005,'Marcos','Garcia P�rez', 'Gafiteria','72349982'),
(0006,'Lenin','Sucasaca', 'Consturcci�n','78822246'),
(0007,'Leslie','Alvarado Calle', 'Electricista','75631179')