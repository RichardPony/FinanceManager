package finan_bean;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import finan_bean.*;
public class Finance_Dao {

   //�����ݿ�������û���¼�ķ���add()
   public void add(Finance finance) throws Exception{
	 Connection conn = null;
	 PreparedStatement ps = null;
	 try {
		 conn = DB_conn_Fin.getConnection();
		 String sql = "insert into fin_info values (?,?,?,?,?)";
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
// //ɾ�����ݿ��û���¼�ķ���delete()
//   public void delete(String username) throws Exception{
//	 Connection conn = null;
//	 PreparedStatement ps = null;
//	 try {
//		conn = DB_conn.getConnection();
//		String sql = "delete from user where username=?";
//		ps = conn.prepareStatement(sql);
//		ps.setString(1,username);
//		ps.executeUpdate();
//	}finally {DB_conn.free( null,ps, conn);}
//   }
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
		   fin.setUsername(rs.getString(1));
		   fin.setType(rs.getString(2));
		   fin.setNumber(rs.getString(3));
		   fin.setTime(rs.getDate(4));
		   fin.setComments(rs.getString(5));
		   finList.add(fin);
		}
	}finally {
		DB_conn_Fin.free(rs, ps, conn);

	}
	return finList;
   }
}


