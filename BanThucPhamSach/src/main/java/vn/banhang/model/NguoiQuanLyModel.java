package vn.banhang.model;

public class NguoiQuanLyModel {
	private String TenDangNhap;
	private String MatKhau;
	private String HoTen;
	public NguoiQuanLyModel() {
		super();
	}
	
	public NguoiQuanLyModel(String tenDangNhap, String matKhau, String hoTen) {
		super();
		TenDangNhap = tenDangNhap;
		MatKhau = matKhau;
		HoTen = hoTen;
	}

	public String getTenDangNhap() {
		return TenDangNhap;
	}

	public void setTenDangNhap(String tenDangNhap) {
		TenDangNhap = tenDangNhap;
	}

	public String getMatKhau() {
		return MatKhau;
	}

	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}

	public String getHoTen() {
		return HoTen;
	}

	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}
	
	@Override
	public String toString() {
		return "NguoiQuanLyModel [TenDangNhap=" + TenDangNhap + ", MatKhau=" + MatKhau + ", HoTen=" + HoTen + "]";
	}
}
