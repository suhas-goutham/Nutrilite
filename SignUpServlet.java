import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String fname=request.getParameter("fname");
		String mname=request.getParameter("mname");
		String lname=request.getParameter("lname");
		String emailid=request.getParameter("emailid");
		String psw=request.getParameter("psw");
		String psw1=request.getParameter("psw1");
		String gender=request.getParameter("gender");
		int age=Integer.parseInt(request.getParameter("age"));
		int height=Integer.parseInt(request.getParameter("height"));
		int weight=Integer.parseInt(request.getParameter("weight"));
		//height/100 doesnt give the right answer and also typecast it like float if right answer should be there
		float bmi=(float)weight/((height*0.01f)*(height*0.01f));
		String url = "jdbc:mysql://localhost:3306/"; 
	    String dbName = "nutrilite"; 
	    String driver = "com.mysql.jdbc.Driver"; 
	    String user = "root";  
	    String password = ""; 
	    Statement st;
	    Statement s;
		int cust_no=0;
	     
	    //String query = "insert into user values(fname,mname,lname,emailid,psw,gender,age,height,weight,bmi)"; 
	    try { 
	        Class.forName(driver).newInstance(); 
	        Connection conn = DriverManager.getConnection(url+dbName, user, password); 
	   
	        s=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			String cust_number_query="select * from cust_numbers;";
			ResultSet rs=s.executeQuery(cust_number_query);
			while(rs.next()){
				cust_no=rs.getInt(1); 
			}
			st = conn.createStatement(); 
	        
			String query = "insert into user values (\"" + fname + "\", \""  + mname  + "\",\"" + lname + "\", \"" + emailid + "\", \"" + psw + "\", \"" + gender + "\"," +age + "," + height + "," + weight + "," + bmi+","+cust_no+")";
			int rows=st.executeUpdate(query);
			
			String customer_up="update cust_numbers set cust_no="+(cust_no+1);
		    int w=s.executeUpdate(customer_up);
			response.sendRedirect("MainPage.jsp");
			
			out.close();
	 
	    } catch (Exception e) { 
	    	System.out.println("ERROR"+e);
  	 	        out.close(); 

}  
	  
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}