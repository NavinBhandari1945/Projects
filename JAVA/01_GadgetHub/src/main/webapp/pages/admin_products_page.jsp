<%@page import="java.awt.font.ImageGraphicAttribute"%>
<%@page import="util.StringUtils"%>
<%@page import="controller.dbconnection.DbConnectioin"%>
<%@page import="model.*"%>
<%@page import="util.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false" %>
<%@page errorPage="error.jsp"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/admin_header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/admin_products_page.css">

</head>
<body>

<%@include file="admin_header.jsp" %>


<table border="1">
  <thead>
    <tr>
      <th>Product ID</th>
      <th>Product Quantity</th>
      <th>Product Unit Price</th>
      <th>Product Name</th>
      <th>Product Image</th>
      <th>Product Brand</th>
    </tr>
  </thead>
  <tbody>
	  <%
	  DbConnectioin dbconnection_obj=new DbConnectioin();
	  List<AddProductModel> list=dbconnection_obj.getProductDetailsUI();
	  for(AddProductModel ap_obj:list){
		  %>
		    <tr>
		      <td><%=ap_obj.getId() %></td>
		      <td><%=ap_obj.getP_quantity() %></td>
		      <td><%=ap_obj.getP_brand() %></td>
		      <td><%=ap_obj.getP_name() %></td>
		      
		      <td>
		           <img src="${pageContext.request.contextPath}/images/<%=ap_obj.getP_image()%>" width="150px"; height="150px"
	                        class="img-thumblin">
	                        
		      	
		      </td>
		      
		      <td><%= ap_obj.getP_unit_price() %></td>
		    </tr>
		  <% 
	  }
	  %>  
  </tbody>
</table>

   <%@include file="footer.jsp" %>









</body>
</html>