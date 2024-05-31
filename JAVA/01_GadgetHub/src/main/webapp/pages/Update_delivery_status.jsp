<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/Update_delivery_status.css">
   
   
   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/footer.css">
  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/admin_header.css">



</head>
<body>

<%@include file="admin_header.jsp" %>
   




<form action="${pageContext.request.contextPath}/update_deliver_servlet" method="post">
    <label for="order_id">Enter Order ID:</label>
    <input type="text" id="order_id" name="order_id" required>
    <br>
    <label for="delivery_status">Enter Delivery Status:</label>
    <input type="text" id="delivery_status" name="delivery_status" required>
    <br>
    <button type="submit">Submit</button>
</form>


 <%@include file="footer.jsp" %>








</body>
</html>