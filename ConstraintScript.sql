
alter table nghesi
add constraint FK_nghesi_nguoi foreign key(maNS) references nguoi(id)
alter table chuongtrinhMCdan
add constraint FK_chuongtrinhMCdan_nghesi foreign key(maMC) references nghesi(maNS)

alter table albumCS
add constraint FK_albumCS_nghesi foreign key(maCS) references nghesi(maNS)

alter table BHthuoctheloai
add constraint FK_BHthuoctheloai_baihat foreign key(maBH) references baihat(maBH)
alter table BHthuoctheloai
add constraint FK_BHthuoctheloai_theloai foreign key(maTL) references theloai(maTL)

alter table nhacsisangtac
add constraint FK_nhacsisangtac_nghesi foreign key(maNS) references nghesi(maNS)

alter table giubanquyenmuathi
add constraint FK_giubanquyenmuathi_muathi foreign key(maMT) references muathi(maMT)
alter table giubanquyenmuathi
add constraint FK_giubanquyenmuathi_nhasanxuan foreign key(maNSX) references nhasanxuat(maNSX)

alter table phatsong
add constraint FK_phatsong_muathi foreign key(maMT) references muathi(maMT)
alter table phatsong
add constraint FK_phatsong_kenhtruyenhinh foreign key(maK) references kenhtruyenhinh(maK)

alter table vongthi
add constraint FK_vongthi_muathi foreign key(maMT) references muathi(maMT)

/* Tạo constraint cho bảng TSthamgiaVT*/
alter table TSthamgiaVT
add constraint FK_TSthamgiaVT_vongthi_STTVongthi_MaMT foreign key(STTvongthi,maMT) references vongthi(STTvongthi,maMT)

alter table TSthamgiaVT
add constraint FK_TSthamgiaVT_thisinh foreign key(maTS) references thisinh(maTS)

/* Tạo constraint cho bảng TSthamgiathugiong*/
alter table TSthamgiathugiong
add constraint FK_TSthamgiathugiong_thisinh foreign key(maTS) references thisinh(maTS)

alter table TSthamgiathugiong
<<<<<<< HEAD
add constraint FK_TSgiamgiathugiong_vongthugiong foreign key(STTvongthi,maMT) references vongthugiong(STTvongthi,maMT)
=======
add constraint FK_TSthamgiathugiong_vongthugiong_STTvongthi_maMT foreign key(STTvongthi,maMT) references vongthugiong(STTvongthi,maMT)
>>>>>>> c78ed8d04d5d2ba2443ed41c7e852b0081f9e9e0

/* Tạo constraint cho bảng TShattaivongthugiong*/
alter table TShattaivongthugiong
add constraint FK_TShattaivongthugiong_vongthugiong_STTvongthi_maMT foreign key(STTvongthi,maMT) references vongthugiong(STTvongthi,maMT)

alter table TShattaivongthugiong
add constraint FK_TShattaivongthugiong_thisinh foreign key(maTS) references thisinh(maTS)

alter table TShattaivongthugiong
add constraint FK_TShattaivongthugiong_baihat foreign key(maBH) references baihat(maBH)

/* Tạo constraint cho bảng TShattaivongnhahat*/
alter table TShattaivongnhahat
add constraint FK_TShattaivongnhahat_thisinh foreign key(maTS) references thisinh(maTS)

alter table TShattaivongnhahat
add constraint FK_TShattaivongnhahat_vongnhahat_STTvongthi_maMT foreign key(STTvongthi,maMT) references vongnhahat(STTvongthi,maMT)

/* Tạo constraint cho bảng nhomcahatBH*/ 
alter table nhomcahatBH
add constraint FK_nhomcahatBH_nhomca foreign key(maNhom) references nhomca(maNhom)

alter table nhomcahatBH
add constraint FK_nhomcahatBH_vongnhahat_STTvongthi_maMT foreign key(STTvongthi,maMT) references vongnhahat(STTvongthi,maMT)

/* Tạo constraint cho bảng TSthamgiavongbanket*/ 
alter table TSthamgiavongbanket
add constraint FK_TSthamgiavongbanket_thisinh foreign key(maTS) references thisinh(maTS)

alter table TSthamgiavongbanket
add constraint FK_TSthamgiavongbanket_vongbanket_STTvongthi_maMT foreign key(STTvongthi,maMT) references vongbanket(STTvongthi,maMT)

/* Tạo constraint cho bảng TShattaivongbanket*/ 
alter table TShattaivongbanket
add constraint FK_TShattaivongbanket_vongbanket_STTvongthi_maMT foreign key(STTvongthi,maMT) references vongbanket(STTvongthi,maMT)

/* Tạo constraint cho bảng vonggala*/
alter table vonggala
add constraint FK_maNHD_nghesi foreign key(maNHD) references nghesi(maNS)

/* Tạo constraint cho bảng TSthamgiavonggala*/
alter table TSthamgiavonggala
add constraint FK_TSthamgiavonggala_thisinh foreign key(maTS) references thisinh(maTS)

alter table TSthamgiavonggala
add constraint FK_TSthamgiavonggala_vonggala_STTvongthi_maMT foreign key(STTvongthi,maMT) references vonggala(STTvongthi,maMT)

/* Tạo constraint cho bảng TShattaivonggala*/
alter table TShattaivonggala
add constraint FK_TShattaivonggala_vonggala_STTvongthi_maMT foreign key(STTvongthi,maMT) references vonggala(STTvongthi,maMT)




