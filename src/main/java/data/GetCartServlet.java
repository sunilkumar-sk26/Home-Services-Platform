package data;

import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/GetCartServlet")
public class GetCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        HttpSession session = request.getSession(false);
        List<Service> cart = (List<Service>) session.getAttribute("cart");
       
        
        StringBuilder htmlBuilder = new StringBuilder();
        boolean isEmpty = true;
        double totalAmount = 0.0;
        if (cart != null && !cart.isEmpty()) {
        	 isEmpty = false;
            for (Service service : cart) {
                htmlBuilder.append("<div class=\"cart-item\">"); 
                htmlBuilder.append("<img src='").append(service.getImagePath()).append("' alt='Service Image'>");
                htmlBuilder.append("<div class=\"cart-item-details\">"); 
                htmlBuilder.append("<h3>").append(service.getName()).append("</h3>");
                htmlBuilder.append("<p class=\"price\">$").append(service.getPrice()).append("</p>");
                htmlBuilder.append("</div>"); 
                htmlBuilder.append("</div>"); 
                
                totalAmount += service.getPrice();
            }
        } else {
            htmlBuilder.append("<p>Cart is empty</p>");
        }
        
        if (!isEmpty) {
            htmlBuilder.append("<button class=\"proceed\" onclick=\"window.location.href='payment.jsp'\">Proceed to Payment</button>");
        }

        htmlBuilder.append("<p>Total Amount: $").append(totalAmount).append("</p>");

       
        response.setContentType("text/html");
        response.getWriter().write(htmlBuilder.toString());
        response.setHeader("isEmpty", String.valueOf(isEmpty));
    }
}
