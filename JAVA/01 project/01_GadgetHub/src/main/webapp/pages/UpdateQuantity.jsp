<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/UpdateQuantity.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/admin_header.css">
   

</head>
<body>

<%@include file="admin_header.jsp" %>
   

    <form action="${pageContext.request.contextPath}/UpdateQuantity" method="post">
        <label for="productID">Product ID:</label>
        <input type="text" id="productID" name="p_id" required><br><br>
        
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="p_quantity" required><br><br>
        
        <button type="submit">Update</button>
    </form>
    
  <%@include file="footer.jsp" %>

</body>
</html>