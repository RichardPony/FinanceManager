package user_bean;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import user_bean.*;
public class User_Dao {
   //向数据库中添加用户记录的方法add()
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
	 }finally {DB_conn_User.free(null,ps, conn);}//插入数据后释放连接
   }

 //修改数据库用户记录的方法update()
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
 //删除数据库用户记录的方法delete()
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
   //根据用户名查询用户密码的方法findUser()
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
   //判断User表中是否存在某用户
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
//   //查询全部用户的方法QueryAll()
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
