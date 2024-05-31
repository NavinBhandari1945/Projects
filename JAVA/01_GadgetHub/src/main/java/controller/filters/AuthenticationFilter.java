package controller.filters;
import java.io.IOException;        
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebFilter("/*")
public class AuthenticationFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		RequestDispatcher rd;
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		String uri = req.getRequestURI();
		System.out.println(uri);
		
		

	
		
		
//		if(uri.endsWith("login_servlet")){
//			chain.doFilter(req, res);
//			return;	
//		}
//		if(uri.endsWith("logout_servlet")){
//			chain.doFilter(req, res);
//			return;	
//		}
		
		
		
		boolean isLogin = uri.endsWith("pages/login.jsp");
		boolean isLoginServlet = uri.endsWith("login_servlet");
		boolean isLogoutServlet = uri.endsWith("logout_servlet");
		
		HttpSession session = req.getSession(false);
		boolean isLoggedIn_client = session != null && session.getAttribute("client_s") != null ;
		boolean isLoggedIn_admin = session != null && session.getAttribute("admin_s") != null;
		
		System.out.println("admin status");
		System.out.println(isLoggedIn_admin);
		System.out.println("client status");
		System.out.println(isLoggedIn_client);
		
		if(uri.endsWith("pages/register.jsp")) {
			chain.doFilter(req, res);
			return;
		}
		
		if(uri.endsWith("pages/login.jsp")) {
			chain.doFilter(req, res);
			return;
		}
		
//		if(uri.endsWith("pages/admin_home.jsp")) {
//			chain.doFilter(req, res);
//			return;
//		}
		
		
		if(uri.endsWith("pages/home.jsp")) {
			chain.doFilter(req, res);
			return;
		}
		
		
		if(uri.endsWith("register_servlet")){
			chain.doFilter(req, res);
			return;	
		}
		
		
		
		  if (!isLoggedIn_client && !isLoggedIn_admin && !(isLogin || isLoginServlet)) { //
			  
		  System.out.println("Hello1");
		  res.sendRedirect(req.getContextPath() + "/pages/home.jsp");
		  
//		  rd=req.getRequestDispatcher("/pages/home.jsp");
//		  rd.forward(req, res);
		  
		  }
		  
		  else if (isLoggedIn_client && !(!isLogin || isLogoutServlet)) {
			  System.out.println("Hello2");
			  
//		  res.sendRedirect(req.getContextPath() + "/pages/home.jsp");
			  rd=req.getRequestDispatcher("/pages/home.jsp");
			  rd.forward(req, res);
		  
		  }
		  
		  else if (isLoggedIn_admin && !(!isLogin || isLogoutServlet)) {
			  System.out.println("Hello4");
			  
//		  res.sendRedirect(req.getContextPath() + "/pages/admin_home.jsp"); 
			  rd=req.getRequestDispatcher("/pages/admin_home.jsp");
			  rd.forward(req, res);
		  
		  
		  }
		  
//		  else if (!isLoggedIn_admin && !(isLogin || isLoginServlet)) { //
//		  System.out.println("Hello3"); 
//		  
//		  res.sendRedirect(req.getContextPath() +"/pages/home.jsp");
//		  
//		  }
		  
		  
		  else { 
			  System.out.println("Hello5");
			  chain.doFilter(request, response);
		 }
		 
		
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}

