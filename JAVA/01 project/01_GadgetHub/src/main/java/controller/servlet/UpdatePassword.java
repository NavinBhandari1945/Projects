package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.dbconnection.DbConnectioin;
import util.StringUtils;

@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.update_password_s})
public class UpdatePassword  extends HttpServlet{
	
	   
	   DbConnectioin dbconnection_obj=new DbConnectioin();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		String new_password=req.getParameter("new_p");
		int userId = -1; 
		HttpSession session_value_u_p = req.getSession(false);
		
		 if (session_value_u_p != null) {
	
			   Integer userIdClient_int = (Integer) session_value_u_p.getAttribute("userId_client");

	
			   String userIdClient_str = (userIdClient_int != null) ? String.valueOf(userIdClient_int) : "";
			    
			   if (userIdClient_str != null && !userIdClient_str.isEmpty()) {
			     
			        userId=userIdClient_int;
			    } 
			  
			} 
		 
		 if(userId!=-1) {
			  
			 int result=dbconnection_obj.updatePassword(userId, new_password);
			 
				if(result>=1 ) {
					showAlert(resp,"Success to update password", req);
					return;
				}			
			else {
				showAlert(resp, "Failed to update password.", req);
				return;
				
			}
				
			  
		 }else {
			 showAlert(resp,"Logout and Relogin.", req);
			 return;
		 }
		
		 
		}catch(Exception o) {
			System.out.println("exception caught");
			System.out.println(o.getMessage());
			showAlert(resp, "Failed to update password.", req);
			return;
			
		}
		

	}

private void showAlert(HttpServletResponse resp, String message,HttpServletRequest req) throws IOException {
    resp.setContentType("text/html");
    PrintWriter out = resp.getWriter();
    out.println("<script type=\"text/javascript\">");
    out.println("alert('" + message + "');");
    out.println("window.location.href = '" + req.getContextPath() + "/pages/update_password.jsp';");
    out.println("</script>");
}
	
	

}
