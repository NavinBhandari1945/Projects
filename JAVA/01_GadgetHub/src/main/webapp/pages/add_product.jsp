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

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/add_product.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/admin_header.css">
</head>
<body>

<%@include file="admin_header.jsp" %>
   


<div id="main_body_01" style=" background-color: grey;
    padding: 20px 20px 20px 20px;">
		 
		 	<form action="${pageContext.request.contextPath}/add_products_servlet" method="post" enctype="multipart/form-data" > 
		 		    <div id="Add product Form">Add Product Form</div>	
		 		    <br>
		 		    
		 			<div class="form-group">
					    <label for="id">Enter product ID</label>
					    <br>
					    <input type="text" name="p_id" class="product" id="p_id">
					</div>
					
					<div class="form-group">
					    <label for="p_name">Enter product name</label>
					    <br>
					    <input type="text" name="p_name" class="product" id="p_name">
					</div>
					
					<div class="form-group">
					    <label for="p_unit_price">Enter product unit price</label>
					    <br>
					    <input type="text" name="p_unit_price" class="product" id="p_unit_price">
					</div>
					
					<div class="form-group">
					    <label for="p_quantity">Enter product quantity</label>
					    <br>
					    <input type="text" name="p_quantity" class="product" id="p_quantity">
					</div>
					
					<div class="form-group">
					    <label for="p_brand">Enter product brand</label>
					    <br>
					    <input type="text" name="p_brand" class="product" id="p_brand">
					</div>
					
					<div class="form-group">
					    <label for="p_description">Enter product Description</label>
					    <br>
					    <input type="text" name="p_description" class="product" id="p_description">
					</div>
					
					<div class="form-group">
					    <label for="p_image">Provide image </label>
					    <br>
					    <input type="file" name="p_image" class="product" id="p_image">
					</div>
					
					<br>

					<button class="btn btn-primary">Add product</button>
				
					
			 </form>
						
		 	
		 </div>





   <%@include file="footer.jsp" %>


</body>
</html>