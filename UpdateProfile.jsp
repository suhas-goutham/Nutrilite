<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Profile</title>
</head>
<style>
body{
overflow:hidden;
font:400 15px/1.8 Lato, sans-serif;
}
.bgimg-1{
     background-attachment: scroll; /* parallax effect not to be there make it background-attachment:scroll */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;  
}
.bgimg-1{
background-image: url("C:/Users/hp/Desktop/DBMS/bill1.jpg");
min-height: 500px;
}
.bgimg-1{
position:relative;
}
.form{
background-color:white;
color:black;
padding:20px;
text-align:center;
width:35%;
font:400 15px/1.8 Lato, sans-serif;
letter-spacing:4px;
opacity:0.8;

}
.form {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    
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
input[type=text], select {
    width: 40%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 80%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}


</style>
<body>

<ul class="sidenav">
 
  <li class="navbar"><a href="MainPage.jsp">Sign out</a></li>
   
   <li class="navbar"><a  href="transactions.jsp">Transactions</a></li>
<li class="navbar"><a class="active"  href="#">Profile</a></li>
 
  <li class="navbar"><a href="order.jsp">Menu</a></li>
 
<li class="navbar" style="float:left"><a href="MainPage.jsp"> <i class="fa fa-home" style="font-size:24px"></i></a></li>
</ul>

<div class="bgimg-1">
<div class="form">
<form action="UpdateProfileServlet" method="post">
<center>Current age: <%= session.getAttribute("age")%></center>
<center>

<input type="text" name="age" value=<%=session.getAttribute("age") %>></center>
<br>


<center>Current height:<%=session.getAttribute("height")%></center>
<center>
<input type="text" name="height" value=<%=session.getAttribute("height") %>></center>
<br>

<center>Current weight:<%=session.getAttribute("weight")%></center>
<center><input type="text" name="weight" value=<%=session.getAttribute("weight") %>></center><br>
<center><input type="hidden" name="customerid" value=<%=session.getAttribute("cust_id") %>></center><br>
<center><input type="submit" value="UPDATE"></center>
</form>
</div>
</div>
</body>
</html>