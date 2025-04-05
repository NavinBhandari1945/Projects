package controller.servlet;

import java.io.IOException;   
  
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import controller.dbconnection.DbConnectioin;
import util.StringUtils;

@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.LOGIN_SERVLET})
public class Login extends HttpServlet {
	
	DbConnectioin dbconnection_obj=new DbConnectioin();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		String userName = req.getParameter("user_username_l");
        String password = req.getParameter("user_password_l");
        RequestDispatcher rd;
        
        int result=dbconnection_obj.getClientLoginDetails(userName, password,req);
        System.out.println(result);
        
        //client
        if(result==1) {
        
        	Cookie usernameCookie_c = new Cookie("usernameCookie_c", userName);
        	Cookie passwordCookie_c = new Cookie("passwordCookie_c", password);
        	
        	usernameCookie_c.setMaxAge(30*60);
        	passwordCookie_c.setMaxAge(30*60);
        	
        	resp.addCookie(usernameCookie_c);
        	resp.addCookie(passwordCookie_c);
        	
         	rd=req.getRequestDispatcher(StringUtils.home_page);
        	rd.forward(req, resp);
        }
        
        //admin
    	//admin id=1
        else if(result==2) {	
        	Cookie usernameCookie_a = new Cookie("usernameCookie_a", userName);
        	Cookie passwordCookie_a = new Cookie("passwordCookie_a", password);
        	usernameCookie_a.setMaxAge(30*60);
        	passwordCookie_a.setMaxAge(30*60);
        	resp.addCookie(usernameCookie_a);
        	resp.addCookie(passwordCookie_a);
        	
        	rd=req.getRequestDispatcher(StringUtils.admin_home_page);
        	rd.forward(req, resp);
        }
        
        //wrong password
        else if(result==3) {
        	showAlert(resp,"Incorrect password.", req);
        	return;
        }
        
        //no any user exists
        else if(result==-1) {
        	showAlert(resp, "Please go and register", req);
        	return;
        }
        
        //exception
        else if(result==-2) {
        	showAlert(resp, "Exception while logging", req);
        	return;
        }
        
		}catch(Exception o) {
			System.out.println("Exception caught in login servlet");
			System.out.println(o.getMessage());
			showAlert(resp,"Reload page and Try again", req);
			return;
			
		}
      
      
	
	}//do post
	private void showAlert(HttpServletResponse resp, String message,HttpServletRequest req) throws IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('" + message + "');");
        out.println("window.location.href = '" + req.getContextPath() + "/pages/login.jsp';");
        out.println("</script>");
    }
	
}//class
