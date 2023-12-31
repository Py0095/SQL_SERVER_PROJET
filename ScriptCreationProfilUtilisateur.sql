/*creation des utilisateurs*/
/*creation des profils*/
USE [master]

CREATE LOGIN [Maitre_d'oeuvre] WITH PASSWORD=N'password', 
DEFAULT_DATABASE=[projet_L3], 
CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF


USE [master]
GO
CREATE LOGIN [Admin_instance] WITH PASSWORD=N'password', 
DEFAULT_DATABASE=[projet_L3], 
CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF



USE [master];
GO

CREATE LOGIN [DESKTOP-UF5VVAP\Chefprojet]
FROM WINDOWS
WITH DEFAULT_DATABASE=[projet_L3];
GO


/*creation des utilisateurs de la base de donnees*/
USE [projet_L3]
GO
CREATE USER [Gestionnaire] FOR LOGIN [Maitre_d'oeuvre]
GO

USE [projet_L3]
GO
CREATE USER [Chef_Projet] FOR LOGIN [DESKTOP-UF5VVAP\Chefprojet]
GO

USE [projet_L3]
GO
CREATE USER [ADM_instance] FOR LOGIN [Admin_instance]
GO

/*creation du shema*/
USE [projet_L3]
GO
CREATE SCHEMA [Mon_projet]
GO

/*modification du shema*/
USE [projet_L3]
GO
ALTER SCHEMA [Mon_projet] TRANSFER [dbo].[Employe]
GO

USE [projet_L3]
GO
ALTER SCHEMA [Mon_projet] TRANSFER [dbo].[Projet]
GO

USE [projet_L3]
GO
ALTER SCHEMA [Mon_projet] TRANSFER [dbo].[Services]
GO

USE [projet_L3]
GO
ALTER SCHEMA [Mon_projet] TRANSFER [dbo].[Tache]
GO

USE [projet_L3]


ALTER SCHEMA [Mon_projet] TRANSFER [dbo].[Travail]


/*accord des droits*/
/*Gestionnaire*/
/*services*/
use [projet_L3]
GO
GRANT DELETE ON [Mon_projet].[Services] TO [Gestionnaire]
GO
use [projet_L3]
GO
GRANT INSERT ON [Mon_projet].[Services] TO [Gestionnaire]
GO
use [projet_L3]
GO
GRANT UPDATE ON [Mon_projet].[Services] TO [Gestionnaire]
GO

/*projet*/
use [projet_L3]
GO
GRANT DELETE ON [Mon_projet].[Projet] TO [Gestionnaire]
GO
use [projet_L3]
GO
GRANT INSERT ON [Mon_projet].[Projet] TO [Gestionnaire]
GO
use [projet_L3]
GO
GRANT UPDATE ON [Mon_projet].[Projet] TO [Gestionnaire]
GO

/*tache*/
use [projet_L3]
GO
GRANT DELETE ON [Mon_projet].[Tache] TO [Gestionnaire]
GO
use [projet_L3]
GO
GRANT INSERT ON [Mon_projet].[Tache] TO [Gestionnaire]
GO
use [projet_L3]
GO
GRANT UPDATE ON [Mon_projet].[Tache] TO [Gestionnaire]
GO

/*travail*/
use [projet_L3]
GO
GRANT DELETE ON [Mon_projet].[Travail] TO [Gestionnaire]
GO
use [projet_L3]
GO
GRANT INSERT ON [Mon_projet].[Travail] TO [Gestionnaire]
GO
use [projet_L3]
GO
GRANT UPDATE ON [Mon_projet].[Travail] TO [Gestionnaire]
GO

/*chef projet*/
use [projet_L3]
GO
GRANT DELETE ON [Mon_projet].[Projet] TO [Chef_Projet]
GO
GRANT DELETE ON [Mon_projet].[Services] TO [Chef_Projet]
GO
GRANT DELETE ON [Mon_projet].[Tache] TO [Chef_Projet]
GO
GRANT DELETE ON [Mon_projet].[Travail] TO [Chef_Projet]
GO
/*ere a se la*/
GRANT UPDATE ON [Mon_projet].[vue_modifier_adresse_employe] TO [Chef_Projet]
/*end*/
GO

/*creation du role LMD*/
USE [projet_L3]
GO
CREATE ROLE [LMD]
GO
USE [projet_L3]
GO
ALTER ROLE [LMD] ADD MEMBER [ADM_instance]
GO
use [projet_L3]
GO
GRANT DELETE TO [LMD]
GO
use [projet_L3]
GO
GRANT INSERT TO [LMD]
GO
use [projet_L3]
GO
GRANT SELECT TO [LMD]
GO
use [projet_L3]
GO
GRANT UPDATE TO [LMD]
GO
