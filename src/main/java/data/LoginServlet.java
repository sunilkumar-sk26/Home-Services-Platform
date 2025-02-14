package data;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.Instant;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3308/data";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM data.user WHERE email = ? AND password = ?")) {
            
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                
                HttpSession session = request.getSession();
              
                session.setAttribute("user_email", email); 
                session.setAttribute("session_start_time", Instant.now());

                
                Cookie loginCookie = new Cookie("user_email", email);
                loginCookie.setMaxAge(3600); // Cookie expires in 1 hour (adjust as needed)
                response.addCookie(loginCookie);

                
                response.sendRedirect(request.getContextPath() + "/session.jsp");
            
            } else {
               
                request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            
            response.getWriter().println("{\"success\": false, \"message\": \"Database error: " + e.getMessage() + "\"}");
        }
    }
}
