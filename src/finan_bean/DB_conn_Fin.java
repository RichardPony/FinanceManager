package finan_bean;
import java.sql.*;
public class DB_conn_Fin {	
	//��ƻ�����Ӷ���ķ���getConnection()
	public static Connection getConnection() throws SQLException, ClassNotFoundException {		
		String userName = "root";						//���ݿ��û���
		String userPwd = "123456";						//����
		String dbName = "financial";						//���ݿ���
		String url1 = "jdbc:mysql://localhost:3306/" + dbName;
		String url2 = "?user=" + userName + "&password=" + userPwd;
		String url3 = "&useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
		String url = url1 + url2 + url3;
		Class.forName("com.mysql.cj.jdbc.Driver");		//���ز�ע����������
		Connection conn=DriverManager.getConnection(url);
			return conn;
		}
	//�ͷŽ�������������ӵķ���free()
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
