<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>client-header</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/admin_header.css">
</head>
<body>

    <div class="header">
    
        <div class="navbar">
        
            <div class="logo">
                <img src="${pageContext.request.contextPath}/images/gadgethub.jpg">
                <p>Admin</p>
            </div>
            
            <ul>
                <li><a href="${pageContext.request.contextPath}/pages/admin_home.jsp">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/pages/admin_order_history.jsp">Order History</a></li>
                <li><a href="${pageContext.request.contextPath}/pages/admin_products_page.jsp">Product</a></li>
                
                <li>
                	<form action="${pageContext.request.contextPath}/logout_servlet" method="post">
    					<button type="submit" class="btn_a_h">Logout</button>
					</form>
				</li>
            </ul>
            
        </div>
        
    </div>
</body>
</html>