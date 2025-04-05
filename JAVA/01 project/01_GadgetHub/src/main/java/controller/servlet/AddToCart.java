package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dbconnection.DbConnectioin;
import model.CartModel;
import util.StringUtils;

@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.Add_TO_CART})
public class AddToCart extends HttpServlet  {
	DbConnectioin dbconnection_obj=new DbConnectioin();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		 String current_c_id=req.getParameter("c_id");
		 String p_id=req.getParameter("p_id");
		 String client_select_quantity=req.getParameter("c_s_quantity");
		 String p_unit_price=req.getParameter("price");
		 
		 System.out.println(current_c_id);
		 System.out.println(p_id);
		 System.out.println(client_select_quantity);
		 System.out.println(p_unit_price);
		 
		 int c_id_int=Integer.parseInt(current_c_id);
		 int p_id_int=Integer.parseInt(p_id);
		 int c_s_quantity_int=Integer.parseInt(client_select_quantity);
		 int p_u_price_int=Integer.parseInt(p_unit_price);
		 
		 int total_price=p_u_price_int*c_s_quantity_int;
		 
		 CartModel cart_obj=new CartModel(p_id_int,c_id_int);
		 
		 int result=dbconnection_obj.addCart(cart_obj,c_s_quantity_int,total_price);
		 if(result>=1) {
			 showAlert(resp,"Inserting product in cart success", req);
			 return;
		 }else {
			 showAlert(resp,"Inserting product in cart Failed", req);
			 return;
		 }
		}catch(Exception o){
			System.out.println(o.getMessage().toString());
			 showAlert(resp,"Add to cart failed.Provide valid quantity.", req);
			 return;
			
		}
	}
	private void showAlert(HttpServletResponse resp, String message,HttpServletRequest req) throws IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('" + message + "');");
        out.println("window.location.href = '" + req.getContextPath() + "/pages/products.jsp';");
        out.println("</script>");
    }
}
