DROP DATABASE QLBanSach;
CREATE DATABASE IF NOT EXISTS QLBanSach;
USE QLBanSach;

CREATE TABLE
    IF NOT EXISTS ChuDe
(
    MaChuDe  INT PRIMARY KEY AUTO_INCREMENT COMMENT "Mã chủ đề sách",
    TenChuDe VARCHAR(225) COMMENT "Tên chủ đề sách"
);

CREATE TABLE IF NOT EXISTS GioiTinh
(
    MaGioiTinh INT PRIMARY KEY AUTO_INCREMENT COMMENT "Mã giới tính",
    Loai       VARCHAR(15) UNIQUE NOT NULL COMMENT "Giới tính"
);

CREATE TABLE
    IF NOT EXISTS NhaXuatBan
(
    MaNXB     INT PRIMARY KEY AUTO_INCREMENT COMMENT "Mã nhà xuất bản",
    TenNXB    VARCHAR(225)       NOT NULL UNIQUE COMMENT "Tên nhà xuất bản",
    DiaChi    VARCHAR(225) COMMENT "Địa chỉ",
    DienThoai VARCHAR(11) UNIQUE NOT NULL COMMENT "Số điện thoại"
);

CREATE TABLE
    IF NOT EXISTS TacGia
(
    MaTacGia  INT PRIMARY KEY AUTO_INCREMENT COMMENT "Mã tác giả",
    TenTacGia VARCHAR(225)       NOT NULL COMMENT "Tên tác giả",
    DiaChi    VARCHAR(225) COMMENT "Địa chỉ",
    TieuSu    VARCHAR(225) COMMENT "Tiểu sử",
    DienThoai VARCHAR(11) UNIQUE NOT NULL COMMENT "Số điện thoại"
);

CREATE TABLE
    IF NOT EXISTS KhachHang
(
    MaKH       INT PRIMARY KEY AUTO_INCREMENT COMMENT "Mã khách hàng",
    TaiKhoan   VARCHAR(125) UNIQUE NOT NULL COMMENT "Tài khoản người dùng",
    MathKhau   VARCHAR(125) UNIQUE NOT NULL COMMENT "Mật khẩu",
    Email      VARCHAR(125) UNIQUE NOT NULL COMMENT "Địa chỉ email",
    HoTen      VARCHAR(225)        NOT NULL COMMENT "Họ tên",
    DienThoai  VARCHAR(11) UNIQUE  NOT NULL COMMENT "Số điện thoại",
    DiaChi     VARCHAR(225) COMMENT "Địa chỉ",
    NgaySinh   DATETIME COMMENT "Ngày sinh",
    -- Foreign keys
    MaGioiTinh INT COMMENT "Giới tính",
    -- Constraint
    CONSTRAINT FK_KhachHang_GioiTinh
        FOREIGN KEY (MaGioiTinh) REFERENCES GioiTinh (MaGioiTinh)
);

CREATE TABLE
    IF NOT EXISTS DonHang
(
    MaDonHang   INT PRIMARY KEY AUTO_INCREMENT COMMENT "Mã đơn hàng",
    DaThanhToan BOOLEAN                                                          DEFAULT FALSE COMMENT "Trạng thái thanh toán",
    TinhTrangGH ENUM ('Đang chuẩn bị', 'Đang vận chuyển', 'Đã giao', 'Hoàn trả') DEFAULT 'Đang chuẩn bị' COMMENT "Trạng thái giao hàng",
    NgayDatHang DATETIME                                                         DEFAULT CURRENT_TIMESTAMP COMMENT "Ngày đặt hàng",
    NgayGiao    DATETIME NOT NULL COMMENT "Ngày giao hàng",
    -- Foreign keys
    MaKhachHang INT      NOT NULL COMMENT "Mã khách hàng",
    -- Constraint
    CONSTRAINT FK_DonHang_KhachHang
        FOREIGN KEY (MaKhachHang) REFERENCES KhachHang (MaKH)
);

CREATE TABLE
    IF NOT EXISTS Sach
(
    MaSach        INT PRIMARY KEY AUTO_INCREMENT COMMENT "Mã sách",
    TenSach       VARCHAR(225)   NOT NULL UNIQUE COMMENT "Tên sách",
    GiaBan        DECIMAL(15, 2) NOT NULL COMMENT "Giá bán",
    MoTa          VARCHAR(225) COMMENT "Mô tả sách",
    SoLuongTonKho DECIMAL(3, 2)  NOT NULL DEFAULT 0 COMMENT "Số lượng tồn kho",
    AnhBia        VARCHAR(225) COMMENT "Ảnh bìa sách",
    NgayCapNhat   DATETIME                DEFAULT CURRENT_TIMESTAMP COMMENT "Ngày cập nhật",
    -- Foreign keys
    MaChuDe       INT            NOT NULL COMMENT "Mã chủ đề",
    MaNXB         INT            NOT NULL COMMENT "Mã nhà xuất bản",
    -- Constraint
    CONSTRAINT FK_Sach_ChuDe FOREIGN KEY (MaChuDe) REFERENCES ChuDe (MaChuDe),
    CONSTRAINT FK_Sach_NhaXB FOREIGN KEY (MaNXB) REFERENCES NhaXuatBan (MaNXB)
);

CREATE TABLE
    IF NOT EXISTS TacGia_Sach
(
    Ma       INT PRIMARY KEY AUTO_INCREMENT,
    VaiTro   VARCHAR(100) NOT NULL COMMENT "Vai trò tác giả",
    ViTri    VARCHAR(100) NOT NULL COMMENT "",
    -- Foreign keys
    MaTacGia INT          NOT NULL COMMENT "Mã tác giả",
    MaSach   INT          NOT NULL COMMENT "Mã sách",
    -- Constraint
    CONSTRAINT FK_TGS_TacGia FOREIGN KEY (MaTacGia) REFERENCES TacGia (MaTacGia),
    CONSTRAINT FK_TGS_Sach FOREIGN KEY (MaSach) REFERENCES Sach (MaSach)
);

CREATE TABLE
    IF NOT EXISTS DonHang_Sach
(
    MaDHSach  INT PRIMARY KEY AUTO_INCREMENT COMMENT "",
    SoLuong   DECIMAL(4, 2) NOT NULL DEFAULT 1 COMMENT "Số lượng sản phẩm",
    DonGia    DOUBLE        NOT NULL COMMENT "Đơn giá",
    -- Foreign keys
    MaDonHang INT           NOT NULL COMMENT "Mã đơn hàng",
    MaSach    INT           NOT NULL COMMENT "Mã sách",
    -- Constraint
    CONSTRAINT FK_DHS_DonHang FOREIGN KEY (MaDonHang) REFERENCES DonHang (MaDonHang),
    CONSTRAINT FK_DHS_Sach FOREIGN KEY (MaSach) REFERENCES Sach (MaSach)
);
