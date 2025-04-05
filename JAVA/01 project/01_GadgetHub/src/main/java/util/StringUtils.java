package util;

public class StringUtils {
	
	public static final String GET_CLIENT_INFO_USERNAME = "SELECT * FROM client_info WHERE username=?";
	
	public static final String GET_CLIENT_INFO_EMAIL = "SELECT * FROM client_info WHERE email=?";
	
	public static final String GET_CLIENT_INFO_PHONE = "SELECT * FROM client_info WHERE phone_number=?";
	
	public static final String insert_client_form = "INSERT INTO client_info "
			  +
			  "(first_name, last_name,email, phone_number,dob, gender,username,password,retype_password,address,c_image) "
			  + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";
	
	public static final String Add_TO_CART_Q = "INSERT INTO CART "
			  +
			  "(p_id,c_id,quantity,price) "
			  + "VALUES (?, ?,?,?)";
	
	public static final String Update_q_order="UPDATE products_info AS p JOIN ( SELECT p_id, SUM(quantity) AS total_quantity FROM cart WHERE c_id = ? GROUP BY p_id ) AS c ON p.p_id = c.p_id SET p.p_quantity = p.p_quantity - c.total_quantity";

	public static final String delete_cart_ITEM = "delete from cart where cart_id=?";
	
	public static final String insert_products_details="INSERT INTO products_info (p_name,p_image,p_unit_price,p_id,p_quantity, p_brand,p_description) VALUES (?, ?, ?, ?, ?, ?,?)";
	
	public static final String insert_order_h = "INSERT INTO order_history (p_id, c_id, cart_id, order_date, delivery_status)\r\n"
			+ "SELECT cart.p_id, ?, cart.cart_id,NOW(), 'pending'\r\n"
			+ "FROM cart\r\n"
			+ "WHERE cart.c_id = ?;\r\n"
			+ "";

	
	public static final String get_products_details = "SELECT * FROM products_info";
	public static final String get_products_details_id = "SELECT * FROM products_info where p_id=?";
	
//	public static final String get_products_details_search = "SELECT * FROM products_info where p_name like ?;
	
    public static final String get_products_details_search ="SELECT * FROM products_info WHERE p_name LIKE ? or p_unit_price BETWEEN ? AND ?";
			
	public static final String get_cart_product_details = "SELECT c.cart_id,c.price,p.p_id,p.p_image,p.p_name,c.quantity,p.p_unit_price,p.p_description,p.p_brand FROM cart as c left join products_info as p"
			+ " on c.p_id=p.p_id where c.c_id=?";
	
	public static final String get_ava_qty_details = "SELECT p_quantity FROM products_info where p_id=?";
	
	public static final String removeProduct = "delete from products_info where p_id=?";
	
	public static final String updateQuantity = "update products_info set p_quantity=? where p_id=? ";
	
	public static final String storeFeedback = "insert into feedback(name,email,message) values(?,?,?) ";
	
	public static final String REGISTER_SERVLET = "/register_servlet";
	
	public static final String get_O_H_C_details = "SELECT oh.o_id, oh.p_id, oh.c_id, oh.order_date, \r\n"
			+ "       c.quantity AS total_quantity,pi.p_unit_price, c.price AS total_price, \r\n"
			+ "       oh.delivery_status,\r\n"
			+ "       pi.p_brand, pi.p_description, pi.p_image, \r\n"
			+ "       oh.cart_id\r\n"
			+ "FROM order_history oh\r\n"
			+ "JOIN cart c ON oh.cart_id = c.cart_id\r\n"
			+ "JOIN products_info pi ON oh.p_id = pi.p_id\r\n"
			+ "WHERE oh.c_id = ?;\r\n"
			+ "";

	public static final String get_O_H_A_details = "SELECT oh.o_id, oh.p_id,p.p_unit_price, oh.c_id, oh.order_date, c.quantity AS total_quantity, c.price AS total_price,\r\n"
			+ "       oh.delivery_status, p.p_brand, p.p_description, p.p_image, oh.cart_id\r\n"
			+ "FROM order_history AS oh\r\n"
			+ "JOIN cart AS c ON oh.cart_id = c.cart_id\r\n"
			+ "JOIN products_info AS p ON oh.p_id = p.p_id;\r\n"
			+ "";
	
	public static final String LOGIN_SERVLET = "/login_servlet"; 
	public static final String Add_TO_CART = "/addtocart_servlet"; 
	public static final String CART_U_NL = "/cart_nl_servlet"; 
	public static final String delete_cart_item = "/delete_c_i_servlet"; 
	public static final String order_cart_item = "/order_c_i_servlet"; 
	public static final String Search_servlet = "/search_servlet"; 
	public static final String update_delivery_servlet = "/update_deliver_servlet"; 
	public static final String update_password_s = "/u_p_servlet"; 
	
	public static final String update_delivery_status = "UPDATE order_history\r\n"
			+ "SET delivery_status = ?\r\n"
			+ "WHERE o_id = ?;\r\n"
			+ "";
	
	public static final String UPDATE_C_DETAILS_SERVLET ="/update_c_d_servlet"; 
	
	public static final String UPDATE_PASSWORD = "UPDATE client_info SET password=?, retype_password=? WHERE id=?";

	
	public static final String LOGOUT_SERVLET = "/logout_servlet";
	
	public static final String add_products_servlet = "/add_products_servlet";
	
	public static final String images_dir_path="C:\\DISKB\\jsp and servlet\\coursework\\Gadget_Hub\\GadgetHub\\src\\main\\webapp\\images\\"; 
	
	//
	public static final  String update_client_profile_details="UPDATE client_info SET first_name=?, last_name=?, "
            + "email=?, phone_number=?, dob=?, gender=?, "
            + "address=? WHERE id=?";
	
//	public static final String STUDENTS_SERVLET = "/student_servlet";
	
	public static final String get_client_login_data="select id,username,password,role from client_info";
	
	//
	
	public static final String get_client_image_data="select id,c_image from client_info where id=?";
	
	//
	public static final String get_client_data="select * from client_info where id=?";
	
	// Start JSP Route
	public static final String home_page = "/pages/home.jsp";
	public static final String admin_home_page = "/pages/admin_home.jsp";
	
	// End JSP Route

	 
}
