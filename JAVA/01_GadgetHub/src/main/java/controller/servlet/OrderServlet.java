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

@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.order_cart_item})
public class OrderServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try{
		
		DbConnectioin dbconnection_obj=new DbConnectioin();
	
	
		int userId = -1; // Default value if session or userId attribute is not available
		
		HttpSession session = req.getSession(false);
		
		if (session != null) {
		    int userIdClient_int = (int)session.getAttribute("userId_client");
		    userId=userIdClient_int;
		    String userIdClient_str = String.valueOf(userId);
		    
		    if (userIdClient_str != null && !userIdClient_str.isEmpty()) {
		        // Client session exists
		        System.out.println("Client session is active. User ID: " + userId);
		        int result=dbconnection_obj.add_order_history(userId);
		        if(result==1) {
		        	System.out.println("Inserting order hisstory success");
		        	int result_update_q=dbconnection_obj.update_q_order(userId);
		        	if(result_update_q==1) {
		        		System.out.println("UPDATING QUANTITY IN PRODUCTS INFO SUCCESS");
		        		showAlert(resp, "Order success", req);
			        	return;
		        		
		        	}
		        	else {
		        		System.out.println("UPDATING QUANTITY IN PRODUCTS INFO Failed");
		        		showAlert(resp, "Order Failed", req);
			        	return;
		        	}
		        }
		        else {
		        	showAlert(resp, "Item order fail.", req);
		        	return;
		        	
		        }
		        
		    } 
		    else {
		    	showAlert(resp, "Item order fail.No session of client exist.", req);
	        	return;
		 
		    }
		}
		}catch(Exception o) {
			System.out.println(o.getMessage());
			showAlert(resp, "Reload page and Try again.", req);
        	return;
			
		}
	}
	
	private void showAlert(HttpServletResponse resp, String message,HttpServletRequest req) throws IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('" + message + "');");
        out.println("window.location.href = '" + req.getContextPath() + "/pages/cart.jsp';");
        out.println("</script>");
    }
	
	
}
