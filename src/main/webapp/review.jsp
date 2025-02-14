<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- Check if review message exists in session --%>
    <%
        String reviewMessage = (String) session.getAttribute("review_message");
        if (reviewMessage != null) {
    %>
            <p><%= reviewMessage %></p>
    <%
            // Clear the review message from session
            session.removeAttribute("review_message");
        }
    %>

    <h2>Submit Review</h2>
    <form action="ReviewServlet" method="post">
        <input type="hidden" name="action" value="submitReview">
        <input type="hidden" name="serviceId" value="<%= request.getParameter("serviceId") %>">
        <label for="reviewContent">Your Review:</label><br>
        <textarea id="reviewContent" name="reviewContent" rows="4" cols="50"></textarea><br><br>
        <input type="submit" value="Submit Review">
    </form>
</body>
</html>