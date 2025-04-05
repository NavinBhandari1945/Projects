package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.crypto.ShortBufferException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dbconnection.DbConnectioin;

@WebServlet("/UpdateQuantity")

public class UpdateQuantity extends HttpServlet {
	DbConnectioin dbconnection_obj=new DbConnectioin();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
	
		String productId = req.getParameter("p_id");	
		String productQuantity = req.getParameter("p_quantity");
		
		if(productId.isEmpty() || productId==null
				|| productQuantity.isBlank() || productQuantity==null
				) {
			showAlert(resp, "Please fill the field properly", req);	
			return;
		}
	
		int productId_i=Integer.parseInt(productId);
		int productQuantity_i=Integer.parseInt(productQuantity);
	    boolean result=dbconnection_obj.getProductIdResult(productId_i);
		if(result==true) {
			int  avaQuantity=dbconnection_obj.avaProductQuantity(productId_i);
			if(avaQuantity==-1 ) {
				showAlert(resp,"Failed to update quantity", req);
				return;
			}
			else if(avaQuantity==-2) {
				showAlert(resp,"Exception caught during  updating quantity", req);
				return;
			}
		    else {
				int finalQuantity=productQuantity_i+avaQuantity;
				dbconnection_obj.updateQuantity(finalQuantity, productId_i);
				showAlert(resp, "Updating Qunatity Success", req);
				return;
			}
			
		}		
		else {
			
			showAlert(resp, "No product item with provided id exists", req);
			return;
			
		}
		}catch(Exception o) {
			System.out.println(o);
			showAlert(resp,"Invalid id or quantity datatype", req);
		    return;
		}
		
	}
	
	private void showAlert(HttpServletResponse resp, String message,HttpServletRequest req) throws IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('" + message + "');");
        out.println("window.location.href = '" + req.getContextPath() + "/pages/UpdateQuantity.jsp';");
        out.println("</script>");
    }

}
