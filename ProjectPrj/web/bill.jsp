<%-- 
    Document   : bill.jsp
    Created on : Mar 10, 2024, 4:17:12 PM
    Author     : Phung An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill </title>
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
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
               
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <a href="manage.jsp">
                                <h2>Manage <b>Bill</b></h2>
                            </a>

                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover" style="border: 10px">
                    <thead>
                        <tr>

                            <th>Order_ID</th>
                            <th>Tên Khách Hàng</th>
                            <th>Ngày mua hàng</th>
                            <th>Địa chỉ</th>
                            <th>Tổng số tiền</th>
                            <th>Ghi Chú</th>

                        </tr>
                    </thead>
                    <tbody>
                       
                        <c:forEach items="${sessionScope.bill1}" var="o">
                              <c:set var="id" value="${o.id}"/>
                            <tr>
                                <td>${o.id}</td>
                                <td>${o.fullname}</td>
                                <td>${o.order_date}</td>
                                <td>${o.address}</td>
                                <td>${o.total_money}</td>
                                <td>${o.note}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
              
                <a href="home"><button type="button" class="btn btn-primary">Back to home</button>

            </div>
             

            <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>

