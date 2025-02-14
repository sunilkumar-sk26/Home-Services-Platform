<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.Instant" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <title>Session Details</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/session.css">
</head>
<body>
    <div class="container">
        <h1>Session Details</h1>
        <%
            
            if (session != null) {
                String userEmail = (String) session.getAttribute("user_email");
                Instant sessionStartTime = (Instant) session.getAttribute("session_start_time");
                String sessionId = session.getId();

                if (userEmail != null && sessionStartTime != null) {
                    out.println("<p>User Email: " + userEmail + "</p>");
                    out.println("<p>Session ID: " + sessionId + "</p>");
                    out.println("<p>Session Start Time: " + Date.from(sessionStartTime) + "</p>");
                } else {
                    out.println("<p class='error'>Session details not available.</p>");
                }
            } else {
                out.println("<p class='error'>No session found. Please log in.</p>");
            }
        %>
    </div>
</body>
</html>
