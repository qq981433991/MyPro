


/************************部分数据植入参考T-SQL***************************************/
select * from dbo.职业病体检_体检项目设置表 where 体检大类='3124'

select * from dbo.系统管理_字典_字典表列表 where 名称 Like '%体检%'

select * from dbo.系统管理_字典_字典内容表 where ID=84
-- 添加单位

--select * from [Uoso.OccupationSJK].dbo.Physical_Organization
--select * from  dbo.单位档案_单位基本信息表


insert into [Uoso.OccupationSJK].dbo.Physical_Organization(UnitGuid,UnitName,ParentId) select 申请编号,单位名称,0 from  dbo.单位档案_单位基本信息表



select * from [Uoso.OccupationSJK].dbo.Sys_Dictionary
-- 添加体检大类
 insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0001',0,'体检科室配置','','',0,0)

     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select InnerID,REPLACE(名称,编号,'') as 名称,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0001'),0,编号  from dbo.系统管理_字典_字典内容表 where ID=84 and InnerID not in(3122,3123,3124,3125)

-- 添加项目属性 常规 化验
 insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0006',0,'项目属性','','',0,0)

 insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('000601',0,'常规','','',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0006'),0)
     
      insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('000602',0,'化验','','',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0006'),0)

-- 添加项目
select * from dbo.职业病体检_体检项目设置表 where 体检大类='3124'



select * from [Uoso.OccupationSJK].dbo.Physical_Project

select * from [Uoso.OccupationSJK].dbo.Sys_Dictionary

select * from 职业病体检_体检项目设置表

insert into [Uoso.OccupationSJK].dbo.Physical_Project(InnerID,NewCode,ProName,DefalutVal,EnumFrom,ProType,StandardVal,Unit,IsDel)
 select b.InnerID,编码,名称,缺省值,枚举来源,case when  属性='常规' then 
(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='000601') 
 else  
 (select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='000602') 
 end sx,标准值,单位,0 from 职业病体检_体检项目设置表 as a
 join   [Uoso.OccupationSJK].dbo.Sys_Dictionary as b on a.体检大类=b.Code and b.ParentID=1

 --update  [Uoso.OccupationSJK].dbo.Physical_Project  set ProType=16 where ProType=0
 --update  [Uoso.OccupationSJK].dbo.Physical_Project  set ProType=17 where ProType=1
 
 -- 添加体检模版类型
 
-- select * from   dbo.职业病体检_体检表模板基本信息表
 
 
-- select * from  dbo.职业病体检_体检表模板体检项目表

--select * from dbo.系统管理_字典_字典表列表  where ID=71

-- select * from dbo.系统管理_字典_字典内容表  where ID=72
 

 --select 体检人员类型,体检类别,体检单名称 from dbo.职业病体检_体检表模板基本信息表 group by 体检人员类型,体检类别,体检单名称

 -- select 体检人员类型 from dbo.职业病体检_体检表模板基本信息表 group by 体检人员类型
  
 --  select 体检人员类型,体检类别 from dbo.职业病体检_体检表模板基本信息表 group by 体检人员类型,体检类别
 --       select * from [Uoso.OccupationSJK].dbo.Sys_Dictionary
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0009',0,'职业体检类型','','',0,0)
     

     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel)
     
     select '00090'+cast(ROW_NUMBER() over( order by innerId) as varchar) as number,体检人员类型,parentId,innerId from (
     select 体检人员类型,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0009') as parentId,0 as innerId from dbo.职业病体检_体检表模板基本信息表 group by 体检人员类型 ) as tb
 
 
  insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel)
  select '000900'+cast(ROW_NUMBER() over( order by innerID) as varchar) as number,  体检类别,InnerID,0 from ( select 体检人员类型,体检类别 from dbo.职业病体检_体检表模板基本信息表 group by 体检人员类型,体检类别 )as a 
	   join   [Uoso.OccupationSJK].dbo.Sys_Dictionary as b on a.体检人员类型 collate Chinese_PRC_CI_AS=b.Name and b.ParentID=(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0009')
	
	
	 -- 添加体检模版
	 --select * from [Uoso.OccupationSJK].dbo.Physical_Template
	 
 insert into [Uoso.OccupationSJK].dbo.Physical_Template(TemplateName,MemberType,PhysicalType)

	 select 体检单名称,ID1,ID2 from (
	  select 体检人员类型,体检类别,体检单名称 from dbo.职业病体检_体检表模板基本信息表  group by 体检人员类型,体检类别,体检单名称 	
	   ) as k
	    left join
	(
	select a.Name as Name1,b.Name as Name2,a.InnerID as  ID1,b.InnerID as ID2 from [Uoso.OccupationSJK].dbo.Sys_Dictionary  as a 
	left join [Uoso.OccupationSJK].dbo.Sys_Dictionary b on a.InnerID = b.ParentID where a.ParentID=(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0009')
)	 as  t on k.体检人员类型  collate Chinese_PRC_CI_AS=t.Name1 and k.体检类别  collate Chinese_PRC_CI_AS=t.Name2


--添加模版关联项目

--select * from [Uoso.OccupationSJK].dbo.Physical_TemplateProject

insert into [Uoso.OccupationSJK].dbo.Physical_TemplateProject(ProID,TemplateID,NewCode)
select b.ProID,c.TemplateID,a.体检项目 from  dbo.职业病体检_体检表模板体检项目表 as a
join [Uoso.OccupationSJK].dbo.Physical_Project  as b on a.体检项目 collate Chinese_PRC_CI_AS=b.NewCode
 join [Uoso.OccupationSJK].dbo.Physical_Template as c on a.体检表名称  collate Chinese_PRC_CI_AS=c.TemplateName
 
 
 -- 格式化名称
 
 
-- select * from  [Uoso.OccupationSJK].dbo.Physical_Template
 
--update [Uoso.OccupationSJK].dbo.Physical_Template set TemplateName=replace(replace(TemplateName,b.体检人员类型+'-' collate Chinese_PRC_CI_AS,''),b.体检类别+'-' collate Chinese_PRC_CI_AS,'') from  
 
--  [Uoso.OccupationSJK].dbo.Physical_Template as a join 
-- (
--  select 体检人员类型,体检类别,体检单名称,ID1,ID2 from (
--	  select 体检人员类型,体检类别,体检单名称 from dbo.职业病体检_体检表模板基本信息表  group by 体检人员类型,体检类别,体检单名称 	
--	   ) as k
--	    left join
--	(
--	select a.Name as Name1,b.Name as Name2,a.InnerID as  ID1,b.InnerID as ID2 from [Uoso.OccupationSJK].dbo.Sys_Dictionary  as a 
--	left join [Uoso.OccupationSJK].dbo.Sys_Dictionary b on a.InnerID = b.ParentID where a.ParentID=(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0009')
--)	 as  t on k.体检人员类型  collate Chinese_PRC_CI_AS=t.Name1 and k.体检类别  collate Chinese_PRC_CI_AS=t.Name2
-- ) as b on a.TemplateName=b.体检单名称 collate Chinese_PRC_CI_AS
 
 
 -- 添加文化程度
select * from dbo.系统管理_字典_字典表列表 


      insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0008',0,'文化程度','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0008'+编号,REPLACE(名称,编号,'') as 名称,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0008'),0,编号  from dbo.系统管理_字典_字典内容表 where ID=7
     
     
     -- 添加现工种
   
       insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0010',0,'现工种','','',0,0)
     

     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0010'+编号,REPLACE(名称,编号,'') as 名称,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0010'),0,编号  from dbo.系统管理_字典_字典内容表 where ID=74
     
     
     --添加照射源
         insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0011',0,'照射源配置','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0011'+编号,REPLACE(名称,编号,'') as 名称,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0011'),0,编号  from dbo.系统管理_字典_字典内容表 where ID=70 and Parent>0
     
     -- 添加职业类别
     
     
       insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0012',0,'职业类别','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0012'+编号,REPLACE(名称,编号,'') as 名称,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0012'),0,编号 from dbo.系统管理_字典_字典内容表 where ID=78
     
     -- 添加危害因素
            insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0013',0,'危害因素','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0013'+编号,REPLACE(名称,编号,'') as 名称,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0013'),0,编号  from dbo.系统管理_字典_字典内容表 where ID=77
     
     
     --添加部门  
	 insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0050',0,'部门','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0050'+编号,REPLACE(名称,编号,'') as 名称,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0050'),0,编号  from dbo.系统管理_字典_字典内容表 where ID=73
     
     -- 添加疾病名称
     
      insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0065',0,'疾病名称','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0065'+编号,REPLACE(名称,编号,'') as 名称,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0065'),0,编号  from dbo.系统管理_字典_字典内容表 where ID=87


--添加转归

     
      insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0066',0,'转归','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0066'+编号,REPLACE(名称,编号,'') as 名称,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0066'),0,编号  from dbo.系统管理_字典_字典内容表 where ID=89

--添加防护措施
          insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0053',0,'防护措施','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0053'+编号,REPLACE(名称,编号,'') as 名称,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0053'),0,编号  from dbo.系统管理_字典_字典内容表 where ID=86
     
     
     
     --放射线种类
          insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0054',0,'放射线种类','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0054'+编号,REPLACE(名称,编号,'') as 名称,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0054'),0,编号  from dbo.系统管理_字典_字典内容表 where ID=75
     
     --病情程度
          insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0099',0,'病情程度','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0099'+编号,REPLACE(名称,编号,'') as 名称,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0099'),0,编号  from dbo.系统管理_字典_字典内容表 where ID=76
     
     
     
       --吸烟喝酒等程度
          insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0096',0,'程度','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0096'+编号,REPLACE(名称,编号,'') as 名称,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0096'),0,编号  from dbo.系统管理_字典_字典内容表 where ID=79
     
      --营养
      insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0080',0,'营养','','',0,0)
     
      insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum) 
       select '008001','良好',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0080'),0,1  
      union all
         select '008002','优',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0080'),0,2  
       union all
         select '008003','差',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0080'),0,3  
      
     
     -- 发育
       insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0081',0,'发育','','',0,0)
        insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum) 
       select '008101','良好',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0081'),0,1  
      union all
         select '008102','优',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0081'),0,2  
       union all
         select '008103','差',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0081'),0,3  
      
      --配偶健康情况
       insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0098',0,'配偶健康情况','','',0,0)
        insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum) 
       select '009801','良好',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0098'),0,1  
      union all
         select '009802','一般',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0098'),0,2  
       union all
         select '009803','体差',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0098'),0,3  
       union all
         select '009804','已去世',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0098'),0,4  
     /***********************业务数据*************************/

     
    select * from  dbo.职业病体检_体检人员图片结果表
     select * from (
    select 公民身份号码,COUNT(*) as n from  dbo.职业病体检_体检人员基本信息表 group by 公民身份号码) as tb where n>1
 select * from  dbo.职业病体检_体检基本信息表 
 
 select * from dbo.职业病体检_体检人员基本信息表 where 公民身份号码='510102194402137517'
 
 
 

 -- 添加档案信息
 select * from [Uoso.OccupationSJK].dbo.Physical_MemberInfo
 delete from [Uoso.OccupationSJK].dbo.Physical_MemberInfo
 
 insert into [Uoso.OccupationSJK].dbo.Physical_MemberInfo(ArchivesCode,MName,MAge,MSex,MBorn,CardID,Nation,Adress,IssuingAuthority,EffectiveDate,CreateTime,Picture)
 select NEWID(),姓名,年龄,性别,出生日期,公民身份号码,民族,住址,系统编号,'',GETDATE(),'' from dbo.职业病体检_体检人员基本信息表
 --添加体检基本信息
 
 
 select * from [Uoso.OccupationSJK].dbo.Physical_Info
 delete from [Uoso.OccupationSJK].dbo.Physical_Info
 insert into [Uoso.OccupationSJK].dbo.Physical_Info(SysNumber,ArchivesCode,IsPay,TemplateID,TemplateName,PhysicalDate,PhysicalConclusion,PhysicalOption,ConDoctor,ConclusionDate,PhysicalStatus,UnitID,UnitName,IsMarry,Profession,Degree,ContactTel,WorkYear,Post,HomeAdress,Transmitter,OccupationalGroup,DangerousEffects,NowJob,DangerousYear,Radiation,WorkNumber,AllWorkYear)
 
 select b.系统编号,a.ArchivesCode,1,c.TemplateID,b.体检表编号,b.体检日期,b.体检结论,b.诊断和处理意见,d.姓名,b.下结论日期,5,q.UnitID,k.单位名称,
 case when k.婚否='已婚' then 1
 when k.婚否='已' then 1
 when k.婚否='是' then 1
 when  k.婚否='未婚' then 2
  when  k.婚否='否' then 2
   when  k.婚否='未' then 2
   when k.婚否='离异' then 3
else '' end as 婚否,'',w.InnerID as 文化程度,k.电话号码,k.工龄,k.邮编,k.住址,k.照射源,k.职业分类,k.危害因素,k.现工种,k.职业危害工龄,k.放射剂量,'','' from [Uoso.OccupationSJK].dbo.Physical_MemberInfo as a join dbo.职业病体检_体检基本信息表 as b
 on  a.IssuingAuthority=b.系统编号 collate Chinese_PRC_CI_AS
 left join dbo.职业病体检_体检人员基本信息表 as k on k.系统编号=b.系统编号
 left join [Uoso.OccupationSJK].dbo.Physical_Template as c on c.TemplateName=b.体检表编号 collate Chinese_PRC_CI_AS
 left join dbo.系统管理_员工基本信息表 as d on d.编号=b.下结论医师
 left join [Uoso.OccupationSJK].dbo.Physical_Organization as q on q.UnitGuid=k.单位申请编号 collate Chinese_PRC_CI_AS 
 left join ( select * from [Uoso.OccupationSJK].dbo.Sys_Dictionary where ParentID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0008')) as w on w.Name=k.文化程度 collate Chinese_PRC_CI_AS 
 where  b.体检状态>=7
 
 
 --select * from  dbo.系统管理_字典_字典内容表 where ID=84
 --select * from dbo.职业病体检_科室结论表
 
 --select k.*,w.*,d.姓名,p.PhID from 
 --(select a.InnerID,a.Name,b.编号 from (select * from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001')) as a
 --inner join (select * from  dbo.系统管理_字典_字典内容表 where ID=84) as b on a.Code=b.InnerID)
 --as k inner join  dbo.职业病体检_科室结论表 as w on k.编号=w.科室 
 --inner join [Uoso.OccupationSJK].dbo.Physical_Info as p on p.SysNumber=w.系统编号 collate Chinese_PRC_CI_AS 
 -- left join dbo.系统管理_员工基本信息表 as d on d.编号=w.医生编号
  
 -- select * from [Uoso.OccupationSJK].dbo.Physical_Category
 
 insert into [Uoso.OccupationSJK].dbo.Physical_Category(PhID,SysNumber,PName,PID,EntryDoctorName,EntryDate,Status,IsAudit,Conclusion)
  select p.PhID,w.系统编号,k.Name,k.InnerID,d.姓名,w.结论日期,1,0,w.文字结论 from 
 (select a.InnerID,a.Name,b.编号 from (select * from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001')) as a
 inner join (select * from  dbo.系统管理_字典_字典内容表 where ID=84) as b on a.Code=b.InnerID)
 as k inner join  dbo.职业病体检_科室结论表 as w on k.编号=w.科室 
 inner join [Uoso.OccupationSJK].dbo.Physical_Info as p on p.SysNumber=w.系统编号 collate Chinese_PRC_CI_AS 
  left join dbo.系统管理_员工基本信息表 as d on d.编号=w.医生编号
 


 /*******************************/-- 添加科室项目详细结果 需注意对应科室的ID 是否正确
 -- select * from [Uoso.OccupationSJK].dbo.Physical_Category

 --select * from  dbo.职业病体检_结果信息_外科 as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 --on a.系统编号  collate Chinese_PRC_CI_AS =b.SysNumber
 --left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.体检项目 collate Chinese_PRC_CI_AS
 -- where b.PID=4
 
 
-- select * from [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo
-- select * from dbo.职业病体检_结果信息_B超影像科
--union all
-- select * from dbo.职业病体检_结果信息_X光影像科
-- union all
--  select * from dbo.职业病体检_结果信息_五官科
--   union all 
--   select * from dbo.职业病体检_结果信息_免疫科
--   union all 
--    select * from dbo.职业病体检_结果信息_内科
--   union all  
--    select * from dbo.职业病体检_结果信息_外科
--    union all   
--    select * from dbo.职业病体检_结果信息_尿常规化验科
--    union all    
--    select * from dbo.职业病体检_结果信息_心电科
--    union all     
--    select * from dbo.职业病体检_结果信息_染色体化验科
--      union all    
--      select * from dbo.职业病体检_结果信息_生化科
--       union all    
--       select * from dbo.职业病体检_结果信息_电测听科
--        union all    
--        select * from dbo.职业病体检_结果信息_肺功能影像科
--        union all     
--        select * from dbo.职业病体检_结果信息_血常规化验科
 
  --B超影像科  
 insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.系统编号,c.ProID,c.ProName,a.体检结果,d.姓名,a.填写时间,1,a.单项结论,a.体检项目,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.职业病体检_结果信息_B超影像科
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.系统编号  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.体检项目 collate Chinese_PRC_CI_AS
 left join dbo.系统管理_员工基本信息表 as d on d.编号=a.体检医师
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='B超影像科' ) 
  
  --X光影像科
 insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.系统编号,c.ProID,c.ProName,a.体检结果,d.姓名,a.填写时间,1,a.单项结论,a.体检项目,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.职业病体检_结果信息_X光影像科
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.系统编号  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.体检项目 collate Chinese_PRC_CI_AS
 left join dbo.系统管理_员工基本信息表 as d on d.编号=a.体检医师
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='X光影像科' ) 
  
  --五官科
  
  insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.系统编号,c.ProID,c.ProName,a.体检结果,d.姓名,a.填写时间,1,a.单项结论,a.体检项目,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.职业病体检_结果信息_五官科
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.系统编号  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.体检项目 collate Chinese_PRC_CI_AS
 left join dbo.系统管理_员工基本信息表 as d on d.编号=a.体检医师
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='五官科' ) 

   --免疫科
  
  
  
insert into  [Uoso.OccupationSJK].dbo.Physical_Category(SysNumber,PhID,PID,PName,Status,IsAudit)
        select a.系统编号,PhID,(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='免疫科' ),'免疫科',1,0 from (select distinct 系统编号 from 职业病体检_结果信息_免疫科)  a  join  [Uoso.OccupationSJK].dbo.Physical_Info as b on a.系统编号 collate Chinese_PRC_CI_AS=b.SysNumber
  
  insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.系统编号,c.ProID,c.ProName,a.体检结果,d.姓名,a.填写时间,1,a.单项结论,a.体检项目,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.职业病体检_结果信息_免疫科
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.系统编号  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.体检项目 collate Chinese_PRC_CI_AS
 left join dbo.系统管理_员工基本信息表 as d on d.编号=a.体检医师
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='免疫科' ) 

    --内科
  
  insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.系统编号,c.ProID,c.ProName,a.体检结果,d.姓名,a.填写时间,1,a.单项结论,a.体检项目,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.职业病体检_结果信息_内科
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.系统编号  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.体检项目 collate Chinese_PRC_CI_AS
 left join dbo.系统管理_员工基本信息表 as d on d.编号=a.体检医师
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='内科' )
 
 
   --外科
  
  insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.系统编号,c.ProID,c.ProName,a.体检结果,d.姓名,a.填写时间,1,a.单项结论,a.体检项目,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.职业病体检_结果信息_外科
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.系统编号  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.体检项目 collate Chinese_PRC_CI_AS
 left join dbo.系统管理_员工基本信息表 as d on d.编号=a.体检医师
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='外科' )
 
--尿常规化验科

insert into  [Uoso.OccupationSJK].dbo.Physical_Category(SysNumber,PhID,PID,PName,Status,IsAudit)
        select a.系统编号,PhID,(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='尿常规化验科' ),'尿常规化验科',1,0 from (select distinct 系统编号 from 职业病体检_结果信息_尿常规化验科)  a  join  [Uoso.OccupationSJK].dbo.Physical_Info as b on a.系统编号 collate Chinese_PRC_CI_AS=b.SysNumber

      insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.系统编号,c.ProID,c.ProName,a.体检结果,d.姓名,a.填写时间,1,a.单项结论,a.体检项目,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.职业病体检_结果信息_尿常规化验科
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.系统编号  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.体检项目 collate Chinese_PRC_CI_AS
 left join dbo.系统管理_员工基本信息表 as d on d.编号=a.体检医师
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='尿常规化验科' )
--心电科
         insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.系统编号,c.ProID,c.ProName,a.体检结果,d.姓名,a.填写时间,1,a.单项结论,a.体检项目,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.职业病体检_结果信息_心电科
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.系统编号  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.体检项目 collate Chinese_PRC_CI_AS
 left join dbo.系统管理_员工基本信息表 as d on d.编号=a.体检医师
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='心电科' ) 
--染色体化验科

insert into  [Uoso.OccupationSJK].dbo.Physical_Category(SysNumber,PhID,PID,PName,Status,IsAudit)
        select a.系统编号,PhID,(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='染色体化验科' ),'染色体化验科',1,0 from (select distinct 系统编号 from 职业病体检_结果信息_染色体化验科)  a  join  [Uoso.OccupationSJK].dbo.Physical_Info as b on a.系统编号 collate Chinese_PRC_CI_AS=b.SysNumber
        
        
            insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.系统编号,c.ProID,c.ProName,a.体检结果,d.姓名,a.填写时间,1,a.单项结论,a.体检项目,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.职业病体检_结果信息_染色体化验科
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.系统编号  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.体检项目 collate Chinese_PRC_CI_AS
 left join dbo.系统管理_员工基本信息表 as d on d.编号=a.体检医师
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='染色体化验科' ) 
--生化科

 insert into  [Uoso.OccupationSJK].dbo.Physical_Category(SysNumber,PhID,PID,PName,Status,IsAudit)
        select a.系统编号,PhID,(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='生化科' ),'生化科',1,0 from (select distinct 系统编号 from 职业病体检_结果信息_生化科)  a  join  [Uoso.OccupationSJK].dbo.Physical_Info as b on a.系统编号 collate Chinese_PRC_CI_AS=b.SysNumber

              insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.系统编号,c.ProID,c.ProName,a.体检结果,d.姓名,a.填写时间,1,a.单项结论,a.体检项目,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.职业病体检_结果信息_生化科
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.系统编号  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.体检项目 collate Chinese_PRC_CI_AS
 left join dbo.系统管理_员工基本信息表 as d on d.编号=a.体检医师
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='生化科' ) 
--电测听科

 insert into  [Uoso.OccupationSJK].dbo.Physical_Category(SysNumber,PhID,PID,PName,Status,IsAudit)
        select a.系统编号,PhID,(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='电测听科' ),'电测听科',1,0 from (select distinct 系统编号 from 职业病体检_结果信息_电测听科)  a  join  [Uoso.OccupationSJK].dbo.Physical_Info as b on a.系统编号 collate Chinese_PRC_CI_AS=b.SysNumber

     insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.系统编号,c.ProID,c.ProName,a.体检结果,d.姓名,a.填写时间,1,a.单项结论,a.体检项目,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.职业病体检_结果信息_电测听科
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.系统编号  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.体检项目 collate Chinese_PRC_CI_AS
 left join dbo.系统管理_员工基本信息表 as d on d.编号=a.体检医师
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='电测听科' ) 
--肺功能影像科
       insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.系统编号,c.ProID,c.ProName,a.体检结果,d.姓名,a.填写时间,1,a.单项结论,a.体检项目,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.职业病体检_结果信息_肺功能影像科
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.系统编号  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.体检项目 collate Chinese_PRC_CI_AS
 left join dbo.系统管理_员工基本信息表 as d on d.编号=a.体检医师
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='肺功能影像科' ) 
--血常规化验科
     
         insert into  [Uoso.OccupationSJK].dbo.Physical_Category(SysNumber,PhID,PID,PName,Status,IsAudit)
        select a.系统编号,PhID,(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='血常规化验科' ),'血常规化验科',1,0 from (select distinct 系统编号 from 职业病体检_结果信息_血常规化验科)  a  join  [Uoso.OccupationSJK].dbo.Physical_Info as b on a.系统编号 collate Chinese_PRC_CI_AS=b.SysNumber
     
         insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.系统编号,c.ProID,c.ProName,a.体检结果,d.姓名,a.填写时间,1,a.单项结论,a.体检项目,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.职业病体检_结果信息_血常规化验科
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.系统编号  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.体检项目 collate Chinese_PRC_CI_AS
 left join dbo.系统管理_员工基本信息表 as d on d.编号=a.体检医师
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='血常规化验科' ) 
 
 -- dbo.职业病体检_结果信息_受检者个人信息录入科
 

  --select * from [Uoso.OccupationSJK].dbo.Occupation_Physique
  
  --select * from dbo.职业病体检_结果信息_受检者个人信息录入科
   
  -- 插入基本数据
  insert into [Uoso.OccupationSJK].dbo.Occupation_Physique(SysNumber) select distinct 系统编号 from dbo.职业病体检_结果信息_受检者个人信息录入科 
  
  -- 更新营养
  update [Uoso.OccupationSJK].dbo.Occupation_Physique set Nutrition=b.体检结果 from [Uoso.OccupationSJK].dbo.Occupation_Physique as a join dbo.职业病体检_结果信息_受检者个人信息录入科 as b on a.SysNumber=b.系统编号 collate Chinese_PRC_CI_AS where b.体检项目='13017'
     -- 更新身高
    update [Uoso.OccupationSJK].dbo.Occupation_Physique set Height=b.体检结果 from [Uoso.OccupationSJK].dbo.Occupation_Physique as a join dbo.职业病体检_结果信息_受检者个人信息录入科 as b on a.SysNumber=b.系统编号 collate Chinese_PRC_CI_AS where b.体检项目='13018'
    
      -- 更新体重
    update [Uoso.OccupationSJK].dbo.Occupation_Physique set Weight=b.体检结果 from [Uoso.OccupationSJK].dbo.Occupation_Physique as a join dbo.职业病体检_结果信息_受检者个人信息录入科 as b on a.SysNumber=b.系统编号 collate Chinese_PRC_CI_AS where b.体检项目='13019'
    -- 更新收缩压
  update [Uoso.OccupationSJK].dbo.Occupation_Physique set SBP=b.体检结果 from [Uoso.OccupationSJK].dbo.Occupation_Physique as a join dbo.职业病体检_结果信息_受检者个人信息录入科 as b on a.SysNumber=b.系统编号 collate Chinese_PRC_CI_AS where b.体检项目='13020'
   -- 更新舒张压
    update [Uoso.OccupationSJK].dbo.Occupation_Physique set DBP=b.体检结果 from [Uoso.OccupationSJK].dbo.Occupation_Physique as a join dbo.职业病体检_结果信息_受检者个人信息录入科 as b on a.SysNumber=b.系统编号 collate Chinese_PRC_CI_AS where b.体检项目='13021'
    
     -- 更新关联phid
   update [Uoso.OccupationSJK].dbo.Occupation_Physique set PhID=b.PhID  from [Uoso.OccupationSJK].dbo.Occupation_Physique as a join [Uoso.OccupationSJK].dbo.Physical_Info as b on a.SysNumber=b.SysNumber
   
   -- 更新既往病史
   --select * from  dbo.职业病体检_既往病史表
   --select * from [Uoso.OccupationSJK].dbo.Occupation_Sickness
   
   insert into [Uoso.OccupationSJK].dbo.Occupation_Sickness(SickName,DiagnoseOrganize,DiagnoseDate,Treatment,TreatmentImprove,SysNumber)
   select a.疾病名称,a.诊断单位,a.诊断日期,a.治疗经过,a.转归,a.系统编号 from  dbo.职业病体检_既往病史表  as a
   -- 更新关联phid
   update [Uoso.OccupationSJK].dbo.Occupation_Sickness set PhID=b.PhID  from [Uoso.OccupationSJK].dbo.Occupation_Sickness as a  join [Uoso.OccupationSJK].dbo.Physical_Info as b on a.SysNumber=b.SysNumber
   
   -- 更新职业史
   
  -- select * from dbo.职业病体检_职业史表   
  -- select * from   [Uoso.OccupationSJK].dbo.Occupation_Career
  insert into [Uoso.OccupationSJK].dbo.Occupation_Career(SysNumber,Company,Department,WorkType,Remark,ProtectMeasures,HazardType,StartDate,EndDate,IsRadiate,MoreRadiate,RadiateType,AddUpRadiate,[WorkLoad],WorkWeek)  
  select a.系统编号,a.工作单位,a.部门,a.工种,a.备注,a.防护措施,a.危害种类,a.起始时间,a.结束时间,a.是否放射性,a.过量照射史,a.放射种类,a.累积照射量,a.每日工作量,a.接触时间 from dbo.职业病体检_职业史表 as a
  -- 更新phid
  update [Uoso.OccupationSJK].dbo.Occupation_Career set PhID=b.PhID  from [Uoso.OccupationSJK].dbo.Occupation_Career as a  join [Uoso.OccupationSJK].dbo.Physical_Info as b on a.SysNumber=b.SysNumber
 
  
--自觉症状表
  
 -- select * from  dbo.职业病体检_自觉症状表
 -- select * from  [Uoso.OccupationSJK].dbo.Occupation_IllnessAsk
 insert into  [Uoso.OccupationSJK].dbo.Occupation_IllnessAsk(SysNumber,Symptom,SymptomLevel,SymptomTime)
 select a.系统编号,a.症状,a.程度,a.出现时间 from  dbo.职业病体检_自觉症状表 as a 
 -- 更新phid
  update [Uoso.OccupationSJK].dbo.Occupation_IllnessAsk set PhID=b.PhID  from [Uoso.OccupationSJK].dbo.Occupation_IllnessAsk as a  join [Uoso.OccupationSJK].dbo.Physical_Info as b on a.SysNumber=b.SysNumber

--更新个人生活史表
 --select * from  dbo.职业病体检_个人生活史表
 -- select * from [Uoso.OccupationSJK].dbo.Occupation_Life
  insert into [Uoso.OccupationSJK].dbo.Occupation_Life(SysNumber,Marry,MarryDate,HusbandHealth,HusbandWork,HusbandTouch,SmokeLevel,SmokeAmount,SmokeYear,NoSmoke,DrinkLevel,DrinkAmount,DrinkYear,DietaryHabit,FetationNum,FetationLifeNum,FetationEarlyNum,FetationDieNum,FetationMissingNum,FetationBadNum,FetationMuchNum,FetationEctopiaNum,InfertilityReason,HasBoy,HasBoyBorn,HasGirl,HasGirlBorn,ChildHealth,Menophania,Menstrual,Cycle,LastMenstruation,StopMenstruation,FamilyHistory,AllergyHistory,Children,UnusualChild)
 select a.系统编号,a.是否结婚,a.结婚日期,a.配偶健康状况,a.配偶职业,a.配偶接触放射,a.吸烟程度,a.吸烟量,a.烟龄,a.戒烟时长,a.饮酒程度,a.饮酒量,a.酒龄,'',a.孕次,a.活产,a.早产,a.死产,a.自然流产,a.畸胎,a.多胎,a.异位妊娠,a.不孕不育原因,(CAST(a.现有子女数目 as int)-CAST(a.现有女孩 as int)),a.男孩出生日期,a.现有女孩,a.女孩出生日期,a.子女健康状况,a.初潮,a.经期,a.周期,a.末次月经,a.停经年龄,a.家族史,a.过敏史,a.现有子女数目,a.异常胎  from dbo.职业病体检_个人生活史表 as a
  
  --更新个人生活史phid
   update [Uoso.OccupationSJK].dbo.Occupation_Life set PhID=b.PhID  from [Uoso.OccupationSJK].dbo.Occupation_Life as a  join [Uoso.OccupationSJK].dbo.Physical_Info as b on a.SysNumber=b.SysNumber
   
   
   --更新组织机构
   update [Uoso.OccupationSJK].dbo.Physical_Organization set UnitGuid='2f99c0e7-d372-4545-b968-6236d9432a90'
   
   
   --跟新8023调残评残
   
 insert into [Uoso.OccupationSJK].dbo.Occupation_DisabilityRrating(PhId)
 select PhID from  [Uoso.OccupationSJK].dbo.Physical_Info
   
   
   
   
   
  
  
     

	    
 




