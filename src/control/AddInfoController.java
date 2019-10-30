package control;

import java.io.IOException;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import finan_bean.Finance;
import finan_bean.Finance_Dao;

@WebServlet("/Add_Info")
public class AddInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddInfoController() {
        super();// TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String comments = request.getParameter("comments");
		String number = request.getParameter("number");
		String time = request.getParameter("time");
		String username = request.getParameter("username");
		
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Finance fin = new Finance();
			java.util.Date date= format.parse(time);
			java.sql.Date Time = new java.sql.Date(date.getTime());
			fin.setType(type);
			fin.setComments(comments);
			fin.setNumber(number);
			fin.setTime(Time);
			fin.setUsername(username);
			
			Finance_Dao FD = new Finance_Dao();
			FD.add(fin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.print(comments);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
