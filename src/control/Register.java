package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user_bean.User;
import user_bean.User_Dao;

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L; 
    public Register() {
        super();
        }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		System.out.println(username); 
		//���� JavaBean ���� 
		User user=new User();
		user.setUsername(username);
		user.setPassword(password);
		//������Ӧҵ�񷽷������ݷ���ֵѡ����ʵ���ͼ����Ӧ�û� 
		//ע�ᣬ�û���������ע�ᣬ���ڱ���
		User_Dao dao = new User_Dao();
		try {
			boolean exist = dao.JudgeExist(username);
	        PrintWriter out = response.getWriter();
	        String failed = URLEncoder.encode("�û��Ѿ����ڣ�", "UTF-8");
			if(exist) {
				out.print("<script language='javascript'>alert(decodeURIComponent('"+failed+"'));window.location.href='index.jsp';</script>");
			}
			else {
				//�������ݿ�
				dao.add(user);
				String success = URLEncoder.encode("ע��ɹ�", "UTF-8");
				out.print("<script>alert(decodeURIComponent('"+success+"'));window.location.href='index.jsp';</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
