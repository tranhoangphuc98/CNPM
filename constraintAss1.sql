
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

/*Đã thêm*/
alter table TSthamgiaVT
add constraint FK_TSthamgiaVT_vongthi_STTVongthi_MaMT foreign key(STTvongthi,maMT) references vongthi(STTvongthi,maMT)

/*bỏ*/
/*
alter table TSthamgiaVT
add constraint FK_TSthamgiaVT_vongthi foreign key(STTvongthi) references vongthi(STTvongthi)
alter table TSthamgiaVT
add constraint FK_TSthamgiaVT_vongthi_muathi foreign key(maMT) references vongthi(maMT)
*/

alter table TSthamgiaVT
add constraint FK_TSthamgiaVT_thisinh foreign key(maTS) references thisinh(maTS)

/*Đã thêm*/
/*Đề không yêu cầu nhưng thích thì thêm thôi*/
alter table vongthugiong
add constraint FK_vongthugiong_vongthi_STTVongthi_muathi foreign key(STTvongthi,maMT) references vongthi(STTvongthi,maMT)

/*bỏ*/
/*
alter table vongthugiong
add constraint FK_vongthugiong_vongthi foreign key(STTvongthi) references vongthi(STTvongthi)
*/

/*Đã thêm*/
/*Đề không yêu cầu nhưng thích thì thêm thôi*/
alter table TSthamgiathugiong
add constraint FK_TSthamgiavongthugiong_vongthugiong_STTvongthi_maMT foreign key(STTvongthi,maMT) references vongthugiong(STTvongthi,maMT)

/*bỏ*/
/*
alter table TSthamgiathugiong
add constraint FK_TSthamgiavongthugiong_vongthugiong foreign key(STTvongthi) references vongthugiong(STTvongthi)
*/
alter table TSthamgiathugiong
add constraint FK_TSthamgiathugiong_thisinh foreign key(maTS) references thisinh(maTS)

/*Đã thêm*/
alter table TShattaivongthugiong
add constraint FK_TSthamgiathugiong_vongthugiong_STTvongthi_maMT foreign key(STTvongthi,maMT) references vongthugiong(STTvongthi,maMT)

/*bỏ*/
/*
alter table TShattaivongthugiong
add constraint FK_TShattaivongthugiong_vongthugiong_muathi foreign key(maMT) references vongthugiong(maMT)

alter table TShattaivongthugiong
add constraint FK_TShattaivongthugiong_vongthugiong foreign key(STTvongthi) references vongthugiong(STTvongthi)
*/

alter table TShattaivongthugiong
add constraint FK_TShattaivongthugiong_thisinh foreign key(maTS) references thisinh(maTS)

alter table TShattaivongthugiong
add constraint FK_thamgiavongthugiong_baihat foreign key(maBH) references baihat(maBH)

alter table vongnhahat
add constraint FK_vongnhahat_vongthi foreign key(STTvongthi) references vongthi(STTvongthi)
alter table vongnhahat
add constraint FK_vongnhahat_muathi foreign key(maMT) references muathi(maMT)

alter table TShattaivongnhahat
add constraint FK_TShattaivongnhahat_vongnhahat_muathi foreign key(STTvongthi) references vongnhahat(STTvongthi)
alter table TShattaivongnhahat
add constraint FK_TShattaivongnhahat_vongnhahat foreign key(maMT) references vongnhahat(maMT)
alter table TShattaivongnhahat
add constraint FK_TShattaivongnhahat_thisinh foreign key(maTS) references thisinh(maTS)
alter table TShattaivongnhahat
add constraint FK_TShattaivongnhahat_baihat foreign key(maBH) references baihat(maBH)

alter table nhomcahatBH
add constraint FK_nhomcahatBH_vongnhahat foreign key(STTvongthi) references vongnhahat(STTvongthi)
alter table nhomcahatBH
add constraint FK_nhomcahatBH_vongnhahat_muathi foreign key(maMT) references vongnhahat(maMT)
alter table nhomcahatBH
add constraint FK_nhomcahatBH_baihat foreign key(maBH) references baihat(maBH)
alter table nhomcahatBH
add constraint FK_nhomcahatBH_nhomca foreign key(maNhom) references nhomca(maNhom)

alter table vongbanket
add constraint FK_vongbanket_vongthi foreign key(STTvongthi) references vongthi(STTvongthi)
alter table vongbanket
add constraint FK_vongbanket_vongthi_muathi foreign key(maMT) references vongthi(maMT)

alter table TSthamgiavongbanket
add constraint FK_TSthamgiavongbanket_vongbanket foreign key(STTvongthi) references vongbanket(STTvongthi)
alter table TSthamgiavongbanket
add constraint FK_TSthamgiavongbanket_vongbanket_muathi foreign key(maMT) references vongbanket(maMT)
alter table TSthamgiavongbanket
add constraint FK_TSthamgiavongbanket_thisinh foreign key(maTS) references thisinh(maTS)

alter table TShattaivongbanket
add constraint FK_TShattaivongbanket_vongbanket foreign key(STTvongthi) references vongbanket(STTvongthi)
alter table TShattaivongbanket
add constraint FK_TShattaivongbanket_vongbanket_muathi foreign key(maMT) references vongbanket(maMT)
alter table TShattaivongbanket
add constraint FK_TShattaivongbanket_thisinh foreign key(maTS) references thisinh(maTS)
alter table TShattaivongbanket
add constraint FK_TShattaivongbanket_baihat foreign key(maBH) references baihat(maBH)

alter table vonggala
add constraint FK_vonggala_vongthi foreign key(STTvongthi) references vongthi(STTvongthi)
alter table vonggala
add constraint FK_vonggala_vongthi_muathi foreign key(maMT) references vongthi(maMT)
alter table vonggala
add constraint FK_maNHD_nghesi foreign key(maNHD) references nghesi(maNS)

alter table TSthamgiavonggala
add constraint FK_TSthamgiavonggala_vonggala foreign key(STTvongthi) references vonggala(STTvongthi)
alter table TSthamgiavonggala
add constraint FK_TSthamgiavonggala_vonggala foreign key(maMT) references vonggala(maMT)
alter table TSthamgiavonggala
add constraint FK_TSthamgiavonggala_thisinh foreign key(maTS) references thisinh(maTS)

alter table TShattaivonggala
add constraint FK_TShattaivonggala_vonggala foreign key(STTvongthi) references vonggala(STTvongthi)
alter table TShattaivonggala
add constraint FK_TShattaivonggala_vonggala foreign key(maMT) references vonggala(maMT)
alter table TShattaivonggala
add constraint FK_TShattaivonggala_thisinh foreign key(maTS) references thisinh(maTS)
alter table TShattaivonggala
add constraint FK_TShattaivonggala_baihat foreign key(maBH) references baihat(maBH)



