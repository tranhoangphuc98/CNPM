--Thông tin các vòng thi dựa trên tên của vòng thi. (Ví dụ: gala 1, gala 2,…)
create index vongthi_thongtinvongthi
on vongthi(tenVT)

--Thông tin thí sinh dựa vào CMND.
create index nguoi_thongtinthisinh
on nguoi(cmnd)

--Thông tin mùa giải dựa vào ngày tháng năm bắt đầu
create index muathi_thongtinmuathi
on muathi(ngayBD)
