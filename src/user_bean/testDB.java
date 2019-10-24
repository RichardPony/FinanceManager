package user_bean;

public class testDB {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		User a = new User();
		a.setUsername("1398");
		a.setPassword("t");
		User_Dao ud = new User_Dao();
		ud.add(a);
//		String pwd = ud.findUser("01");
//		System.out.print("success" + pwd);
		
	}

}
