use school
create table nguoi(
	id char(12) NOT NULL,
	cmnd char(12),
	ten nvarchar(30),
	gioiTinh bit,
	ngaySinh date,
	noiSinh nvarchar(100),
	primary key(id)
)
create table thisinh
(
	maTS char(12) not NULL,
	diaChi nvarchar(300),
	dienThoai char(10),
	gioiThieu text,
	primary key(maTS)
)
create table nghesi
(
	maNS char(12)not null,
	ngheDanh nvarchar(30),
	thanhTich nvarchar(200),
	MCFlag bit,
	CSFlag bit,
	NSFlag bit,
	primary key(maNS)
)
create table chuongtrinhMCdan(
	maMC char(12) not null,
	maCTDD char(8) not null,
	primary key(maMC,maCTDD)
)
create table albumCS(
	maCS char(12) not null,
	maAlbum char(8) not null,
	primary key(maAlbum,maCS)
)
create table baihat(
	maBH char(8)not null,
	tuaBH nvarchar(50) not null,
	primary key(maBH)
)
create table theloai(
	maTL char(5)not null,
	tenTL nvarchar(100)not null,
	primary key(maTL)
)
create table BHthuoctheloai(
	maBH char(8) not null,
	maTL char(5) not null,
	primary key(maBH,maTL)
)
create table nhacsisangtac(
	maNS char(12) not null,
	maBH char(12) not null,
	thongtinST tinyint,
	primary key(maNS,maBH)
)
create table tinhthanh(
	maTT char(4) not null,
	tenTT nvarchar(30)not null,
	primary key(maTT)
)
create table nhasanxuat(
	maNSX char(6) not null,
	tenSX nvarchar(100),
	primary key(maNSX)
)
create table kenhtruyenhinh(
	maK char(5) not null,
	tenK nvarchar(100) not null,
	primary key(maK)
)
create table muathi(
	maMT char(4) not null,
	ngayBD date,
	ngayKT date,
	giaiThuong text,
	diadiemvongNH nvarchar(300),
	diadiemvongBK nvarchar(300),
	diadiemvongGL nvarchar(300),
	maGDAN char(10),
	maGK1 char(10),
	maGK2 char(10),
	maGK3 char(10),
	maMC char(12),
	primary key(maMT)
)
create table giubanquyenmuathi(
	maMT char(4) not null,
	maNSX char(6) not null,
	primary key(maMT,maNSX)
)
create table phatsong(
	maMT char(4) not null,
	maK char(5) not null,
	thongtinPS tinyint,
	primary key(maMT,maK)
)
create table vongthi(
	/*VT= vongthi*/
	STTvongthi char(3)not null,
	maMT char(4) NOT NULL,
	tenVT nvarchar(100),
	thoigianBD date,
	thoigianKT date,
	loaiVT int,
	primary key(STTvongthi,maMT)
)
create table TSthamgiaVT(
	STTvongthi char(3)not null,
	maTS char(12) not null,
	maMT char(4) not null,
	KQ int default -1,
	primary key(STTvongthi,maTS,maMT)
)
create table vongthugiong(
	STTvongthi char(3)not null,
	maMT char(4)not null,
	maTT nvarchar(30),
	diadiem nvarchar(300),
	primary key(STTvongthi, maMT)
)
create table TSthamgiathugiong(
	STTvongthi char(3) not null,
	maMT char(4) not null,
	maTS char(12) not null,
	GK1 bit,
	GK2 bit,
	GK3 bit,
	primary key(STTvongthi,maMT ,maTS)
)
create table TShattaivongthugiong(
	STTvongthi char(3) not null,
	maMT char(4) not null,
	maTS char(12) not null,
	maBH char(8) not null,
	primary key(STTvongthi,maMT,maTS,maBH)
)
create table vongnhahat(
	STTvongthi char(3) not null,
	maMT char(4) not null,
	hatnhomFLAG bit,
	primary key(STTvongthi,maMT)
)

create table TShattaivongnhahat(
	STTvongthi char(3) not null,
	maMT char(4) not null,
	maTS char(12) not null,
	maBH char(8) not null,
	primary key(STTvongthi,maMT,maTS,maBH)
)
create table nhomca(
	maNhom char(8) not null,
	tenNhom nvarchar(50),
	maTS1 char(12)not null,
	maTS2 char(12)not null,
	maTS3 char(12)not null,
	maTS4 char(12)not null,
	primary key(maNhom)
)
create table nhomcahatBH(
	maNhom char(8)NOT NULL,
	maBH char(8) not null,
	STTvongthi char(3) not null,
	maMT char(4) not null,
	primary key(maNhom,maBH)
)
create table vongbanket(
	STTvongthi char(3) not null,
	maMT char(4),
	Nam_Nu tinyint default -1,
	primary key(STTvongthi,maMT)
)
create table TSthamgiavongbanket(
	STTvongthi char(3) not null,
	maMT char(4) not null,
	maTS char(12) not null,
	MSBC char(3),
	tongsoTN int,
	primary key(STTvongthi,maMT,maTS)
)
create table TShattaivongbanket(
	maTS char(12) not null,
	maBH char(8) not null,
	STTvongthi char(3) not null,
	maMT char(4) not null,
	primary key(maTS,maBH)
)
create table vonggala(
	STTvongthi char(3) not null,
	maMT char(4) not null,
	chude char(100) not null,
	maNHD char(12) not null,
	HatDoiFlag bit,
	primary key(STTvongthi,maMT)
)
create table TSthamgiavonggala(
	STTvongthi char(3) not null,
	maMT char(4) not null,
	maTS char(12) not null,
	MSBC char(3),
	tongsoTN int,
	primary key(STTvongthi,maMT,maTS)
)
create table TShattaivonggala(
	maTS char(12) not null,
	maBH char(8) not null,
	STTvongthi char(3) not null,
	maMT char(4) not null,
	primary key(maTS,maBH)
)



