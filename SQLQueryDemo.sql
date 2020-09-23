use school
create trigger formatTablenguoi
on nguoi
instead of insert, update
as
begin
	declare @id char(12);
	declare @ngaySinh date;
	declare @result int;
	set @ngaySinh = ( select ngaySinh from inserted);
	set @id = (select id from inserted);
	set @result =year(getdate()) - year(@ngaySinh);
	if (left(@id,2)='TS')
	begin
		if len(@id)!=12 or ISNUMERIC(right(@id,10))=0
		begin
			print N'Phải nhập theo format';
			rollback tran;
		end	
		else
		begin
			if (month(getdate()) < month(@ngaySinh))
			begin
				set @result -= 1;		
			end
			else if(month(getdate()) = month(@ngaySinh))
			begin
				if(day(getdate()) < day(@ngaySinh))
				begin
					set @result -= 1;	
				end
			end
			print(@result);
			if( @result >= 15 and @result <=30 )
			begin
				if(@id in (select id from nguoi ))
				begin
					update nguoi set ngaySinh = @ngaySinh;
				end
				else
				begin 
					insert into nguoi(id,ngaySinh) values(@id,@ngaySinh);
				end
			end	
		end
	end
	else if (left(@id,2)='NS')
	begin
		if len(@id)!=8 or ISNUMERIC(right(@id,6))=0
		begin
			print N'Phải nhập theo format';
			rollback;
		end
	end
	else 
		begin
			print N'Phải nhập theo format';
			rollback;
		end
end

-------------------------------
-- trigger Baihat
-------------------------------
create trigger formatTablebaihat
on baihat
after insert 
as
begin
	declare @maBH char(8);
	set @maBH = (select maBH from inserted);
	if(left(@maBH,2)='BH')
		begin
			if len(@maBH)!=8 or ISNUMERIC (right(@maBH,6)) = 0
				begin
					print N'Phải nhập đúng format!';
					rollback;
				end
		end
	else 
		begin
			print N'Phải nhập theo format';
			rollback;
		end
end
----------------------------------
--trigger Theloai
----------------------------------
create trigger formatTabletheloai
on theloai
after insert
as
begin
	declare @maTL char(5)
	set @maTL = (select maTL from inserted);
	if(LEFT(@maTL,2)='TL')
		begin 
			if len(@maTL)!=5 or isnumeric (right(@maTL,3)) = 0
				begin
					print N'Phải nhập đúng format!';
					rollback; 
				end
			end
	else
		begin
			print N'Phải nhập theo format';
			rollback;
		end
end
---------------------------------------------
--trigger tỉnh thành
---------------------------------------------
create trigger formatTabletinhthanh
on tinhthanh
after insert 
as
begin
	declare @maTT char(4);
	set @maTT = (select maTT from inserted);
	if(left(@maTT,2)='TT')
		begin
			if len(@maTT)!=4 or ISNUMERIC (right(@maTT,2)) = 0
				begin
					print N'Phải nhập đúng format!';
					rollback;
				end
		end
	else 
		begin
			print N'Phải nhập theo format';
			rollback;
		end
end
-------------------------------
--Trigger Nhà sản xuất
-------------------------------
create trigger formatTablenhasanxuat
on nhasanxuat
after insert 
as
begin
	declare @maNSX char(6);
	set @maNSX = (select maNSX from inserted);
	if(left(@maNSX,3)='NSX')
		begin
			if len(@maNSX)!=6 or ISNUMERIC (right(@maNSX,3)) = 0
				begin
					print N'Phải nhập đúng format!';
					rollback;
				end
		end
	else 
		begin
			print N'Phải nhập theo format';
			rollback;
		end
end
-----------------------------------
--trigger kenh truyen hinh
-----------------------------------
create trigger formatTablekenhtruyenhinh
on kenhtruyenhinh
after insert 
as
begin
	declare @maK char(5);
	set @maK = (select maK from inserted);
	if(left(@maK,2)='TH')
		begin
			if len(@maK)!= 5 or ISNUMERIC (right(@maK,3)) = 0
				begin
					print N'Phải nhập đúng format!';
					rollback;
				end
		end
	else 
		begin
			print N'Phải nhập theo format';
			rollback;
		end
end
----------------------------
--trigger tinh thanh
----------------------------
create trigger formatTabletinhthanh
on tinhthanh
after insert 
as
begin
	declare @maTT char(4);
	set @maTT = (select maTT from inserted);
	if(left(@maTT,2)='TT')
		begin
			if len(@maTT)!=4 or ISNUMERIC (right(@maTT,2)) = 0
				begin
					print N'Phải nhập đúng format!';
					rollback;
				end
		end
	else 
		begin
			print N'Phải nhập theo format';
			rollback;
		end
end
--------------------------------
-- trigger nhom ca
--------------------------------
create trigger formatTablenhomca
on nhomca
after insert 
as
begin
	declare @maNhom char(8);
	set @maNhom = (select maNhom from inserted);
	if(left(@maNhom,2)='NC')
		begin
			if len(@maNhom)!=8 or ISNUMERIC (right(@maNhom,6)) = 0
				begin
					print N'Phải nhập đúng format!';
					rollback;
				end
		end
	else 
		begin
			print N'Phải nhập theo format';
			rollback;
		end
end

---------------------------
-- Check trigger
---------------------------
SET DATEFORMAT DMY
insert into nguoi values('TS0860000980','086000098989',N'Trần Hoàng Phúc',0,'21/01/1998',N'Vĩnh Long');
insert into nguoi values('NS000001','086000098989',N'Trần Hoàng Phúc',0,'21/01/1998',N'Vĩnh Long');

select * from nguoi
------------------------------
-- Format bảng Mùa thi
------------------------------
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
-------------------------
-- Check trigger
-------------------------
drop trigger formatTableMuathi
delete from muathi
drop trigger formatTableNGUOI
delete from nguoi
insert into muathi(maMT,ngayBD,ngayKT) values('','1998/01/21','1998/01/21');

select* from muathi
select* from nguoi