package data;

import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    int serviceId = Integer.parseInt(request.getParameter("serviceId"));
	    String serviceName = request.getParameter("serviceName");
	    double servicePrice = Double.parseDouble(request.getParameter("servicePrice"));
	    String serviceImagePath = request.getParameter("serviceImagePath"); 
	    
	    
	    HttpSession session = request.getSession(true);
	    List<Service> cart = (List<Service>) session.getAttribute("cart");
	    if (cart == null) {
	        cart = new ArrayList<>();
	        session.setAttribute("cart", cart);
	    }
	    cart.add(new Service(serviceId, serviceName, servicePrice, serviceImagePath)); 
	    
	    response.setContentType("text/plain");
	    response.getWriter().write("Service added to cart successfully");
	}

}
