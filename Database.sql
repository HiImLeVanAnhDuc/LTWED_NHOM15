create database BanTraiCay
go

use BanTraiCay
go 

create table NguoiQuanLy(
	TenDangNhap nvarchar(20) primary key,
	MatKhau nvarchar(20),
	HoTen nvarchar(40)
)

create table KhachHang(
	SoDT nvarchar(12) primary key,
	MatKhau nvarchar(20),
	HoTen nvarchar(40),
	DiaChi nvarchar(50)
)

create table LoaiSanPham(
	MaLoai nvarchar(20) primary key,
	TenLoai nvarchar(30)
)

create table SanPham(
	MaSP nvarchar(20) primary key,
	TenSP nvarchar(30),
	GiaSP int,
	SoLuongTonKho decimal(10,2),
	PhanLoai nvarchar(20) references LoaiSanPham(MaLoai),
	HinhAnh nvarchar(100)
)

create table DonHang(
	MaDon nvarchar(20) primary key,
	NgayXuatDon date,
	SDT_KhachHang nvarchar(12) references KhachHang(SoDT)
)

create table ChiTietDonHang(
	MaDon nvarchar(20) references DonHang(MaDon),
	MaSP nvarchar(20) references SanPham(MaSP),
	primary key(MaDon, MaSP),
	SoLuong decimal(10,2)
)
go

--Them du lieu
insert into NguoiQuanLy values
('quanly001', '123456', N'Lê Đình Bảo'),
('quanly002', '123456', N'Lại Văn Quý'),
('quanly003', '123456', N'Lê Văn Anh Đức')
go

insert into KhachHang values
('0853000001', '123456', N'Nguyễn Văn An', N'201 Lê Văn Việt TP Thủ Đức'),
('0853000002', '123456', N'Lê Văn Bình', N'02 Võ Văn Ngân TP Thủ Đức'),
('0853000003', '123456', N'Trần Văn Cường', N'302 Tô Vĩnh Diện TP Thủ Đức'),
('0853000004', '123456', N'Vũ Trí Ba Tá Trợ', N'01 Làng Lá'),
('0853000005', '123456', N'Tuyền Oa Minh Nhân', N'02 Làng Lá')
go

insert into LoaiSanPham values
('LSP001', N'Rau'),
('LSP002', N'Trái cây'),
('LSP003', N'Củ')
go

insert into SanPham values
('SP001', N'Cải thìa', 12000, 30, 'LSP001', null),
('SP002', N'Rau muống', 10000, 25, 'LSP001', null),
('SP003', N'Rau dền', 14000, 35, 'LSP001', null),
('SP004', N'Dưa hấu', 15000, 30, 'LSP002', null),
('SP005', N'Sầu riêng', 75000, 15, 'LSP002', null),
('SP006', N'Mít tố nữ', 60000, 20, 'LSP002', null),
('SP007', N'Khoai tây', 25000, 40, 'LSP003', null),
('SP008', N'Khoai lang tím', 15000, 30, 'LSP003', null)
go

insert into DonHang values
('DH000001', '2022-11-29', '0853000002')
go

insert into ChiTietDonHang values
('DH000001', 'SP001', 1.5),
('DH000001', 'SP004', 2.3)
go

