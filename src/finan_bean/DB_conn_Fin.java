package finan_bean;
import java.sql.*;
public class DB_conn_Fin {	
	//设计获得连接对象的方法getConnection()
	public static Connection getConnection() throws SQLException, ClassNotFoundException {		
		String userName = "root";						//数据库用户名
		String userPwd = "123456";						//密码
		String dbName = "financial";						//数据库名
		String url1 = "jdbc:mysql://localhost:3306/" + dbName;
		String url2 = "?user=" + userName + "&password=" + userPwd;
		String url3 = "&useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
		String url = url1 + url2 + url3;
		Class.forName("com.mysql.cj.jdbc.Driver");		//加载并注册驱动程序
		Connection conn=DriverManager.getConnection(url);
			return conn;
		}
	//释放结果集、语句和连接的方法free()
	public static void free(ResultSet rs, Statement st, Connection conn) {
		try { if (rs != null) rs.close();
		} catch (SQLException e) {e.printStackTrace();
		} finally {
			try { if (st != null) st.close();
			} catch (SQLException e) {e.printStackTrace();
			} finally {
			    if (conn != null)
				try { conn.close();
				} catch (SQLException e) {e.printStackTrace();
				}
			             }
			     }
		    }
}
