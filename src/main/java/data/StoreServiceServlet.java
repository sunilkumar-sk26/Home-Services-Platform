package data;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class StoreServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	 private static final String URL = "jdbc:mysql://localhost:3308/data";
	    private static final String USERNAME = "root";
	    private static final String PASSWORD = "1234";

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	       
	        String serviceName = request.getParameter("serviceName");
	        double servicePrice = Double.parseDouble(request.getParameter("servicePrice"));
	        
	       
	        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD)) {
	            String sql = "INSERT INTO data.services (name, price) VALUES (?, ?)";
	            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
	                stmt.setString(1, serviceName);
	                stmt.setDouble(2, servicePrice);
	                stmt.executeUpdate();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            
	        }
	        
	       
	        response.sendRedirect("confirmation.jsp");
	    }
   

}
