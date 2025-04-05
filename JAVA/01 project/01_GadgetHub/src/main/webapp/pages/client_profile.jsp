<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="controller.dbconnection.*" %>
<%@ page import="util.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%@page isELIgnored="false" %>
<%@page errorPage="error.jsp"%>



<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/header.css">   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/client_profile.css">   
</head>
<body>
<%@include file="header.jsp" %>
   



    <div class="profile-container">
    
        <div class="profile-image-container">
		<%
		DbConnectioin dbcon_obj_1=new DbConnectioin();
		int userId = -1; 
		HttpSession session_value_c_p = request.getSession(false);
		
		 if (session_value_c_p != null) {
	
			   Integer userIdClient_int = (Integer) session_value_c_p.getAttribute("userId_client");

	
			   String userIdClient_str = (userIdClient_int != null) ? String.valueOf(userIdClient_int) : "";
			    
			   if (userIdClient_str != null && !userIdClient_str.isEmpty()) {
			     
			        userId=userIdClient_int;
			    } 
			  
			} 
		     
		
        String result=dbcon_obj_1.getClientProfileImage(userId);
   
    
     
        if(result=="exception" || result=="no_image"){
            %>
            <div class="profile-image">
               	<img src="" alt="No image">
           	</div>
            <% 
            }
            else{
            %>
         	<div class="profile-image">
         	
         		<img src="${pageContext.request.contextPath}/images/<%=result %>" alt="p i n s" class="img-thumblin">
         	
           	</div>
           <% 
            }
    		
		%>
        </div>
		<%
				String first_name_db = "";
		        String last_name_db = "";
		        String address_db = "";
		        String email_db = "";
		        String phone_number_db = "";
		        String dob_db = "";
		        String gender_db = "";
		       
		        	DbConnectioin dbcon_obj_2=new DbConnectioin();
		    		int userId_1 = -1; // Default value if session or userId attribute is not available
		    		HttpSession session_value_c_p_1 = request.getSession(false);
		    		
		    		 if (session_value_c_p_1 != null) {
		    	
		    			   Integer userIdClient_int_1 = (Integer) session.getAttribute("userId_client");

		    	
		    			   String userIdClient_str_1 = (userIdClient_int_1 != null) ? String.valueOf(userIdClient_int_1) : "";
		    			    
		    			   if (userIdClient_str_1 != null && !userIdClient_str_1.isEmpty()) {

		    			        userId_1=userIdClient_int_1;
		    			    } 
		    			  
		    			} 
		    		Connection conn=dbcon_obj_2.getConnection();
		    		PreparedStatement ps=conn.prepareStatement(StringUtils.get_client_data);
		    		ps.setInt(1,userId_1);
		    		ResultSet rs=ps.executeQuery(); 
		    		while(rs.next()) 
		    		{
		    			 first_name_db = rs.getString("first_name");
		    	         last_name_db = rs.getString("last_name");
		    	         address_db = rs.getString("address");
		    	         email_db = rs.getString("email");
		    	         phone_number_db = rs.getString("phone_number");
		    	         dob_db = rs.getString("dob");
		    	         gender_db = rs.getString("gender");
		    		}
		    		
		    			
		    		
		    	
		    		
    		
		%>
		
		<div class="profile-info">
		    <p>Full name: <span><%= first_name_db %> <%= last_name_db %></span></p>
		    <p>Email: <span><%= email_db %></span></p>
		    <p>PhoneNumber: <span><%= phone_number_db %></span></p>
		    <p>Address: <span><%= address_db %></span></p>
		    <p>Date of Birth: <span><%= dob_db %></span></p>
		    <p>Gender: <span><%= gender_db %></span></p>
		</div>
		
		<br>
		  <form action="${pageContext.request.contextPath}/pages/update_c_details.jsp" method="post">
            <button type="submit" class="logout-btn">Update Details</button>
        </form>
        
         <br>
        <form action="${pageContext.request.contextPath}/pages/update_password.jsp" method="get">
            <button type="submit" class="logout-btn">Update Password</button>
        </form>
        
        <br>
        <form action="${pageContext.request.contextPath}/logout_servlet" method="post">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>
    
  <%@include file="footer.jsp" %>
</body>
</html>
