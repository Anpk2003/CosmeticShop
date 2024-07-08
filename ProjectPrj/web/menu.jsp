<%-- 
    Document   : menu.jsp
    Created on : Feb 27, 2024, 10:54:26 PM
    Author     : Phung An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TheCosmetic</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
        <style>
            .user_optio_box {
                position: relative;
            }

            .custom-select {
                position: relative;
                width: 150px; /* Adjust as needed */
            }

            #userOptions {
                width: 100%;
                padding: 5px;
                cursor: pointer;
                appearance: none;
                -webkit-appearance: none;
                -moz-appearance: none;
                background: url('path/to/your-caret-icon.png') no-repeat right center;
                border: 1px solid #ddd;
                border-radius: 5px;
                padding-right: 20px; /* Adjust as needed */
            }

            #userOptions:hover {
                border-color: #aaa;
            }

            #userOptions option {
                color: black;
            }

            #userOptions::after {
                content: '\f107'; /* Unicode for the FontAwesome caret-down icon */
                font-family: 'FontAwesome';
                position: absolute;
                right: 10px; /* Adjust as needed */
                top: 50%;
                transform: translateY(-50%);
            }
        </style>
        <link href="css/font-awesome.min.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />

    </head>
    <body>
        <header class="header_section"style="margin-bottom: 20px">
            <div class="container-fluid" >
                <nav class="navbar navbar-expand-lg custom_nav-container " >
                    <a class="navbar-brand" href="home">
                        <span>
                            TheCosmetic
                        </span>
                    </a>

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class=""> </span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav  ">
                            <li class="nav-item active">
                                <a class="nav-link" href="home">Trang Chủ <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="about.jsp"> Giới Thiệu</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="product">Sản Phẩm</a>
                            </li>
                        </ul>
                        <div class="user_optio_box">
                            <!--                                <a href="login.jsp">
                                                                <i class="fa fa-user" aria-hidden="true"></i>
                                                            </a>-->
                            <c:if test="${((sessionScope.account!=null)&&(sessionScope.account.isAdmin==false) )}">
                                <select id="userOptions" onchange="redirectToPage()">
                                    <option value="#" selected disabled hidden>
                                    <i class="fa fa-user" aria-hidden="true">Xin chào ${sessionScope.account.getUsername()}</i>
                                    </option>
                                    <option value="authentication?action=logout" >Đăng Xuất</option>
                                    <option value="profile.jsp">Hồ Sơ</option>
                                </select>
                            </c:if>
                            <c:if test="${((sessionScope.account!=null)&&(sessionScope.account.isAdmin==true) )}">
                                <select id="userOptions" onchange="redirectToPage()">
                                    <option value="#" selected disabled hidden>
                                    <i class="fa fa-user" aria-hidden="true">Xin chào  ${sessionScope.account.getUsername()}</i>
                                    </option>
                                    <option value="authentication?action=logout" >Đăng Xuất</option>
                                    <option value="profile.jsp">Hồ Sơ</option>
                                    <option value="manage.jsp">Quản lý</option>
                                </select>
                            </c:if>
                            <c:if test="${sessionScope.account==null}">
                                <select id="userOptions" onchange="redirectToPage()">
                                    <option value="#" selected disabled hidden>
                                    <i class="fa fa-user" aria-hidden="true" id="choose"> Xin chào,bạn
                                    </i>
                                    </option>
                                    <option value="login.jsp" id="login1">Đăng Nhập</option>
                                    <option value="register.jsp">Đăng ký</option>
                                </select>
                            </c:if>
                            <a href="cart?action=showcart">
                                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
        </header>
        <script>
            function redirectToPage() {
                console.log("Redirecting...");
                var selectElement = document.getElementById("userOptions");
                var selectedValue = selectElement.options[selectElement.selectedIndex].value;

                // Kiểm tra nếu người dùng đã chọn "Login", chuyển hướng đến trang login.jsp
                if (selectedValue === "login.jsp") {
                    console.log("Redirecting to login.jsp");
                    window.location.href = selectedValue;
                }
                //
                if (selectedValue === "profile.jsp") {
                    console.log("Redirecting to profile.jsp");
                    window.location.href = selectedValue;
                }
                if (selectedValue === "authentication?action=logout") {
                    console.log("Redirecting to logout");
                    window.location.href = selectedValue;

                }
                //tra ve trang register.jsp
                if (selectedValue === "register.jsp") {
                    console.log("Redirecting to register.jsp");
                    window.location.href = selectedValue;
                }
                if (selectedValue === "manage.jsp") {
                    console.log("Redirecting to manage.jsp");
                    window.location.href = selectedValue;
                }

            }

        </script>
    </body>
</html>
