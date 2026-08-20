USE db_QLBanSach;

-- ---------------------------------------------------------------------
-- 1. ChuDe
-- ---------------------------------------------------------------------
INSERT INTO ChuDe (TenChuDe, MoTa)
VALUES ('Văn học', 'Tiểu thuyết, truyện ngắn, thơ ca'),
       ('Kinh tế', 'Sách về kinh doanh, tài chính, quản trị'),
       ('Kỹ năng sống', 'Phát triển bản thân, kỹ năng mềm'),
       ('Thiếu nhi', 'Sách dành cho trẻ em'),
       ('Khoa học', 'Sách phổ biến khoa học'),
       ('Lịch sử', 'Sách về lịch sử, văn hóa'),
       ('Tâm lý học', 'Sách về tâm lý, hành vi con người'),
       ('Công nghệ thông tin', 'Lập trình, công nghệ');

-- ---------------------------------------------------------------------
-- 2. GioiTinh
-- ---------------------------------------------------------------------
INSERT INTO GioiTinh (Loai)
VALUES ('Nam'),
       ('Nữ'),
       ('Khác');

-- ---------------------------------------------------------------------
-- 3. NhaXuatBan
-- ---------------------------------------------------------------------
INSERT INTO NhaXuatBan (TenNXB, DiaChi, DienThoai)
VALUES ('NXB Trẻ', '161B Lý Chính Thắng, Q.3, TP.HCM', '02839316289'),
       ('NXB Kim Đồng', '55 Quang Trung, Hai Bà Trưng, Hà Nội', '02439434730'),
       ('NXB Tổng hợp TP.HCM', '62 Nguyễn Thị Minh Khai, Q.1, TP.HCM', '02838225340'),
       ('NXB Giáo dục Việt Nam', '81 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội', '02439421467'),
       ('NXB Văn học', '18 Nguyễn Trường Tộ, Ba Đình, Hà Nội', '02438294685'),
       ('First News - Trí Việt', '11H Nguyễn Thị Minh Khai, Q.1, TP.HCM', '02838227979');

-- ---------------------------------------------------------------------
-- 4. TacGia
-- ---------------------------------------------------------------------
INSERT INTO TacGia (TenTacGia, DiaChi, TieuSu, DienThoai)
VALUES ('Nguyễn Nhật Ánh', 'TP.HCM', 'Nhà văn chuyên viết về tuổi thơ và tuổi mới lớn',
        '09011110001'),
       ('Tô Hoài', 'Hà Nội', 'Nhà văn hiện đại Việt Nam, nổi tiếng với truyện đồng thoại',
        '09011110002'),
       ('Nguyễn Ngọc Tư', 'Cà Mau', 'Nhà văn Nam Bộ, chuyên viết truyện ngắn', '09011110003'),
       ('Rosie Nguyễn', 'TP.HCM', 'Tác giả sách phát triển bản thân', '09011110004'),
       ('Dale Carnegie', 'Hoa Kỳ', 'Tác giả sách kỹ năng sống kinh điển', '09011110005'),
       ('Paulo Coelho', 'Brazil', 'Tiểu thuyết gia nổi tiếng thế giới', '09011110006'),
       ('Yuval Noah Harari', 'Israel', 'Sử gia, tác giả sách khoa học phổ thông', '09011110007'),
       ('James Clear', 'Hoa Kỳ', 'Tác giả sách về thói quen và phát triển bản thân', '09011110008'),
       ('Robert Kiyosaki', 'Hoa Kỳ', 'Doanh nhân, tác giả sách tài chính cá nhân', '09011110009'),
       ('Vũ Trọng Phụng', 'Hà Nội', 'Nhà văn hiện thực phê phán Việt Nam', '09011110010'),
       ('Nam Cao', 'Hà Nam', 'Nhà văn hiện thực phê phán Việt Nam', '09011110011'),
       ('Nguyễn Văn Học', 'Hà Nội', 'Giảng viên, tác giả sách lập trình', '09011110012'),
       ('Eric Ries', 'Hoa Kỳ', 'Doanh nhân, tác giả sách khởi nghiệp', '09011110013'),
       ('Trần Thị Hồng', 'TP.HCM', 'Dịch giả sách kinh tế - kỹ năng sống', '09011110014'),
       ('Stephen Hawking', 'Vương quốc Anh', 'Nhà vật lý lý thuyết, tác giả sách khoa học',
        '09011110015');

-- ---------------------------------------------------------------------
-- 5. LoaiSach
-- ---------------------------------------------------------------------
INSERT INTO LoaiSach (LoaiSach)
VALUES ('Bìa cứng'),
       ('Bìa mềm');

-- ---------------------------------------------------------------------
-- 6. KhachHang
-- ---------------------------------------------------------------------
INSERT INTO KhachHang (TaiKhoan, MatKhau, Email, DienThoai, Ten, Ho, DiaChi, NgaySinh, MaGioiTinh)
VALUES ('minhanh92', '$2y$10$abcdefghijklmnopqrstuvKQ1', 'minhanh92@gmail.com', '0901234567', 'Anh',
        'Nguyễn Minh', '12 Lê Lợi, Q.1, TP.HCM', '1992-05-14',
        (SELECT MaGioiTinh FROM GioiTinh WHERE Loai = 'Nữ')),
       ('hoangnam90', '$2y$10$abcdefghijklmnopqrstuvKQ2', 'hoangnam.tran@gmail.com', '0912345678',
        'Nam', 'Trần Hoàng', '45 Trần Hưng Đạo, Q.5, TP.HCM', '1990-11-02',
        (SELECT MaGioiTinh FROM GioiTinh WHERE Loai = 'Nam')),
       ('lethiha88', '$2y$10$abcdefghijklmnopqrstuvKQ3', 'lethiha88@gmail.com', '0923456789', 'Hà',
        'Lê Thị', '78 Nguyễn Trãi, Q.5, TP.HCM', '1988-03-21',
        (SELECT MaGioiTinh FROM GioiTinh WHERE Loai = 'Nữ')),
       ('quocbao95', '$2y$10$abcdefghijklmnopqrstuvKQ4', 'quocbao95@gmail.com', '0934567890', 'Bảo',
        'Phạm Quốc', '23 Điện Biên Phủ, Q.Bình Thạnh, TP.HCM', '1995-07-09',
        (SELECT MaGioiTinh FROM GioiTinh WHERE Loai = 'Nam')),
       ('kimanh.do', '$2y$10$abcdefghijklmnopqrstuvKQ5', 'kimanh.do@gmail.com', '0945678901',
        'Kim Anh', 'Đỗ Thị', '9 Cách Mạng Tháng 8, Q.3, TP.HCM', '1993-01-30',
        (SELECT MaGioiTinh FROM GioiTinh WHERE Loai = 'Nữ')),
       ('minhduc.vu', '$2y$10$abcdefghijklmnopqrstuvKQ6', 'minhduc.vu@gmail.com', '0956789012',
        'Đức', 'Vũ Minh', '156 Lý Thường Kiệt, Q.10, TP.HCM', '1991-09-17',
        (SELECT MaGioiTinh FROM GioiTinh WHERE Loai = 'Nam')),
       ('hoanglan.pham', '$2y$10$abcdefghijklmnopqrstuvKQ7', 'hoanglan.pham@gmail.com',
        '0967890123', 'Lan', 'Hoàng Thị', '67 Võ Văn Tần, Q.3, TP.HCM', '1996-12-05',
        (SELECT MaGioiTinh FROM GioiTinh WHERE Loai = 'Nữ')),
       ('vantoan.bui', '$2y$10$abcdefghijklmnopqrstuvKQ8', 'vantoan.bui@gmail.com', '0978901234',
        'Toàn', 'Bùi Văn', '34 Phan Xích Long, Q.Phú Nhuận, TP.HCM', '1989-04-25',
        (SELECT MaGioiTinh FROM GioiTinh WHERE Loai = 'Nam'));

-- ---------------------------------------------------------------------
-- 7. Sach  (FK tra theo tên qua subquery)
-- ---------------------------------------------------------------------
INSERT INTO Sach (TenSach, GiaBan, MoTa, SoLuongTonKho, AnhBia, MaChuDe, MaNXB, MaLoaiSach)
VALUES ('Mắt biếc', 88000, 'Tiểu thuyết về tình yêu tuổi học trò', 120, 'mat-biec.jpg',
        (SELECT MaChuDe FROM ChuDe WHERE TenChuDe = 'Văn học'),
        (SELECT MaNXB FROM NhaXuatBan WHERE TenNXB = 'NXB Trẻ'),
        (SELECT MaLoaiSach FROM LoaiSach WHERE LoaiSach = 'Bìa mềm')),
       ('Cho tôi xin một vé đi tuổi thơ', 75000, 'Hồi ức tuổi thơ dí dỏm, sâu lắng', 95,
        've-di-tuoi-tho.jpg',
        (SELECT MaChuDe FROM ChuDe WHERE TenChuDe = 'Văn học'),
        (SELECT MaNXB FROM NhaXuatBan WHERE TenNXB = 'NXB Trẻ'),
        (SELECT MaLoaiSach FROM LoaiSach WHERE LoaiSach = 'Bìa mềm')),
       ('Dế Mèn phiêu lưu ký', 65000, 'Truyện đồng thoại kinh điển', 80, 'de-men.jpg',
        (SELECT MaChuDe FROM ChuDe WHERE TenChuDe = 'Thiếu nhi'),
        (SELECT MaNXB FROM NhaXuatBan WHERE TenNXB = 'NXB Kim Đồng'),
        (SELECT MaLoaiSach FROM LoaiSach WHERE LoaiSach = 'Bìa cứng')),
       ('Cánh đồng bất tận', 92000, 'Tập truyện ngắn nổi tiếng của Nguyễn Ngọc Tư', 60,
        'canh-dong-bat-tan.jpg',
        (SELECT MaChuDe FROM ChuDe WHERE TenChuDe = 'Văn học'),
        (SELECT MaNXB FROM NhaXuatBan WHERE TenNXB = 'NXB Trẻ'),
        (SELECT MaLoaiSach FROM LoaiSach WHERE LoaiSach = 'Bìa mềm')),
       ('Tuổi trẻ đáng giá bao nhiêu', 79000, 'Sách truyền cảm hứng sống và học tập', 150,
        'tuoi-tre-dang-gia.jpg',
        (SELECT MaChuDe FROM ChuDe WHERE TenChuDe = 'Kỹ năng sống'),
        (SELECT MaNXB FROM NhaXuatBan WHERE TenNXB = 'First News - Trí Việt'),
        (SELECT MaLoaiSach FROM LoaiSach WHERE LoaiSach = 'Bìa mềm')),
       ('Đắc nhân tâm', 86000, 'Sách kỹ năng sống bán chạy mọi thời đại', 200, 'dac-nhan-tam.jpg',
        (SELECT MaChuDe FROM ChuDe WHERE TenChuDe = 'Kỹ năng sống'),
        (SELECT MaNXB FROM NhaXuatBan WHERE TenNXB = 'First News - Trí Việt'),
        (SELECT MaLoaiSach FROM LoaiSach WHERE LoaiSach = 'Bìa mềm')),
       ('Nhà giả kim', 79000, 'Tiểu thuyết ngụ ngôn nổi tiếng thế giới', 140, 'nha-gia-kim.jpg',
        (SELECT MaChuDe FROM ChuDe WHERE TenChuDe = 'Văn học'),
        (SELECT MaNXB FROM NhaXuatBan WHERE TenNXB = 'NXB Văn học'),
        (SELECT MaLoaiSach FROM LoaiSach WHERE LoaiSach = 'Bìa mềm')),
       ('Sapiens: Lược sử loài người', 220000, 'Sách phổ biến khoa học về lịch sử loài người', 45,
        'sapiens.jpg',
        (SELECT MaChuDe FROM ChuDe WHERE TenChuDe = 'Khoa học'),
        (SELECT MaNXB FROM NhaXuatBan WHERE TenNXB = 'NXB Tổng hợp TP.HCM'),
        (SELECT MaLoaiSach FROM LoaiSach WHERE LoaiSach = 'Bìa cứng')),
       ('Atomic Habits - Thay đổi tí hon, hiệu quả bất ngờ', 98000,
        'Sách về xây dựng thói quen tốt', 90, 'atomic-habits.jpg',
        (SELECT MaChuDe FROM ChuDe WHERE TenChuDe = 'Kỹ năng sống'),
        (SELECT MaNXB FROM NhaXuatBan WHERE TenNXB = 'First News - Trí Việt'),
        (SELECT MaLoaiSach FROM LoaiSach WHERE LoaiSach = 'Bìa mềm')),
       ('Cha giàu cha nghèo', 89000, 'Sách kinh điển về tư duy tài chính', 110,
        'cha-giau-cha-ngheo.jpg',
        (SELECT MaChuDe FROM ChuDe WHERE TenChuDe = 'Kinh tế'),
        (SELECT MaNXB FROM NhaXuatBan WHERE TenNXB = 'First News - Trí Việt'),
        (SELECT MaLoaiSach FROM LoaiSach WHERE LoaiSach = 'Bìa mềm')),
       ('Lược sử thời gian', 135000, 'Sách phổ biến khoa học về vũ trụ', 30,
        'luoc-su-thoi-gian.jpg',
        (SELECT MaChuDe FROM ChuDe WHERE TenChuDe = 'Khoa học'),
        (SELECT MaNXB FROM NhaXuatBan WHERE TenNXB = 'NXB Trẻ'),
        (SELECT MaLoaiSach FROM LoaiSach WHERE LoaiSach = 'Bìa cứng')),
       ('Số đỏ', 68000, 'Tiểu thuyết trào phúng kinh điển', 70, 'so-do.jpg',
        (SELECT MaChuDe FROM ChuDe WHERE TenChuDe = 'Văn học'),
        (SELECT MaNXB FROM NhaXuatBan WHERE TenNXB = 'NXB Văn học'),
        (SELECT MaLoaiSach FROM LoaiSach WHERE LoaiSach = 'Bìa mềm')),
       ('Chí Phèo', 55000, 'Truyện ngắn hiện thực phê phán kinh điển', 85, 'chi-pheo.jpg',
        (SELECT MaChuDe FROM ChuDe WHERE TenChuDe = 'Văn học'),
        (SELECT MaNXB FROM NhaXuatBan WHERE TenNXB = 'NXB Văn học'),
        (SELECT MaLoaiSach FROM LoaiSach WHERE LoaiSach = 'Bìa mềm')),
       ('Lập trình Python cơ bản', 145000, 'Giáo trình lập trình Python cho người mới bắt đầu', 40,
        'python-co-ban.jpg',
        (SELECT MaChuDe FROM ChuDe WHERE TenChuDe = 'Công nghệ thông tin'),
        (SELECT MaNXB FROM NhaXuatBan WHERE TenNXB = 'NXB Giáo dục Việt Nam'),
        (SELECT MaLoaiSach FROM LoaiSach WHERE LoaiSach = 'Bìa mềm')),
       ('Khởi nghiệp tinh gọn', 112000, 'Phương pháp khởi nghiệp Lean Startup', 55,
        'khoi-nghiep-tinh-gon.jpg',
        (SELECT MaChuDe FROM ChuDe WHERE TenChuDe = 'Kinh tế'),
        (SELECT MaNXB FROM NhaXuatBan WHERE TenNXB = 'NXB Trẻ'),
        (SELECT MaLoaiSach FROM LoaiSach WHERE LoaiSach = 'Bìa mềm'));

-- ---------------------------------------------------------------------
-- 8. TacGia_Sach  (FK tra theo tên qua subquery)
-- ---------------------------------------------------------------------
INSERT INTO TacGia_Sach (VaiTro, ViTri, MaTacGia, MaSach)
VALUES ('Tác giả chính', '1', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Nguyễn Nhật Ánh'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Mắt biếc')),
       ('Tác giả chính', '1', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Nguyễn Nhật Ánh'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Cho tôi xin một vé đi tuổi thơ')),
       ('Tác giả chính', '1', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Tô Hoài'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Dế Mèn phiêu lưu ký')),
       ('Tác giả chính', '1', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Nguyễn Ngọc Tư'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Cánh đồng bất tận')),
       ('Tác giả chính', '1', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Rosie Nguyễn'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Tuổi trẻ đáng giá bao nhiêu')),
       ('Tác giả chính', '1', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Dale Carnegie'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Đắc nhân tâm')),
       ('Dịch giả', '2', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Trần Thị Hồng'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Đắc nhân tâm')),
       ('Tác giả chính', '1', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Paulo Coelho'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Nhà giả kim')),
       ('Dịch giả', '2', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Trần Thị Hồng'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Nhà giả kim')),
       ('Tác giả chính', '1', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Yuval Noah Harari'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Sapiens: Lược sử loài người')),
       ('Dịch giả', '2', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Trần Thị Hồng'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Sapiens: Lược sử loài người')),
       ('Tác giả chính', '1', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'James Clear'),
        (SELECT MaSach
         FROM Sach
         WHERE TenSach = 'Atomic Habits - Thay đổi tí hon, hiệu quả bất ngờ')),
       ('Dịch giả', '2', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Trần Thị Hồng'),
        (SELECT MaSach
         FROM Sach
         WHERE TenSach = 'Atomic Habits - Thay đổi tí hon, hiệu quả bất ngờ')),
       ('Tác giả chính', '1', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Robert Kiyosaki'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Cha giàu cha nghèo')),
       ('Dịch giả', '2', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Trần Thị Hồng'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Cha giàu cha nghèo')),
       ('Tác giả chính', '1', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Stephen Hawking'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Lược sử thời gian')),
       ('Dịch giả', '2', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Trần Thị Hồng'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Lược sử thời gian')),
       ('Tác giả chính', '1', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Vũ Trọng Phụng'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Số đỏ')),
       ('Tác giả chính', '1', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Nam Cao'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Chí Phèo')),
       ('Tác giả chính', '1', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Nguyễn Văn Học'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Lập trình Python cơ bản')),
       ('Tác giả chính', '1', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Eric Ries'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Khởi nghiệp tinh gọn')),
       ('Dịch giả', '2', (SELECT MaTacGia FROM TacGia WHERE TenTacGia = 'Trần Thị Hồng'),
        (SELECT MaSach FROM Sach WHERE TenSach = 'Khởi nghiệp tinh gọn'));

-- ---------------------------------------------------------------------
-- 9. DonHang  (FK khách hàng tra theo TaiKhoan qua subquery)
-- ---------------------------------------------------------------------
INSERT INTO DonHang (DaThanhToan, TinhTrangGH, NgayDatHang, NgayGiao, MaKhachHang)
VALUES (TRUE, 'Đã giao', '2026-06-01 09:15:00', '2026-06-05 00:00:00',
        (SELECT MaKH FROM KhachHang WHERE TaiKhoan = 'minhanh92')),
       (TRUE, 'Đã giao', '2026-06-03 14:30:00', '2026-06-07 00:00:00',
        (SELECT MaKH FROM KhachHang WHERE TaiKhoan = 'hoangnam90')),
       (TRUE, 'Đang vận chuyển', '2026-08-10 10:00:00', '2026-08-15 00:00:00',
        (SELECT MaKH FROM KhachHang WHERE TaiKhoan = 'lethiha88')),
       (FALSE, 'Đang chuẩn bị', '2026-08-18 16:45:00', '2026-08-23 00:00:00',
        (SELECT MaKH FROM KhachHang WHERE TaiKhoan = 'minhanh92')),
       (TRUE, 'Đã giao', '2026-07-01 08:20:00', '2026-07-05 00:00:00',
        (SELECT MaKH FROM KhachHang WHERE TaiKhoan = 'quocbao95')),
       (TRUE, 'Hoàn trả', '2026-07-15 11:00:00', '2026-07-20 00:00:00',
        (SELECT MaKH FROM KhachHang WHERE TaiKhoan = 'kimanh.do')),
       (FALSE, 'Đang chuẩn bị', '2026-08-19 13:10:00', '2026-08-25 00:00:00',
        (SELECT MaKH FROM KhachHang WHERE TaiKhoan = 'minhduc.vu')),
       (TRUE, 'Đã giao', '2026-06-20 17:05:00', '2026-06-25 00:00:00',
        (SELECT MaKH FROM KhachHang WHERE TaiKhoan = 'hoanglan.pham')),
       (TRUE, 'Đang vận chuyển', '2026-08-12 09:40:00', '2026-08-17 00:00:00',
        (SELECT MaKH FROM KhachHang WHERE TaiKhoan = 'vantoan.bui')),
       (FALSE, 'Đang chuẩn bị', '2026-08-20 08:00:00', '2026-08-27 00:00:00',
        (SELECT MaKH FROM KhachHang WHERE TaiKhoan = 'hoangnam90'));

-- ---------------------------------------------------------------------
-- 10. DonHang_Sach
-- Lưu ý: MaDonHang tham chiếu theo ID tuần tự 1-10 vừa insert ở trên
-- (đúng thứ tự khai báo). MaSach tra theo tên qua subquery.
-- ---------------------------------------------------------------------
INSERT INTO DonHang_Sach (SoLuong, DonGia, MaDonHang, MaSach)
VALUES (2, 88000, 1, (SELECT MaSach FROM Sach WHERE TenSach = 'Mắt biếc')),
       (1, 86000, 1, (SELECT MaSach FROM Sach WHERE TenSach = 'Đắc nhân tâm')),
       (1, 79000, 2, (SELECT MaSach FROM Sach WHERE TenSach = 'Tuổi trẻ đáng giá bao nhiêu')),
       (1, 98000, 2, (SELECT MaSach
                      FROM Sach
                      WHERE TenSach = 'Atomic Habits - Thay đổi tí hon, hiệu quả bất ngờ')),
       (1, 220000, 3, (SELECT MaSach FROM Sach WHERE TenSach = 'Sapiens: Lược sử loài người')),
       (3, 75000, 4, (SELECT MaSach FROM Sach WHERE TenSach = 'Cho tôi xin một vé đi tuổi thơ')),
       (2, 65000, 5, (SELECT MaSach FROM Sach WHERE TenSach = 'Dế Mèn phiêu lưu ký')),
       (1, 92000, 5, (SELECT MaSach FROM Sach WHERE TenSach = 'Cánh đồng bất tận')),
       (1, 79000, 6, (SELECT MaSach FROM Sach WHERE TenSach = 'Nhà giả kim')),
       (2, 89000, 7, (SELECT MaSach FROM Sach WHERE TenSach = 'Cha giàu cha nghèo')),
       (1, 135000, 7, (SELECT MaSach FROM Sach WHERE TenSach = 'Lược sử thời gian')),
       (1, 68000, 8, (SELECT MaSach FROM Sach WHERE TenSach = 'Số đỏ')),
       (1, 55000, 8, (SELECT MaSach FROM Sach WHERE TenSach = 'Chí Phèo')),
       (1, 145000, 9, (SELECT MaSach FROM Sach WHERE TenSach = 'Lập trình Python cơ bản')),
       (2, 112000, 10, (SELECT MaSach FROM Sach WHERE TenSach = 'Khởi nghiệp tinh gọn')),
       (1, 86000, 10, (SELECT MaSach FROM Sach WHERE TenSach = 'Đắc nhân tâm'));