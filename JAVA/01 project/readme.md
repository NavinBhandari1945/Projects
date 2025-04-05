Smartwatch E-Commerce Web Application  

Overview  
A full-stack e-commerce platform tailored for smartwatches, designed using the MVC architecture. It offers distinct interfaces for administrators and customers, with features like user authentication, product management, shopping cart functionality, and order tracking. Built with JSP, Servlets, and JDBC for seamless integration of frontend and backend logic.  

Key Features  
- User Authentication: Secure registration/login with AES-encrypted passwords.  
- Admin Panel:  
  - CRUD operations (Create, Read, Update, Delete) for products.  
  - Inventory management and order history tracking.  
- Customer Interface:  
  - Browse/search products, add/remove items from cart.  
  - View order history and update profile details.  
- Responsive Design: Dynamic content rendering using JSP, HTML, and CSS.  

Functionality  
- Registration & Login: Shared portal for admins and users with encrypted password storage.  
- Product Management: Admins can add, update, or remove products.  
- Shopping Cart: Users can review selections and simulate checkout.  
- Order Tracking: Admins and users can view purchase history.  

Technologies Used  
- Frontend: HTML, CSS, JSP  
- Backend: Java Servlets  
- Database: MySQL (JDBC for connectivity)  
- Server: Apache Tomcat  
- Security: AES encryption for passwords  
- Tools: Eclipse IDE  

Development Process  
- Followed MVC architecture:  
  - Model: JDBC/MySQL for data handling.  
  - View: JSP/HTML for dynamic UI.  
  - Controller: Servlets for request handling.  
- Conducted unit testing for critical workflows (e.g., user registration, product updates).  
- Tested edge cases (invalid inputs, session management, error handling).  

Testing  
- Validated core features:  
  - User registration/login.  
  - Product addition/removal by admins.  
  - Cart management (add/remove items).  
  - Order history tracking.  
- Tested error scenarios (invalid passwords, missing form fields).  

Security  
- AES encryption for storing passwords.  
- Session management to secure user/admin dashboards.  

Conclusion  
This project showcases a scalable e-commerce system for smartwatches, emphasizing Java backend integration (JSP/Servlets) with MySQL. The MVC structure ensures maintainability, while security measures like encryption protect user data.  

