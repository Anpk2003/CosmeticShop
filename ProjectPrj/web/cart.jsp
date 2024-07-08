<%-- 
    Document   : cart.jsp
    Created on : Mar 6, 2024, 11:18:01 PM
    Author     : Phung An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

        <!-- fonts style -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

        <!-- font awesome style -->
        <link href="css/font-awesome.min.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />

        <style>
            img{
                width: 120px;
                height: 120px;
            }
    .payment-section {
        text-align: right;
        margin-right: 70px; /* Điều chỉnh khoảng cách nếu cần */
    }

        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <form action="cart?action=updatecart" method="post">
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Cart</b></h2>

                            </div>
                            <table class="table table-striped table-hover" style="border: 10px">
                                <thead>
                                    <tr>

                                        <th>ID</th>
                                        <th>Title</th>
                                        <th>Price</th>
                                        <th>Thumbnail</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th>Delete</th>

                                    </tr>
                                </thead>
                                <tbody>
                                  
                                    <c:set var="i" value="${sessionScope.cart}"/>
                                    <c:forEach items="${i.items}" var="o">
                                        <tr>
                                            <td>${o.product.id}</td>
                                            <td>${o.product.title}</td> 
                                            <td>${o.product.price}</td> 
                                            <td>
                                                <img src="${o.product.thumbnail}">
                                            </td>
                                            <td><input type="number" name="quantity" value="${o.quantity}" min="1" max="${sessionScope.productOrigin.quantity}"required></td>
                                            <td>${o.product.price*o.quantity}</td>
                                            <td><a href="cart?action=delete&product_id=${o.product.id}">delete</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <button type="submit"> Update</button>

                        </div>
                    </div>
                </div>
            </div>
            <c:if test="${sessionScope.size!=0}">
                <div class="payment-section">
                    <hr/>
                    <p>Tổng tiền:</p> 
                    <p><fmt:formatNumber pattern="##########" value="${sessionScope.total}"/>đ</p>
                    <a href="forminfo.jsp">Thanh toán</a>
                </div>
            </c:if>
        </form>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>
