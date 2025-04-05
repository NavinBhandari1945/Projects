package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dbconnection.DbConnectioin;
import util.StringUtils;

@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.update_delivery_servlet})

public class UpdateDeliveryStatus extends HttpServlet {
	  DbConnectioin dbconnection_obj=new DbConnectioin();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		String orderId = req.getParameter("order_id");
		String deliveryStatus = req.getParameter("delivery_status");

		// Check if the parameters are not null before saving them
		if (orderId != null && deliveryStatus != null && !orderId.isEmpty() && !deliveryStatus.isEmpty()) {
		    String orderIdStr = orderId.trim(); 
		    String deliveryStatusStr = deliveryStatus.trim(); 
		    
		    int order_id=Integer.parseInt(orderIdStr);
		    
		    int result=dbconnection_obj.update_delivery_staetus(order_id, deliveryStatusStr);
		   
			if(result>=1 ) {
				showAlert(resp,"Success to update Delivery status.", req);
				return;
			}
			else{
				showAlert(resp,"Success to update Delivery status.", req);
				return;
			}
		} else {
			showAlert(resp, "Please fill the provide field properly.", req);
			return;
		}
		}catch(Exception o) {
			System.out.println(o.getMessage().toString());
			showAlert(resp, "Reload page and Try again.", req);
			return;
			
		}
	}
	
	private void showAlert(HttpServletResponse resp, String message,HttpServletRequest req) throws IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('" + message + "');");
        out.println("window.location.href = '" + req.getContextPath() + "/pages/Update_delivery_status.jsp';");
        out.println("</script>");
    }
	
	

}
