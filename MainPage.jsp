<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<title>Nutrilite Intropage</title>
 
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<style>


body{
background-color:black;

}
h1{
color:white;}
body,h1,h2,h3,h4,h5,h6 {font: 400 15px/1.8 Lato, sans-serif;}


.mySlides {display:none}

/* Slideshow container */

.slideshow-container {
  
  position: relative;
  
   
}
/* Slideshow container */
.slideshow-container :hover {
  
opacity:0.4;
}
.dot {
  height: 10px;
  width: 10px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.text {
  color:white;
  font-size: 400%;
  padding: 8px 12px;
  position: absolute;
  width: 100%;
  text-align: center;
  letter-spacing:3px;
}


.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
  
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}

input[type=text] {
    width: 70%;
    padding: 12px 20px;
    margin: 8px 200px;
    box-sizing: border-box;
    border: none;
    background-color: #333333;
    color: white;
}
input[type=password] {
    width: 70%;
    padding: 12px 20px;
    margin: 8px 200px;
    box-sizing: border-box;
    border: none;
    background-color: #333333;
    color: white;
}
.Colour{
text-align:center;

color:white;
letter-spacing:3px;
}

.button {
    background-color: #000033; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 26px;
    width:15%;
    margin: 8px 430px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}

.button1:hover {
    background-color: #e6f0ff;
    color: black;
}


</style>
<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nutrilite","root","");
	PreparedStatement s;
	int cust_no=0;
	String fname="",psw_from_db="";
	String emailid=request.getParameter("emailid");
	String psw=request.getParameter("psw");
	String query="select cust_id,fname,psw,gender,age,height,weight from user where email=?";
	int age=0,height=0,weight=0;
	String gender="";
	s=con.prepareStatement(query);
	s.setString(1,emailid);
	ResultSet rs=s.executeQuery();
	if(rs!=null){
	while(rs.next()){
		cust_no=rs.getInt(1);
		fname=rs.getString(2);
		psw_from_db=rs.getString(3);
		gender=rs.getString(4);
		age=rs.getInt(5);
		height=rs.getInt(6);
		weight=rs.getInt(7);
	
		
	}
	
   if(psw_from_db.equals(psw)){
	  // out.println("Welcome " + fname+ " <a href=\"order.jsp\">Back to main</a>");
	  session.setAttribute("cust_id",cust_no);
	  session.setAttribute("fname",fname);
	  session.setAttribute("gender",gender);
	  session.setAttribute("age",age);
	  session.setAttribute("height",height);
	  session.setAttribute("weight",weight);
	  response.sendRedirect("order.jsp");
	  
   } 
   
	}
  // else{
	//	response.sendRedirect("signuppage.html");
	 //}
	%>

<center>
<div class="slideshow-container">

<div class="mySlides fade">
  
  <img src="http://s1.1zoom.net/big0/236/Salads_Fruit_Cheese_Nuts_482320.jpg" style="width:100%">
  
</div>

<div class="mySlides fade">
  
  <img src="http://www.mycity-web.com/wp-content/uploads/2015/08/Smoothies-Organic-Eats-Mag.jpg" style="width:100%">

</div>

<div class="mySlides fade">
  
  <img src="https://2rdnmg1qbg403gumla1v9i2h-wpengine.netdna-ssl.com/wp-content/uploads/sites/3/2015/02/MediteranneanDiet-650x450.jpg" style="width:100%">
  
</div>
<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>
</div>
<br>
  <div class="text">WELCOME TO NUTRILITE</div>
  <br>
<br>
<br>
<br>
<br>

<form action="MainPage.jsp" method="post">
  <div class="Colour">
  <h3>
  <label for="emailid">Enter EmailId:</label>
  </h3>
  </div>
  <input type="text" id="emailid" name="emailid">
  <div class="Colour">
  <h3>
  <label for="psw">Enter password:</label>
  </h3>
  </div>

  <input type="password" id="psw" name="psw">
 <button class="button button1" type="submit">LOGIN <br></button>
</form>
<br>
<br>

<a href="signuppage.html" class="button button1">SIGNUP</a>

<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>
</body>
</html>

