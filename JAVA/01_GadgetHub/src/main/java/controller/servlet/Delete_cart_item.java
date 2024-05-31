package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dbconnection.DbConnectioin;
import util.StringUtils;

@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.delete_cart_item})

public class Delete_cart_item extends HttpServlet {
	  
	   DbConnectioin dbconnection_obj=new DbConnectioin();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		String cart_id=req.getParameter("cart_id");
		int c_id_int=Integer.parseInt(cart_id);
		int result=dbconnection_obj.deleteCartItem(c_id_int);
		RequestDispatcher rd;
		if(result>=1) {
			showAlert(resp, "Delete success of item id = "+cart_id, req);
			return;
		}
		else {
			showAlert(resp, "Delete Failed of item id = "+cart_id, req);
			return;
		}
		}catch(Exception o){
			System.out.println("test1");
			System.out.println("Exception caught in delete cart item servlet");
			System.out.println(o.getMessage().toString());
			 showAlert(resp,"Sorry.Try again.", req);
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
