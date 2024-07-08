<%-- 
    Document   : profile.jsp
    Created on : Feb 29, 2024, 4:30:08 PM
    Author     : Phung An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

        <!-- fonts style -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

        <!-- font awesome style -->
        <link href="css/font-awesome.min.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 600px;
                margin: 50px auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .form-group {
                margin-bottom: 20px;
            }

            label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }

            input {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            button {
                background-color: #4caf50;
                color: #fff;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <div class="container">
            <form action="authentication?action=changeprofile" method="post">
                <h3 style="color: chocolate;margin-left: 40% "> Thông tin tài khoản</h3>
                <c:set var="acc" value="${sessionScope.account}"/>
                <c:if test="${acc!=null}">
                     <div class="form-group">
                         Username:<input type="text" name="username" value= "${acc.username}" style="width: 200px"  />
                    </div>
                     <div class="form-group">
                        Email:${acc.email}
                    </div>
                    <div class="form-group">
                        <c:set var="acc1" value="${sessionScope.role}"/>
                        Nghiệp vụ:${acc1}
                    </c:if>
                </div>
                <div class="form-group">
                    <label for="password">Mật Khẩu Hiện Tại:</label>
                    <input type="password" name="password" required >
                </div>
                <input type="hidden" name="email" value="${sessionScope.account.getEmail()}"/>
                <div class="form-group">
                    <label for="password">Mật Khẩu Mới:</label>
                    <input type="password" name="newpassword"/>
                </div>
                <div class="form-group">
                    <label for="password">Nhập Lại Mật Khẩu Mới:</label>
                    <input type="password"  name="cnewpassword" />
                </div>
                <h3 style="color: red">${requestScope.mess}</h3>
                <input type="submit" style="background-color: green;color: white" value="CHANGE">
            </form>
        </div>
    </body>
</html>
