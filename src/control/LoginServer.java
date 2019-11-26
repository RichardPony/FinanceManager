package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
	

@WebServlet("/LoginServer")
public class LoginServer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginServer() {
        super();
        // TODO Auto-generated constructor stub
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   response.setContentType("text/html;charset=utf-8");
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
   PrintWriter out = response.getWriter();
        
	 String username = request.getParameter("username");
	 String password = request.getParameter("password");
               
 
   if(username.equals("admin") && password.equals("123456")) {
       out.print("Login succeeded!");
   }else {
       out.print("Login failed!");
   } 
   out.flush();
   out.close();
}
public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
	doPost(request,response);
}

}
