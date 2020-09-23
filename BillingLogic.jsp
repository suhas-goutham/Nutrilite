<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Payment </title>
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
min-height: 700px;
}
.bgimg-1{
position:relative;
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

.pagination {
    display: inline-block;
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
    margin: 0 4px;
}
.pagination a.active {
    background-color: #4CAF50;
    color: white;
    border: 1px solid #4CAF50;
}

</style>
<body>

<%! int bill_no;String[] item_code_bought=new String[20];String[] qty_bought=new String[20];int n;int amt=0;int num_of_calories_consumed=0;%>
<%!int cost_cart[]=new int[17];
	String[] cart_names=new String[17];
	%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nutrilite","root","");
	Statement stmt;
	stmt=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
   
    int  cust_id=(int)session.getAttribute("cust_id");
   
    //the values sent through the form whose action is Billinglogic.jsp
	item_code_bought=(String[])request.getParameterValues("items");
	qty_bought=(String[])request.getParameterValues("quantity");
	int num_of_items=Integer.parseInt(request.getParameter("number"));
	
	int cart[]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
	String bill_query="select * from bill_numbers;";
	ResultSet rs=stmt.executeQuery(bill_query);
	while(rs.next()){
		bill_no=rs.getInt(1); 
	}
	session.setAttribute("bill_no",bill_no);
	PreparedStatement pst;
	ResultSet rs1;
	String query="";
	amt=0;
	String item_name="";
	int cost=0;
	int calories=0;
	
	for(n=0;n<num_of_items;n++){
		if(Integer.parseInt(item_code_bought[n])>=1 &&Integer.parseInt(item_code_bought[n])<=6)
			query="select saladname,cost,calories from salad where itemcode=?";
			
		
		
		else if(Integer.parseInt(item_code_bought[n])>=7 &&Integer.parseInt(item_code_bought[n])<=9)
			query="select fruit_salname,cost,calories from fruits where itemcode=?";
		
		else if(Integer.parseInt(item_code_bought[n])>=10 &&Integer.parseInt(item_code_bought[n])<=12)
			query="select drink_name,cost,calories from healthydrinks where itemcode=?";
		else 
			query="select main_dish,cost,calories from maincourse where itemcode=?";
		
		pst=con.prepareStatement(query);
		pst.setString(1,item_code_bought[n]);
		
		rs1=pst.executeQuery();
		
		while(rs1.next()){
		 item_name=rs1.getString(1);
	     cost=rs1.getInt(2);
	     calories=rs1.getInt(3);
		}
		cost_cart[Integer.parseInt(item_code_bought[n])-1]=cost;
		cart_names[Integer.parseInt(item_code_bought[n])-1]=item_name;
		cart[Integer.parseInt(item_code_bought[n])-1]=cart[Integer.parseInt(item_code_bought[n])-1]+Integer.parseInt(qty_bought[n]);		
		amt=amt+Integer.parseInt(qty_bought[n])*cost;
		num_of_calories_consumed+=(Integer.parseInt(qty_bought[n])*calories);
		
	}
	//to decide calorie intake
	float calorie_intake=0.0f;
	String gender=(String)session.getAttribute("gender");
	int age=(int)session.getAttribute("age");
	int height=(int)session.getAttribute("height");
	int weight=(int)session.getAttribute("weight");
	String msg="";
	//according to the revised harris-benedict equation
	if(gender.equals("male")){
		float men_bmr=(float)88.362f+(13.397f*weight)+(4.799f*height)-(5.677f*age);
		
		calorie_intake=men_bmr*1.2f;	
	}
	else{
		float women_bmr=(float)447.593f+(9.247f*weight)+(3.098f*height)-(4.330f*age);
		calorie_intake=women_bmr*1.2f;	
	}
  
   amt=(int)(amt+0.05*amt);
   PreparedStatement ps=con.prepareStatement("insert into bill values(?,?,?,?,sysdate())");
   
		ps.setInt(1, bill_no);
		ps.setInt(2,cust_id);
		ps.setInt(3,amt);
		ps.setInt(4,num_of_calories_consumed);
		int c =ps.executeUpdate();
	
    //set the next bill number by updating table
	String order_up="update bill_numbers set bill_no="+(bill_no+1);
    int w=stmt.executeUpdate(order_up);
    
    
    //String info_query="select "
   
%>
<ul class="sidenav">
 
  <li class="navbar"><a href="MainPage.jsp">Sign out</a></li>
  
   <li class="navbar"><a  href="transactions.jsp">Transactions</a></li>
<li class="navbar"><a   href="UpdateProfile.jsp">Profile</a></li>
 
  <li class="navbar"><a class="active" href="#">Menu</a></li>
 
<li class="navbar" style="float:left"><a href="MainPage.jsp"> <i class="fa fa-home" style="font-size:24px"></i></a></li>
</ul>
<div class="bgimg-1">
<div class="bill">
<center>Hello,<%=session.getAttribute("fname") %></center>
<table cellspacing="100">
  <tr>
    <th>Item</th>
    <th>Qty</th>
    <th>Cost</th>
  </tr>
  <%for(int cc=0;cc<cart.length;cc++){ 
	if (cart[cc]!=0){
		
	%>
	
	  <tr>
	    <td><%=cart_names[cc] %></td>
	    <td><%=cart[cc]%></td>
	    <td><%=cost_cart[cc]*cart[cc] %></td>
	   
	  </tr>
	  <%
cart[cc]=0;} 
}

%>
</table>
<hr>
<p>  CGST  :  2.5%<br> SGST  :  2.5%</p>
<hr>
Amount: <%=amt%><br>
Calories consumed: <%=num_of_calories_consumed %>cals

<center>
<div class="pagination"><a href="ConfirmOrder.jsp" class="active">Confirm order</a></div>
</center>
<center>
<div class="pagination"><a href="RemoveOrder.jsp" class="active">Delete order</a></div>
</center>
</div>


<%
if(num_of_calories_consumed<calorie_intake){%>
<div class="alert alert-success">
    <strong>Congrats!</strong>You are maintaining a healthy diet.
</div>
<% }
else{
%>
<div class="alert alert-danger">
    <strong>Danger!</strong> You are consuming more your calorie intake :<%=calorie_intake %>cals.
  </div>
<% } %>

</div>
</body>
</html>
