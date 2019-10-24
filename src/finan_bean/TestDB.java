package finan_bean;

import java.text.SimpleDateFormat;
import java.util.Date;


public class TestDB {
	public static void main(String []args) throws Exception
	{
		
			// TODO Auto-generated method stub
			Finance f = new Finance();
			f.setUsername("1398");
			f.setType("t");
			f.setNumber("123");
			f.setTime(new Date());
			f.setComments("123");
			Finance_Dao Fd = new Finance_Dao();
			Fd.add(f);
//			String pwd = ud.findUser("01");
//			System.out.print("success" + pwd);
			
//		 Date user_input = null;
//		 SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
//		 user_input = ft.parse("2019-1-1");
//		 java.sql.Date timePara = new java.sql.Date(user_input.getTime()); 
//		 System.out.println(timePara);
	}
}
