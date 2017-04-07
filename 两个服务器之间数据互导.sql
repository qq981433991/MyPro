--创建链接服务器 
exec sp_addlinkedserver   'ITSV ', ' ', 'SQLOLEDB ', '192.168.0.42 ' 
exec sp_addlinkedsrvlogin 'ITSV ', 'false ',null, 'sa', 'lym123!@#' 

--查询示例 
select * from ITSV.[Uoso.OccupationSJK].dbo.Occupation_Designer where ID>=32

--以后不再使用时删除链接服务器 
exec sp_dropserver  'ITSV ', 'droplogins ' 

insert into [Uoso.OccupationSJK].[Occupation_Designer](ModuleName,Content,DataFrom,[Order],IsPage,DesignerDescription) 
select ModuleName
,Content
,DataFrom
,[Order]
,IsPage
,DesignerDescription from ITSV.[Uoso.OccupationSJK].dbo.Occupation_Designer where ID>=32


select * from Occupation_Designer