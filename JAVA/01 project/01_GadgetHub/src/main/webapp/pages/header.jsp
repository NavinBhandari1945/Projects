<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>client-header</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/header.css">
</head>
<body>
	<% 
	HttpSession session_value_h = request.getSession(false);
	
	boolean isLoggedIn_client_h = session_value_h != null && session_value_h.getAttribute("userId_client") != null ;
	%>
	
    <div class="header" style="margin-bottom: 0px">
        <div class="navbar">
        
            <div class="logo">
                <img src="${pageContext.request.contextPath}/images/gadgethub.jpg">
                <p>GadgetHub</p>
              </div>
              
            <ul>
                <li><a href="${pageContext.request.contextPath}/pages/home.jsp">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/pages/products.jsp">Product</a></li>
                
                <%
                if(isLoggedIn_client_h==true){
                	%>
                	<li><a href="${pageContext.request.contextPath}/pages/cart.jsp">Cart</a></li>
	          <% 
                }else{
                	 %>
 	                 <li><a href="${pageContext.request.contextPath}/cart_nl_servlet">Cart</a></li>
                	<% 
                }
                %>
                
                <li><a href="${pageContext.request.contextPath}/pages/aboutus.jsp">About</a></li>
                <%
                if(isLoggedIn_client_h==true){
                	%>
                	  <li><a href="${pageContext.request.contextPath}/pages/client_profile.jsp">Profile</a></li>
                	  <% 
                }
                %>
                
                <%
                
                if(isLoggedIn_client_h==false){
                	%>
                    <li>	
                    <a href="${pageContext.request.contextPath}/pages/login.jsp">
    				<button class="auth_btn">Login</button>
    				</a>
    				</li>
    				
                     <li>
                     
                     <a href="${pageContext.request.contextPath}/pages/register.jsp">
    				<button class="auth_btn">Register</button>
    				</a>
                     
                     </li>
                	
       <% 
                }
                
             
                %>
                
                
                <%
                if(isLoggedIn_client_h==true){
                	%>
                	
                <li>  
	                <a href="${pageContext.request.contextPath}/pages/OrderHistory.jsp">
					Order History
					</a>
				</li>
				
				<%
                }
                %>
            </ul>
        </div>
    </div>
</body>
</html>