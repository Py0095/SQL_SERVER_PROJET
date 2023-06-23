/* insertion des donnes */
USE projet_L3
GO

INSERT INTO Mon_projet.Services VALUES ('Depannage',GETDATE()),
							('Intelligence artificielle',GETDATE()),
							('Reseau',GETDATE()),
							('Programmation',GETDATE()),
							('Robotique',GETDATE()),
							('Securite informatique',GETDATE()),
							('Systeme information',GETDATE()),
							('Sauvegarde',GETDATE()),
							('DNS',GETDATE()),
							('WEB',GETDATE())

INSERT INTO Mon_projet.Employe VALUES 
('Baptist','Stephanie','2003-02-24','Port-au-prince',100000,'depaneur',2),
							('eldor','Kenley','2001-12-11','Port-au-prince',90000,'resauman',1),
							('elton','Barbara','2002-12-11','Port-au-prince',90000,'graphiste',3),
							('elbai','Bryan','1999-05-11','Cap-Haitien',75000.8,'databasien',4),
							('nazaire','sadlie','2002-12-11','Port-au-prince',100000,'petit personnel',5),
							('MARC','anderson','2002-12-11','Port-au-prince',100000,'adm',6),
							('rene','dukens','2002-12-11','Port-au-prince',100000,'ressources  humaine',7),
							('sanon','jean dukens','2002-12-11','Port-au-prince',100000,'strategie marketing',8),
							('cesar','roodensley','2002-12-11','Port-au-prince',100000,'AI',9),
							('beauville','ruth','2002-12-11','Port-au-prince',100000,'programmeur',10),

('Baptist','Stephanie','2003-02-24','Port-au-prince',100000,'depaneur',2),
							('Beldor','Kenley','2001-12-11','Port-au-prince',90000,'resauman',1),
							('PIERRE','Barbara','2002-12-11','Port-au-prince',90000,'graphiste',3),
							('Nicaisse','Bryan','1999-05-11','Cap-Haitien',75000.8,'databasien',4),
							('nazaire','sadlie','2002-12-11','Port-au-prince',100000,'petit personnel',5),
							('MARC','anderson','2002-12-11','Port-au-prince',100000,'adm',6),
							('rene','dukens','2002-12-11','Port-au-prince',100000,'ressources  humaine',7),
							('sanon','jean dukens','2002-12-11','Port-au-prince',100000,'strategie marketing',8),
							('cesar','roodensley','2002-12-11','Port-au-prince',100000,'AI',9),
							('beauville','ruth','2002-12-11','Port-au-prince',100000,'programmeur',10)

INSERT INTO Mon_projet.Projet VALUES ('Reparer tous les ordinateurs','Port-au-prince',20,1),
						('Creer un programme de reconnaissance faciale','Port-au-prince',10,2),
						('Ameliore le service reseau','Port-au-prince',10,3),
						('Creer un programme de comptabilite','Port-au-prince',10,4),
						('Creer des robots pour porter des materiaux','Port-au-prince',10,5),
						('Renforce le systeme de securite','Port-au-prince',10,6),
						('Ameliorer le systeme information','Port-au-prince',10,7),
						('Creer une strategie de backup','Port-au-prince',10,8),
						('Ameliorer le server DNS','Port-au-prince',10,9),
						('Ameliorer le serveur Web','Port-au-prince',10,10)

INSERT INTO Mon_projet.Tache VALUES (1,'Acheter les materiaux','2022-05-19','2022-05-23',1000000,1),
						(2,'Recuperer les donnees','2022-05-19','2022-09-01',1000000,2),
						(3,'Acheter les materiaux','2022-05-19','2022-05-23',1000000,3),
						(4,'Creer le modele','2022-05-19','2022-06-01',1000000,4),
						(5,'Recuperer les donnees','2022-05-19','2022-10-01',1000000,5),
						(6,'Analyser le systeme en place','2022-05-19','2022-07-01',1000000,6),
						(7,'Acheter le systeme en place','2022-05-19','2022-07-01',1000000,7),
						(8,'Mettre en place le modele','2022-05-19','2022-08-01',1000000,8),
						(9,'Analyser le serveur en place','2022-05-19','2022-07-01',10000000,9),
						(10,'Analyser le serveur en place','2022-05-19','2022-07-01',10000000,10)

INSERT INTO Mon_projet.Travail VALUES (1,1,3),
						(2,2,3),
						(3,3,3),
						(4,4,3),
						(5,5,3),
						(6,6,3),
						(7,7,3),
						(8,8,3),
						(9,9,3),
						(10,10,3)



SELECT * FROM Mon_projet.Employe