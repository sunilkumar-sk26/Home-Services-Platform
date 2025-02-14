<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%@ page import="java.io.*, java.util.*, jakarta.servlet.*, jakarta.servlet.http.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="login.css">
</head>
<body>

     <header>
        <div class="container">
            <div class="logo">
                <img src="images/logo1.jpg" alt="Home Services Platform Logo">
            </div>
            <h1 style="color: white;">HOME SERVICES</h1>
            <nav>
                <ul>
                     <li><a href="<%= request.getContextPath() %>/home.jsp">Home</a></li>
                <li><a href="<%= request.getContextPath() %>/login.jsp">Login</a></li>
                <li><a href="#about">About Us</a></li>
                </ul> 
            </nav>
        </div>     
    </header>
    
    <div class="login-container">
        <h2 id="form-title">Login</h2>
        <form id="login-form" action="LoginServlet" method="POST">
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Sign In</button>
            <p id="login-feedback" class="feedback">${errorMessage}</p> 
        </form>
          <div class="switch-container">
            <p>Dont have an account ? <a href="register.jsp" >Register here</a></p>
        </div>
    </div>
    
     

    <script src="login.js"></script>
<%
   
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null && !errorMessage.isEmpty()) {
        
        request.removeAttribute("errorMessage");
    } else {
        
        HttpSession existingSession = request.getSession(false);
        if (existingSession != null && existingSession.getAttribute("user_id") != null) {
           
            response.sendRedirect(request.getContextPath() + "/home.jsp");
            return; 
        }
    }
%>


</body>
</html>