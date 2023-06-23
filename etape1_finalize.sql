/*Creation de la base de donnee et des tables*/

CREATE DATABASE projet_L3


USE projet_L3


CREATE TABLE Services
(
	Num_serv INT PRIMARY KEY IDENTITY(1,1),
	Nom_serv VARCHAR(50) NOT NULL,
	Date_création DATE NOT NULL
	CONSTRAINT ck_nom_serv UNIQUE(Nom_serv)
)


CREATE TABLE Employe
(
	Matricule INT PRIMARY KEY IDENTITY(1,1),
	Nom VARCHAR(50) NOT NULL,
	Prenom VARCHAR(50) NOT NULL,
	Date_naissance DATE NOT NULL,
	Adresse VARCHAR(100) NOT NULL,
	Salaire	FLOAT NOT NULL,
	Grade VARCHAR(50) NOT NULL,
	Num_serv INT FOREIGN KEY(Num_serv) REFERENCES Services(Num_serv) NOT NULL
)
ALTER TABLE Employe
ADD CONSTRAINT CK_Employe_dateNaissance CHECK(YEAR(GETDATE())-YEAR(Date_naissance)>18
	 OR (YEAR(GETDATE())-YEAR(Date_naissance)=18 AND MONTH(GETDATE())-MONTH(Date_naissance)>0)
	 OR (YEAR(GETDATE())-YEAR(Date_naissance)=18 AND MONTH(GETDATE())-MONTH(Date_naissance)=0 
	 AND DAY(GETDATE())-DAY(Date_naissance)>=0))



CREATE TABLE Projet
(
	Num_proj INT PRIMARY KEY IDENTITY(1,1),
	Nom_proj VARCHAR(50) COLLATE FRENCH_CI_AS NOT NULL,
	Lieu VARCHAR(50) NOT NULL,
	Nbr_limite_taches INT NOT NULL,
	Num_serv INT FOREIGN KEY(Num_serv) REFERENCES Services(Num_serv) NOT NULL
)

---
CREATE TABLE Tache
(
	Num_tach INT PRIMARY KEY,
	Nom_tach VARCHAR(50) NOT NULL,
	Date_debut DATE NOT NULL,
	Date_fin DATE NOT NULL,
	Cout FLOAT NOT NULL,
	Num_prj INT FOREIGN KEY(Num_prj) REFERENCES Projet(Num_proj) NOT NULL
)

ALTER TABLE Tache
---il faut que de fin d'une tache soit superieur a sa date de debut
ADD CONSTRAINT ck_date CHECK(Date_debut<Date_fin)
,
---la duree minimale d'une tache doit etre de trois jours
CONSTRAINT CK_Tache_duree CHECK(DATEDIFF(DAY,Date_debut,Date_fin)>=3)

ALTER TABLE Tache

---le cout minimale d'une tache doit etre de 1000 HTG par jours
add CONSTRAINT CK_Tache_cout CHECK(Cout>=DATEDIFF(DAY,Date_debut,Date_fin)*1000)

---creation de deux groupe de fichiers pour le partitionnement de la table tache
ALTER DATABASE [projet_L3] ADD FILEGROUP groupe_1
ALTER DATABASE [projet_L3] ADD FILEGROUP groupe_2

---creation d'un nouveau champ nommer durée_en_jour pour la duree des taches en jour
ALTER TABLE Tache ADD durée_en_jour AS (DATEDIFF(DAY,Date_fin,Date_debut))


CREATE TABLE Travail
(
	Matricule INT FOREIGN KEY(Matricule) REFERENCES Employe(Matricule),
	Num_tach INT FOREIGN KEY(Num_tach) REFERENCES Tache(Num_tach),
	Nombre_heure INT NOT NULL,
	PRIMARY KEY(Matricule,Num_tach)
)
---ajout d'une nouvelle colonne age dans la table employe qui contiendra sa date naissance
ALTER TABLE Employe ADD age AS (DATEDIFF(YEAR,Date_naissance,GETDATE()))