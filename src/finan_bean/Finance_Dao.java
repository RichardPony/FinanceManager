package finan_bean;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class Finance_Dao {

   //�����ݿ�������û���¼�ķ���add()
   public void add(Finance finance) throws Exception{
	 Connection conn = null;
	 PreparedStatement ps = null;
	 try {
		 conn = DB_conn_Fin.getConnection();
		 String sql = "insert into fin_info(username,type,number,time,comments) values (?,?,?,?,?)";
		 ps = conn.prepareStatement(sql);
		 ps.setString(1, finance.getUsername());
		 ps.setString(2,finance.getType());
		 ps.setString(3, finance.getNumber());
		 ps.setDate(4, finance.getTime());
		 ps.setString(5, finance.getComments());
		 ps.executeUpdate();
	 }finally {DB_conn_Fin.free(null,ps, conn);}//�������ݺ��ͷ�����
   }

// //�޸����ݿ��û���¼�ķ���update()
//   public void update(User user) throws Exception{
//	Connection conn = null;
//	PreparedStatement ps = null;
//	try {
//		conn = DB_conn.getConnection();
//		String sql = "update user set password=? where username=? ";
//		ps = conn.prepareStatement(sql);
//		ps.setString(1,user.getUsername());
//		ps.setString(2,user.getPassword());
//		ps.executeUpdate();
//	}finally {DB_conn.free(null,ps, conn);}
//   }
 //ɾ�����ݿ��û���¼�ķ���delete()
   public void delete(int id) throws Exception{
	 Connection conn = null;
	 PreparedStatement ps = null;
	 try {
		conn = DB_conn_Fin.getConnection();
		String sql = "delete from fin_info where id=?";
		ps = conn.prepareStatement(sql);
		ps.setInt(1,id);
		ps.execute();
	}finally {DB_conn_Fin.free( null,ps, conn);}
   }
//   //�����û�����ѯ�û�����ķ���findUser()
//   public String findUser(String username) throws Exception{
//	if(!JudgeExist(username)) {return "false";}
//	Connection conn = null;
//	PreparedStatement ps = null;
//	ResultSet rs = null;
//	String Pwd = null;
//	try {
//		conn = DB_conn.getConnection();
//		String sql = "select * from user where username=?";
//		ps = conn.prepareStatement(sql);
//		ps.setString(1, username);
//		rs = ps.executeQuery();
//		rs.next();
//		Pwd = rs.getString(2);
//		
//	}finally {DB_conn.free(rs, ps, conn);}
//	return Pwd;
//   }
//   //�ж�User�����Ƿ����ĳ�û�
//   boolean JudgeExist(String username) throws Exception {
//	   Connection conn = DB_conn.getConnection();
//	   String sql = "select count(*) as ct from user where username=?";
//	   PreparedStatement ps = conn.prepareStatement(sql);
//	   ps.setString(1, username);
//	   ResultSet rs = ps.executeQuery();
//	   rs.next();
//	   int count = rs.getInt("ct");
//	   DB_conn.free(rs, ps, conn);
//	   if(count == 1) {
//		   return true;
//	   }
//	   return false;
//   }
   //��ѯȫ���û��ķ���QueryAll()
   public List<Finance> QueryAll() throws Exception{
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	List<Finance> finList=new ArrayList<Finance>();
	try {
		conn = DB_conn_Fin.getConnection();
		String sql = "select * from fin_info";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
		   Finance fin=new Finance();
		   fin.setId(rs.getInt(1));
		   fin.setUsername(rs.getString(2));
		   fin.setType(rs.getString(3));
		   fin.setNumber(rs.getString(4));
		   fin.setTime(rs.getDate(5));
		   fin.setComments(rs.getString(6));
		   finList.add(fin);
		}
	}finally {
		DB_conn_Fin.free(rs, ps, conn);

	}
	return finList;
   }
   
   public List<Finance> QueryAll(String username) throws Exception{
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	List<Finance> finList=new ArrayList<Finance>();
	try {
		conn = DB_conn_Fin.getConnection();
		String sql = "select * from fin_info where username="+username;
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
		   Finance fin=new Finance();
		   fin.setId(rs.getInt(1));
		   fin.setUsername(rs.getString(2));
		   fin.setType(rs.getString(3));
		   fin.setNumber(rs.getString(4));
		   fin.setTime(rs.getDate(5));
		   fin.setComments(rs.getString(6));
		   finList.add(fin);
		}
	}finally {
		DB_conn_Fin.free(rs, ps, conn);

	}
	return finList;
   }
   public List<Finance> Query(String username,String TimeStart,String TimeEnd) throws Exception, SQLException{
	   Connection conn = null;
	   PreparedStatement ps = null;
	   ResultSet rs = null;
	   List<Finance> FinList = new ArrayList<Finance>();
	   try {
		   conn = DB_conn_Fin.getConnection();
			String sql = "select * from fin_info where username=" +username+ " and time between "+"'"+TimeStart+"'"+" and "+"'"+TimeEnd+"'";
			
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
			   Finance fin=new Finance();
//			   System.out.print(rs.getString(1));
			   fin.setUsername(rs.getString(2));
			   fin.setType(rs.getString(3));
			   fin.setNumber(rs.getString(4));
			   fin.setTime(rs.getDate(5));
			   fin.setComments(rs.getString(6));
			   FinList.add(fin);
			}
		   
	   }finally {
		   DB_conn_Fin.free(rs, ps, conn);
	   }
	   return FinList;
   }
   public List<String> QuerySum(String username,String TimeStart,String TimeEnd) throws Exception, Exception{
	   Connection conn = null;
	   PreparedStatement ps = null;
	   ResultSet rs = null;
	   List<String> res = new ArrayList<String>();
	   //如果没有时间，就是全部
	   if(TimeStart==null&&TimeEnd==null)
	   {
		   try {
			   conn = DB_conn_Fin.getConnection();
				String sql = "select number from fin_info where username=" +username +" and type = "+ "'IN'";
				Double SUM_IN = new Double(0);
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				while(rs.next()){
					SUM_IN += Double.valueOf(rs.getString(1));
				}
				String IN = String.valueOf(SUM_IN);
				res.add(IN);
			   
		   }finally {
			   DB_conn_Fin.free(rs, ps, conn);
		   }
		   //再查询支出总额
		   try {
			   conn = DB_conn_Fin.getConnection();
				String sql = "select number from fin_info where username=" +username +" and type = "+ "'OUT'";
				Double SUM_OUT = new Double(0);
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				while(rs.next()){
					SUM_OUT += Double.valueOf(rs.getString(1));
				}
				String OUT = String.valueOf(SUM_OUT);
				res.add(OUT);
			   
		   }finally {
			   DB_conn_Fin.free(rs, ps, conn);
		   }
		   System.out.print(res);
	   }
	   //如果有时间，就按时间查询
	   else {
		 //先查询收入总和
		   try {
			   conn = DB_conn_Fin.getConnection();
				String sql = "select number from fin_info where username=" +username +" and type = "+ "'IN'" +" and time between "+"'"+TimeStart+"'"+" and "+"'"+TimeEnd+"'";
				Double SUM_IN = new Double(0);
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				while(rs.next()){
					SUM_IN += Double.valueOf(rs.getString(1));
				}
				String IN = String.valueOf(SUM_IN);
				res.add(IN);
			   
		   }finally {
			   DB_conn_Fin.free(rs, ps, conn);
		   }
		   //再查询支出总额
		   try {
			   conn = DB_conn_Fin.getConnection();
				String sql = "select number from fin_info where username=" +username +" and type = "+ "'OUT'" +" and time between "+"'"+TimeStart+"'"+" and "+"'"+TimeEnd+"'";
				Double SUM_OUT = new Double(0);
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				while(rs.next()){
					SUM_OUT += Double.valueOf(rs.getString(1));
				}
				String OUT = String.valueOf(SUM_OUT);
				res.add(OUT);
			   
		   }finally {
			   DB_conn_Fin.free(rs, ps, conn);
		   }
	   }
	   
	   return res;
   }
   
}