package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.StringUtils;



/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.LOGOUT_SERVLET})
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		Cookie[] cookies = request.getCookies();
		System.out.println("logout start");
		if(cookies != null) {
			for (Cookie cookie: cookies) {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
		HttpSession session = request.getSession(false);
		System.out.println("1");
		if (session!=null) {
			session.invalidate();
		}
		System.out.println("Logout success");
		showAlert(response,"Logout Success", request);
		return;
		}catch(Exception o) {
			System.out.println("Exception caught in Logout servlet servlet");
			System.out.println(o.getMessage());
			showAlert(response,"Reload page and Try again", request);
			return;
			
		}
	}
	
	private void showAlert(HttpServletResponse resp, String message,HttpServletRequest req) throws IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('" + message + "');");
        out.println("window.location.href = '" + req.getContextPath()+"/pages/home.jsp';");
        out.println("</script>");
    }

}
