<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="paint.css">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="left-section">
        <!-- Service details -->
        <h2>Service :</h2>
        <p>Electric Repair</p>
        <h3>Rating :</h3>
        <ul>
            <li>4 stars</li>
            
            <!-- Add more painting types as needed -->
        </ul>
    </div>

    <div class="center-section">
        <!-- Available services -->
        <h2>Available Services</h2>
        <div class="available-services" id="availableServices">
        <div class="service">
        <img src="images/electric.jpg" alt="Painting Service">
        <div class="service-details">
        <h3>Wall Drill</h3>
        <p class="price">Price: $100</p>
        <div class="button-container">
                <button onclick="addToCart(1, 'Service Name 1', 50, 'images/paint.jpg')">Add to Cart</button>
                <button onclick="openReviewPage()">Add Review</button>
                <button onclick="ReviewPage()">Review</button>
            </div>
           </div>            
       </div><hr>
       
     
      
          <!-- Add more service items as needed -->
     </div>   
    </div>   

</body>
</html>