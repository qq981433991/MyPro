USE [Uoso.Occupation]
GO

/****** Object:  UserDefinedFunction [dbo].[GetBaseName]    Script Date: 03/08/2017 14:57:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 
CREATE FUNCTION [dbo].[GetBaseName] (@id int)  
RETURNS varchar(50)  AS  
BEGIN 
        declare @retvalue varchar(50)
        if @id is null return '' 
        if @id=0 return ''
        set @retvalue=isnull((select Name from Sys_Dictionary where InnerID=@id),'')
       return @retvalue 
END


GO


