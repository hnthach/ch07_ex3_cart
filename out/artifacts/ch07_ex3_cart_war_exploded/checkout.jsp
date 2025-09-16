<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
<h1>Checkout</h1>

<p style="text-align:center;">Please enter your shipping information below:</p>

<div class="container">
    <form action="orderConfirmation.jsp" method="post" accept-charset="UTF-8">
    <label>Full Name:</label>
        <input type="text" name="name" required><br>

        <label>Email:</label>
        <input type="email" name="email" required><br>

        <label>Address:</label>
        <input type="text" name="address" required><br>

        <label>Payment Method:</label>
        <select name="paymentMethod" required>
            <option value="">-- Select a method --</option>
            <option value="Credit Card">Credit Card</option>
            <option value="PayPal">PayPal</option>
            <option value="Cash on Delivery">Cash on Delivery</option>
        </select><br><br>

        <input type="submit" value="Confirm Order">

    </form>
</div>
</body>
</html>
