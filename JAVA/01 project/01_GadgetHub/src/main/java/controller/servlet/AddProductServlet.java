package controller.servlet; 

import java.io.FileOutputStream ;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import controller.dbconnection.DbConnectioin;
import model.AddProductModel;
import util.StringUtils;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB)
@WebServlet(asyncSupported = true, urlPatterns = {StringUtils.add_products_servlet})
public class AddProductServlet extends HttpServlet {
	DbConnectioin dbconnection_obj=new DbConnectioin();
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
		
		String p_id = req.getParameter("p_id");
		String p_name = req.getParameter("p_name");
		String p_unit_price = req.getParameter("p_unit_price");
		String p_quantity = req.getParameter("p_quantity");
		String p_brand = req.getParameter("p_brand");
		String p_description=req.getParameter("p_description");
	
		
		if (p_id == null || p_id.isEmpty() ||
			    p_name == null || p_name.isEmpty() ||
			    p_unit_price == null || p_unit_price.isEmpty() ||
			    p_quantity == null || p_quantity.isEmpty() ||
			    p_brand == null || p_brand.isEmpty() ||
			    p_description==null || p_description.isEmpty()
			    )
		{
			
			showAlertAddProduct(resp,"Please fill all the field and try again.", req);
			return;
			  
		}
		
		int p_int_id=Integer.parseInt(p_id);
		int p_int_unit_price=Integer.parseInt(p_unit_price);
		int p_int_quantity=Integer.parseInt(p_quantity);
		
		Part p_image_file=req.getPart("p_image");
		System.out.println("1");
		System.out.println(p_image_file);
		
		if (p_image_file==null)
		{
			
			showAlertAddProduct(resp,"Please provide image and try again.", req);
			return;
			  
		}
		
		AddProductModel addproductmodel_obj=new AddProductModel(p_int_id, p_name, p_int_unit_price, p_int_quantity, p_brand, p_image_file, p_description);
		
		String savePath = StringUtils.images_dir_path;
		String fileName=addproductmodel_obj.getP_image();
		
		if (!fileName.isEmpty() && fileName != null) {
			p_image_file.write(savePath + fileName);
		}
		
		System.out.println("file name");
		System.out.println(p_image_file);
		
		int result=dbconnection_obj.add_products(addproductmodel_obj);
		if(result==1) {
			System.out.println("Adding Products success");
			showAlertAddProduct(resp,"Adding Products success", req);
			
		}else {
			System.out.println("Adding Products Failed");
			showAlertAddProduct(resp,"Adding Products Failed", req);
			return;
			
		}
		}catch(Exception o) {
			System.out.println("Exception caught in addproduct servlet");
			System.out.println(o.getMessage());
			showAlertAddProduct(resp,"Adding Products Failed.Provide valid format in all input field.", req);
			return;
			
		}
		
		

	}
	
	private void showAlertAddProduct(HttpServletResponse resp, String message,HttpServletRequest req) throws IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('" + message + "');");
        out.println("window.location.href = '" + req.getContextPath() + "/pages/add_product.jsp';");
        out.println("</script>");
    }
	

}





