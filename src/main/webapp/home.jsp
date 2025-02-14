<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="jakarta.servlet.http.HttpSession" %>
    <%@ page import="java.io.*, org.w3c.dom.*, javax.xml.parsers.*, org.xml.sax.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Services Platform</title>
<link rel="stylesheet" href="home.css">

 <style>
        
        .section {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .section h2 {
            flex: 1 100%;
            margin: 0;
            padding: 10px 0;
        }

        .section p {
            flex: 1 50%; 
            margin: 0;
            padding: 10px 0;
        }
   

   .user-info {
            float: right;
            margin-right: 20px; 
            font-size: 16px;
            color: #333;
            margin-top: 105px; 
        }
   
 
</style>

</head>

<body>

<jsp:include page="header.jsp" />


<%-- Retrieve user's email from session --%>
<% if (request.getSession(false) != null && request.getSession(false).getAttribute("user_email") != null) { %>
    <%-- Get the user's email from the session --%>
    <% String userEmail = (String) request.getSession(false).getAttribute("user_email"); %>
     <%-- Extract the part before "@" symbol --%>
    <% String userEmailPrefix = userEmail.substring(0, userEmail.indexOf("@")); %>
    <%-- Display the user's email next to the location bar --%>
    <div class="user-info">Welcome, <%= userEmailPrefix %>!</div>
<% } %>



<div class="main-content" style="padding-top: 80px;">
   
    <div class="search-container">
        <input type="text" class="search-bar" placeholder="Search Services">
        <select class="location-dropdown">
            <option value="">Select Location</option>
            <option value="location1">Chennai</option>
            <option value="location2">Pondicherry</option>
            <option value="location3">Vijayawada</option>
            <option value="location4">Nellore</option>
            <option value="location5">Tirupati</option>
            <option value="location6">Vizag</option>
           
        </select>
    </div>
    
</div>

<br>
 <div class="home-container">
        <h2>Welcome to Home Services Platform</h2>
        <img src="images/home.jpg" alt="Your Photo">
        <p>Home services at your doorstep</p>
    </div>

<div class="section-divider" style="border-top: 3px solid #ccc; margin-top: 20px;"></div>

<h2 style="text-align:center;">Our Services</h2>
<div class="image-container">
    <div>
        <a href="paint.jsp">
            <img class="zoomable-image" src="images/paint.jpg" alt="Image 1">         
        </a>
        <p>Painting</p>
    </div>
    <div>
        <a href="ac.jsp">
            <img class="zoomable-image" src="images/ac.jpg" alt="Image 2">
           
        </a>
        <p>AC Repair</p>
    </div>
    <div>
        <a href="drill.jsp">
            <img class="zoomable-image" src="images/drill.jpg" alt="Image 3">
        </a>
        <p>Drill</p>
    </div>
    
     <div>
        <a href="electric.jsp">
            <img class="zoomable-image" src="images/electric.jpg" alt="Image 1">
        </a>
        <p>Electric</p>
    </div>
    
    <div>
        <a href="garden.jsp">
            <img class="zoomable-image" src="images/gard.jpg" alt="Image 2">
        </a>
        <p>Gardening</p>
    </div>
    
    
</div>
<div class="section-divider" style="border-top: 5px solid #ccc; margin-top: 20px;"></div>

<h2 style="text-align:center;">Popular Services</h2>
<div class="image-container">

    <div>
        <a href="chimney.jsp">
            <img class="zoomable-image" src="images/chimney.jpg" alt="Image 4">
        </a>
        <p>Chimney Repair</p>
    </div>
    <div>
        <a href="plumbing.jsp">
            <img class="zoomable-image" src="images/plumb.jpg" alt="Image 5">
        </a>
        <p>Plumbing</p>
    </div>
    <div>
        <a href="fan.jsp">
            <img class="zoomable-image" src="images/fan.jpg" alt="Image 6">
        </a>
        <p>Fan Repair</p>
    </div>
    <div>
        <a href="washing.jsp">
            <img class="zoomable-image" src="images/washing.jpg" alt="Image 6">
        </a>
        <p>Washing Machine Repair</p>
    </div>
    <div>
        <a href="cupboard.jsp">
            <img class="zoomable-image" src="images/cup.jpg" alt="Image 6">
        </a>
        <p>Cupboard Repair</p>
    </div>
    
</div>
<div class="section-divider" style="border-top: 5px solid #ccc; margin-top: 20px;"></div>

<h2 style="text-align:center;">Cleaning Services</h2>
<div class="image-container">

    <div>
        <a href="service7.jsp">
            <img class="zoomable-image" src="images/room.jpg" alt="Image 7">
        </a>
        <p>Room Cleaning</p>
    </div>
    <div>
        <a href="service8.jsp">
            <img class="zoomable-image" src="images/kitch.jpg" alt="Image 8">
        </a>
        <p>Kitchen Cleaning</p>
    </div>
    <div>
        <a href="service9.jsp">
            <img class="zoomable-image" src="images/bathclean.jpg" alt="Image 9">
        </a>
        <p>Bathroom Cleaning</p>
    </div>
    <div>
        <a href="service9.jsp">
            <img class="zoomable-image" src="images/sofa.jpg" alt="Image 9">
        </a>
        <p>Sofa Cleaning</p>
    </div>
    <div>
    
        <a href="service9.jsp">
            <img class="zoomable-image" src="images/homeclean.jpg" alt="Image 9">
        </a>
        <p>Full House Cleaning</p>
    </div>
 </div> 
  <!-- Add more images and service names as needed -->
<div class="section-divider" style="border-top: 5px solid #ccc; margin-top: 20px;"></div>
 
 
 
<div id="xmlContent"></div>
<script>
        function loadXMLContent() {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (xmlhttp.readyState == XMLHttpRequest.DONE) {
                    if (xmlhttp.status == 200) {
                        parseXMLContent(xmlhttp.responseXML);
                    } else {
                        console.error('Error fetching XML data:', xmlhttp.statusText);
                    }
                }
            };
            xmlhttp.open("GET", "content.xml", true);
            xmlhttp.send();
        }

        function parseXMLContent(xml) {
            var contentContainer = document.getElementById("xmlContent");
            var sections = xml.getElementsByTagName("section");
            var html = "";

            for (var i = 0; i < sections.length; i++) {
                var section = sections[i];
                var title = section.getAttribute("title");
                html += "<div class='section'>";
                html += "<h2>" + title + "</h2>";

                var links = section.getElementsByTagName("link");
                for (var j = 0; j < links.length; j++) {
                    var link = links[j];
                    var linkTitle = link.getAttribute("title");
                    var linkTitle = link.getAttribute("title");
                    html += "<p>" + linkTitle + "</p>";
                }

                html += "</div>"; 
            }

            contentContainer.innerHTML = html;
        }

        window.onload = function() {
            loadXMLContent();
        };
    </script>
</body>
</html>
