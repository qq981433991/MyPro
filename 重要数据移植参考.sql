


/************************��������ֲ��ο�T-SQL***************************************/
select * from dbo.ְҵ�����_�����Ŀ���ñ� where ������='3124'

select * from dbo.ϵͳ����_�ֵ�_�ֵ���б� where ���� Like '%���%'

select * from dbo.ϵͳ����_�ֵ�_�ֵ����ݱ� where ID=84
-- ��ӵ�λ

--select * from [Uoso.OccupationSJK].dbo.Physical_Organization
--select * from  dbo.��λ����_��λ������Ϣ��


insert into [Uoso.OccupationSJK].dbo.Physical_Organization(UnitGuid,UnitName,ParentId) select ������,��λ����,0 from  dbo.��λ����_��λ������Ϣ��



select * from [Uoso.OccupationSJK].dbo.Sys_Dictionary
-- ���������
 insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0001',0,'����������','','',0,0)

     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select InnerID,REPLACE(����,���,'') as ����,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0001'),0,���  from dbo.ϵͳ����_�ֵ�_�ֵ����ݱ� where ID=84 and InnerID not in(3122,3123,3124,3125)

-- �����Ŀ���� ���� ����
 insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0006',0,'��Ŀ����','','',0,0)

 insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('000601',0,'����','','',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0006'),0)
     
      insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('000602',0,'����','','',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0006'),0)

-- �����Ŀ
select * from dbo.ְҵ�����_�����Ŀ���ñ� where ������='3124'



select * from [Uoso.OccupationSJK].dbo.Physical_Project

select * from [Uoso.OccupationSJK].dbo.Sys_Dictionary

select * from ְҵ�����_�����Ŀ���ñ�

insert into [Uoso.OccupationSJK].dbo.Physical_Project(InnerID,NewCode,ProName,DefalutVal,EnumFrom,ProType,StandardVal,Unit,IsDel)
 select b.InnerID,����,����,ȱʡֵ,ö����Դ,case when  ����='����' then 
(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='000601') 
 else  
 (select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='000602') 
 end sx,��׼ֵ,��λ,0 from ְҵ�����_�����Ŀ���ñ� as a
 join   [Uoso.OccupationSJK].dbo.Sys_Dictionary as b on a.������=b.Code and b.ParentID=1

 --update  [Uoso.OccupationSJK].dbo.Physical_Project  set ProType=16 where ProType=0
 --update  [Uoso.OccupationSJK].dbo.Physical_Project  set ProType=17 where ProType=1
 
 -- ������ģ������
 
-- select * from   dbo.ְҵ�����_����ģ�������Ϣ��
 
 
-- select * from  dbo.ְҵ�����_����ģ�������Ŀ��

--select * from dbo.ϵͳ����_�ֵ�_�ֵ���б�  where ID=71

-- select * from dbo.ϵͳ����_�ֵ�_�ֵ����ݱ�  where ID=72
 

 --select �����Ա����,������,��쵥���� from dbo.ְҵ�����_����ģ�������Ϣ�� group by �����Ա����,������,��쵥����

 -- select �����Ա���� from dbo.ְҵ�����_����ģ�������Ϣ�� group by �����Ա����
  
 --  select �����Ա����,������ from dbo.ְҵ�����_����ģ�������Ϣ�� group by �����Ա����,������
 --       select * from [Uoso.OccupationSJK].dbo.Sys_Dictionary
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0009',0,'ְҵ�������','','',0,0)
     

     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel)
     
     select '00090'+cast(ROW_NUMBER() over( order by innerId) as varchar) as number,�����Ա����,parentId,innerId from (
     select �����Ա����,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0009') as parentId,0 as innerId from dbo.ְҵ�����_����ģ�������Ϣ�� group by �����Ա���� ) as tb
 
 
  insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel)
  select '000900'+cast(ROW_NUMBER() over( order by innerID) as varchar) as number,  ������,InnerID,0 from ( select �����Ա����,������ from dbo.ְҵ�����_����ģ�������Ϣ�� group by �����Ա����,������ )as a 
	   join   [Uoso.OccupationSJK].dbo.Sys_Dictionary as b on a.�����Ա���� collate Chinese_PRC_CI_AS=b.Name and b.ParentID=(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0009')
	
	
	 -- ������ģ��
	 --select * from [Uoso.OccupationSJK].dbo.Physical_Template
	 
 insert into [Uoso.OccupationSJK].dbo.Physical_Template(TemplateName,MemberType,PhysicalType)

	 select ��쵥����,ID1,ID2 from (
	  select �����Ա����,������,��쵥���� from dbo.ְҵ�����_����ģ�������Ϣ��  group by �����Ա����,������,��쵥���� 	
	   ) as k
	    left join
	(
	select a.Name as Name1,b.Name as Name2,a.InnerID as  ID1,b.InnerID as ID2 from [Uoso.OccupationSJK].dbo.Sys_Dictionary  as a 
	left join [Uoso.OccupationSJK].dbo.Sys_Dictionary b on a.InnerID = b.ParentID where a.ParentID=(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0009')
)	 as  t on k.�����Ա����  collate Chinese_PRC_CI_AS=t.Name1 and k.������  collate Chinese_PRC_CI_AS=t.Name2


--���ģ�������Ŀ

--select * from [Uoso.OccupationSJK].dbo.Physical_TemplateProject

insert into [Uoso.OccupationSJK].dbo.Physical_TemplateProject(ProID,TemplateID,NewCode)
select b.ProID,c.TemplateID,a.�����Ŀ from  dbo.ְҵ�����_����ģ�������Ŀ�� as a
join [Uoso.OccupationSJK].dbo.Physical_Project  as b on a.�����Ŀ collate Chinese_PRC_CI_AS=b.NewCode
 join [Uoso.OccupationSJK].dbo.Physical_Template as c on a.��������  collate Chinese_PRC_CI_AS=c.TemplateName
 
 
 -- ��ʽ������
 
 
-- select * from  [Uoso.OccupationSJK].dbo.Physical_Template
 
--update [Uoso.OccupationSJK].dbo.Physical_Template set TemplateName=replace(replace(TemplateName,b.�����Ա����+'-' collate Chinese_PRC_CI_AS,''),b.������+'-' collate Chinese_PRC_CI_AS,'') from  
 
--  [Uoso.OccupationSJK].dbo.Physical_Template as a join 
-- (
--  select �����Ա����,������,��쵥����,ID1,ID2 from (
--	  select �����Ա����,������,��쵥���� from dbo.ְҵ�����_����ģ�������Ϣ��  group by �����Ա����,������,��쵥���� 	
--	   ) as k
--	    left join
--	(
--	select a.Name as Name1,b.Name as Name2,a.InnerID as  ID1,b.InnerID as ID2 from [Uoso.OccupationSJK].dbo.Sys_Dictionary  as a 
--	left join [Uoso.OccupationSJK].dbo.Sys_Dictionary b on a.InnerID = b.ParentID where a.ParentID=(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0009')
--)	 as  t on k.�����Ա����  collate Chinese_PRC_CI_AS=t.Name1 and k.������  collate Chinese_PRC_CI_AS=t.Name2
-- ) as b on a.TemplateName=b.��쵥���� collate Chinese_PRC_CI_AS
 
 
 -- ����Ļ��̶�
select * from dbo.ϵͳ����_�ֵ�_�ֵ���б� 


      insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0008',0,'�Ļ��̶�','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0008'+���,REPLACE(����,���,'') as ����,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0008'),0,���  from dbo.ϵͳ����_�ֵ�_�ֵ����ݱ� where ID=7
     
     
     -- ����ֹ���
   
       insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0010',0,'�ֹ���','','',0,0)
     

     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0010'+���,REPLACE(����,���,'') as ����,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0010'),0,���  from dbo.ϵͳ����_�ֵ�_�ֵ����ݱ� where ID=74
     
     
     --�������Դ
         insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0011',0,'����Դ����','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0011'+���,REPLACE(����,���,'') as ����,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0011'),0,���  from dbo.ϵͳ����_�ֵ�_�ֵ����ݱ� where ID=70 and Parent>0
     
     -- ���ְҵ���
     
     
       insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0012',0,'ְҵ���','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0012'+���,REPLACE(����,���,'') as ����,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0012'),0,��� from dbo.ϵͳ����_�ֵ�_�ֵ����ݱ� where ID=78
     
     -- ���Σ������
            insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0013',0,'Σ������','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0013'+���,REPLACE(����,���,'') as ����,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0013'),0,���  from dbo.ϵͳ����_�ֵ�_�ֵ����ݱ� where ID=77
     
     
     --��Ӳ���  
	 insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0050',0,'����','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0050'+���,REPLACE(����,���,'') as ����,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0050'),0,���  from dbo.ϵͳ����_�ֵ�_�ֵ����ݱ� where ID=73
     
     -- ��Ӽ�������
     
      insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0065',0,'��������','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0065'+���,REPLACE(����,���,'') as ����,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0065'),0,���  from dbo.ϵͳ����_�ֵ�_�ֵ����ݱ� where ID=87


--���ת��

     
      insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0066',0,'ת��','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0066'+���,REPLACE(����,���,'') as ����,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0066'),0,���  from dbo.ϵͳ����_�ֵ�_�ֵ����ݱ� where ID=89

--��ӷ�����ʩ
          insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0053',0,'������ʩ','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0053'+���,REPLACE(����,���,'') as ����,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0053'),0,���  from dbo.ϵͳ����_�ֵ�_�ֵ����ݱ� where ID=86
     
     
     
     --����������
          insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0054',0,'����������','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0054'+���,REPLACE(����,���,'') as ����,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0054'),0,���  from dbo.ϵͳ����_�ֵ�_�ֵ����ݱ� where ID=75
     
     --����̶�
          insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0099',0,'����̶�','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0099'+���,REPLACE(����,���,'') as ����,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0099'),0,���  from dbo.ϵͳ����_�ֵ�_�ֵ����ݱ� where ID=76
     
     
     
       --���̺ȾƵȳ̶�
          insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0096',0,'�̶�','','',0,0)
     
     
     insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum)  select '0096'+���,REPLACE(����,���,'') as ����,(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0096'),0,���  from dbo.ϵͳ����_�ֵ�_�ֵ����ݱ� where ID=79
     
      --Ӫ��
      insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0080',0,'Ӫ��','','',0,0)
     
      insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum) 
       select '008001','����',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0080'),0,1  
      union all
         select '008002','��',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0080'),0,2  
       union all
         select '008003','��',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0080'),0,3  
      
     
     -- ����
       insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0081',0,'����','','',0,0)
        insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum) 
       select '008101','����',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0081'),0,1  
      union all
         select '008102','��',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0081'),0,2  
       union all
         select '008103','��',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0081'),0,3  
      
      --��ż�������
       insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,ID,Name,Mnemonic,Description,ParentID,IsDel)
     values ('0098',0,'��ż�������','','',0,0)
        insert into [Uoso.OccupationSJK].dbo.Sys_Dictionary(Code,Name,ParentID,IsDel,OrderNum) 
       select '009801','����',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0098'),0,1  
      union all
         select '009802','һ��',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0098'),0,2  
       union all
         select '009803','���',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0098'),0,3  
       union all
         select '009804','��ȥ��',(select innerId from [Uoso.OccupationSJK].dbo.Sys_Dictionary where code='0098'),0,4  
     /***********************ҵ������*************************/

     
    select * from  dbo.ְҵ�����_�����ԱͼƬ�����
     select * from (
    select ������ݺ���,COUNT(*) as n from  dbo.ְҵ�����_�����Ա������Ϣ�� group by ������ݺ���) as tb where n>1
 select * from  dbo.ְҵ�����_��������Ϣ�� 
 
 select * from dbo.ְҵ�����_�����Ա������Ϣ�� where ������ݺ���='510102194402137517'
 
 
 

 -- ��ӵ�����Ϣ
 select * from [Uoso.OccupationSJK].dbo.Physical_MemberInfo
 delete from [Uoso.OccupationSJK].dbo.Physical_MemberInfo
 
 insert into [Uoso.OccupationSJK].dbo.Physical_MemberInfo(ArchivesCode,MName,MAge,MSex,MBorn,CardID,Nation,Adress,IssuingAuthority,EffectiveDate,CreateTime,Picture)
 select NEWID(),����,����,�Ա�,��������,������ݺ���,����,סַ,ϵͳ���,'',GETDATE(),'' from dbo.ְҵ�����_�����Ա������Ϣ��
 --�����������Ϣ
 
 
 select * from [Uoso.OccupationSJK].dbo.Physical_Info
 delete from [Uoso.OccupationSJK].dbo.Physical_Info
 insert into [Uoso.OccupationSJK].dbo.Physical_Info(SysNumber,ArchivesCode,IsPay,TemplateID,TemplateName,PhysicalDate,PhysicalConclusion,PhysicalOption,ConDoctor,ConclusionDate,PhysicalStatus,UnitID,UnitName,IsMarry,Profession,Degree,ContactTel,WorkYear,Post,HomeAdress,Transmitter,OccupationalGroup,DangerousEffects,NowJob,DangerousYear,Radiation,WorkNumber,AllWorkYear)
 
 select b.ϵͳ���,a.ArchivesCode,1,c.TemplateID,b.������,b.�������,b.������,b.��Ϻʹ������,d.����,b.�½�������,5,q.UnitID,k.��λ����,
 case when k.���='�ѻ�' then 1
 when k.���='��' then 1
 when k.���='��' then 1
 when  k.���='δ��' then 2
  when  k.���='��' then 2
   when  k.���='δ' then 2
   when k.���='����' then 3
else '' end as ���,'',w.InnerID as �Ļ��̶�,k.�绰����,k.����,k.�ʱ�,k.סַ,k.����Դ,k.ְҵ����,k.Σ������,k.�ֹ���,k.ְҵΣ������,k.�������,'','' from [Uoso.OccupationSJK].dbo.Physical_MemberInfo as a join dbo.ְҵ�����_��������Ϣ�� as b
 on  a.IssuingAuthority=b.ϵͳ��� collate Chinese_PRC_CI_AS
 left join dbo.ְҵ�����_�����Ա������Ϣ�� as k on k.ϵͳ���=b.ϵͳ���
 left join [Uoso.OccupationSJK].dbo.Physical_Template as c on c.TemplateName=b.������ collate Chinese_PRC_CI_AS
 left join dbo.ϵͳ����_Ա��������Ϣ�� as d on d.���=b.�½���ҽʦ
 left join [Uoso.OccupationSJK].dbo.Physical_Organization as q on q.UnitGuid=k.��λ������ collate Chinese_PRC_CI_AS 
 left join ( select * from [Uoso.OccupationSJK].dbo.Sys_Dictionary where ParentID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0008')) as w on w.Name=k.�Ļ��̶� collate Chinese_PRC_CI_AS 
 where  b.���״̬>=7
 
 
 --select * from  dbo.ϵͳ����_�ֵ�_�ֵ����ݱ� where ID=84
 --select * from dbo.ְҵ�����_���ҽ��۱�
 
 --select k.*,w.*,d.����,p.PhID from 
 --(select a.InnerID,a.Name,b.��� from (select * from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001')) as a
 --inner join (select * from  dbo.ϵͳ����_�ֵ�_�ֵ����ݱ� where ID=84) as b on a.Code=b.InnerID)
 --as k inner join  dbo.ְҵ�����_���ҽ��۱� as w on k.���=w.���� 
 --inner join [Uoso.OccupationSJK].dbo.Physical_Info as p on p.SysNumber=w.ϵͳ��� collate Chinese_PRC_CI_AS 
 -- left join dbo.ϵͳ����_Ա��������Ϣ�� as d on d.���=w.ҽ�����
  
 -- select * from [Uoso.OccupationSJK].dbo.Physical_Category
 
 insert into [Uoso.OccupationSJK].dbo.Physical_Category(PhID,SysNumber,PName,PID,EntryDoctorName,EntryDate,Status,IsAudit,Conclusion)
  select p.PhID,w.ϵͳ���,k.Name,k.InnerID,d.����,w.��������,1,0,w.���ֽ��� from 
 (select a.InnerID,a.Name,b.��� from (select * from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001')) as a
 inner join (select * from  dbo.ϵͳ����_�ֵ�_�ֵ����ݱ� where ID=84) as b on a.Code=b.InnerID)
 as k inner join  dbo.ְҵ�����_���ҽ��۱� as w on k.���=w.���� 
 inner join [Uoso.OccupationSJK].dbo.Physical_Info as p on p.SysNumber=w.ϵͳ��� collate Chinese_PRC_CI_AS 
  left join dbo.ϵͳ����_Ա��������Ϣ�� as d on d.���=w.ҽ�����
 


 /*******************************/-- ��ӿ�����Ŀ��ϸ��� ��ע���Ӧ���ҵ�ID �Ƿ���ȷ
 -- select * from [Uoso.OccupationSJK].dbo.Physical_Category

 --select * from  dbo.ְҵ�����_�����Ϣ_��� as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 --on a.ϵͳ���  collate Chinese_PRC_CI_AS =b.SysNumber
 --left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.�����Ŀ collate Chinese_PRC_CI_AS
 -- where b.PID=4
 
 
-- select * from [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo
-- select * from dbo.ְҵ�����_�����Ϣ_B��Ӱ���
--union all
-- select * from dbo.ְҵ�����_�����Ϣ_X��Ӱ���
-- union all
--  select * from dbo.ְҵ�����_�����Ϣ_��ٿ�
--   union all 
--   select * from dbo.ְҵ�����_�����Ϣ_���߿�
--   union all 
--    select * from dbo.ְҵ�����_�����Ϣ_�ڿ�
--   union all  
--    select * from dbo.ְҵ�����_�����Ϣ_���
--    union all   
--    select * from dbo.ְҵ�����_�����Ϣ_�򳣹滯���
--    union all    
--    select * from dbo.ְҵ�����_�����Ϣ_�ĵ��
--    union all     
--    select * from dbo.ְҵ�����_�����Ϣ_Ⱦɫ�廯���
--      union all    
--      select * from dbo.ְҵ�����_�����Ϣ_������
--       union all    
--       select * from dbo.ְҵ�����_�����Ϣ_�������
--        union all    
--        select * from dbo.ְҵ�����_�����Ϣ_�ι���Ӱ���
--        union all     
--        select * from dbo.ְҵ�����_�����Ϣ_Ѫ���滯���
 
  --B��Ӱ���  
 insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.ϵͳ���,c.ProID,c.ProName,a.�����,d.����,a.��дʱ��,1,a.�������,a.�����Ŀ,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.ְҵ�����_�����Ϣ_B��Ӱ���
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.ϵͳ���  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.�����Ŀ collate Chinese_PRC_CI_AS
 left join dbo.ϵͳ����_Ա��������Ϣ�� as d on d.���=a.���ҽʦ
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='B��Ӱ���' ) 
  
  --X��Ӱ���
 insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.ϵͳ���,c.ProID,c.ProName,a.�����,d.����,a.��дʱ��,1,a.�������,a.�����Ŀ,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.ְҵ�����_�����Ϣ_X��Ӱ���
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.ϵͳ���  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.�����Ŀ collate Chinese_PRC_CI_AS
 left join dbo.ϵͳ����_Ա��������Ϣ�� as d on d.���=a.���ҽʦ
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='X��Ӱ���' ) 
  
  --��ٿ�
  
  insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.ϵͳ���,c.ProID,c.ProName,a.�����,d.����,a.��дʱ��,1,a.�������,a.�����Ŀ,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.ְҵ�����_�����Ϣ_��ٿ�
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.ϵͳ���  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.�����Ŀ collate Chinese_PRC_CI_AS
 left join dbo.ϵͳ����_Ա��������Ϣ�� as d on d.���=a.���ҽʦ
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='��ٿ�' ) 

   --���߿�
  
  
  
insert into  [Uoso.OccupationSJK].dbo.Physical_Category(SysNumber,PhID,PID,PName,Status,IsAudit)
        select a.ϵͳ���,PhID,(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='���߿�' ),'���߿�',1,0 from (select distinct ϵͳ��� from ְҵ�����_�����Ϣ_���߿�)  a  join  [Uoso.OccupationSJK].dbo.Physical_Info as b on a.ϵͳ��� collate Chinese_PRC_CI_AS=b.SysNumber
  
  insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.ϵͳ���,c.ProID,c.ProName,a.�����,d.����,a.��дʱ��,1,a.�������,a.�����Ŀ,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.ְҵ�����_�����Ϣ_���߿�
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.ϵͳ���  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.�����Ŀ collate Chinese_PRC_CI_AS
 left join dbo.ϵͳ����_Ա��������Ϣ�� as d on d.���=a.���ҽʦ
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='���߿�' ) 

    --�ڿ�
  
  insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.ϵͳ���,c.ProID,c.ProName,a.�����,d.����,a.��дʱ��,1,a.�������,a.�����Ŀ,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.ְҵ�����_�����Ϣ_�ڿ�
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.ϵͳ���  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.�����Ŀ collate Chinese_PRC_CI_AS
 left join dbo.ϵͳ����_Ա��������Ϣ�� as d on d.���=a.���ҽʦ
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='�ڿ�' )
 
 
   --���
  
  insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.ϵͳ���,c.ProID,c.ProName,a.�����,d.����,a.��дʱ��,1,a.�������,a.�����Ŀ,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.ְҵ�����_�����Ϣ_���
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.ϵͳ���  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.�����Ŀ collate Chinese_PRC_CI_AS
 left join dbo.ϵͳ����_Ա��������Ϣ�� as d on d.���=a.���ҽʦ
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='���' )
 
--�򳣹滯���

insert into  [Uoso.OccupationSJK].dbo.Physical_Category(SysNumber,PhID,PID,PName,Status,IsAudit)
        select a.ϵͳ���,PhID,(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='�򳣹滯���' ),'�򳣹滯���',1,0 from (select distinct ϵͳ��� from ְҵ�����_�����Ϣ_�򳣹滯���)  a  join  [Uoso.OccupationSJK].dbo.Physical_Info as b on a.ϵͳ��� collate Chinese_PRC_CI_AS=b.SysNumber

      insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.ϵͳ���,c.ProID,c.ProName,a.�����,d.����,a.��дʱ��,1,a.�������,a.�����Ŀ,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.ְҵ�����_�����Ϣ_�򳣹滯���
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.ϵͳ���  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.�����Ŀ collate Chinese_PRC_CI_AS
 left join dbo.ϵͳ����_Ա��������Ϣ�� as d on d.���=a.���ҽʦ
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='�򳣹滯���' )
--�ĵ��
         insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.ϵͳ���,c.ProID,c.ProName,a.�����,d.����,a.��дʱ��,1,a.�������,a.�����Ŀ,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.ְҵ�����_�����Ϣ_�ĵ��
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.ϵͳ���  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.�����Ŀ collate Chinese_PRC_CI_AS
 left join dbo.ϵͳ����_Ա��������Ϣ�� as d on d.���=a.���ҽʦ
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='�ĵ��' ) 
--Ⱦɫ�廯���

insert into  [Uoso.OccupationSJK].dbo.Physical_Category(SysNumber,PhID,PID,PName,Status,IsAudit)
        select a.ϵͳ���,PhID,(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='Ⱦɫ�廯���' ),'Ⱦɫ�廯���',1,0 from (select distinct ϵͳ��� from ְҵ�����_�����Ϣ_Ⱦɫ�廯���)  a  join  [Uoso.OccupationSJK].dbo.Physical_Info as b on a.ϵͳ��� collate Chinese_PRC_CI_AS=b.SysNumber
        
        
            insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.ϵͳ���,c.ProID,c.ProName,a.�����,d.����,a.��дʱ��,1,a.�������,a.�����Ŀ,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.ְҵ�����_�����Ϣ_Ⱦɫ�廯���
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.ϵͳ���  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.�����Ŀ collate Chinese_PRC_CI_AS
 left join dbo.ϵͳ����_Ա��������Ϣ�� as d on d.���=a.���ҽʦ
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='Ⱦɫ�廯���' ) 
--������

 insert into  [Uoso.OccupationSJK].dbo.Physical_Category(SysNumber,PhID,PID,PName,Status,IsAudit)
        select a.ϵͳ���,PhID,(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='������' ),'������',1,0 from (select distinct ϵͳ��� from ְҵ�����_�����Ϣ_������)  a  join  [Uoso.OccupationSJK].dbo.Physical_Info as b on a.ϵͳ��� collate Chinese_PRC_CI_AS=b.SysNumber

              insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.ϵͳ���,c.ProID,c.ProName,a.�����,d.����,a.��дʱ��,1,a.�������,a.�����Ŀ,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.ְҵ�����_�����Ϣ_������
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.ϵͳ���  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.�����Ŀ collate Chinese_PRC_CI_AS
 left join dbo.ϵͳ����_Ա��������Ϣ�� as d on d.���=a.���ҽʦ
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='������' ) 
--�������

 insert into  [Uoso.OccupationSJK].dbo.Physical_Category(SysNumber,PhID,PID,PName,Status,IsAudit)
        select a.ϵͳ���,PhID,(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='�������' ),'�������',1,0 from (select distinct ϵͳ��� from ְҵ�����_�����Ϣ_�������)  a  join  [Uoso.OccupationSJK].dbo.Physical_Info as b on a.ϵͳ��� collate Chinese_PRC_CI_AS=b.SysNumber

     insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.ϵͳ���,c.ProID,c.ProName,a.�����,d.����,a.��дʱ��,1,a.�������,a.�����Ŀ,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.ְҵ�����_�����Ϣ_�������
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.ϵͳ���  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.�����Ŀ collate Chinese_PRC_CI_AS
 left join dbo.ϵͳ����_Ա��������Ϣ�� as d on d.���=a.���ҽʦ
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='�������' ) 
--�ι���Ӱ���
       insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.ϵͳ���,c.ProID,c.ProName,a.�����,d.����,a.��дʱ��,1,a.�������,a.�����Ŀ,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.ְҵ�����_�����Ϣ_�ι���Ӱ���
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.ϵͳ���  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.�����Ŀ collate Chinese_PRC_CI_AS
 left join dbo.ϵͳ����_Ա��������Ϣ�� as d on d.���=a.���ҽʦ
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='�ι���Ӱ���' ) 
--Ѫ���滯���
     
         insert into  [Uoso.OccupationSJK].dbo.Physical_Category(SysNumber,PhID,PID,PName,Status,IsAudit)
        select a.ϵͳ���,PhID,(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='Ѫ���滯���' ),'Ѫ���滯���',1,0 from (select distinct ϵͳ��� from ְҵ�����_�����Ϣ_Ѫ���滯���)  a  join  [Uoso.OccupationSJK].dbo.Physical_Info as b on a.ϵͳ��� collate Chinese_PRC_CI_AS=b.SysNumber
     
         insert into [Uoso.OccupationSJK].dbo.Physical_OccupationMemberProjectInfo(FID,SysNumber,ProID,ProName,ResultVal,EntryDoctorName,EntryDate,Status,SampleCon,Code,Unit,StandardVal,DefaultVal,ConEnum)
select FID,a.ϵͳ���,c.ProID,c.ProName,a.�����,d.����,a.��дʱ��,1,a.�������,a.�����Ŀ,c.Unit,c.StandardVal,c.DefalutVal,c.ConEnum from  dbo.ְҵ�����_�����Ϣ_Ѫ���滯���
as a left join [Uoso.OccupationSJK].dbo.Physical_Category as b
 on a.ϵͳ���  collate Chinese_PRC_CI_AS =b.SysNumber
 left join [Uoso.OccupationSJK].dbo.Physical_Project as c on c.NewCode=a.�����Ŀ collate Chinese_PRC_CI_AS
 left join dbo.ϵͳ����_Ա��������Ϣ�� as d on d.���=a.���ҽʦ
  where b.PID=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where parentId=(select InnerID from [Uoso.OccupationSJK].dbo.Sys_Dictionary where Code='0001') and Name='Ѫ���滯���' ) 
 
 -- dbo.ְҵ�����_�����Ϣ_�ܼ��߸�����Ϣ¼���
 

  --select * from [Uoso.OccupationSJK].dbo.Occupation_Physique
  
  --select * from dbo.ְҵ�����_�����Ϣ_�ܼ��߸�����Ϣ¼���
   
  -- �����������
  insert into [Uoso.OccupationSJK].dbo.Occupation_Physique(SysNumber) select distinct ϵͳ��� from dbo.ְҵ�����_�����Ϣ_�ܼ��߸�����Ϣ¼��� 
  
  -- ����Ӫ��
  update [Uoso.OccupationSJK].dbo.Occupation_Physique set Nutrition=b.����� from [Uoso.OccupationSJK].dbo.Occupation_Physique as a join dbo.ְҵ�����_�����Ϣ_�ܼ��߸�����Ϣ¼��� as b on a.SysNumber=b.ϵͳ��� collate Chinese_PRC_CI_AS where b.�����Ŀ='13017'
     -- �������
    update [Uoso.OccupationSJK].dbo.Occupation_Physique set Height=b.����� from [Uoso.OccupationSJK].dbo.Occupation_Physique as a join dbo.ְҵ�����_�����Ϣ_�ܼ��߸�����Ϣ¼��� as b on a.SysNumber=b.ϵͳ��� collate Chinese_PRC_CI_AS where b.�����Ŀ='13018'
    
      -- ��������
    update [Uoso.OccupationSJK].dbo.Occupation_Physique set Weight=b.����� from [Uoso.OccupationSJK].dbo.Occupation_Physique as a join dbo.ְҵ�����_�����Ϣ_�ܼ��߸�����Ϣ¼��� as b on a.SysNumber=b.ϵͳ��� collate Chinese_PRC_CI_AS where b.�����Ŀ='13019'
    -- ��������ѹ
  update [Uoso.OccupationSJK].dbo.Occupation_Physique set SBP=b.����� from [Uoso.OccupationSJK].dbo.Occupation_Physique as a join dbo.ְҵ�����_�����Ϣ_�ܼ��߸�����Ϣ¼��� as b on a.SysNumber=b.ϵͳ��� collate Chinese_PRC_CI_AS where b.�����Ŀ='13020'
   -- ��������ѹ
    update [Uoso.OccupationSJK].dbo.Occupation_Physique set DBP=b.����� from [Uoso.OccupationSJK].dbo.Occupation_Physique as a join dbo.ְҵ�����_�����Ϣ_�ܼ��߸�����Ϣ¼��� as b on a.SysNumber=b.ϵͳ��� collate Chinese_PRC_CI_AS where b.�����Ŀ='13021'
    
     -- ���¹���phid
   update [Uoso.OccupationSJK].dbo.Occupation_Physique set PhID=b.PhID  from [Uoso.OccupationSJK].dbo.Occupation_Physique as a join [Uoso.OccupationSJK].dbo.Physical_Info as b on a.SysNumber=b.SysNumber
   
   -- ���¼�����ʷ
   --select * from  dbo.ְҵ�����_������ʷ��
   --select * from [Uoso.OccupationSJK].dbo.Occupation_Sickness
   
   insert into [Uoso.OccupationSJK].dbo.Occupation_Sickness(SickName,DiagnoseOrganize,DiagnoseDate,Treatment,TreatmentImprove,SysNumber)
   select a.��������,a.��ϵ�λ,a.�������,a.���ƾ���,a.ת��,a.ϵͳ��� from  dbo.ְҵ�����_������ʷ��  as a
   -- ���¹���phid
   update [Uoso.OccupationSJK].dbo.Occupation_Sickness set PhID=b.PhID  from [Uoso.OccupationSJK].dbo.Occupation_Sickness as a  join [Uoso.OccupationSJK].dbo.Physical_Info as b on a.SysNumber=b.SysNumber
   
   -- ����ְҵʷ
   
  -- select * from dbo.ְҵ�����_ְҵʷ��   
  -- select * from   [Uoso.OccupationSJK].dbo.Occupation_Career
  insert into [Uoso.OccupationSJK].dbo.Occupation_Career(SysNumber,Company,Department,WorkType,Remark,ProtectMeasures,HazardType,StartDate,EndDate,IsRadiate,MoreRadiate,RadiateType,AddUpRadiate,[WorkLoad],WorkWeek)  
  select a.ϵͳ���,a.������λ,a.����,a.����,a.��ע,a.������ʩ,a.Σ������,a.��ʼʱ��,a.����ʱ��,a.�Ƿ������,a.��������ʷ,a.��������,a.�ۻ�������,a.ÿ�չ�����,a.�Ӵ�ʱ�� from dbo.ְҵ�����_ְҵʷ�� as a
  -- ����phid
  update [Uoso.OccupationSJK].dbo.Occupation_Career set PhID=b.PhID  from [Uoso.OccupationSJK].dbo.Occupation_Career as a  join [Uoso.OccupationSJK].dbo.Physical_Info as b on a.SysNumber=b.SysNumber
 
  
--�Ծ�֢״��
  
 -- select * from  dbo.ְҵ�����_�Ծ�֢״��
 -- select * from  [Uoso.OccupationSJK].dbo.Occupation_IllnessAsk
 insert into  [Uoso.OccupationSJK].dbo.Occupation_IllnessAsk(SysNumber,Symptom,SymptomLevel,SymptomTime)
 select a.ϵͳ���,a.֢״,a.�̶�,a.����ʱ�� from  dbo.ְҵ�����_�Ծ�֢״�� as a 
 -- ����phid
  update [Uoso.OccupationSJK].dbo.Occupation_IllnessAsk set PhID=b.PhID  from [Uoso.OccupationSJK].dbo.Occupation_IllnessAsk as a  join [Uoso.OccupationSJK].dbo.Physical_Info as b on a.SysNumber=b.SysNumber

--���¸�������ʷ��
 --select * from  dbo.ְҵ�����_��������ʷ��
 -- select * from [Uoso.OccupationSJK].dbo.Occupation_Life
  insert into [Uoso.OccupationSJK].dbo.Occupation_Life(SysNumber,Marry,MarryDate,HusbandHealth,HusbandWork,HusbandTouch,SmokeLevel,SmokeAmount,SmokeYear,NoSmoke,DrinkLevel,DrinkAmount,DrinkYear,DietaryHabit,FetationNum,FetationLifeNum,FetationEarlyNum,FetationDieNum,FetationMissingNum,FetationBadNum,FetationMuchNum,FetationEctopiaNum,InfertilityReason,HasBoy,HasBoyBorn,HasGirl,HasGirlBorn,ChildHealth,Menophania,Menstrual,Cycle,LastMenstruation,StopMenstruation,FamilyHistory,AllergyHistory,Children,UnusualChild)
 select a.ϵͳ���,a.�Ƿ���,a.�������,a.��ż����״��,a.��żְҵ,a.��ż�Ӵ�����,a.���̶̳�,a.������,a.����,a.����ʱ��,a.���Ƴ̶�,a.������,a.����,'',a.�д�,a.���,a.���,a.����,a.��Ȼ����,a.��̥,a.��̥,a.��λ����,a.���в���ԭ��,(CAST(a.������Ů��Ŀ as int)-CAST(a.����Ů�� as int)),a.�к���������,a.����Ů��,a.Ů����������,a.��Ů����״��,a.����,a.����,a.����,a.ĩ���¾�,a.ͣ������,a.����ʷ,a.����ʷ,a.������Ů��Ŀ,a.�쳣̥  from dbo.ְҵ�����_��������ʷ�� as a
  
  --���¸�������ʷphid
   update [Uoso.OccupationSJK].dbo.Occupation_Life set PhID=b.PhID  from [Uoso.OccupationSJK].dbo.Occupation_Life as a  join [Uoso.OccupationSJK].dbo.Physical_Info as b on a.SysNumber=b.SysNumber
   
   
   --������֯����
   update [Uoso.OccupationSJK].dbo.Physical_Organization set UnitGuid='2f99c0e7-d372-4545-b968-6236d9432a90'
   
   
   --����8023��������
   
 insert into [Uoso.OccupationSJK].dbo.Occupation_DisabilityRrating(PhId)
 select PhID from  [Uoso.OccupationSJK].dbo.Physical_Info
   
   
   
   
   
  
  
     

	    
 




