<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false" %>
<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/register.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/header.css">   
   




</head>
<body>

   


	
<div id="main_body_01">

     	<div id="main_body_02">
     	
					<form action="${pageContext.request.contextPath}/register_servlet" method="post" enctype="multipart/form-data"> 
						<p id="form_signin">Signin Form</p>
						<br>	
						<div class="form-group">
						<label>Enter first name</label>
						<br>	
						<input type="text" name="user_first_name" class="user_name">
						</div>
						
						<div class="form-group">
						<label>Enter last name</label>
						<br>	
						<input type="text" name="user_last_name" class="user_name">
						</div>
						
						<div class="form-group">
						<label>Enter email</label>
						<br>
						<input type="text" name="user_email" class="user_name">
						</div>
						
						<div class="form-group">
						<label>Enter phone number</label>
						<br>	
						<input type="text" name="user_phone_number" class="user_name">
						</div>
					
					
						
						<br>	
							
						
						<div class="form-group">
                            <label for="birthday">Birthday:</label>
                            <input type="date" name="user_dob" class="form-control user_name" id="birthday" required>
                        </div> 
						
						
		
						
						
					<div class="form-group">
                            <label for="gender">Gender:</label>
                            <select class="form-control user_name" id="gender" name="user_gender" required>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                            </select>
                        </div> 
						
						<div class="form-group">
						<label>Enter username</label>
						<br>	
						<input type="text" name="user_username_s" class="user_name">
						</div>
						
						<div class="form-group">
						<label>Enter password</label>
						<br>	
						<input type="text" name="user_password_s" class="user_name">
						</div>
						
						
						<div class="form-group">
						<label>Retype password</label>
						<br>	
						<input type="text" name="retype_password" class="user_name">
						</div>
						
						<div class="form-group">
						<label>Address</label>
						<br>	
						<input type="text" name="user_address" class="user_name">
						</div>
						<br>
						<div class="form-group">
						    <label for="p_image">Provide profile image </label>
						    <br>
						    <input type="file" name="profile_image" class="user_name" id="p_image">
						</div>
						
						<br>
			
						<button class="btn ">Register</button>
						
						<br>
						<br>
						
						
						
						
						<a href="${pageContext.request.contextPath}/pages/login.jsp">Login Page</a>
						
					</form>
					
		 </div>
		 
	
		 
		 
	</div>
	





</body>
</html>