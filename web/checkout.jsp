<!DOCTYPE html>
<html>
<head>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
<h1>Checkout</h1>

<p>Cảm ơn bạn đã mua hàng. Vui lòng nhập thông tin giao hàng:</p>

<form action="order" method="post">
    <label>Họ tên:</label>
    <input type="text" name="name"><br><br>

    <label>Email:</label>
    <input type="email" name="email"><br><br>

    <label>Địa chỉ:</label>
    <input type="text" name="address"><br><br>

    <input type="submit" value="Xác nhận đơn hàng">
</form>

</body>
</html>
