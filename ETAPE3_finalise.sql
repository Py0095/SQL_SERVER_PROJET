/*Requete sql de selection*/
USE projet_L3

GO
/*1 good*/
SELECT * FROM Mon_projet.Employe WHERE nom LIKE 'EL%' AND nom NOT LIKE '%[a-f]' ORDER BY date_naissance


/*2 not found*/

SELECT UPPER(Nom_tach) FROM Mon_projet.Tache WHERE YEAR(Date_fin) = YEAR(GETDATE()) 
AND MONTH(Date_fin) = MONTH(GETDATE())


/*3 ok*/
SELECT COUNT(*) AS nombre_grade_different FROM 
( SELECT grade FROM Mon_projet.Employe GROUP BY grade ) AS grade


/*4*/
SELECT Mon_projet.Employe.matricule,Mon_projet.Employe.nom,Employe.prenom FROM Mon_projet.Employe INNER JOIN Mon_projet.Travail ON Mon_projet.Employe.matricule = Mon_projet.Travail.matricule

INNER JOIN Mon_projet.Tache ON Mon_projet.Travail.num_tach = Mon_projet.Tache.num_tach
INNER JOIN Mon_projet.Projet ON Mon_projet.Tache.num_prj = Mon_projet.Projet.num_proj
INNER JOIN Mon_projet.Services ON Mon_projet.Projet.num_serv = Mon_projet.Services.num_serv
WHERE Mon_projet.Services.num_serv != Mon_projet.Employe.num_serv GROUP BY Mon_projet.Employe.matricule,Mon_projet.Employe.nom,Mon_projet.Employe.prenom


/*5 not found*/
SELECT Mon_projet.Projet.num_proj,Mon_projet.Projet.nom_proj,Mon_projet.Projet.lieu,Mon_projet.Projet.nbr_limite_taches,Mon_projet.Projet.num_serv
FROM Mon_projet.Projet INNER JOIN Mon_projet.Tache ON Mon_projet.Projet.num_proj = Mon_projet.Tache.num_prj
WHERE Mon_projet.Projet.num_proj IN (
SELECT Mon_projet.Projet.num_proj FROM Mon_projet.Projet INNER JOIN Mon_projet.Tache ON Mon_projet.Projet.num_proj = Mon_projet.Tache.num_prj 
WHERE  DATEDIFF(DAY,Mon_projet.Tache.date_debut,Mon_projet.Tache.date_fin)<=30
)
AND DATEDIFF(DAY,Mon_projet.Tache.date_debut,Mon_projet.Tache.date_fin)>=60
 

/*6 not found*/
SELECT SUM(DATEDIFF(DAY,Mon_projet.Tache.date_debut,Mon_projet.tache.date_fin)*24) as masse_horaire FROM Mon_projet.Tache
WHERE YEAR(Mon_projet.Tache.date_fin) = YEAR(GETDATE()) AND YEAR(Mon_projet.Tache.date_debut) = YEAR(GETDATE())

/*7 not found*/
SELECT Mon_projet.Employe.matricule,Mon_projet.Employe.nom FROM Mon_projet.Employe 
INNER JOIN Mon_projet.Travail ON Mon_projet.Employe.matricule = Mon_projet.Travail.matricule
INNER JOIN Mon_projet.Tache ON Mon_projet.Travail.num_tach = Mon_projet.Tache.num_tach
INNER JOIN Mon_projet.Projet ON Mon_projet.Tache.num_prj = Mon_projet.Projet.num_proj
GROUP BY Mon_projet.Employe.matricule,Mon_projet.Employe.nom 
HAVING COUNT(DISTINCT(Mon_projet.Projet.num_proj)) >=2


/*8*/
SELECT Matricule,Nom,Date_naissance,Adresse FROM Mon_projet.Employe 
WHERE DATEADD(YEAR,DATEDIFF(YEAR,Date_naissance,GETDATE()),Date_naissance)
BETWEEN DATEADD(DAY,7-DATEPART(WEEKDAY,GETDATE()),GETDATE()) 
AND DATEADD(DAY,7-DATEPART(WEEKDAY,GETDATE()) + 7,GETDATE())


/*9ok*/
SELECT Mon_projet.Projet.num_proj,Mon_projet.Projet.nom_proj,Mon_projet.Projet.nbr_limite_taches,Mon_projet.Projet.lieu,Mon_projet.Projet.num_serv
FROM Mon_projet.Projet INNER JOIN Mon_projet.Tache ON Mon_projet.Projet.num_proj = Mon_projet.Tache.num_prj 
GROUP BY  Mon_projet.Projet.num_proj,Mon_projet.Projet.nom_proj,Mon_projet.Projet.nbr_limite_taches,Mon_projet.Projet.lieu,Mon_projet.Projet.num_serv
HAVING COUNT(*) = ( SELECT MAX(nbr_tache) FROM (SELECT COUNT(Mon_projet.Projet.num_proj) as nbr_tache
FROM Mon_projet.Projet INNER JOIN Mon_projet.Tache ON Mon_projet.Projet.num_proj = Mon_projet.Tache.num_prj 
GROUP BY Mon_projet.Projet.num_proj) AS nombre_tache)

/*10 ok*/
SELECT Mon_projet.Projet.num_proj, DATEDIFF(DAY,MIN(Mon_projet.Tache.date_debut),MAX(Mon_projet.Tache.date_fin)) + 1 AS duree_en_jour
FROM Mon_projet.Tache INNER JOIN Mon_projet.Projet ON Mon_projet.Tache.num_prj = Mon_projet.Projet.num_proj GROUP BY Mon_projet.Projet.num_proj 

/*Requete update*/
/*1 ok*/

SELECT * FROM Mon_projet.Employe
UPDATE Mon_projet.Employe SET salaire = salaire + salaire*(0.5/100) WHERE age BETWEEN 58 AND 60
SELECT * FROM Mon_projet.Employe


UPDATE Mon_projet.Employe SET salaire = salaire + salaire*(0.7/100) WHERE age > 60


/*2*/

DELETE FROM Mon_projet.Tache WHERE GETDATE() > date_fin AND num_tach NOT IN (SELECT Mon_projet.Travail.num_tach FROM Mon_projet.Travail INNER JOIN Mon_projet.Tache
ON Mon_projet.Travail.num_tach = Mon_projet.Tache.num_tach)
GO
