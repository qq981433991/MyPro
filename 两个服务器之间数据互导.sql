--�������ӷ����� 
exec sp_addlinkedserver   'ITSV ', ' ', 'SQLOLEDB ', '192.168.0.42 ' 
exec sp_addlinkedsrvlogin 'ITSV ', 'false ',null, 'sa', 'lym123!@#' 

--��ѯʾ�� 
select * from ITSV.[Uoso.OccupationSJK].dbo.Occupation_Designer where ID>=32

--�Ժ���ʹ��ʱɾ�����ӷ����� 
exec sp_dropserver  'ITSV ', 'droplogins ' 

insert into [Uoso.OccupationSJK].[Occupation_Designer](ModuleName,Content,DataFrom,[Order],IsPage,DesignerDescription) 
select ModuleName
,Content
,DataFrom
,[Order]
,IsPage
,DesignerDescription from ITSV.[Uoso.OccupationSJK].dbo.Occupation_Designer where ID>=32


select * from Occupation_Designer