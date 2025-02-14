<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="paint.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
    function addToCart(serviceId, serviceName, servicePrice, serviceImage) {
        $.post("AddToCartServlet", { 
            serviceId: serviceId, 
            serviceName: serviceName, 
            servicePrice: servicePrice,
            serviceImagePath: serviceImage 
        }, function(data) {
            alert(data);
            $("#proceedButton").show();
        });
        
        $.post("StoreServiceServlet", {
            serviceName: serviceName,
            servicePrice: servicePrice
        }, function(data) {
            
            alert(data);
        });
    }


    function updateCart() {
        $.get("GetCartServlet", function(data, status, xhr) {
            $("#cartContents").html(data);
            var isEmpty = xhr.getResponseHeader("isEmpty");
            if (isEmpty === "false") {
                $("#proceedButton").show(); 
            } else {
                $("#proceedButton").hide(); 
            }
        });
    }
    </script>

</head>
<body>

<jsp:include page="header.jsp" />

<div class="main-content">
      
    <div class="left-section">
        
        <h2>Rating</h2>
        <p>5 stars</p>
        <h3>Service :</h3>
        <ul>
            <li>Full Home Painting</li>
            <li>Room Painting</li>
            
        </ul>
    </div>

    <div class="center-section">
        
        <h2>Available Services</h2>
        <div class="available-services" id="availableServices">
        <div class="service">
        <img src="images/paint.jpg" alt="Painting Service">
        <div class="service-details">
        <h3>Full House Painting</h3>
        <p class="price">Price: $150</p>
        <div class="button-container">
                <button onclick="addToCart(1, 'Service Name 1', 150, 'images/paint.jpg')">Add to Cart</button>
                <button onclick="openReviewPage()">Add Review</button>
                <button onclick="ReviewPage()">Review</button>
            </div>
           </div>            
       </div><hr>
       
      <div class="service">
        <img src="images/drill.jpg" alt="Painting Service">
        <div class="service-details">
        <h3>House Painting</h3>
        <p class="price">Price: $50</p>
        <div class="button-container">
         <button onclick="addToCart(2, 'Service Name 2', 50)">Add to Cart</button>
          <button onclick="openReviewPage()">Add Review</button>
                <button onclick="ReviewPage()">Review</button>
           </div>
           </div>            
       </div><hr>
      
          
     </div>   
    </div>   
</div>

<script type="text/javascript">
function openReviewPage() {
    window.open("review.jsp", "_blank");
}

function openReviewPage() {
    
    window.open("showreview.jsp", "_blank");
}
</script>

 

</body>
</html>
