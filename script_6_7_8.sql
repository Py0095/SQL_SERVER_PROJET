USE [msdb]
GO
EXEC msdb.dbo.sp_add_operator @name=N'DBA_Enchef', 
		@enabled=1, 
		@pager_days=0, 
		@email_address=N'pyp0859@gmail.com'
GO

USE [msdb]
GO
EXEC msdb.dbo.sp_add_operator @name=N'DBA_Asistant', 
		@enabled=1, 
		@pager_days=0, 
		@email_address=N'bryannicaisse2001@gmail.com.com'
GO
