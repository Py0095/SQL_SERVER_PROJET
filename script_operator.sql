USE [msdb]
GO
EXEC msdb.dbo.sp_add_alert @name=N'augmenter_size', 
		@message_id=50500, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=120, 
		@include_event_description_in=1, 
		@database_name=N'projet_L3', 
		@notification_message=N'You have to resize the file ', 
		@event_description_keyword=N'Error you have to augmente the size of the file', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'augmenter_size', @operator_name=N'DBA_Asistant', @notification_method = 1
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'augmenter_size', @operator_name=N'DBA_Enchef', @notification_method = 1
GO
