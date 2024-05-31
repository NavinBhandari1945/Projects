<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="controller.dbconnection.DbConnectioin"%>
<%@page import="model.*"%>
<%@page import="util.*"%>
<%@page import="java.util.*"%>
<%@page isELIgnored="false" %>
<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cart</title>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/footer.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/header.css">   
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/cart.css">   
	
	
   
</head>
<body>
<%@include file="header.jsp" %>

    <%
	  DbConnectioin dbconnection_obj=new DbConnectioin();
	  int userId = -1;
	  HttpSession session_value_g_c_d = request.getSession(false);
	   if (session_value_g_c_d != null) {
		   
		   Integer userIdAdmin_int = (Integer) session.getAttribute("userId_admin");
		   Integer userIdClient_int = (Integer) session.getAttribute("userId_client");

		   String userIdAdmin_str = (userIdAdmin_int != null) ? String.valueOf(userIdAdmin_int) : "";
		   String userIdClient_str = (userIdClient_int != null) ? String.valueOf(userIdClient_int) : "";
		    

		    if (userIdAdmin_str != null && !userIdAdmin_str.isEmpty()) {
		        userId=userIdAdmin_int;
		    } 
		    else if (userIdClient_str != null && !userIdClient_str.isEmpty()) {
		        userId=userIdClient_int;
		    } 
	   
	   }
	   
	  List<CartProductDetailsModel> list=dbconnection_obj.getCartProductDetails(userId);
	  for(CartProductDetailsModel ap_obj:list){
		  %>	  
    <div class="cart-items">
            <div class="cart-item">
            
			                <div class="product-image">
			                	<img src="${pageContext.request.contextPath}/images/<%= ap_obj.getP_image()%>" width="150px"; height="150px" class="img-thumblin">
			                
			                
			                    
			                </div>
			                
			                <div class="product-details">
			                    <div class="product-name">Name:<%=ap_obj.getP_name()%></div>
			                    <div class="product-price">Unit Price:<%=ap_obj.getP_unit_price() %></div>    
			                    <div class="product-quantity">Total Quantity:<%=ap_obj.getP_quantity() %></div>
			                    <div class="product-price">TotalS Price:<%=ap_obj.getTotal_price() %></div>
			                    <div class="product-price">Brand:<%=ap_obj.getP_brand() %></div>
			                    <div class="product-description">Description:<%=ap_obj.getP_description() %></div>
			                </div>
			                
			                <form action="${pageContext.request.contextPath}/delete_c_i_servlet" method="post">
			                	<input type="hidden" name="cart_id" value="<%=ap_obj.getCart_id() %>">
			                	<button type="submit" value="Delete" class="btn">Delete</button>
			                </form>
                
            </div>
            
    </div>
    <% 
	  }
	  %>
    
    
    
   <div>
   
	    <form action="${pageContext.request.contextPath}/order_c_i_servlet" method="get">
	   		<button type="submit" value="Order" class="btn" >CheckOut</button>
   		</form>
   		
   </div>
   
<%@include file="footer.jsp" %>
    
    
</body>
</html>
