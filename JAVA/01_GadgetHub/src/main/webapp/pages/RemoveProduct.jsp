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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/RemoveProduct.css">   
</head>
<body>

<%@include file="admin_header.jsp" %>
<div id="main1">
    <div id="main2">
        <form action="${pageContext.request.contextPath}/RemoveProduct" method="post" class="form-container" style=" margin: 10px 10px 10px 10px;">
            <p id="st1" class="form-heading">Remove product form</p>
            <p id="st2" class="label">Enter the Product ID:</p>
            <input type="text" id="productID" name="p_id" class="input-field" required><br><br>
            <button type="submit" class="submit-btn">Remove</button>
        </form>
    </div>
</div>

<%@include file="footer.jsp" %>
</body>
</html>

</html>