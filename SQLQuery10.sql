/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Ccodigo]
      ,[Nnombre]
      ,[Napellido]
      ,[NUMdni]
      ,[NUMplaca]
  FROM [FERRETERIA].[dbo].[Encargado]
    INSERT INTO Encargado(Ccodigo, Nnombre,Napellido, NUMdni, NUMplaca) 
VALUES
(0001,'Jedy Carlos','Yacolca Valerio', '78555411','F5U-798'),
(0002,'Juan Arturo','Velez Castro', '78221543','A1A-852'),
(0003,'Jose Ruben','Ramos Ochoa', '79663254','IA4-633'),
(0004,'Luis Juaquin','Huaman Ureta', '71149631','HP-874'),
(0005,'Sofia','Celis Quispe', '74682136','JCP-784'),
(0006,'Maria Antonia','Rojas Purizaca', '74961254','456-DS'),
(0007,'Jose','Vicente Fernandez', '79985139','PE4-875')