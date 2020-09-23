<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Delivery</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <style >
  body{
  font:400 15px/1.8 Lato, sans-serif;
  overflow-x:hidden;
  overflow-y:hidden;
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
li.navbar a.active{
background-color:teal;
color:white;
}
  
  </style>
</head>
<body>
<ul class="sidenav">
 
  <li class="navbar"><a href="MainPage.jsp">Sign out</a></li>
   
   <li class="navbar"><a  href="transactions.jsp">Transactions</a></li>
<li class="navbar"><a   href="UpdateProfile.jsp">Profile</a></li>
 
  <li class="navbar"><a class="active" href="#">Menu</a></li>
 
<li class="navbar" style="float:left"><a href="MainPage.jsp"> <i class="fa fa-home" style="font-size:24px"></i></a></li>
</ul>
<div class="container">
  <center><h2>ORDER DELIVERY</h2></center>

  <script>
  var i = 0;
	var counterBack = setInterval(function(){
    i = i+25;
    if(i < 101){
      $('.progress-bar').css('width', i+'%');
      if(i == 25)
      document.getElementById("demo").innerHTML = "MAKING";
      if( i == 50)
   	  document.getElementById("demo").innerHTML = "COOKING";
      if( i == 75)
      document.getElementById("demo").innerHTML = "PACKING";
      if( i == 100)
      document.getElementById("demo").innerHTML = "DISPATCHED";
    } else {
      clearTimeout(counterBack);
    }
  }, 2000);
  </script>
  <div class="progress">
    <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width:0%">
    </div>
  </div>
   <h4 id="demo"> ORDER RECEIVED</h4>
</div>

</body>
</html>