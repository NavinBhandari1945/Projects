<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false" %>
<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/login.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/header.css">
</head>
<body>

<div id="main_cont">

		 <div id="main_body_01">
		 
		 	<form action="${pageContext.request.contextPath}/login_servlet" method="post" > 
		 	       
		 		    <div id="login_title">Login Form</div>	
		 		    
		 		    <br>
						
		 			<div class="form-group">
						<label>Enter username</label>
						<br>	
						<input type="text" name="user_username_l" class="user_name">
					</div>
					
					<div class="form-group">
						<label>Enter password</label>
						<br>	
						<input type="text" name="user_password_l" class="user_name">
					</div>
					
					<br>
					
					<button class="btn">Login</button>
					<br>
					<br>
					
					<div>Don't register</div>
					
					<br>
					
					<a href="${pageContext.request.contextPath}/pages/register.jsp">Register page</a>
					<br>
					
					<a href="${pageContext.request.contextPath}/pages/home.jsp">Home page</a>
						
			 </form>
						
		 	
		 </div>


</div>







</body>
</html>