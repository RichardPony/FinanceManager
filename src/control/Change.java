package control;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import finan_bean.Finance;
import finan_bean.Finance_Dao;

@WebServlet("/Change")
public class Change extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Change() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("GB2312");
		String type = request.getParameter("type");
		String comments = request.getParameter("comments");
		String number = request.getParameter("number");
		String time = request.getParameter("time");
		String username = request.getParameter("username");
		String getid=request.getParameter("id");
		int id = Integer.parseInt(getid);
		System.out.println("\n"+time);
		
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Finance fin = new Finance();
			java.util.Date date= format.parse(time);
			Calendar calendar =
					new GregorianCalendar();
					calendar.setTime(date); //你自己的数据进行类型转换
					calendar.add(calendar.DATE,1);//把日期往后增加一天.整数往后推,负数往前移动
					date=calendar.getTime();
			java.sql.Date Time = new java.sql.Date(date.getTime());
			System.out.println("写入时间："+Time);
			fin.setType(type);
			fin.setComments(comments);
			fin.setNumber(number);
			fin.setTime(Time);
			fin.setUsername(username);
			fin.setId(id);
			Finance_Dao FD = new Finance_Dao();
			FD.update(fin);
			System.out.print("************************update*******************");
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect("main.jsp?username="+username+"&res=success");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
