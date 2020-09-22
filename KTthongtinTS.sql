----
-- Viết trigger kiểm tra thông tin hợp lệ của một thí sinh khi đăng ký tham gia một mùa thi
----

--a. Tuổi từ 15 tới 30 

--
Create function CheckTS(@ngaySinh date,@ngayBD date,@id char(12))
return bit

create trigger kiemtrathongtinTS on nguoi
after insert
as
	begin
		SET DATEFORMAT DMY;
		declare @KT date; --KT = Kiemtra
		declare @ngayBD date;
		declare @id char(12);
		set @KT = ( select ngaySinh from nguoi from id = @id  );
		set @ngayBD = (select ngayBD from inserted);
		if((@ngayBD.get(Year)- @KT.get(year) > 15) and(@NgayBD.get(Year)- @KT.get(year) < 30))
			begin
				
			end
		else if ((@ngayBD.get(year) - @KT.get(year) = 15 or (@NgayBD.get(Year)- @KT.get(year) = 30))
					begin 
						if (@ngayBD.get(MONTH)- @KT.get(MONTH) = 0)
							begin
								if(@ngayBD.get(day)- @KT.get(day) >= 0)
									begin

									end
								else
									begin
										update nguoi set (delete id and cmnd = null and ten = null and gioiTinh = null and ngaySinh = null and noiSinh = null)
									end
							end
						else if (@ngayBD.get(MONTH)- @KT.get(MONTH) > 0)
							begin
								
							end
						else
							begin
								update nguoi set (delete id and cmnd = null and ten = null and gioiTinh = null and ngaySinh = null and noiSinh = null)
							end
					end

		else
			update nguoi set (delete id and cmnd = null and ten = null and gioiTinh = null and ngaySinh = null and noiSinh = null)
			
	end

	----Chưa từng lọt tới vòng thi gala trong tất cả mùa giải trước đó