

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
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String age1=request.getParameter("age");
		String height1=request.getParameter("height");
		String weight1=request.getParameter("weight");
		//String url = "jdbc:mysql://localhost:3306/"; 
	    //String dbName = "nutrilite"; 
	    //String driver = "com.mysql.jdbc.Driver"; 
	    //String user = "root";  
	    //String password = ""; 
	    //out.println(height1);
    	//out.println(weight1);
    	String update_query="";
	    try { 
	    	Class.forName("com.mysql.jdbc.Driver");
	    	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/nutrilite","root","");
	       // Class.forName(driver).newInstance(); 
	        //Connection conn = DriverManager.getConnection(url+dbName, user, password); 
	        PreparedStatement ps;
	    	String query="select age,height,weight,bmi from user where cust_id=?";
	    	ps=conn.prepareStatement(query);
	    	int cust_id=Integer.parseInt(request.getParameter("customerid"));
	    	ps.setInt(1,cust_id);
	    	ResultSet rs=ps.executeQuery();
	    	int age=0,height=0,weight=0;
	    	float bmi=0;
	    	while(rs.next()){
	    		age=rs.getInt(1);
	    		height=rs.getInt(2);
	    		weight=rs.getInt(3);
	    		bmi=rs.getFloat(4);
	    		
	    	}
	    	PreparedStatement s1,s2,s3,s4;
	    	int w=0,changed1=0;
	    	
	    	if(age!=Integer.parseInt(age1)){
	    		update_query="update user set age="+Integer.parseInt(age1)+"where cust_id=?";
	    		s1=conn.prepareStatement(update_query);
	    		s1.setInt(1,cust_id);
	    	    w=s1.executeUpdate();
	    	}
	    	
	    	if(height!=Integer.parseInt(height1)){
	    		update_query="update user set height= ? where cust_id=?";
	    		s2=conn.prepareStatement(update_query);
	    		s2.setInt(1,Integer.parseInt(height1) );
	    		s2.setInt(2,cust_id);
	    	    w=s2.executeUpdate();
	    	    height=Integer.parseInt(height1);
	    	    changed1=1;   
	    	    
	    	}
	    	
	    	
	    	if(weight!=Integer.parseInt(weight1)){
	    		update_query="update user set weight=? where cust_id=?";
	    		s3=conn.prepareStatement(update_query);
	    		s3.setInt(1,Integer.parseInt(weight1) );
	    		s3.setInt(2,cust_id);
	    	    w=s3.executeUpdate();
	    	    weight=Integer.parseInt(weight1);
	    	    changed1=1;
	    	}
	    	
	    	if(changed1==1 ){
	    		bmi=(float)weight/((height*0.01f)*(height*0.01f));
	    		update_query="update user set bmi=? where cust_id=?";
	    		s4=conn.prepareStatement(update_query);
	    		s4.setFloat(1, bmi);
	    		s4.setInt(2,cust_id);
	    	    int ww=s4.executeUpdate();
	    	}
	    	
	    	
			response.sendRedirect("UpdateProfile.jsp");
			
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