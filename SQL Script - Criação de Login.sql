USE [master]
GO
CREATE LOGIN [loja] WITH PASSWORD=N'loja' MUST_CHANGE, DEFAULT_DATABASE=[SQL_DevFullStack], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
use [tempdb];
GO
USE [SQL_DevFullStack]
GO
CREATE USER [loja] FOR LOGIN [loja]
GO
USE [SQL_DevFullStack]
GO
ALTER USER [loja] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [SQL_DevFullStack]
GO
ALTER ROLE [db_datareader] ADD MEMBER [loja]
GO
USE [SQL_DevFullStack]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [loja]
GO
USE [SQL_DevFullStack]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [loja]
GO
