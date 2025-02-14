<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<%@ page import="java.util.List" %>

  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    /* Add CSS styles here */
   /* cart.css */

/* Container styles */
.cart-container {
    margin: 20px auto;
    max-width: 800px;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
    margin-top: 80px;
}

/* Header styles */
.cart-header {
    text-align: center;
    margin-bottom: 20px;
}

/* Cart item styles */
.cart-item {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #fff;
}

.cart-item img {
    width: 100px;
    height: auto;
    margin-right: 20px;
}

.cart-item-details {
    flex: 1;
}

.cart-item-details h3 {
    margin: 0;
    font-size: 18px;
}

.cart-item-details p {
    margin: 5px 0;
    color: #888;
}

.cart-item-details .price {
    font-weight: bold;
}


/* Button styles */
.proceed {
    display: block;
    margin-top: 10px; /* Add space between the price and the button */
    padding: 10px 20px; /* Add padding to the button */
    border: none;
    border-radius: 5px;
    background-color: #007bff; /* Button background color */
    color: #fff; /* Button text color */
    font-size: 16px;
    cursor: pointer;
}

.proceed:hover {
    background-color: #0056b3; /* Button background color on hover */
}

   

</style>

</head>
<body>

<jsp:include page="header.jsp" />
 
 <div class="cart-header" style="position:relative; z-index: 100;">
    <h1>Cart</h1>
</div>
   
<div class="cart-container">
    <div id="cartContents" class="cart-items">
        <!-- Cart contents will be displayed here -->
       </div>
</div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    updateCart();
});

function updateCart() {
    $.get("GetCartServlet", function(data) {
        $("#cartContents").html(data);
        var isEmpty = $("meta[name=isEmpty]").attr("content");
        if (isEmpty === "false") {
            var totalAmount = parseFloat($("meta[name=totalAmount]").attr("content"));
            $(".total-amount").text("Total Amount: $" + totalAmount.toFixed(2)); // Display total amount
            $(".total-amount").show(); // Show the total amount if the cart is not empty
        } else {
            $(".total-amount").hide(); // Hide the total amount if the cart is empty
        }
    });
}

</script>
 
 
    
</body>
</html>