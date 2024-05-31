 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isErrorPage="true" %>
<%@page import="controller.dbconnection.DbConnectioin"%>
<%@page import="model.*"%>
<%@page import="util.*"%>
<%@page import="java.util.*"%>
<%@page isErrorPage="true" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/error.css">
</head>
<body>


	<%@include file="header.jsp" %>	
	
	
	 <div class="descp_cont">
		 	
		<div class="descprition">
		    <p >Home Description</p>
		    <p >Product Description</p>
		</div>
		<br>
		<div class="descprition">
		    <p >About Us Description</p>
		    <p >Profile Description</p>
		</div>
		<br>
		<div class="descprition">
		    <p >Cart Description</p>
		    <p >Order History Description</p>
		</div>
	 
	 </div>
 	<br>
    <h2 class="title">Featured Products</h2>
    
	<%
	  DbConnectioin dbconnection_obj_e=new DbConnectioin();
	   int userId = -1;
	   
	   HttpSession sesssession_value_e = request.getSession(false);
	   
	   if (session_value_h != null) {
		 
		   Integer userIdClient_int = (Integer) sesssession_value_e.getAttribute("userId_client");

		
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
        
	  List<AddProductModel> list=dbconnection_obj_e.getProductDetailsUI();
	  for(AddProductModel ap_obj:list) 
		  
	  {
		  %>	
	                    <div class="cart-body text-center">
	                        <img src="${pageContext.request.contextPath}/images/<%=ap_obj.getP_image()%>" width="150px"; height="150px" class="img-thumblin">
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
	                        		 <a href="${pageContext.request.contextPath}/cart_nl_servlet">Add to Cart</a>
	                        		 <span><a href="${pageContext.request.contextPath}/pages/productsdetails.jsp?p_id=<%=ap_obj.getId() %>" class="btn btn-success btn-sm ml-1">View Details</a></span>
	                            
	                        		 <%
	                        	}                  	
	                        	%>
	                        </div>
	
	                </div>
	                
	                
	                

	       

	            
	            
	            

	
	
	<% 
	}
	  %>
	  
	  	</div> 
    
    
    <br>
    <br>
    <%@include file="footer.jsp" %>

	
</body>
</html>