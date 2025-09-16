<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
<div class="container">
    <h1>Thank you for your order 🎉</h1>

    <p><b>Name:</b> ${param.name}</p>
    <p><b>Email:</b> ${param.email}</p>
    <p><b>Address:</b> ${param.address}</p>
    <p><b>Payment Method:</b> ${param.paymentMethod}</p>

    <form action="cart" method="post">
        <input type="hidden" name="action" value="shop">
        <input type="submit" value="Continue Shopping">
    </form>
</div>
</body>
</html>
