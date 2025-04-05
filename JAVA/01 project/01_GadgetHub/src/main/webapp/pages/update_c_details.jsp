<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/Update_c_details.css">
   
   
   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/header.css">   
   

</head>
<body>
<%@include file="header.jsp" %>
   


<div id="main_body_02">
     	
					<form action="${pageContext.request.contextPath}/update_c_d_servlet" method="post" > 
						<div id="Update_Details_Form">Signin Form</div>				
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
						<label>Address</label>
						<br>	
						<input type="text" name="user_address" class="user_name">
						</div>
						<br>
						<button class="btn btn-primary">Update Details</button>
						<br>
						<br>
					</form>
					
		 </div>
		 
		  <%@include file="footer.jsp" %>
		 



</body>
</html>