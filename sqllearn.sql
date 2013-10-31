--数据量大 快速返回记录数
select rows from sysindexes where id=object_id('table name')
--添加列
if exists(select * from syscolumns where id=object_id('your table name') and name='your column name')
alter table [your table name] drop column [column name]
alter table [your table name] add [column name] nvarchar(3) null;
go

--sp_rename
if exists(select * from syscolumns where id=object_id('dbo.django') and name='firstname')
--修改列名
exec sp_rename 'django.firstname','lastname','column'
--修改表名
exec sp_rename 'customer','cust'
go

--cast convert
cast(ID as int)
convert(int,ID)
substring(1,4,firstname) as fname

--表结构
--id int
--fname varchar(10)
--游标
declare @id int
declare @fname varchar(10)

declare cursor_one cursor for           --创建游标
select * from Person
open cursor_one                         --打开游标
fetch next from cursor_one into @id,@fname  --游标下一行，将数据放入，变量@id @name
while @@fetch_status=0                  --0表示成功，1失败
begin
update Person set fname='first-'+@fname
where id=@id

fetch next from cursor_one into @id,@name  --游标下一行
end
close cursor_one
deallocate cursor_one
