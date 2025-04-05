package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.dbconnection.DbConnectioin;
import model.FeedbackModel;

@WebServlet("/SendFeedback_servlet")

public class FeedbackServlet extends HttpServlet{
	
	   DbConnectioin dbconnection_obj=new DbConnectioin();
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  try {
		   String name = req.getParameter("name");
	       String email = req.getParameter("email");
	       String message = req.getParameter("message");
	       
	       FeedbackModel feedback_obj=new FeedbackModel(name,email,message);
	       int result=dbconnection_obj.storeFeedback(feedback_obj);
	       
	       if(result ==1) {
	    	    showAlert(resp,"Feedbaack send success", req);
	    	    return;
	        }
	        else {
	        	showAlert(resp,"Feedbaack send failed", req);
	        	return;
	        }
	       }catch(Exception o){
	    	   System.out.println(o.toString());
	    	   showAlert(resp,"Reload page and Try again", req);
	       }
	       
	       
	       
	       
	       
	       
		
	
	}
	
	private void showAlert(HttpServletResponse resp, String message,HttpServletRequest req) throws IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('" + message + "');");
        out.println("window.location.href = '" + req.getContextPath() + "/pages/aboutus.jsp';");
        out.println("</script>");
    }
	
}
