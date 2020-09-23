<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Previous Transactions</title>
</head>
<style>
div {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}


.bgimg-1{
     background-attachment: scroll; /* parallax effect not to be there make it background-attachment:scroll */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;  
}
.bgimg-1{
background-image: url("C:/Users/hp/Desktop/DBMS/bill1.jpg");
min-height: 400px;
}
.bgimg-1{
position:relative;
}
.heading{
background-color:white;
color:black;
padding:20px;
text-align:center;

font:400 15px/1.8 Lato, sans-serif;
letter-spacing:4px;
opacity:0.8;
}

.heading {
    position: absolute;
    top:20%;
    left:50%;
    transform: translate(-50%, -50%);
   
}
.bill{
background-color:white;
color:black;
padding:20px;
text-align:center;

font:400 15px/1.8 Lato, sans-serif;
letter-spacing:4px;
opacity:0.8;

}
.bill {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    
}
table {
    border-collapse: collapse;
    border: 1px solid white;
  }


ul.sidenav {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li.navbar {
    float: right;
}

li.navbar a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}


li.navbar a:hover:not(.active) {
    background-color: #111;
}
.active{
background-color:teal;
color:white;
}

</style>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nutrilite","root","");

int  cust_id=(int)session.getAttribute("cust_id");
//the values sent through the form whose action is Billinglogic.jsp
int bill_no;
int amt=0;
int calories=0;
Date date;
PreparedStatement ps;
int loop=0;
int billnumbers[]=new int[20];
Date d[]=new Date[20];
int amount[]=new int[20];
int cals[]=new int[20];

String orders="select bill_no,date,amt,calories from bill where cust_id=?;";
ps=con.prepareStatement(orders);
ps.setInt(1,cust_id);
ResultSet rs=ps.executeQuery();
while(rs.next()){
	bill_no=rs.getInt(1); 
	date=rs.getDate(2);
	amt=rs.getInt(3);
	calories=rs.getInt(4);
    billnumbers[loop]=bill_no;
    d[loop]=date;
    amount[loop]=amt;
    cals[loop]=calories;
    loop++;
}

PreparedStatement pst;
ResultSet rs1;
String query="";
//amt=0;
//String item_name="";
//int cost=0;
//int calories=0;



%>
<ul class="sidenav">
 
  <li class="navbar"><a href="MainPage.jsp">Sign out</a></li>
   
   <li class="navbar"><a  class="active" href="transactions.jsp">Transactions</a></li>
<li class="navbar"><a   href="UpdateProfile.jsp">Profile</a></li>
 
  <li class="navbar"><a href="order.jsp">Menu</a></li>
 
<li class="navbar" style="float:left"><a href="MainPage.jsp"> <i class="fa fa-home" style="font-size:24px"></i></a></li>
</ul>
<div class="bgimg-1">
<div class="heading">
<center>ORDER SUMMARY</center>

</div>
<div class="bill">
<table cellspacing="100">
  <tr>
    <th>Bill number</th>
    <th>Date</th>
    <th>Amount</th>
    <th>Calories</th>
    
  </tr>
  <%for(int kk=0;kk<loop;kk++){ 
	
		
	%>
	
	  <tr>
	    <td><%=billnumbers[kk] %></td>
	    <td><%=d[kk]%></td>
	    <td><%=amount[kk] %></td>
	    <td><%=cals[kk] %></td>
	  </tr>
	  <%
} 


%>
</table>

</div>
</div>
</body>
</html>