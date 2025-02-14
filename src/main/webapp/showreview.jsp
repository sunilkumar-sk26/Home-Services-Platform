<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>Reviews</h2>

    <%-- Establish database connection --%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>
    <%
        String url = "jdbc:mysql://localhost:3308/data";
        String username = "root";
        String password = "1234";
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
            statement = connection.createStatement();
            String query = "SELECT * FROM data.reviews";
            resultSet = statement.executeQuery(query);
    %>

    <div>
        <%-- Display reviews --%>
        <%
            while(resultSet.next()) {
                String userEmail = resultSet.getString("user_email");
                String reviewContent = resultSet.getString("review_content");
        %>
                <p>User: <%= userEmail %></p>
                <p>Review: <%= reviewContent %></p>
                <hr>
        <%
            }
        %>
    </div>

    <%-- Close database resources --%>
    <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (resultSet != null) {
                try { resultSet.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (statement != null) {
                try { statement.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (connection != null) {
                try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    %>

</body>
</html>