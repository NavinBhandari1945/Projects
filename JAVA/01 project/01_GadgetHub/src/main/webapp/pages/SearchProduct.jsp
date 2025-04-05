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
		
	  <%
	  String search_value=request.getParameter("search");
	  String search_value_min=request.getParameter("min_price");
	  String search_value_max=request.getParameter("max_price");
	  
	  int min_price_i=Integer.parseInt(search_value_min);
	  int max_price_i=Integer.parseInt(search_value_max);
	  
	  DbConnectioin dbconnection_obj_sp=new DbConnectioin();
	   int userId = -1;
	   HttpSession session_value_sp = request.getSession(false);
			if (session_value_sp != null) {
			    Integer userIdObj = (Integer) session_value_sp.getAttribute("userId_client");
			    if (userIdObj != null) {
			        userId = userIdObj.intValue(); // Convert Integer to int
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
			
	  List<AddProductModel> list=dbconnection_obj_sp.getProductDetailsSearch(search_value,min_price_i,max_price_i);
	  for(AddProductModel ap_obj:list){
		  %>	
		  

		        <div class="cart-body text-center" >
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