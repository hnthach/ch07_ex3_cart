<!DOCTYPE html>
<html>
<head>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta charset="utf-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>

<h1>Your cart</h1>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table>
    <tr>
        <th>Quantity</th>
        <th>Description</th>
        <th>Price</th>
        <th>Amount</th>
        <th></th>
    </tr>

    <c:forEach var="item" items="${cart.items}">
        <tr>
            <!-- Update: vẫn dùng POST -->
            <td>
                <form action="cart" method="post">
                    <input type="hidden" name="productCode" value="${item.product.code}">
                    <input type="text" name="quantity" value="${item.quantity}" id="quantity">
                    <input type="submit" value="Update">
                </form>
            </td>

            <td>${item.product.description}</td>
            <td>${item.product.priceCurrencyFormat}</td>
            <td>${item.totalCurrencyFormat}</td>

            <!-- Remove: dùng URL rewriting (GET) -->
            <td>
                <a href="cart?action=cart&productCode=${item.product.code}&quantity=0">
                    Remove Item
                </a>
            </td>
        </tr>
    </c:forEach>
</table>

<p><b>To change the quantity</b>, enter the new quantity
    and click on the Update button.</p>

<form action="" method="post">
    <input type="hidden" name="action" value="shop">
    <input type="submit" value="Continue Shopping">
</form>

<!-- Thêm nút Mua hàng (Checkout) -->
<form action="cart" method="post">
    <input type="hidden" name="action" value="checkout">
    <input type="submit" value="Mua hàng">
</form>

</body>
</html>
