<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false" %>
<%@page errorPage="error.jsp"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/admin_header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/admin_home.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/footer.css">



<title>Insert title here</title>
</head>
<body>


<%@include file="admin_header.jsp" %>

<br>
<div id="main_1">

		<div class="main_2">
		
		
	
				<a href="${pageContext.request.contextPath}/pages/add_product.jsp">
								<button class="btn">Add product</button>
				</a>

				<br>
				<br>
				
				<a href="${pageContext.request.contextPath}/pages/RemoveProduct.jsp">
							<button class="btn">Remove Product</button>
				</a>
				
				<br>
				<br>
			
				<a href="${pageContext.request.contextPath}/pages/UpdateQuantity.jsp">
							<button class="btn">Update quantity</button>
				</a>
			
				<br>
				<br>
			
				<a href="${pageContext.request.contextPath}/pages/Update_delivery_status.jsp">
							<button class="btn">Update Delivery Status</button>
				</a>
			</div>
		
</div>






   <%@include file="footer.jsp" %>


</body>

</html>