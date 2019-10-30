package finan_bean;

import java.text.SimpleDateFormat;
import java.util.Date;


public class TestDB {
	public static void main(String []args) throws Exception
	{
		
			// TODO Auto-generated method stub
			Finance f = new Finance();
			f.setUsername("2017011398");
			f.setType("In");
			f.setNumber("1000");
			f.setTime(new java.sql.Date((new java.util.Date()).getTime()));
			f.setComments("¹¤×Ê");
			
			
			Finance_Dao Fd = new Finance_Dao();
			int num = 2000;
			for(int i=0;i<5;i++)
			{
				num += 67;
				String number = String.valueOf(num);
				f.setNumber(number);
				Fd.add(f);
			}
//			String pwd = ud.findUser("01");
//			System.out.print("success" + pwd);
			
//		 Date user_input = null;
//		 SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
//		 user_input = ft.parse("2019-1-1");
//		 java.sql.Date timePara = new java.sql.Date(user_input.getTime()); 
//		 System.out.println(timePara);
	}
}
