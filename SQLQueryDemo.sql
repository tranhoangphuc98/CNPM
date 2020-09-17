use SQLDemo

create trigger formatTableNGUOI
on NGUOI
after insert
as
begin
	declare @id char(12);
	set @id = (select id from inserted);
	if (left(@id,2)='TS')
	begin
		if len(@id)!=12 or ISNUMERIC(right(@id,10))=0
		begin
			print N'Phải nhập theo format';
			rollback;
		end	
	end
	if (left(@id,2)='NS')
	begin
		if len(@id)!=8 or ISNUMERIC(right(@id,6))=0
		begin
			print N'Phải nhập theo format';
			rollback;
		end
	end
end

-- Check trigger
SET DATEFORMAT DMY
insert into NGUOI values('TS20120000','086000098989',N'Trần Hoàng Phúc',0,'21/01/1998',N'Vĩnh Long');
insert into NGUOI values('NS000001','086000098989',N'Trần Hoàng Phúc',0,'21/01/1998',N'Vĩnh Long');

select * from NGUOI

-- Format bảng Mùa thi
create trigger formatTableMuathi
on muathi
for insert
as
begin
	SET DATEFORMAT DMY
	declare @maMT char(4), @ma char(4);
	declare @id int;
	declare @ngayBD date;
	declare @ngayKT date;
	set @ngayBD = (select ngayBD from inserted);
	set @ngayKT = (select ngayBD from inserted);
	rollback tran;
	set @ma = (select TOP 1 maMT from muathi order by maMT desc);
	set @id = cast(right(@ma,2) as int);

	if @id is null
	begin
		set @maMT = 'MT1';
	end
	else
	begin
		set @maMT = CONCAT('MT',@id+1);
	end
	insert into muathi(maMT,ngayBD,ngayKT) values(@maMT,@ngayBD,@ngayKT);
end

-- Check trigger
drop trigger formatTableMuathi
delete from muathi

insert into muathi(maMT,ngayBD,ngayKT) values('','1998/01/21','1998/01/21');

select* from muathi
