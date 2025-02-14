<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
        <h2 id="form-title">Register</h2>
        <form id="signup-form" action="RegisterServlet" method="POST">
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Sign Up</button>
              <% 
            Boolean registrationSuccess = (Boolean)request.getAttribute("registrationSuccess");
            if (registrationSuccess != null) {
                if (registrationSuccess) {
                    out.println("<p style='color: green;'>Registration successful!</p>");
                    
                } else {
                    out.println("<p style='color: red;'>Registration failed.</p>");
                }
            }
        %>
        
        </form>
        <div class="switch-container">
            <p>Already have an account? <a href="login.jsp" >Sign In</a></p>
        </div>
    </div>

    <script src="register.js"></script>

</body>
</html>