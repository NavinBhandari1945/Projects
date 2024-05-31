<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="controller.dbconnection.DbConnectioin"%>
<%@page import="model.*"%>
<%@page import="util.*"%>
<%@page import="java.util.*"%>
<%@page isELIgnored="false" %>
<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/header.css">   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheet/productdetails.css">  
   



</head>
<body>



	<%@include file="header.jsp" %>
	
	<br>
	<br>
		
	<%
	String p_id=request.getParameter("p_id");
	int int_p_id=Integer.parseInt(p_id);
	DbConnectioin dbconnection_obj=new DbConnectioin();
	List<AddProductModel> list=dbconnection_obj.getProductDetailsAll(int_p_id);
	for(AddProductModel ap_obj:list){
	%>	
	<div class="container text-center">
	    <div class="row justify-content-center">
	        <div class="col-md-3">
	            <div class="rounded-circle img-circle-container">
	                <img src="${pageContext.request.contextPath}/images/<%=ap_obj.getP_image()%>" width="150px" height="150px" class="img-thumbnail">
	            </div>
	        </div>
	    </div>
	    
	    <br>
	    <br>
	
	    <!-- Product information -->
	    <div class="row justify-content-center mt-3">
	        <div class="col-md-6">
	            <div class="card card-horizontal">
	                <div class="card-body text-center">
	                 	<p class="card-text">Id: <%= ap_obj.getId()%></p>
	                    <h5 class="card-title">Name: <%=ap_obj.getP_name()%></h5>
	                    <p class="card-text">Price: <%= ap_obj.getP_unit_price()%></p>
	                    <p class="card-text">Brand: <%= ap_obj.getP_brand()%></p>
	                    <p class="card-text">Description: <%= ap_obj.getP_description()%></p>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<% 
	}
	%>

	
	<%@include file="footer.jsp" %>








</body>
</html>