package user_bean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import user_bean.*;
public class User_Dao {
   //�����ݿ�������û���¼�ķ���add()
   public void add(User user) throws Exception{
	 Connection conn = null;
	 PreparedStatement ps = null;
	 try {
		 conn = DB_conn_User.getConnection();
		 String sql = "insert into user values (?,?)";
		 ps = conn.prepareStatement(sql);
		 ps.setString(1, user.getUsername());
		 ps.setString(2,user.getPassword());
		 ps.executeUpdate();
	 }finally {DB_conn_User.free(null,ps, conn);}//�������ݺ��ͷ�����
   }

 //�޸����ݿ��û���¼�ķ���update()
   public void update(User user) throws Exception{
	Connection conn = null;
	PreparedStatement ps = null;
	try {
		conn = DB_conn_User.getConnection();
		String sql = "update user set password=? where username=? ";
		ps = conn.prepareStatement(sql);
		ps.setString(1,user.getUsername());
		ps.setString(2,user.getPassword());
		ps.executeUpdate();
	}finally {DB_conn_User.free(null,ps, conn);}
   }
 //ɾ�����ݿ��û���¼�ķ���delete()
   public void delete(String username) throws Exception{
	 Connection conn = null;
	 PreparedStatement ps = null;
	 try {
		conn = DB_conn_User.getConnection();
		String sql = "delete from user where username=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1,username);
		ps.executeUpdate();
	}finally {DB_conn_User.free( null,ps, conn);}
   }
   //�����û�����ѯ�û�����ķ���findUser()
   public String findUser(String username) throws Exception{
	if(!JudgeExist(username)) {return "false";}
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String Pwd = null;
	try {
		conn = DB_conn_User.getConnection();
		String sql = "select * from user where username=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, username);
		rs = ps.executeQuery();
		rs.next();
		Pwd = rs.getString(2);
		
	}finally {DB_conn_User.free(rs, ps, conn);}
	return Pwd;
   }
   //�ж�User�����Ƿ����ĳ�û�
   boolean JudgeExist(String username) throws Exception {
	   Connection conn = DB_conn_User.getConnection();
	   String sql = "select count(*) as ct from user where username=?";
	   PreparedStatement ps = conn.prepareStatement(sql);
	   ps.setString(1, username);
	   ResultSet rs = ps.executeQuery();
	   rs.next();
	   int count = rs.getInt("ct");
	   DB_conn_User.free(rs, ps, conn);
	   if(count == 1) {
		   return true;
	   }
	   return false;
   }
//   //��ѯȫ���û��ķ���QueryAll()
//   public List<User> QueryAll() throws Exception{
//	Connection conn = null;
//	PreparedStatement ps = null;
//	ResultSet rs = null;
//	List<User> userList=new ArrayList<User>();
//	try {
//		conn = JdbcUtil.getConnection();
//		String sql = "select * from students_info";
//		ps=conn.prepareStatement(sql);
//		rs=ps.executeQuery();
//		while(rs.next()){
//		   User user=new User();
//		   user.setUserid(rs.getString(1));
//		   user.setUsername(rs.getString(2));
//		   user.setSex(rs.getString(3));
//		   userList.add(user);
//		}
//	}finally {
//		JdbcUtil.free(rs, ps, conn);
//
//	}
//	return userList;
//   }
}
