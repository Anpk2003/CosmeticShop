<%-- 
    Document   : forminfo
    Created on : Mar 9, 2024, 4:22:22 PM
    Author     : Phung An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Information</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                padding: 20px;
            }

            h2 {
                color: #333;
            }

            form {
                max-width: 400px;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            label {
                display: block;
                margin-bottom: 5px;
            }

            input[type="text"],
            input[type="email"],
            input[type="tel"],
            textarea {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <h2 style="margin-left: 40%">Nhập thông tin khách hàng</h2>
        <form action="checkout" method="post">
            <input type="hidden" name="total" value="${total}"/>
            <label for="fullname">Họ và tên:</label>
            <input type="text" id="fullname" name="fullname" value="${sessionScope.account.username}" required><br>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${sessionScope.account.email}" readonly required><br>

            <label for="phone">Số điện thoại:</label>
            <input type="tel" id="phone" name="phone" required><br>

            <label for="address">Địa chỉ:</label>
            <input type="text" id="address" name="address" required><br>

            <label for="note">Ghi chú:</label>
            <textarea id="note" name="note"></textarea><br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
