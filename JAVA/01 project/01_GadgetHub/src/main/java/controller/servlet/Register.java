package controller.servlet;

import java.io.IOException;   
import java.io.PrintWriter;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.dbconnection.DbConnectioin;
import model.AddClientModel;
import util.StringUtils;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB)
@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.REGISTER_SERVLET})
public class Register extends HttpServlet {
	DbConnectioin dbconnection_obj=new DbConnectioin();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
	
		String first_name=req.getParameter("user_first_name");
		String last_name=req.getParameter("user_last_name");
		String email=req.getParameter("user_email");
		String phone_number=req.getParameter("user_phone_number");
		String dob=req.getParameter("user_dob");
		String gender=req.getParameter("user_gender");
		String username=req.getParameter("user_username_s");
		String password=req.getParameter("user_password_s");
		String retype_password=req.getParameter("retype_password"); 
		String address=req.getParameter("user_address");
		
		
		System.out.println("dob value");
		System.out.println(dob);
		
		if (first_name.isEmpty() || last_name.isEmpty() || email.isEmpty() || phone_number.isEmpty() || dob.isEmpty() || gender.isEmpty() || username.isEmpty() || password.isEmpty() || retype_password.isEmpty() || address.isEmpty()) {
		    showAlertRegister(resp, "All fields are required. Please fill in all the fields.", req);
		    return;
		}
		
		if (!isValidName(first_name) || !isValidName(last_name)) {
            showAlertRegister(resp, "Invalid first or last name format. Names should not contain numbers or special characters.",req);
            return;
        }

        if (username.length() <= 6 || !isValidUsername(username)) {
            showAlertRegister(resp, "Invalid username format or length. Username should be more than 6 characters and not contain special characters.",req);
            return;
        }

        if (!isValidPhoneNumber(phone_number)) {
            showAlertRegister(resp, "Invalid phone number format. Phone numbers should start with '+' and have a length of 14 characters.",req);
            return;
        }

        // Password Complexity Requirement
        if (!isValidPassword(password, retype_password)) {
            showAlertRegister(resp, "Invalid password format. Passwords should be longer than 6 characters, include at least one number, one special character, and one capital letter. Retype password correctly.",req);
            return;
        }
        
        //changing string date to datetime object
        
        LocalDate dob1 = LocalDate.parse(dob);
        
        if (dob1.isAfter(LocalDate.now())) {
            showAlertRegister(resp, "Invalid birthdate. Birthdate should not be later than the current date.",req);
            return;
        }
        
        if ( dbconnection_obj.isUserNameExists(username) || dbconnection_obj.isEmailExists(email) ||  dbconnection_obj.isPhoneNumber(phone_number)) {
            showAlertRegister(resp, "Username, email, or phone number already exists. Choose unique values.",req);
            return;
        }
        
    	Part profile_image_file=req.getPart("profile_image");
		System.out.println("1");
		System.out.println(profile_image_file);
		
		if (profile_image_file==null)
		{
			showAlertRegister(resp,"Provid profile image and try again.", req);
			return;
		}
        
        AddClientModel add_clien_model_obj=new AddClientModel(first_name, last_name, email, phone_number, dob1, gender, username, retype_password, password, address,profile_image_file);
    	
		String savePath = StringUtils.images_dir_path;
		String fileName=add_clien_model_obj.getProfile_image();
		
		if (!fileName.isEmpty() && fileName != null) {
			profile_image_file.write(savePath + fileName);
		}
		
		System.out.println("file name");
		System.out.println(profile_image_file);
		
        //calling method
        int result=dbconnection_obj.addClient(add_clien_model_obj);
        if(result ==1) {
        	System.out.println("register.java 1");
        	showAlert(resp,"Register success", req);
        	return;
        }
        else {
        	System.out.println("register.java ! 1");
        	showAlertRegister(resp,"Failed to register client", req);
        	return;
        }
		}catch(Exception o) {
			System.out.println(o);
			showAlertRegister(resp, "Invalid datatype format", req);
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
	
	private void showAlertRegister(HttpServletResponse resp, String message,HttpServletRequest req) throws IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('" + message + "');");
        out.println("window.location.href = '" + req.getContextPath() + "/pages/register.jsp';");
        out.println("</script>");
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

    private boolean isValidPassword(String password, String retypePassword) {
        // Add your password complexity logic here
        return password.length() > 6 && password.equals(retypePassword) && password.matches(".*[A-Z].*") && password.matches(".*\\d.*") && password.matches(".*[^a-zA-Z0-9].*");
    }
	
}// Register
