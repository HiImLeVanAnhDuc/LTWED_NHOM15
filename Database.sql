create database BanTraiCayWeb
go

use BanTraiCayWeb
go 

create table NguoiQuanLy(
	TenDangNhap nvarchar(20) primary key,
	MatKhau nvarchar(20) check(len(MatKhau) >= 8),
	HoTen nvarchar(40)
)

create table KhachHang(
	SoDT nvarchar(12) primary key check(len(SoDT) = 10 and isnumeric(SoDT) = 1),
	MatKhau nvarchar(20) check(len(MatKhau) >= 8),
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
	GiaSP int check(GiaSP > 0),
	SoLuongTonKho decimal(10,2) check(SoLuongTonKho > 0),
	PhanLoai nvarchar(20) references LoaiSanPham(MaLoai),
	DoTuoiKho nvarchar(20) check(DoTuoiKho = N'Đồ tươi' or DoTuoiKho = N'Đồ khô'),
	DanhGia decimal(3,1) check(DanhGia >= 1 or DanhGia <=5),
	LuotDanhGia int check(LuotDanhGia >= 0) default 0,
	GiamGia int check(GiamGia >=0 or GiamGia <= 100),
	MoTaSP nvarchar(1000),
	NgayNhapHang date,
	HinhAnh char(100)
)

create table MaGiamGia(
	IDMaGiam nvarchar(20) primary key,
	PhanTram int check(PhanTram >=0 and PhanTram <= 100)
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

create  table YKienDongGop(
	Email nvarchar(40),
	HoTen nvarchar(40),
	ThoiGian datetime,
	primary key(Email, ThoiGian),
	YKien nvarchar(150)
)

create table ThongTinEmailKhuyenMai(
	Email nvarchar(40) primary key
)
go

--Them du lieu
insert into NguoiQuanLy values
('quanly001', '12345678', N'Lê Đình Bảo'),
('quanly002', '12345678', N'Lại Văn Quý'),
('quanly003', '12345678', N'Lê Văn Anh Đức')
go

insert into KhachHang values
('0853000001', '12345678', N'Nguyễn Văn An', N'201 Lê Văn Việt TP Thủ Đức'),
('0853000002', '12345678', N'Lê Văn Bình', N'02 Võ Văn Ngân TP Thủ Đức'),
('0853000003', '12345678', N'Trần Văn Cường', N'302 Tô Vĩnh Diện TP Thủ Đức'),
('0853000004', '12345678', N'Vũ Trí Ba Tá Trợ', N'01 Làng Lá'),
('0853000005', '12345678', N'Tuyền Oa Minh Nhân', N'02 Làng Lá')
go

insert into LoaiSanPham values
('LSP001', N'Rau'),
('LSP002', N'Củ'),
('LSP003', N'Quả'),
('LSP004', N'Hạt'),
('LSP005', N'Đậu')
go

insert into SanPham values
('SP001', N'Cải thìa', 12000, 30, 'LSP001', N'Đồ tươi', 3.75, 3, 0, N'Cải thìa không chỉ là loại rau quen thuộc để chế biến nên những món ăn ngon mà còn chứa nhiều thành phần dinh dưỡng có lợi cho sức khỏe. Cải thìa tốt cho phụ nữ mang thai, có tác dụng phòng ngừa khuyết tật cho thai nhi, giúp xương chắc khỏe, có khả năng kích thích nhịp tim hoạt động tốt và hạ huyết áp. Cải thìa làm chậm quá trình lão hóa và giảm đáng kể việc hình thành các gốc tự do, có tác dụng phòng ngừa bệnh đục nhân mắt và thoái hóa hoàng điểm ở mắt đồng thời có tác dụng ngăn ngừa ung thư bằng cách loại bỏ những thành phần có hại trong cơ thể.', '2022-12-4', 'pokchoy.jpg'),
('SP002', N'Rau muống', 10000, 25, 'LSP001', N'Đồ tươi', 4, 2, 0, N'Rau muống là một loại rau cực kỳ phổ biến trong các bữa cơm gia đình của người Việt. Ăn rau muống mỗi ngày với hàm lượng vừa đủ rất có ích cho người thiếu máu, huyết áp thấp, phụ nữ mang thai, người bị loãng xương và giúp ngừa chứng táo bón.', '2022-12-4', 'waterspinach.jpg'),
('SP003', N'Rau dền', 14000, 35, 'LSP001', N'Đồ tươi', 4.2, 12, 30, N'Thân và lá rau dền có vị ngọt, chứa sắt, vitamin B2, vitamin C, axít nicotic và calci (dền gai có hàm lượng calci tối đa đến 0,2%). Hạt ngoài các thành phần vitamin A, vitamin C còn giàu tinh bột, đạm thực vật (các loài dền hạt trồng làm lương thực có hàm lượng đạm thực vật từ 12 đến 16%) và lysin.', '2022-12-2', 'rauden.jpg'),
('SP004', N'Dưa hấu', 15000, 30, 'LSP002', N'Đồ tươi', 4, 14, 10, N'Dưa hấu là món ăn giải nhiệt mùa hè được nhiều người yêu thích, có vị ngọt mát. Một cốc nước dưa hấu chỉ chứa 46 calo nhưng cung cấp rất nhiều vitamin C, vitamin A và những hợp chất thực vật tốt cho sức khỏe. Dưa hấu ngoài giá trị về dinh dưỡng, chúng còn có giá thành rẻ và dễ tìm kiếm nên phù hợp để bổ sung thường xuyên vào thực đơn của cả gia đình.', '2022-12-1', 'water-melon.jpg'),
('SP005', N'Sầu riêng', 75000, 15, 'LSP002', N'Đồ tươi', 3.5, 10, 0, N'Sầu riêng là một loại trái cây lớn, có mùi khá nồng và nặng, nhưng cực kỳ giàu các chất dinh dưỡng, chẳng hạn như vitamin C, vitamin B, khoáng chất, chất béo lành mạnh, chất xơ và một số hợp chất thực vật có lợi khác. Sầu riêng thường có mặt tại nhiều quốc gia trong khu vực Đông Nam Á, điển hình là Việt Nam. Ăn sầu riêng có thể mang lại một số lợi ích nhất định cho sức khỏe.', '2022-12-1', 'durian.jpg'),
('SP006', N'Mít tố nữ', 60000, 20, 'LSP002', N'Đồ tươi', 3, 2, 0, N'Mít tố nữ nổi tiếng từ lâu với những múi to tròn vàng ươm hấp dẫn, mít tố nữ xứng đáng với danh hiệu nữ hoàng của các loại mít. Ăn nhiều mít bạn sẽ có thể duy trì được sức khỏe của làn da và đôi mắt. Trái mít tố nữ giúp tăng cường hệ miễn dịch, giúp hệ tiêu hóa được khỏe mạnh và ngăn ngừa được bệnh thiếu máu và có thể phòng chống được bệnh ung thư khá hiệu quả.', '2022-12-3', 'Cempedak.jpg'),
('SP007', N'Khoai tây', 25000, 40, 'LSP003', N'Đồ tươi', 4, 3, 10, N'Khoai tây là một loại thực phẩm giàu carb, cung cấp các loại vitamin, khoáng chất và các hợp chất thực vật tốt cho sức khỏe. Hơn thế nữa, chúng còn có tác dụng hỗ trợ giảm cân và ngăn ngừa bệnh tim hiệu quả.', '2022-11-30', 'potatoes.jpg'),
('SP008', N'Khoai lang tím', 15000, 30, 'LSP003', N'Đồ tươi', 4, 3, 15, N'Khoai lang tím là một món ăn quen thuộc đối với nhiều người, không những có mùi vị thơm ngon và màu sắc đặc trưng, khoai lang tím còn mang nhiều giá trị dinh dưỡng cao. Trong khoai lang tím có chứa một lượng các chất như: sắt, natri, protein,...', '2022-11-29', 'sweetpotato.jpg'),
('SP009', N'Hạt điều', 30000, 20, 'LSP004', N'Đồ tươi', 3.8, 12, 0, N'Hạt điều là hạt thuộc họ Anacardium occidentale có nguồn gốc từ Brazil được trồng nhiều ở các tỉnh phía Nam của Việt Nam. Ngoài hương vị thơm ngon thì hạt điều còn có giá trị dinh dưỡng cao cùng với những công dụng tuyệt vời đối với sức khỏe con người.', '2022-11-20', 'hatdieu.jpg'),
('SP010', N'Hạt hướng dương', 5000, 20, 'LSP004', N'Đồ tươi', 4.2, 20, 0, N'Hạt hướng dương là nguồn cung cấp nhiều dưỡng chất tuyệt vời cho cơ thể, nhất là hợp chất thực vật có đặc tính chống oxy hóa cùng với hàm lượng vitamin E và selen đáng kể.', '2022-11-20', 'hathuongduong.jpg'),
('SP011', N'Đậu ve', 9000, 20, 'LSP005', N'Đồ tươi', 5, 1, 0, N'Đậu cô ve Bách Hóa Xanh là loại thực phẩm mang lại rất nhiều giá trị dinh dưỡng cần thiết cho cơ thể như giàu chất xơ, vitamin K, C, A, B1, B2, B3, B6, E và các khoáng chất như Canxi, Sắt, Magie, Phốt pho, Kali, Natri, Kẽm, Đồng,...,giúp giảm lượng Cholesterol xấu, bảo vệ sức khỏe tim mạch.', '2022-11-15', 'daucove.jpg'),
('SP012', N'Đậu hà lan', 14000, 20, 'LSP005', N'Đồ tươi', 4, 3, 15, N'Đậu Hà Lan rất giàu tinh bột, chất xơ, chất đạm và nhiều loại vitamin cùng với nhiều khoáng chất thiết yếu cho con người.', '2022-11-15', 'dauhalan.jpg'),
('SP013', N'Mít sấy gói 500g', 150000, 30, 'LSP002', N'Đồ khô', 4, 3, 10, N'Mít sấy được là bằng cách mang những miếng mít tươi ngọt đi sấy khô cho đến khi hết nước, có thể dùng lò nướng, các loại máy sấy, nồi chiên để làm ra món ăn này. Mít sau khi sấy vẫn giữ được màu vàng ươm, vịt ngọt và hương thơm nhẹ nhàng.', '2022-11-15', 'mitsay.jpg'),
('SP014', N'Xoài cát Hòa Lộc', 70000, 30, 'LSP003', N'Đồ tươi', 4.2, 7, 5, N'Trong số các giống xoài được trồng ở Việt Nam, xoài cát Hòa Lộc là loại xoài ngon và to nhất, rất được ưa chuộng.', '2022-12-1', 'xoaicathoaloc.jpg'),
('SP015', N'Nho', 150000, 30, 'LSP003', N'Đồ tươi', 4.5, 10, 15, N'Nho là loại trái cây được nhiều người ưa thích, đặc biệt nhất là phụ nữ và trẻ em.', '2022-12-1', 'nho.jpg'),
('SP016', N'Ôỉ', 12000, 30, 'LSP003', N'Đồ tươi', 4.2, 5, 0, N'Ổi là một trong những loại trái cây chứa nhiều vitamin và các khoáng chất có lợi cho sức khoẻ.', '2022-12-1', 'oi.jpg'),
('SP017', N'Táo', 70000, 30, 'LSP003', N'Đồ tươi', 4, 7, 0, N'Táo chứa nhiều chất xơ, chất chống oxy hóa và vitamin C có tác dụng tăng cường miễn dịch, tăng sức đề kháng cũng như chống lão hóa và giảm nguy cơ mắc các bệnh nguy hiểm.', '2022-12-1', 'tao.jpg'),
('SP018', N'Ớt chuông', 90000, 30, 'LSP003', N'Đồ tươi', 3.5, 3, 20, N'Ớt chuông đỏ không chỉ được sử dụng như một món ăn giúp làm đẹp cho phái nữ mà ớt chuông đỏ còn cung cấp các chất dinh dưỡng có lợi ích cho sức khỏe. Ớt chuông hấp dẫn với nhiều màu sắc sặc sỡ như vàng, đỏ, cam.... ', '2022-12-3', 'otchuong.jpg'),
('SP019', N'Hạt óc chó', 160000, 20, 'LSP004', N'Đồ tươi', 4.1, 3, 0, N'Quả óc chó có nguồn gốc ở khu vực Địa Trung Hải và Trung Á. Óc chó giàu chất béo omega-3 và chứa lượng chất chống oxy hóa cao hơn hầu hết các loại thực phẩm khác.', '2022-12-2', 'hatoccho.jpg'),
('SP020', N'Xoài sấy dẻo gói 500g', 40000, 20, 'LSP002', N'Đồ khô', 4.2, 5, 10, N'Xoài sấy dẻo có vị ngọt và hơi chua, tính nhiệt. Xoài chứa nhiều vitamin và khoáng chất. Đặc biệt, các chất dinh dưỡng như protein, lipit, gluxit và nhất là tiền sinh tố A đều vượt xa các loại quả khác.', '2022-11-15', 'xoaisaydeo.jpg'),
('SP021', N'Hạt điều rang muối hộp 300g', 84000, 40, 'LSP004', N'Đồ khô', 4.5, 22, 5, N'Sản phẩm hạt điều rang muối được đóng vô bao (túi) hút chân không hoặc hộp nhựa, cân nặng 500gr', '2022-11-20', 'hatdieurangmuoi.jpg'),
('SP022', N'Đậu phộng rang muối hộp 500g', 40000, 35, 'LSP005', N'Đồ khô', 3.7, 12, 0, N'Mồi nhậu siêu ngon', '2022-11-20', 'dauphongrangmuoi.jpg'),
('SP023', N'Táo đỏ sấy khô 1kg', 140000, 10, 'LSP002', N'Đồ khô', 4, 4, 0, N'Trải qua các công đoạn sơ chế, sấy khô với công nghệ hiện đại đã cho ra đời những quả Táo đỏ khô thơm ngon tuyệt hảo và vẫn giữ nguyên giá trị dinh dưỡng.', '2022-11-25', 'taodosaykho.jpg')
go

insert into DonHang values
('DH000001', '2022-11-29', '0853000002')
go

insert into ChiTietDonHang values
('DH000001', 'SP001', 1.5),
('DH000001', 'SP004', 2.3)
go

insert into YKienDongGop values
('khachhang1@gmail.com', N'Nguyễn Văn A', '2022-12-01 11:42:00', N'Mong cải thiện tốc độ giao hàng'),
('khachhang2@gmail.com', N'Lê Văn B', '2022-12-01 11:42:00', N'Mong thêm nhiều khuyến mãi hihi')
go

insert into ThongTinEmailKhuyenMai values
('khachhang1@gmail.com'),
('khachhang2@gmail.com')
go

insert into MaGiamGia values
('MGGXUAN2023001', 25),
('MGGSIEUUUDAI001', 30)
go


--Hàm
--Gọi 9 sản phẩm yêu thích nhất: điều kiện đánh giá >=4
create function Func_SPYeuThich() returns table
as
	return (select top(9) * from SanPham where DanhGia >=4 order by DanhGia desc)
go

--Gọi 9 sản phẩm có lượt mua cao nhất
create function Func_SPMuaNhieu() returns table
as
	return(select SanPham.*, topsp.TongSoBanRa
			from SanPham, (select top(9) SanPham.MaSP, Sum(SoLuong) as TongSoBanRa from SanPham inner join ChiTietDonHang on SanPham.MaSP = ChiTietDonHang.MaSP
											group by SanPham.MaSP order by TongSoBanRa)topsp
			where SanPham.MaSP = topsp.MaSP)
go

--Thủ tục sắp xếp theo giá cao đến thấp
create proc Proc_SapXepGiaCaoDenThap
as
	select * from SanPham order by GiaSP desc
go

--Thủ tục sắp xếp theo giá thấp đến cao
create proc Proc_SapXepGiaThapDenCao
as
	select * from SanPham order by GiaSP asc
go


--Thủ tục sắp xếp theo chữ cái a-z
create proc Proc_SapXepAdenZ
as
	select * from SanPham order by TenSP asc
go


--Thủ tục sắp xếp theo chữ cái z-a
create proc Proc_SapXepZdenA
as
	select * from SanPham order by TenSP desc
go

--Func gọi sản phẩm giảm giá + giá mới
create function Func_HangGiamGia() returns table
as
	return (select *, GiaSP*(100-GiamGia)/100 as GiaSauGiam from SanPham where GiamGia > 0)
go

--Func gọi sản phẩm theo loại
create function Func_GoiSPTheoLoai(@TenLoaiSP nvarchar(30)) returns table
as
	return (select SanPham.* from SanPham, LoaiSanPham where @TenLoaiSP = LoaiSanPham.TenLoai and LoaiSanPham.MaLoai = SanPham.PhanLoai)
go

--select * from Func_GoiSPTheoLoai(N'Quả')


