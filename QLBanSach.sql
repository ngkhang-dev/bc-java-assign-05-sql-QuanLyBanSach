DROP DATABASE IF EXISTS db_QLBanSach;

CREATE DATABASE IF NOT EXISTS db_QLBanSach
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE db_QLBanSach;

CREATE TABLE
    IF NOT EXISTS ChuDe
(
    MaChuDe     INT PRIMARY KEY AUTO_INCREMENT COMMENT "Mã chủ đề sách",
    TenChuDe    VARCHAR(225) NOT NULL UNIQUE COMMENT "Tên chủ đề sách",
    MoTa        VARCHAR(225) COMMENT "Mô tả thể loại",
    NgayKhoiTao TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT "Ngày khởi tạo",
    NgayCapNhat TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Ngày cập nhật"
);

CREATE TABLE IF NOT EXISTS GioiTinh
(
    MaGioiTinh  INT PRIMARY KEY AUTO_INCREMENT COMMENT "Mã giới tính",
    Loai        VARCHAR(15) UNIQUE NOT NULL COMMENT "Giới tính",
    NgayKhoiTao TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT "Ngày khởi tạo",
    NgayCapNhat TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Ngày cập nhật"
);

CREATE TABLE
    IF NOT EXISTS NhaXuatBan
(
    MaNXB       INT PRIMARY KEY AUTO_INCREMENT COMMENT "Mã nhà xuất bản",
    TenNXB      VARCHAR(225)       NOT NULL UNIQUE COMMENT "Tên nhà xuất bản",
    DiaChi      VARCHAR(225) COMMENT "Địa chỉ",
    DienThoai   VARCHAR(11) UNIQUE NOT NULL COMMENT "Số điện thoại",
    NgayKhoiTao TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT "Ngày khởi tạo",
    NgayCapNhat TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Ngày cập nhật"
);

CREATE TABLE
    IF NOT EXISTS TacGia
(
    MaTacGia    INT PRIMARY KEY AUTO_INCREMENT COMMENT "Mã tác giả",
    TenTacGia   VARCHAR(225)       NOT NULL UNIQUE COMMENT "Tên tác giả",
    DiaChi      VARCHAR(225) COMMENT "Địa chỉ",
    TieuSu      VARCHAR(225) COMMENT "Tiểu sử",
    DienThoai   VARCHAR(11) UNIQUE NOT NULL COMMENT "Số điện thoại",
    NgayKhoiTao TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT "Ngày khởi tạo",
    NgayCapNhat TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Ngày cập nhật"
);

CREATE TABLE
    IF NOT EXISTS KhachHang
(
    MaKH        INT PRIMARY KEY AUTO_INCREMENT COMMENT "Mã khách hàng",
    TaiKhoan    VARCHAR(125) UNIQUE NOT NULL COMMENT "Tài khoản người dùng",
    MatKhau     VARCHAR(255)        NOT NULL COMMENT "Mật khẩu",
    Email       VARCHAR(125) UNIQUE NOT NULL COMMENT "Địa chỉ email",
    DienThoai   VARCHAR(11) UNIQUE  NOT NULL COMMENT "Số điện thoại",
    Ten         VARCHAR(225)        NOT NULL COMMENT "Tên khách hàng",
    Ho          VARCHAR(225)        NOT NULL COMMENT "Họ khách hàng",
    DiaChi      VARCHAR(225) COMMENT "Địa chỉ",
    NgaySinh    DATE COMMENT "Ngày sinh",
    NgayKhoiTao TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT "Ngày khởi tạo",
    NgayCapNhat TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Ngày cập nhật",
    -- Foreign keys
    MaGioiTinh  INT COMMENT "Mã giới tính",
    -- Constraint
    CONSTRAINT FK_KhachHang_GioiTinh
        FOREIGN KEY (MaGioiTinh) REFERENCES GioiTinh (MaGioiTinh) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE
    IF NOT EXISTS DonHang
(
    MaDonHang   INT PRIMARY KEY AUTO_INCREMENT COMMENT "Mã đơn hàng",
    DaThanhToan BOOLEAN                                                          DEFAULT FALSE COMMENT "Trạng thái thanh toán",
    TinhTrangGH ENUM ('Đang chuẩn bị', 'Đang vận chuyển', 'Đã giao', 'Hoàn trả') DEFAULT 'Đang chuẩn bị' COMMENT "Trạng thái giao hàng",
    NgayDatHang DATETIME                                                         DEFAULT CURRENT_TIMESTAMP COMMENT "Ngày đặt hàng",
    NgayGiao    DATETIME NOT NULL COMMENT "Ngày giao hàng",
    NgayKhoiTao TIMESTAMP                                                        DEFAULT CURRENT_TIMESTAMP COMMENT "Ngày khởi tạo",
    NgayCapNhat TIMESTAMP                                                        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Ngày cập nhật",
    -- Foreign keys
    MaKhachHang INT      NOT NULL COMMENT "Mã khách hàng",
    -- Constraint
    CONSTRAINT FK_DonHang_KhachHang
        FOREIGN KEY (MaKhachHang) REFERENCES KhachHang (MaKH) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS LoaiSach
(
    MaLoaiSach  INT PRIMARY KEY AUTO_INCREMENT COMMENT "Mã loại sách",
    LoaiSach    VARCHAR(20) NOT NULL DEFAULT ('Bìa cứng') COMMENT "Loại sách: Bìa cứng, Bìa mềm",
    NgayKhoiTao TIMESTAMP            DEFAULT CURRENT_TIMESTAMP COMMENT "Ngày khởi tạo",
    NgayCapNhat TIMESTAMP            DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Ngày cập nhật"
);

CREATE TABLE
    IF NOT EXISTS Sach
(
    MaSach        INT PRIMARY KEY AUTO_INCREMENT COMMENT "Mã sách",
    TenSach       VARCHAR(225)   NOT NULL COMMENT "Tên sách",
    GiaBan        DECIMAL(15, 2) NOT NULL COMMENT "Giá bán",
    MoTa          VARCHAR(225) COMMENT "Mô tả sách",
    SoLuongTonKho INT UNSIGNED   NOT NULL DEFAULT 0 COMMENT "Số lượng tồn kho",
    AnhBia        VARCHAR(225) COMMENT "Ảnh bìa sách",
    NgayKhoiTao   TIMESTAMP               DEFAULT CURRENT_TIMESTAMP COMMENT "Ngày khởi tạo",
    NgayCapNhat   TIMESTAMP               DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Ngày cập nhật",
    -- Foreign keys
    MaChuDe       INT            NOT NULL COMMENT "Mã chủ đề",
    MaNXB         INT            NOT NULL COMMENT "Mã nhà xuất bản",
    MaLoaiSach    INT            NOT NULL COMMENT "Mã loại sách",
    -- Constraint
    CONSTRAINT FK_Sach_ChuDe FOREIGN KEY (MaChuDe) REFERENCES ChuDe (MaChuDe) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT FK_Sach_NhaXB FOREIGN KEY (MaNXB) REFERENCES NhaXuatBan (MaNXB) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT FK_Sach_LoaiSach FOREIGN KEY (MaLoaiSach) REFERENCES LoaiSach (MaLoaiSach) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT CHK_Sach_GiaBan CHECK (GiaBan >= 0)
);

CREATE TABLE
    IF NOT EXISTS TacGia_Sach
(
    Ma          INT PRIMARY KEY AUTO_INCREMENT,
    VaiTro      VARCHAR(100) NOT NULL COMMENT "Vai trò tác giả",
    ViTri       VARCHAR(100) NOT NULL COMMENT "Vị trí (thứ tự) tác giả trong sách",
    NgayKhoiTao TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT "Ngày khởi tạo",
    NgayCapNhat TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Ngày cập nhật",
    -- Foreign keys
    MaTacGia    INT          NOT NULL COMMENT "Mã tác giả",
    MaSach      INT          NOT NULL COMMENT "Mã sách",
    -- Constraint
    CONSTRAINT FK_TGS_TacGia FOREIGN KEY (MaTacGia) REFERENCES TacGia (MaTacGia) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_TGS_Sach FOREIGN KEY (MaSach) REFERENCES Sach (MaSach) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT UQ_TGS_TacGia_Sach UNIQUE (MaTacGia, MaSach)
);

CREATE TABLE
    IF NOT EXISTS DonHang_Sach
(
    MaDHSach    INT PRIMARY KEY AUTO_INCREMENT COMMENT "",
    SoLuong     INT UNSIGNED   NOT NULL DEFAULT 1 COMMENT "Số lượng sản phẩm",
    DonGia      DECIMAL(15, 2) NOT NULL COMMENT "Đơn giá",
    NgayKhoiTao TIMESTAMP               DEFAULT CURRENT_TIMESTAMP COMMENT "Ngày khởi tạo",
    NgayCapNhat TIMESTAMP               DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Ngày cập nhật",
    -- Foreign keys
    MaDonHang   INT            NOT NULL COMMENT "Mã đơn hàng",
    MaSach      INT            NOT NULL COMMENT "Mã sách",
    -- Constraint
    CONSTRAINT FK_DHS_DonHang FOREIGN KEY (MaDonHang) REFERENCES DonHang (MaDonHang) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_DHS_Sach FOREIGN KEY (MaSach) REFERENCES Sach (MaSach) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT CHK_DHS_SoLuong CHECK (SoLuong > 0),
    CONSTRAINT CHK_DHS_DonGia CHECK (DonGia >= 0)
);
