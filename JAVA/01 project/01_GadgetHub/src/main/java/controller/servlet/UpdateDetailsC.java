package controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.dbconnection.DbConnectioin;
import util.StringUtils;

@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.UPDATE_C_DETAILS_SERVLET})
public class UpdateDetailsC extends HttpServlet {
	DbConnectioin dbconnection_obj=new DbConnectioin();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		
		// Retrieve parameter values from the request
		String userFirstName = req.getParameter("user_first_name");
		String userLastName = req.getParameter("user_last_name");
		String userEmail = req.getParameter("user_email");
		String userPhoneNumber = req.getParameter("user_phone_number");
		String userDOB = req.getParameter("user_dob");
		String userGender = req.getParameter("user_gender");
		String userAddress = req.getParameter("user_address");
		
		if (userFirstName.isEmpty() || userLastName.isEmpty() || userEmail.isEmpty() || userPhoneNumber.isEmpty() || userDOB.isEmpty() || userGender.isEmpty() ||  userAddress.isEmpty()) {
		    showAlert(resp, "All fields are required. Please fill in all the fields.", req);
		    return;
		}
		
		if (!isValidName(userFirstName) || !isValidName(userLastName)) {
            showAlert(resp, "Invalid first or last name format. Names should not contain numbers or special characters.",req);
            return;
        }
		
		 if (!isValidPhoneNumber(userPhoneNumber )) {
	            showAlert(resp, "Invalid phone number format. Phone numbers should start with '+' and have a length of 14 characters.",req);
	            return;
	        }
		 
		 if (  dbconnection_obj.isEmailExists(userEmail) ||  dbconnection_obj.isPhoneNumber(userPhoneNumber)) {
	            showAlert(resp, "Username, email, or phone number already exists. Choose unique values.",req);
	            return;
	        }

        
        //changing string date to datetime object
        
        LocalDate dob1 = LocalDate.parse(userDOB);
        
        if (dob1.isAfter(LocalDate.now())) {
            showAlert(resp, "Invalid birthdate. Birthdate should not be later than the current date.",req);
            return;
        }
        
        int userId = -1;
        HttpSession session_value = req.getSession(false);
     		if (session_value != null) {
     		    Integer userIdObj = (Integer) session_value.getAttribute("userId");
     		    if (userIdObj != null) {
     		        userId = userIdObj.intValue(); // Convert Integer to int
     		    }
     		}
        
       int result=dbconnection_obj.UpdateDetailsClient(userId, userFirstName, userLastName, userEmail, userPhoneNumber, dob1, userGender, userAddress);
        
        if(result>=1) {
        	showAlert(resp,"Update details Success", req);
        }else {
        	showAlert(resp, "Update details Failed", req);
        }
		}catch(Exception o) {
			System.out.println(o.getMessage());
			showAlert(resp, "Reload page and Try again.", req);
        	return;
			
		}
        
        
	}
	
	private boolean isValidName(String name) {
        return name.matches("[a-zA-Z]+");
    }
	
	private boolean isValidUsername(String username) {
        return username.matches("[a-zA-Z0-9]+");
    }

    private boolean isValidPhoneNumber(String phoneNumber) {
        return phoneNumber.matches("\\+[0-9]{13}");
    }
	
	private void showAlert(HttpServletResponse resp, String message,HttpServletRequest req) throws IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('" + message + "');");
        out.println("window.location.href = '" + req.getContextPath() + "/pages/update_c_details.jsp';");
        out.println("</script>");
    }
	

}
