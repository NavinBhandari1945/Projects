<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="util.StringUtils"%>
<%@page import="controller.dbconnection.DbConnectioin"%>
<%@page import="model.*"%>
<%@page import="util.*"%>
<%@page import="java.util.*"%>
<%@page isELIgnored="false" %>
<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/OrderHistory.css">


   
</head>
<body>


 <%@include file="header.jsp" %>


<table border="1">
  <thead>
    <tr>
		<th>Order ID</th> 
		<th>Product ID</th> 
		<th>Client ID</th> 
		<th>Order Date</th> 
		<th>Product unit price</th>
		<th>Total Quantity</th> 
		<th>Total Price</th> 
		<th>Product Brand</th> 
		<th>Product Description</th>
		<th>Delivery Status</th> 
		<th>Product image</th>
		<th>Cart ID</th>
    </tr>
  </thead>
  <tbody>
	  <%
	 		    DbConnectioin dbconnection_obj=new DbConnectioin();
				int userId = -1; 
				HttpSession session_value_o_h_c = request.getSession(false);
				 if (session_value_o_h_c != null) {
			
					   Integer userIdClient_int = (Integer) session.getAttribute("userId_client");

			
					   String userIdClient_str = (userIdClient_int != null) ? String.valueOf(userIdClient_int) : "";
					    
					   if (userIdClient_str != null && !userIdClient_str.isEmpty()) {
					        // Client session exists
					        //System.out.println("Client session is active. User ID: " + userIdClient_int);
					        userId=userIdClient_int;
					    } 
					  
					} 
				 
				
				
	  List<OrderHistoryModel> list=dbconnection_obj.getO_H_C(userId);
	  for(OrderHistoryModel ap_obj:list){
		  %>
		    <tr>
			    <td><%= ap_obj.getoId() %></td>
				<td><%= ap_obj.getpId() %></td>
				<td><%= ap_obj.getcId() %></td>
				<td><%= ap_obj.getOrderDate() %></td>
				<td><%= ap_obj.getP_unit_price() %></td>
				<td><%= ap_obj.getTotalQuantity() %></td>
				<td><%= ap_obj.getTotalPrice() %></td>
				
				<td><%= ap_obj.getP_brand() %></td>
				<td><%= ap_obj.getP_description() %></td>
				<td><%= ap_obj.getDeliveryStatus() %></td>
				<td>
				
				 <img alt="order_item_photo_n" src="${pageContext.request.contextPath}/images/<%=ap_obj.getP_image()%>" width="150px"; height="150px" >
   
				

				
				
				</td>
				<td><%= ap_obj.getCart_id() %></td>
		      
		    </tr>
		  <% 
	  }
	  %>  
  </tbody>
</table>
   	<%@include file="footer.jsp" %>













</body>
</html>