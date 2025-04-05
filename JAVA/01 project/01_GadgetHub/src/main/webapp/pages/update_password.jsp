<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false" %>
<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/Update_Password.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/header.css">   
   

</head>
<body>
<%@include file="header.jsp" %>
   



    
    <form action="${pageContext.request.contextPath}/u_p_servlet" method="post">
        <label for="productID">Enter the New Password.</label>
        <input type="text" id="new_p" name="new_p" required>
        <br>
        <button type="submit">Update</button>
    </form>
    
    <%@include file="footer.jsp" %>

</body>
</html>