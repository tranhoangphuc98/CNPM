drop function fn_MinSTTVongThi
create function fn_MinSTTVongThi(@maMT char(4),@loaiVT int)
returns int as
begin
	declare @Minstt int;
	set @Minstt = (select MIN(VT.STTvongthi)
	from vongthi VT
	where VT.maMT = @maMT and VT.loaiVT = @loaiVT )
	return @Minstt
end

select dbo.fn_MinSTTVongThi('MT1',3)


drop function fn_MaxSTTVongThi
create function fn_MaxSTTVongThi(@maMT char(4),@loaiVT int)
returns int as
begin
	declare @Maxstt int;
	set @Maxstt =(select MAX(VT.STTvongthi)
	from vongthi VT
	where VT.maMT = @maMT and VT.loaiVT = @loaiVT )
	return @Maxstt
end
select dbo.fn_MaxSTTVongThi('MT1',3)



drop PROCEDURE CapNhatKetQuaThuGiong
create PROCEDURE CapNhatKetQuaThuGiong(@STTVongThi char(3),@maMT char(4) ,@maTS char(12))
as
begin
	declare @KQThuGiong int;
	declare @GK1 bit ,@GK2 bit , @GK3 bit;
	set @GK1 = (select GK1 from TSthamgiathugiong where STTvongthi = @STTVongThi and maMT = @maMT and maTS = @maTS );
	set @GK2 = (select GK2 from TSthamgiathugiong where STTvongthi = @STTVongThi and maMT = @maMT and maTS = @maTS );
	set @GK3 = (select GK3 from TSthamgiathugiong where STTvongthi = @STTVongThi and maMT = @maMT and maTS = @maTS );
	if((@GK1 = 1 And @GK2 = 1) or (@GK1 = 1 and @GK3 = 1) or (@GK2 = 1 and @GK3 = 1))
		begin
			set	@KQThuGiong = 1;
		end 
	else
		begin
			set @KQThuGiong = 0;
		end
	update TSthamgiaVT set KQ = @KQThuGiong where STTvongthi = @STTVongThi and maMT = @maMT and maTS = @maTS

end

go CapNhatKetQuaThuGiong '',