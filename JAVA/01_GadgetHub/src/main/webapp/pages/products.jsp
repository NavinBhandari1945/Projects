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

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/footer.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/header.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/products.css">
    
</head>
<body>

<%@include file="header.jsp" %>
	

    <div class="container">
        <form class="form" method="post" action="${pageContext.request.contextPath}/pages/SearchProduct.jsp">
	        	<p>Enter the product name.</p>
	            <input class="form-control mr-sm-2" type="search" name="search" placeholder="Search" value="empty">
	            <p>Enter the minimum price.</p>
	            <input name="min_price" value="0">
	            <p>Enter the maximum price.</p>
	            <input name="max_price" value="1000">
	            <button class="btn" type="submit">Search</button>
        </form>
    </div>

	 
	   <%
	  DbConnectioin dbconnection_obj_p=new DbConnectioin();
	   int userId = -1;
	   
	   HttpSession sesssession_value_p = request.getSession(false);
	   
	   if (session_value_h != null) {
		 
		   Integer userIdClient_int = (Integer) sesssession_value_p.getAttribute("userId_client");

		
		   String userIdClient_str = (userIdClient_int != null) ? String.valueOf(userIdClient_int) : "";
		    
		  if (userIdClient_str != null && !userIdClient_str.isEmpty()) {
		        // Client session exists
		       // System.out.println("Client session is active. User ID: " + userIdClient_int);
		        userId=userIdClient_int;
		    } 
		
		} 
	 %>
	   
	<div class="product_main_container" style="display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width:100%;
	justify-content: space-between;
	margin: 10px;
	">
	   
        <%
        
	  List<AddProductModel> list=dbconnection_obj_p.getProductDetailsUI();
	  for(AddProductModel ap_obj:list) 
		  
	  {
		  %>	
	                    <div class="cart-body text-center">
	                        <img src="${pageContext.request.contextPath}/images/<%=ap_obj.getP_image()%>" width="150px"; height="150px" >
	                        <p>Name:<%=ap_obj.getP_name()  %></p>
	                        <p>Price:<%= ap_obj.getP_unit_price() %></p>
	                        <p>Available quantity:<%= ap_obj.getP_quantity() %></p>  
	                        <div class="row">
	                        	<%
	                        	if(userId!=-1){
	                        		%>
	                        		
	                      <span>
				                       <form action="${pageContext.request.contextPath}/addtocart_servlet?p_id=<%= ap_obj.getId() %>&c_id=<%= userId %>&price=<%=ap_obj.getP_unit_price() %>" method="post">
						                        <div>
						                        	<p>Enter quantity to add to cart</p>
						                        	
						                        	<div class="c1">
						                        	
						                        			<input type="text" name="c_s_quantity" >
						                        	
						                        	</div>
						                        
						                        	
						                        </div>
						                        
						                        <br>
						                        
						                        <div id="button_s1" class="c1">
						                        
						                        		 <button type="submit" class="size_btn">Add to cart</button>
						                        		 <a href="${pageContext.request.contextPath}/pages/productsdetails.jsp?p_id=<%=ap_obj.getId() %>" class="size_btn">View Details</a>
						                        
						                        </div>
						                       
				                            
						                        
				                        </form> 	
	                         
	                         </span>
	                         
		                        <% 
	                        	}else{
	                        		%>
	                        		
	                        		<div id="no_login">
	                        		 <a href="${pageContext.request.contextPath}/cart_nl_servlet" class="no_login_a" >Add to Cart</a>
	                        		 <a href="${pageContext.request.contextPath}/pages/productsdetails.jsp?p_id=<%=ap_obj.getId() %>" class="no_login_a">View Details</a>
	                            	</div>
	                        		 <%
	                        	}                  	
	                        	%>
	                        </div>
	
	                </div>
	                
	                
	                

	       

	            
	            
	            

	
	
	<% 
	}
	  %>
	  	</div> 
	
	<%@include file="footer.jsp" %>
	
	
</body>
</html> 


 
 
 
 
 

 



 
 
 
 
 
 
 
 
 
	            
	            

	
	



 
 
 
 
 
 
 
 
 