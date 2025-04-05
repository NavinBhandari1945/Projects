package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.StringUtils;

@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.CART_U_NL})
public class CartNoLogin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		System.out.println("No user login  so cart cannot access");
		showAlert(resp,"Login First.", req);
		return;
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
