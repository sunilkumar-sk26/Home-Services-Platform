package data;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3308/data";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            request.setAttribute("registrationSuccess", false);
        } else {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
                PreparedStatement pstmt = conn.prepareStatement("INSERT INTO data.user (email, password) VALUES (?, ?)");

                pstmt.setString(1, email);
                pstmt.setString(2, password);
                int rowsInserted =  pstmt.executeUpdate();

                if (rowsInserted > 0) {
                    request.setAttribute("registrationSuccess", true);
                } else {
                    request.setAttribute("registrationSuccess", false);
                }

                pstmt.close();
                conn.close();
            } catch (ClassNotFoundException | SQLException e) {
                request.setAttribute("registrationSuccess", false);
            }
        }

        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
}
