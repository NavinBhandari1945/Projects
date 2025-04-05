package controller.dbconnection;

import java.sql.Connection;    
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.AddClientModel;
import model.AddProductModel;
import model.CartModel;
import model.CartProductDetailsModel;
import model.FeedbackModel;
import model.OrderHistoryModel;
import model.PasswordEncryptionWIthAes;
import util.StringUtils;

public class DbConnectioin {
	
	public Connection getConnection() throws SQLException, ClassNotFoundException {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gadgethub", "root", "2075");
		} catch (Exception o) {
			System.out.println(o);
		}
		return conn;
	}//getConnection
	
	public boolean isUserNameExists(String username) {
		try (Connection con = getConnection()) {
			PreparedStatement st = con.prepareStatement(StringUtils.GET_CLIENT_INFO_USERNAME);
			st.setString(1, username);
			
			ResultSet rs = st.executeQuery();
			
			return rs.next();
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	public boolean isPhoneNumber(String phoneNumber) {
		try (Connection con = getConnection()) {
			PreparedStatement st = con.prepareStatement(StringUtils.GET_CLIENT_INFO_PHONE);
			st.setString(1, phoneNumber);
			
			ResultSet rs = st.executeQuery();
			
			return rs.next();
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	public boolean isEmailExists(String email) {
		try (Connection con = getConnection()) {
			PreparedStatement st = con.prepareStatement(StringUtils.GET_CLIENT_INFO_EMAIL);
			st.setString(1, email);
			ResultSet rs = st.executeQuery();
			
			return rs.next();
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	public int addClient(AddClientModel client_model) {
		try {

			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement(StringUtils.insert_client_form);
			

            // Encrypt password before storing it in the database
            String encryptedPassword = PasswordEncryptionWIthAes.encryptPassword(client_model.getPassword(), "U3CdwubLD5yQbUOG92ZnHw==");
            String encryptedRetypePassword = PasswordEncryptionWIthAes.encryptPassword(client_model.getRetypePassword(), "U3CdwubLD5yQbUOG92ZnHw==");
            
            
			ps.setString(1, client_model.getFirst_name());
			ps.setString(2, client_model.getLast_name());
			ps.setString(3, client_model.getEmail());
			ps.setString(4, client_model.getPhone_number());
			ps.setDate(5,Date.valueOf(client_model.getDob()));
			ps.setString(6, client_model.getGender());
			ps.setString(7, client_model.getUsername());
			ps.setString(8, encryptedPassword);
			ps.setString(9, encryptedRetypePassword);
			ps.setString(10, client_model.getAddress()); 
			ps.setString(11, client_model.getProfile_image());
			int result=ps.executeUpdate(); 
			  if(result>=1) {
			  System.out.println("inserting client data in database success"); 
			  return 1;
			  }else { 
				  System.out.println("inserting client data in database failed"); 
				  return-1;
				  }
		} catch (Exception o) {
			System.out.println(o);
			System.out.println("exception caught in add student method ");
			 return -1; 
		}

	}
	
	public int getClientLoginDetails(String username,String password,HttpServletRequest request)  {
		try {
		Connection conn=getConnection();
		PreparedStatement ps=conn.prepareStatement(StringUtils.get_client_login_data);
		ResultSet rs=ps.executeQuery(); 
		while(rs.next()) 
		{
			int id_db_int = rs.getInt("id");
			String id_db = Integer.toString(id_db_int);
			
			String username_db=rs.getString("username");
			String password_db=rs.getNString("password");
			
			String role_db=rs.getString("role");
			
			  // Decrypt password from database and compare
            String decryptedPassword = PasswordEncryptionWIthAes.decryptPassword(password_db, "U3CdwubLD5yQbUOG92ZnHw==");
			
			
			//admin
			
			//admin id=1 role="admin"
			if(decryptedPassword!=null && !decryptedPassword.isEmpty() && username_db.equals(username) && decryptedPassword.equals(password) && id_db.equals("1") && role_db.equals("admin"))
			{
				int return_value=2;
				System.out.println("admin conditdodn 2");
				
				HttpSession adminSession = request.getSession();
				System.out.println("user sesssion created = "+id_db_int);
				adminSession.setAttribute("userId_admin", id_db_int);
				adminSession.setMaxInactiveInterval(60*30);
				System.out.println("return value = "+return_value);
				return return_value;
			}
			
			//wrong password
			else if(username_db.equals(username) && !decryptedPassword.equals(password) )
			{
				int return_value=3;
				System.out.println("wrong password conditdodn 3");
				return return_value;
			}
			
			//client
			else if(username_db.equals(username) && decryptedPassword.equals(password) )
			{
				int return_value=1;
				System.out.println("client conditdodn 1");
				HttpSession userSession = request.getSession();
				System.out.println("user sesssion created = "+id_db_int);
				userSession.setAttribute("userId_client", id_db_int);
				userSession.setMaxInactiveInterval(60*30);	
				System.out.println("return value = "+return_value);
				return return_value;
			}
			
		}//while
		
		//no client
		return -1;
		}//try
		catch(Exception o) 
		{
			System.out.println(o);
			System.out.println("exceptiion caught in getuserlogin details method");
			return -2;
		}//catch
	}	
	
	public int add_products(AddProductModel add_p_model_obj) 
	{
		
		try {
			
			Connection conn=getConnection();
			PreparedStatement ps=conn.prepareStatement(StringUtils.insert_products_details);
			ps.setString(1, add_p_model_obj.getP_name());
			ps.setString(2, add_p_model_obj.getP_image());
			ps.setInt(3,add_p_model_obj.getP_unit_price());
			ps.setInt(4,add_p_model_obj.getId());
			ps.setInt(5, add_p_model_obj.getP_quantity());
			ps.setString(6, add_p_model_obj.getP_brand());
			ps.setString(7, add_p_model_obj.getP_description());
			int result=ps.executeUpdate();
			 if(result>=1) {
			  System.out.println("inserting products details in database success"); 
			  return 1;
			  }else { 
				  System.out.println("inserting products details in database failed"); 
				  return-1;
				  }
			
		}catch(Exception o) {
			System.out.println("Exceptiion caught in add products method");
			System.out.println(o);
			return -1;
		}
		
		
		
	}
	
	public int get_products_details() {
		
		try {
			Connection conn=getConnection();
			PreparedStatement ps=conn.prepareStatement(StringUtils.get_products_details);
			ResultSet rs=ps.executeQuery(); 
			while(rs.next()) 
			{
				int p_id = rs.getInt("p_id");
				int p_quantity = rs.getInt("p_quantity");
				int p_unit_price = rs.getInt("p_unit_price");
				String p_name = rs.getString("p_name");
				String p_image = rs.getString("p_image");
				String p_brand = rs.getString("p_brand");
				return 1;
			}
			return -1;
		}catch(Exception e) {
			System.out.println("exception caught in get_products_details() ");
			System.out.println(e);
			return -1;
		}
		
	}
	
	public boolean getProductIdResult(int id) {
		
		try {
			Connection conn=getConnection();
			PreparedStatement ps=conn.prepareStatement(StringUtils.get_products_details);
			ResultSet rs=ps.executeQuery(); 
			while(rs.next()) 
			{
				int p_id_db = rs.getInt("p_id");
				if(p_id_db==id) {
					return true;
				}
			}
			return false;
		}catch(Exception e) {
			System.out.println("exception caught in get_products_id_result() ");
			System.out.println(e);
			return false;
		}
		
	}
	
	public int removeProduct(int id) {
		
		try {
			Connection conn=getConnection();
			PreparedStatement ps=conn.prepareStatement(StringUtils.removeProduct);
			ps.setInt(1,id);
			int result=ps.executeUpdate(); 
			  if(result>=1) {
			  System.out.println("Removing product  success"); 
			  return 1;
			  }else { 
				  System.out.println("Removing product  failed"); 
				  return-1;
				  }
		}catch(Exception e) {
			System.out.println("exception caught in removeProduct");
			System.out.println(e);
			return -2;
		}
		
	}
	
	public int avaProductQuantity(int id)
	{
		try  {
			Connection conn=getConnection();
			PreparedStatement ps=conn.prepareStatement(StringUtils.get_ava_qty_details);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery(); 
			while(rs.next()) 
			{
				int p_quantity = rs.getInt("p_quantity");
				return p_quantity;
			}
			return -1;
		}catch(Exception e) {
			System.out.println("exception caught in avaProductQuantity ");
			System.out.println(e);
			return -2;
		}
			
	}
		
	public int updateQuantity(int quantity,int id){
			
			try {
				Connection conn=getConnection();
				PreparedStatement ps=conn.prepareStatement(StringUtils.updateQuantity);
				ps.setInt(1,quantity);
				ps.setInt(2,id);
				int result=ps.executeUpdate(); 
				  if(result>=1) {
				  System.out.println("Updating quantity success"); 
				  return 1;
				  }else { 
					  System.out.println("Updating quantity failed"); 
					  return-1;
				}
			}catch(Exception e) {
				System.out.println("exception caught in Updating quantity");
				System.out.println(e);
				return -2;
			}
			
			
		}
	
	
	public int storeFeedback(FeedbackModel feedback_obj) {
		
		try {
			Connection conn=getConnection();
			PreparedStatement ps=conn.prepareStatement(StringUtils.storeFeedback);
			
			ps.setString(1,feedback_obj.getName());
			ps.setString(2,feedback_obj.getEmail());
			ps.setString(3,feedback_obj.getMessage());
			
			int result=ps.executeUpdate(); 
			  if(result>=1) {
			  System.out.println("Storing feedback success"); 
			  return 1;
			  }else { 
				  System.out.println("Storing feedback failed"); 
				  return-1;
			}
		}catch(Exception e) {
			System.out.println("exception caught in Storing feedback");
			System.out.println(e);
			return -2;
		}
	}
		
	
	
	
	public String getClientProfileImage(int id){
		try {
		Connection conn=getConnection();
		int userid=id;
		PreparedStatement ps=conn.prepareStatement(StringUtils.get_client_image_data);
		ps.setInt(1,userid);
		ResultSet rs=ps.executeQuery(); 
		while(rs.next()) 
		{
			int id_db_int =rs.getInt("id");
			System.out.println(id_db_int);
			System.out.println(userid);
			if(id_db_int==userid) {
				System.out.println("user found");
				String image_name_db=rs.getString("c_image");
				if(image_name_db==null || image_name_db.isEmpty()) {
					System.out.println("no  profile image found of client = "+image_name_db);
					return "no_image";
				}
				else {
					System.out.println("client profile image found");
					System.out.println(image_name_db);
					return image_name_db;
				}
			}
		}//while
		return "no_image";
		}//try
		catch(Exception o) 
		{
			System.out.println(o);
			System.out.println("exceptiion caught in getclient profile image data");
			return "exception";
		}//catch
		
	}	
	
	public int UpdateDetailsClient(int userId,String userFirstName, String userLastName, String userEmail, 
            String userPhoneNumber, LocalDate dob1, String userGender, 
            String userAddress){
			try {
			Connection conn=getConnection();
			PreparedStatement ps = conn.prepareStatement(StringUtils.update_client_profile_details);
			ps.setString(1, userFirstName);
			ps.setString(2, userLastName);
			ps.setString(3, userEmail);
			ps.setString(4, userPhoneNumber);
			ps.setDate(5,Date.valueOf(dob1));
			ps.setString(6, userGender);
			ps.setString(7, userAddress);
			// Assuming user_id is the identifier for the client record
			ps.setInt(8, userId); // You need to have userId available in this method
			int rowsUpdated = ps.executeUpdate();
			if(rowsUpdated>=1) {
				return rowsUpdated;
			}
			else {
				return 0;
			}
			
			} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.toString());
			System.out.println(e.getMessage().toString());
			return 0; // Return 0 to indicate failure
			}
}
	
	public List getProductDetailsUI()
	{
			List<AddProductModel> list=new ArrayList<AddProductModel>();
			AddProductModel ap_obj=null;
			try  {
			Connection conn=getConnection();
			PreparedStatement ps=conn.prepareStatement(StringUtils.get_products_details);
			ResultSet rs=ps.executeQuery(); 
			while(rs.next()) 
			{
				
					ap_obj=new AddProductModel();	
					
			        int p_id = rs.getInt("p_id");
		            int p_quantity = rs.getInt("p_quantity");
		            int p_unit_price = rs.getInt("p_unit_price");
		            String p_name = rs.getString("p_name");
		            String p_image = rs.getString("p_image");
		            String p_brand = rs.getString("p_brand");
		            
		            ap_obj.setId(p_id);
		            ap_obj.setP_brand(p_brand);
		            ap_obj.setP_image(p_image);
		            ap_obj.setP_name(p_name);
		            ap_obj.setP_quantity(p_quantity);
		            ap_obj.setP_unit_price(p_unit_price);
		            
		            list.add(ap_obj);   
			}
		}catch(Exception e) {
			System.out.println("exception caught in getProductDetailsUI() ");
			System.out.println(e);
		}
		return list;
	}
	
	public int addCart(CartModel cart_model ,int quantity,int t_price) {
		try {

			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement(StringUtils.Add_TO_CART_Q);
			ps.setInt(1, cart_model.getProductId());
			ps.setInt(2, cart_model.getClientID());
			ps.setInt(3, quantity);
			ps.setInt(4, t_price);
			int result=ps.executeUpdate(); 
			  if(result>=1) {
			  System.out.println("inserting cart data in database success"); 
			  return 1;
			  }else { 
				  System.out.println("inserting cart data in database failed"); 
				  return-1;
				  }
		} catch (Exception o) {
			System.out.println(o);
			System.out.println("exception caught in add cart method ");
			 return -1; 
		}

	}
	
	public List getCartProductDetails(int curent_user_id)
	{
			List<CartProductDetailsModel> list=new ArrayList<CartProductDetailsModel>();
			CartProductDetailsModel ap_obj=null;
			try  {
			Connection conn=getConnection();
			PreparedStatement ps=conn.prepareStatement(StringUtils.get_cart_product_details);
			ps.setInt(1, curent_user_id);
			ResultSet rs=ps.executeQuery(); 
			while(rs.next()) 
			{
				
					ap_obj=new CartProductDetailsModel();	
					
			        int p_id = rs.getInt("p_id");
		            int p_quantity = rs.getInt("quantity");
		            int p_unit_price = rs.getInt("p_unit_price");
		            String p_name = rs.getString("p_name");
		            String p_image = rs.getString("p_image");
		            String p_brand = rs.getString("p_brand");
		            String p_description = rs.getString("p_description");
		            int cart_id=rs.getInt("cart_id");
		            int total_price=rs.getInt("price");
		            
		        
		           
		           
		            ap_obj.setId(p_id);
		            ap_obj.setP_brand(p_brand);
		            ap_obj.setP_image(p_image);
		            ap_obj.setP_name(p_name);
		            ap_obj.setP_quantity(p_quantity);
		            ap_obj.setP_unit_price(p_unit_price);
		            ap_obj.setP_description(p_description);
		            ap_obj.setCart_id(cart_id);
		            ap_obj.setTotal_price(total_price);
		            list.add(ap_obj);   
			}
		}catch(Exception e) {
			System.out.println(e.getMessage().toString());
			System.out.println("exception caught in getCartProductDetails() ");
			System.out.println(e);
		}
		return list;
	}
	
	public int deleteCartItem(int cart_id) throws ClassNotFoundException, SQLException {
		Connection conn = getConnection();
		try {
		
			PreparedStatement ps = conn.prepareStatement(StringUtils.delete_cart_ITEM);
			ps.setInt(1,cart_id);
			int result=ps.executeUpdate(); 
			
			  if(result>=1) {
			  System.out.println("Deleting  cart item in database success"); 
			  return 1;
			  }else { 
				  System.out.println("Deleting  cart item in database failed"); 
				  return-1;
				  }
		} catch (Exception o) {
			System.out.println(o);
			System.out.println("exception caught in adeleteCartItem (int cart_id) ");
			 return -1; 
		}

	}
	

	
	public List<AddProductModel> getProductDetailsSearch(String searchValue, int minPrice, int maxPrice) {
	    List<AddProductModel> list = new ArrayList<>();
	    AddProductModel ap_obj = null;
	    try {
	        Connection conn = getConnection();
	        PreparedStatement ps = conn.prepareStatement(StringUtils.get_products_details_search);
	        ps.setString(1, "%" + searchValue + "%");
	        ps.setInt(2, minPrice);
	        ps.setInt(3, maxPrice);
	        ResultSet rs = ps.executeQuery(); 
	        while (rs.next()) {
	            ap_obj = new AddProductModel();   
	            int pId = rs.getInt("p_id");
	            int pQuantity = rs.getInt("p_quantity");
	            int pUnitPrice = rs.getInt("p_unit_price");
	            String pName = rs.getString("p_name");
	            String pImage = rs.getString("p_image");
	            String pBrand = rs.getString("p_brand");
	            String pDescription = rs.getString("p_description");
	            
	            ap_obj.setId(pId);
	            ap_obj.setP_brand(pBrand);
	            ap_obj.setP_image(pImage);
	            ap_obj.setP_name(pName);
	            ap_obj.setP_quantity(pQuantity);
	            ap_obj.setP_unit_price(pUnitPrice);
	            ap_obj.setP_description(pDescription);
	            

	            
	            list.add(ap_obj);   
	        }
	    } catch (Exception e) {
	        System.out.println("Exception caught in getProductDetailsSearch()");
	        System.out.println(e);
	    }
	    return list;
	}
	
	
	public List getProductDetailsAll(int id)
	{
			List<AddProductModel> list=new ArrayList<AddProductModel>();
			AddProductModel ap_obj=null;
			try  {
			Connection conn=getConnection();
			PreparedStatement ps=conn.prepareStatement(StringUtils.get_products_details_id);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery(); 
			while(rs.next()) 
			{
				
					ap_obj=new AddProductModel();	
			        int p_id = rs.getInt("p_id");
		            int p_quantity = rs.getInt("p_quantity");
		            int p_unit_price = rs.getInt("p_unit_price");
		            String p_name = rs.getString("p_name");
		            String p_image = rs.getString("p_image");
		            String p_brand = rs.getString("p_brand");
		            String p_description = rs.getString("p_description");
		            
		            ap_obj.setId(p_id);
		            ap_obj.setP_brand(p_brand);
		            ap_obj.setP_image(p_image);
		            ap_obj.setP_name(p_name);
		            ap_obj.setP_quantity(p_quantity);
		            ap_obj.setP_unit_price(p_unit_price);
		            ap_obj.setP_description(p_description);
		            
		            list.add(ap_obj);   
			}
		}catch(Exception e) {
			System.out.println("exception caught in getProductDetailsAll() ");
			System.out.println(e);
		}
		return list;
	}
	
	
	public int add_order_history(int client_id) 
	{
		
		try {
			Connection conn=getConnection();
			PreparedStatement ps=conn.prepareStatement(StringUtils.insert_order_h);
			ps.setInt(1,client_id);
			ps.setInt(2,client_id);
			int result=ps.executeUpdate();
			 if(result>=1) {
			  System.out.println("inserting order history in database success"); 
			  return 1;
			  }else { 
				  System.out.println("inserting order history in database failed"); 
				  return-1;
				  }
			
		}catch(Exception o) {
			System.out.println("Exceptiion caught in add order history");
			System.out.println(o);
			return -1;
		}
		
		
		
	}
	
	public int update_q_order(int client_id) 
	{
		
		try {
			Connection conn=getConnection();
			PreparedStatement ps=conn.prepareStatement(StringUtils.Update_q_order);
			ps.setInt(1,client_id);
			int result=ps.executeUpdate();
			 if(result>=1) {
			  System.out.println("Updating quantity in products info table in database success"); 
			  return 1;
			  }else { 
				  System.out.println("Updating quantity in products info table in database failed"); 
				  return-1;
				  }
			
		}catch(Exception o) {
			System.out.println("Exceptiion caught in Updating quantity in products info table");
			System.out.println(o);
			return -1;
		}
		
		
		
	}
	
	public List getO_H_C(int id)
	{
			List<OrderHistoryModel> list=new ArrayList<OrderHistoryModel>();
			OrderHistoryModel ap_obj=null;
			try  {
			Connection conn=getConnection();
			PreparedStatement ps=conn.prepareStatement(StringUtils.get_O_H_C_details);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery(); 
			while(rs.next()) 
			{
				
					ap_obj=new OrderHistoryModel();	
					
					int o_id = rs.getInt("o_id");
					int p_id = rs.getInt("p_id");
					int c_id = rs.getInt("c_id");
					Date order_date = rs.getDate("order_date");
					int total_quantity = rs.getInt("total_quantity");
					int total_price = rs.getInt("total_price");
					String delivery_status = rs.getString("delivery_status");
					String p_brand = rs.getString("p_brand");
					String p_description = rs.getString("p_description");
					String p_image=rs.getString("p_image");
					int cart_id=rs.getInt("cart_id");
					int p_unit_price=rs.getInt("p_unit_price");
					
					
					
					ap_obj.setoId(o_id);
					ap_obj.setpId(p_id);
					ap_obj.setcId(c_id);
					ap_obj.setOrderDate(order_date);
					ap_obj.setTotalQuantity(total_quantity);
					ap_obj.setTotalPrice(total_price);
					ap_obj.setDeliveryStatus(delivery_status);
					ap_obj.setP_brand(p_brand);
					ap_obj.setP_description(p_description);
					ap_obj.setP_image(p_image);
					ap_obj.setCart_id(cart_id);
					ap_obj.setP_unit_price(p_unit_price);
					
					
		            list.add(ap_obj);   
			}
		}catch(Exception e) {
			System.out.println("exception caught in order history fetch client ");
			System.out.println(e);
		}
		return list;
	}
	
	
	public List getO_H_A()
	{
			List<OrderHistoryModel> list=new ArrayList<OrderHistoryModel>();
			OrderHistoryModel ap_obj=null;
			try  {
			Connection conn=getConnection();
			PreparedStatement ps=conn.prepareStatement(StringUtils.get_O_H_A_details);
			ResultSet rs=ps.executeQuery(); 
			while(rs.next()) 
			{
				
					ap_obj=new OrderHistoryModel();	
					
					int o_id = rs.getInt("o_id");
					int p_id = rs.getInt("p_id");
					int c_id = rs.getInt("c_id");
					Date order_date = rs.getDate("order_date");
					int total_quantity = rs.getInt("total_quantity");
					int total_price = rs.getInt("total_price");
					String delivery_status = rs.getString("delivery_status");
					String p_brand = rs.getString("p_brand");
					String p_description = rs.getString("p_description");
					
					String p_image=rs.getString("p_image");
					
					
					int cart_id=rs.getInt("cart_id");
					int p_unit_price=rs.getInt("p_unit_price");
					
					
					
					ap_obj.setoId(o_id);
					ap_obj.setpId(p_id);
					ap_obj.setcId(c_id);
					ap_obj.setOrderDate(order_date);
					ap_obj.setTotalQuantity(total_quantity);
					ap_obj.setTotalPrice(total_price);
					ap_obj.setDeliveryStatus(delivery_status);
					ap_obj.setP_brand(p_brand);
					ap_obj.setP_description(p_description);
					ap_obj.setP_image(p_image);
					ap_obj.setCart_id(cart_id);
					ap_obj.setP_unit_price(p_unit_price);
					
		            list.add(ap_obj);   
			}
		}catch(Exception e) {
			System.out.println("exception caught in order history fetch admin ");
			System.out.println(e);
		}
		return list;
	}
	
	public int update_delivery_staetus(int order_id,String status) {
		
		try {
			Connection conn=getConnection();
			PreparedStatement ps=conn.prepareStatement(StringUtils.update_delivery_status);
			ps.setString(1, status);
			ps.setInt(2, order_id);
			int result=ps.executeUpdate();
			 if(result>=1) {
			  System.out.println("Updating delivery status   in database success"); 
			  return 1;
			  }else { 
				  System.out.println("Updating delivery status  in database failed"); 
				  return-1;
				  }
	
		}catch(Exception e) {
			System.out.println("exception caught in update_delivery_staetus() ");
			System.out.println(e);
			return -1;
		}
		
	}
	
	
	public int updatePassword(int c_id,String new_password){
		
		try {
			Connection conn=getConnection();
			PreparedStatement ps=conn.prepareStatement(StringUtils.UPDATE_PASSWORD);
			String encryptedPassword = PasswordEncryptionWIthAes.encryptPassword(new_password, "U3CdwubLD5yQbUOG92ZnHw==");
			ps.setString(1,encryptedPassword);
			ps.setString(2,encryptedPassword);
			ps.setInt(3, c_id);
			int result=ps.executeUpdate(); 
			  if(result>=1) {
			  System.out.println("Updating password success"); 
			  return 1;
			  }else { 
				  System.out.println("Updating password failed"); 
				  return-1;
			}
		}catch(Exception e) {
			System.out.println("exception caught in Updating password");
			System.out.println(e);
			return -2;
		}
		
		
	}
	
	
	
	
	
	
	
	
	

	
}//DbConnection
