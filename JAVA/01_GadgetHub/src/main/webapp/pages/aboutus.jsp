<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@page isELIgnored="false" %>
<%@page errorPage="error.jsp"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/aboutus.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/header.css">


</head>
<body>

<%@include file="header.jsp" %>
  
        <div class="icons">
            <div id="menu-btn" class="fas fa-bars"></div>
            <a href="#" class="fas fa-user-circle"></a>
            <a href="#" class="fas fa-search"></a>
            <a href="#" class="fas fa-shopping-cart"></a>
        </div>
        
        


    <div class="container">
        <div class="content">
            <div class="left">
                <!-- Address Details -->
                <div class="address details">
                    <i class="fas fa-map-marker-alt"></i>
                    <div class="topic">Address</div>
                    <div class="text-one">Dulari-4, Nepa </div>
                    <div class="text-two">Jhapa</div>
                </div>
                <!-- Phone Details -->
                <div class="phone details">
                    <i class="fas fa-phone-alt"></i>
                    <div class="topic">Phone</div>
                    <div class="text-one">+977 982435068</div>
                </div>
                <!-- Email Details -->
                <div class="email details">
                    <i class="fas fa-envelope"></i>
                    <div class="topic">Email</div>
                    <div class="text-one">Gadgethub@gmail.com</div>
                </div>
            </div>
            <!-- Contact Form -->
            <div class="right">
                <div class="topic-text">Send a message to our Admin</div>
              
                
                <form action="${pageContext.request.contextPath}/SendFeedback_servlet" method="post"">
                    <div class="input-box">
                        <input name="name" type="text" id="name" placeholder="Enter your name" required>
                    </div>
                    <div class="input-box">
                        <input name="email" type="text" id="email" placeholder="Enter your email" required>
                    </div>
                    <div class="input-box message-box">
                        <textarea name="message" id="message" placeholder="write us a message" rows="4" cols="50" required></textarea>
                    </div>
                    <div class="button">
                        <button>Send Now</button>
                    </div>
                </form>
                
                
            </div>
        </div>
    </div>
    
<%@include file="footer.jsp" %>


</body>
</html>