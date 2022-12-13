package vn.banhang;

import vn.banhang.dao.LoginDAO;
import vn.banhang.model.AccountModel;

public class TestKey {
//	Test dữ liệu
	public static void main(String[] args) {
		LoginDAO pd=new LoginDAO();
		AccountModel list=pd.dangNhapAdmin("quanly001","12345678");
		System.out.println(list);
	}
}
