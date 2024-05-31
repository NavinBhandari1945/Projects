package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dbconnection.DbConnectioin;

@WebServlet("/RemoveProduct")

public class RemoveProduct extends HttpServlet  {
	DbConnectioin dbconnection_obj=new DbConnectioin();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String productId = req.getParameter("p_id");
		
		if(productId==null || productId.isEmpty()) {
			showAlert(resp, "Please fill the field propesrly", req);
		}
		
		try {
		int productId_i=Integer.parseInt(productId);
		boolean result=dbconnection_obj.getProductIdResult(productId_i);
		if(result==true) {
			int result2=dbconnection_obj.removeProduct(productId_i);
			if(result2==1) {
				showAlert(resp, "Removing product success", req);
				return;
			}
			else {
				showAlert(resp, "Removing product failed", req);
				return;
				
			}
			
		}else {
			
			showAlert(resp, "No product item with provided id exists.", req);
			return;
			
		}
		}catch(Exception o) {
			System.out.println(o);
			showAlert(resp, "Invalid id  format", req);
			return;
			
		}
	
	}
	
	private void showAlert(HttpServletResponse resp, String message,HttpServletRequest req) throws IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('" + message + "');");
        out.println("window.location.href = '" + req.getContextPath() + "/pages/RemoveProduct.jsp';");
        out.println("</script>");
    }
	
	
	
	

}
