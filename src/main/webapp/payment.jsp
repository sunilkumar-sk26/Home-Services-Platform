<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="payment.css">
</head>
<body>
    <h1>Payment Details</h1>
    <div class="payment-container">
        <form action="ConfirmBookingServlet" method="post">
            <div class="payment-option">
                <input type="radio" id="netbanking" name="paymentMode" value="netbanking">
                <label for="netbanking">Net Banking</label>
            </div>
            <div class="payment-option">
                <input type="radio" id="upi" name="paymentMode" value="upi">
                <label for="upi">UPI</label>
            </div>
            <div class="payment-option">
                <input type="radio" id="creditcard" name="paymentMode" value="creditcard">
                <label for="creditcard">Credit Card</label>
            </div>
            <div class="payment-option">
                <input type="radio" id="debitcard" name="paymentMode" value="debitcard">
                <label for="debitcard">Debit Card</label>
            </div>
            <button id="payButton" type="submit">PAY</button>
        </form>
    </div>
    
   
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
   
    $("#payButton").click(function(event) {
        event.preventDefault(); 
        
        storeServices();
    });
});

function storeServices() {
   
    $.post("StoreServiceServlet", { 
        serviceName: serviceName, 
        servicePrice: servicePrice 
    }, function(response) {
       
        window.location.href = "paymentSuccess.jsp";
    });
}
</script>
</body>
</html>