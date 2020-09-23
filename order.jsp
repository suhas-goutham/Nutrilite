
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
body {
      
      font: 400 15px/1.8 Lato, sans-serif;
      color: #777;
      
  }
  h3, h4 {
      margin: 10px 0 30px 0;
      letter-spacing: 10px;
      font-size: 20px;
      color: #111;
  }

.btn {
      padding: 10px 20px;
      background-color: #333;
      color: #f1f1f1;
      border-radius: 0;
      transition: .2s;
  }
  .btn:hover, .btn:focus {
      border: 1px solid #333;
      background-color: #fff;
      color: #000;
  }
list-group-item{
      border-top-right-radius: 0;
      border-top-left-radius: 0;
       color:#000000;
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
<title>PLACE YOUR ORDER</title>
</head>

<body>


<%!int n=0; %>
<%!String[] itmcode=new String[20];
String[] qty=new String[20];int i=0; %>
<%
  String a=request.getParameter("qty");
  String b=request.getParameter("itmcode");
  
  if(a != null && b != null){
		  itmcode[i]=b;
   	      qty[i]=(a);
   	     // previtmcode=itmcode[i];
   	     // prevqty=qty[i];
   	   // out.println(itmcode[i]+"  "+qty[i]+"  "+i);
   	      i = i+1; //for next thing		 	
 }
 //array_code tells list of items bought
  //session.setAttribute("array_code",itmcode);
  //session.setAttribute("array_qty",qty);
  //session.setAttribute("i", i); 
  //
 /* if(i>=1)
  {
  for(int k=0;k<itmcode.length;k++)
	 
  	out.println(itmcode[k]);
  for(int l=0;l<itmcode.length;l++)
	  out.println(qty[l]);
  }
  */
  // i is number of diff items bought
%>
<ul class="sidenav">
 
  <li class="navbar"><a href="MainPage.jsp">Sign out</a></li>
   
   <li class="navbar"><a  href="transactions.jsp">Transactions</a></li>
<li class="navbar"><a   href="UpdateProfile.jsp">Profile</a></li>
 
  <li class="navbar"><a class="active" href="#">Menu</a></li>
 
<li class="navbar" style="float:left"><a href="MainPage.jsp"> <i class="fa fa-home" style="font-size:24px"></i></a></li>
</ul>
<div class="row text-center">
       <ul class="list-group">
      <li class="list-group-item"><b>SALADS</b></li>
      </ul>
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="C:/Users/hp/Desktop/DBMS/greek-salad-4902x3660-tomato-olives-peppers-onions-cheese-feto-4991.jpg" title="Greek Salad" alt="Greek Salad" width="400" height="300">
          <p><strong>Greek Salad</strong></p>
          <p>Fresh veggies and feta cheese<br> with the classic greek style </p>
          <p>Calories : 150 | Cost : <i class="fa fa-rupee" style="font-size:15px;"></i>  125</p>
          <form name="itmform" role="form"  method="post" action="order.jsp" >
          <input type="hidden" name="itmcode" value="1">
          <label  for="qty">Qty :</label>
          <input  type="text" name="qty"style="font-size:14px;" id="qty_1" min="1" max="999"  value ="1" placeholder="1">
          <p>    </p>
          <button class="btn" type="submit">Add To Cart </button>
          </form>
        </div>
      </div>

      
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="C:/Users/hp/Desktop/DBMS/sald3.jpg" title="Mushroom Delicacy" alt="Mushroom Delicacy" width="400" height="300">
          <p><strong>Mushroom Delicacy</strong></p>
          <p>A fine salad prepared<br> with fresh mushrooms </p>
          <p>Calories : 76| Cost : <i class="fa fa-rupee" style="font-size:15px;"></i>  120</p>
          <form name="itmform" role="form"  method="post" action="order.jsp" >
          <input type="hidden" name="itmcode" value="2">
          <label  for="qty">Qty :</label>
          <input  type="text" name="qty"style="font-size:14px;" id="qty_1" min="1" max="999"  value ="1" placeholder="1">
          <p>    </p>
          <button class="btn" type="submit">Add To Cart </button>
          </form>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="C:/Users/hp/Desktop/DBMS/Mediterranean-bean-salad-6019-March-07-2017-4.jpg" title="Mediterranean bean Salad" alt="Mediterranean bean Salad" width="400" height="300">
          <p><strong>Mediterranean bean Salad</strong></p>
          <p>A Mediterranean touch  <br> to the beans in a salad. </p>
          <p>Calories : 143| Cost : <i class="fa fa-rupee" style="font-size:15px;"></i>  150</p>
          <form name="itmform" role="form"  method="post" action="order.jsp" >
          <input type="hidden" name="itmcode" value="3">
          <label  for="qty">Qty :</label>
          <input  type="number" name="qty"style="font-size:14px;" id="qty_1" min="1" max="999"  value ="1" placeholder="1">
          <p>    </p>
          <button class="btn" type="submit">Add To Cart </button>
          </form>
        </div>
      </div>
      
    
       <div class="col-sm-4">
        <div class="thumbnail">
          <img src="C:/Users/hp/Desktop/DBMS/garden.jpg" title="Garden exotica" alt="Garden exotica" width="400" height="300">
          <p><strong>Garden exotica</strong></p>
          <p>Fresh garden veggies<br> with a splendid taste. </p>
          <p>Calories : 55| Cost : <i class="fa fa-rupee" style="font-size:15px;"></i>  100</p>
          <form name="itmform" role="form"  method="post" action="order.jsp" >
          <input type="hidden" name="itmcode" value="4">
          <label  for="qty">Qty :</label>
          <input  type="number" name="qty"style="font-size:14px;" id="qty_1" min="1" max="999"  value ="1" placeholder="1">
          <p>    </p>
          <button class="btn" type="submit">Add To Cart </button>
          </form>
        </div>
      </div>
  
       <div class="col-sm-4">
        <div class="thumbnail">
          <img src="C:/Users/hp/Desktop/DBMS/ceasar.jpg" title="Chicken Caesar Salad" alt="Chicken Caesar Salad" width="400" height="300">
          <p><strong>Chicken Caesar Salad</strong></p>
          <p>The authentic <br> Caesar salad with slices of chicken. </p>
          <p>Calories : 46| Cost : <i class="fa fa-rupee" style="font-size:15px;"></i>  135</p>
          <form name="itmform" role="form"  method="post" action="order.jsp" >
          <input type="hidden" name="itmcode" value="5">
          <label  for="qty">Qty :</label>
          <input  type="number" name="qty"style="font-size:14px;" id="qty_1" min="1" max="999"  value ="1" placeholder="1">
          <p>    </p>
          <button class="btn" type="submit">Add To Cart </button>
          </form>
        </div>
      </div>
      
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="C:/Users/hp/Desktop/DBMS/salad1.jpg" title="Crunchy Chicken Salad" alt="Crunchy Chicken Salad" width="400" height="300">
          <p><strong>Crunchy Chicken Salad</strong></p>
          <p>The crispiness of chicken<br> with a blend of vegetables. </p>
          <p>Calories : 70| Cost : <i class="fa fa-rupee" style="font-size:15px;"></i>  150</p>
          <form name="itmform" role="form"  method="post" action="order.jsp" >
          <input type="hidden" name="itmcode" value="6">
          <label  for="qty">Qty :</label>
          <input  type="number" name="qty"style="font-size:14px;" id="qty_1" min="1" max="999"  value ="1" placeholder="1">
          <p>    </p>
          <button class="btn" type="submit">Add To Cart </button>
          </form>
        </div>
      </div>
</div>
<div class="row text-center">

 <ul class="list-group">
      <li class="list-group-item"><b>FRUIT SALADS</b></li>
      </ul>
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="C:/Users/hp/Desktop/DBMS/fruit1.jpg" title="Berries Salad" alt="Berries Salad" width="400" height="300">
          <p><strong>Berries Salad</strong></p>
          <p>Fresh berries<br> handpicked and made in a salad.</p>
          <p>Calories : 56 | Cost : <i class="fa fa-rupee" style="font-size:15px;"></i>  180</p>
          <form name="itmform" role="form"  method="post" action="order.jsp" >
          <input type="hidden" name="itmcode" value="7">
          <label  for="qty">Qty :</label>
          <input  type="number" name="qty"style="font-size:14px;" id="qty_1" min="1" max="999"  value ="1" placeholder="1">
          <p>    </p>
          <button class="btn" type="submit">Add To Cart </button>
          </form>
        </div>
      </div>

      
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="C:/Users/hp/Desktop/DBMS/fruit2.jpg" title="Fruit Salad" alt="Fruit Salad" width="400" height="300">
          <p><strong>Fruit Salad</strong></p>
          <p>A classy salad prepared<br> with fresh fruits</p>
          <p>Calories : 50| Cost : <i class="fa fa-rupee" style="font-size:15px;"></i>  160</p>
          <form name="itmform" role="form"  method="post" action="order.jsp" >
          <input type="hidden" name="itmcode" value="8">
          <label  for="qty">Qty :</label>
          <input  type="number" name="qty"style="font-size:14px;" id="qty_1" min="1" max="999"  value ="1" placeholder="1">
          <p>    </p>
          <button class="btn" type="submit">Add To Cart </button>
          </form>
        </div>
      </div>
      
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="C:/Users/hp/Desktop/DBMS/fruit3.jpg" title="Exotic Mix" alt="Exotic Mix" width="400" height="300">
          <p><strong>Exotic Mix</strong></p>
          <p>Our Chef's special<br>with a twist. </p>
          <p>Calories : 100| Cost : <i class="fa fa-rupee" style="font-size:15px;"></i> 160</p>
          <form name="itmform" role="form"  method="post" action="order.jsp" >
          <input type="hidden" name="itmcode" value="9">
          <label  for="qty">Qty :</label>
          <input  type="number" name="qty"style="font-size:14px;" id="qty_1" min="1" max="999"  value ="1" placeholder="1">
          <p>    </p>
          <button class="btn" type="submit">Add To Cart </button>
          </form>
        </div>
      </div>
      
    
      
</div>
<div class="row text-center">

 <ul class="list-group">HEALTHY DRINKS</b></li>
      </ul>
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="C:/Users/hp/Desktop/DBMS/drink1.jpg" title="Strawberry Smoothie" alt="Strawberry Smoothie" width="400" height="300">
          <p><strong>Strawberry Smoothie</strong></p>
          <p>Fresh strawberries<br> blended with fat-free milk.</p>
          <p>Calories : 146 | Cost : <i class="fa fa-rupee" style="font-size:15px;"></i>  200</p>
          <form name="itmform" role="form"  method="post" action="order.jsp" >
          <input type="hidden" name="itmcode" value="10">
          <label  for="qty">Qty :</label>
          <input  type="number" name="qty"style="font-size:14px;" id="qty_1" min="1" max="999"  value ="1" placeholder="1">
          <p>    </p>
          <button class="btn" type="submit">Add To Cart </button>
          </form>
        </div>
      </div>

      
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="C:/Users/hp/Desktop/DBMS/drink2.jpg" title="Green Tea" alt="Green Tea" width="400" height="300">
          <p><strong>Green Tea</strong></p>
          <p>The healthiest way for<br> burning fat</p>
          <p>Calories : 14| Cost : <i class="fa fa-rupee" style="font-size:15px;"></i>  45</p>
          <form name="itmform" role="form"  method="post" action="order.jsp" >
          <input type="hidden" name="itmcode" value="11">
          <label  for="qty">Qty :</label>
          <input  type="number" name="qty"style="font-size:14px;" id="qty_1" min="1" max="999"  value ="1" placeholder="1">
          <p>    </p>
          <button class="btn" type="submit">Add To Cart </button>
          </form>
        </div>
      </div>
      
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="C:/Users/hp/Desktop/DBMS/drink3.jpg" title="Tomato-Carrot Juice" alt="Tomato-Carrot Juice" width="400" height="300">
          <p><strong>Tomato-Carrot Juice</strong></p>
          <p>Our Chef's special<br>blend of a vegetable and fruit </p>
          <p>Calories : 50| Cost : <i class="fa fa-rupee" style="font-size:15px;"></i> 80</p>
          <form name="itmform" role="form"  method="post" action="order.jsp" >
          <input type="hidden" name="itmcode" value="12">
          <label  for="qty">Qty :</label>
          <input  type="number" name="qty"style="font-size:14px;" id="qty_1" min="1" max="999"  value ="1" placeholder="1">
          <p>    </p>
          <button class="btn" type="submit">Add To Cart </button>
          </form>
        </div>
      </div>
     
    
</div>

<div class="row text-center">

 <ul class="list-group">MAIN COURSE</b></li>
      </ul>
      
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="C:/Users/hp/Desktop/DBMS/main2.jpg" title="Veggie Delight" alt="Veggie Delight" width="400" height="300">
          <p><strong>Veggie Delight</strong></p>
          <p>The sub for <br> the veggie lovers</p>
          <p>Calories : 230| Cost : <i class="fa fa-rupee" style="font-size:15px;"></i> 160</p>
          <form name="itmform" role="form"  method="post" action="order.jsp" >
          <input type="hidden" name="itmcode" value="13">
          <label  for="qty">Qty :</label>
          <input  type="number" name="qty"style="font-size:14px;" id="qty_1" min="1" max="999"  value ="1" placeholder="1">
          <p>    </p>
          <button class="btn" type="submit">Add To Cart </button>
          </form>
        </div>
      </div>

      
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="C:/Users/hp/Desktop/DBMS/main5.jpg" title="Spinach Brown Rice" alt="Spinach Brown Rice" width="400" height="300">
          <p><strong>Spinach Brown Rice</strong></p>
          <p>Our blend of spinach<br>blendand brown rice </p>
          <p>Calories : 150| Cost : <i class="fa fa-rupee" style="font-size:15px;"></i> 155</p>
          <form name="itmform" role="form"  method="post" action="order.jsp" >
          <input type="hidden" name="itmcode" value="14">
          <label  for="qty">Qty :</label>
          <input  type="number" name="qty"style="font-size:14px;" id="qty_1" min="1" max="999"  value ="1" placeholder="1">
          <p>    </p>
          <button class="btn" type="submit">Add To Cart </button>
          </form>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="C:/Users/hp/Desktop/DBMS/main3.jpg" title="Roasted Chicken" alt="Roasted Chicken" width="400" height="300">
          <p><strong>Roasted Chicken</strong></p>
          <p>Our Chef's special<br> chicken in an American style. </p>
          <p>Calories : 103| Cost : <i class="fa fa-rupee" style="font-size:15px;"></i> 190</p>
          <form name="itmform" role="form"  method="post" action="order.jsp" >
          <input type="hidden" name="itmcode" value="15">
          <label  for="qty">Qty :</label>
          <input  type="number" name="qty"style="font-size:14px;" id="qty_1" min="1" max="999"  value ="1" placeholder="1">
          <p>    </p>
          <button class="btn" type="submit">Add To Cart </button>
          </form>
        </div>
      </div>
  
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="C:/Users/hp/Desktop/DBMS/main4.jpg" title="Salmon Delicacy" alt="Salmon Delicacy" width="400" height="300">
          <p><strong>Salmon Delicacy</strong></p>
          <p>Our Chef's special<br>blend of a vegetable and fruit </p>
          <p>Calories : 200| Cost : <i class="fa fa-rupee" style="font-size:15px;"></i> 220</p>
          <form name="itmform" role="form"  method="post" action="order.jsp" >
          <input type="hidden" name="itmcode" value="16">
          <label  for="qty">Qty :</label>
          <input  type="number" name="qty"style="font-size:14px;" id="qty_1" min="1" max="999"  value ="1" placeholder="1">
          <p>    </p>
          <button class="btn" type="submit">Add To Cart </button>
          </form>
        </div>
      </div>

      
     <div class="col-sm-4">
        <div class="thumbnail">
          <img src="C:/Users/hp/Desktop/DBMS/main1.jpg" title="Veg Sandwich" alt="Veg Sandwich" width="400" height="300">
          <p><strong>Veg Sandwich</strong></p>
          <p>Try the veg<br> sandwich with veggies.</p>
          <p>Calories : 135| Cost : <i class="fa fa-rupee" style="font-size:15px;"></i> 85</p>
          <form name="itmform" role="form"  method="post" action="order.jsp" >
          <input type="hidden" name="itmcode" value="17">
          <label  for="qty">Qty :</label>
          <input  type="number" name="qty"style="font-size:14px;" id="qty_1" min="1" max="999"  value ="1" placeholder="1">
          <p>    </p>
          <button class="btn" type="submit">Add To Cart </button>
          </form>
        </div>
      </div>
      
      
    
</div>
<form action="BillingLogic.jsp" method="post">
<% for (int s=0;s<i;s++){
	//s is jus a loop variable which runs for only number of items bought
	//basically i stands for the number of items bought
	%>

<input type="hidden" name="items" value=<%=itmcode[s]%> >
<input type="hidden" name="quantity" value=<%=qty[s]%> >
<input type="hidden" name="number" value=<%=i%> >
<%}
//session.setAttribute("quantity",qty);
//session.setAttribute("itemcode",itmcode);
//session.setAttribute("num",i);
%>
<center><button class="btn" type="submit">Proceed to Billing</button></center>
</form>
</body>
</html>