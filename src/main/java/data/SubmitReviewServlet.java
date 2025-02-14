package data;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/ReviewServlet")
public class SubmitReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("user_email");

        
        String reviewContent = request.getParameter("reviewContent");

       
        String url = "jdbc:mysql://localhost:3308/data";
        String username = "root";
        String password = "1234";

        try {
           
            Class.forName("com.mysql.cj.jdbc.Driver");

            
            Connection conn = DriverManager.getConnection(url, username, password);

            
            String sql = "INSERT INTO data.reviews (user_email, review_content) VALUES (?, ?)";

           
            PreparedStatement statement = conn.prepareStatement(sql);

            
            statement.setString(1, userEmail);
            statement.setString(2, reviewContent);

            
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                
                session.setAttribute("review_message", "Review submitted successfully");
            } else {
                
                session.setAttribute("review_message", "Failed to submit review");
            }

            
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            
            e.printStackTrace();
            session.setAttribute("review_message", "An error occurred while processing your request");
        }

        
        response.sendRedirect("review.jsp");
    }
}
