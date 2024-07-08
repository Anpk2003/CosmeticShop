<%-- 
    Document   : thongke.jsp
    Created on : Mar 12, 2024, 1:16:59 AM
    Author     : Phung An
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Quản trị Viên</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <style>
            /* Custom CSS */
            /* Adjustments for mobile */
            @media (max-width: 768px) {
                .app.sidebar-mini.rtl .app-sidebar {
                    display: none !important;
                }

                .app.sidebar-mini.rtl .app-content {
                    margin-left: 0 !important;
                }

                .app.sidebar-mini.rtl .app-sidebar__overlay {
                    display: none !important;
                }
            }

            /* Header Styles */
            .app-header {
                background-color: #343a40;
                color: #fff;
                padding: 10px;
            }

            .app-sidebar__user-name {
                margin: 0;
                font-weight: bold;
            }

            .app-sidebar__user-designation {
                margin: 0;
            }

            /* Sidebar Styles */
            .app-sidebar {
                background-color: #fff;
                color: #000;
                width: 250px;
                position: fixed;
                height: 100%;
                overflow-y: auto;
            }

            .app-sidebar__user {
                background-color: #f8f9fa;
                padding: 20px;
                text-align: center;
            }

            .app-menu {
                list-style: none;
                padding-left: 0;
            }

            .app-menu__item {
                color: #000;
                text-decoration: none;
            }

            .app-menu__item:hover {
                background-color: #f0f0f0;
            }

            .app-menu__icon {
                margin-right: 10px;
            }

            /* Main Content Styles */
            .app-content {
                margin-left: 250px;
                padding: 20px;
            }

            .app-title {
                margin-bottom: 20px;
            }

            /* Widget Styles */
            .widget-small {
                margin-bottom: 20px;
                padding: 20px;
                border-radius: 5px;
            }

            .widget-small h4 {
                margin-top: 0;
            }

            .info-tong {
                margin-bottom: 0;
            }

            /* Table Styles */
            .table-bordered {
                border: 1px solid #dee2e6;
            }

            .table-bordered th,
            .table-bordered td {
                border: 1px solid #dee2e6;
            }

            /* Button Styles */
            a.btn {
                text-decoration: none;
                color: #f59d39;
                background-color: #fbe2c5;
                padding: 5px;
                border-radius: 5px;
            }

            a.btn:hover {
                background-color: #fbca86;
            }

        </style>

    </style> 
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

    <!-- fonts style -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

    <!-- font awesome style -->
    <link href="css/font-awesome.min.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet" />
    <!-- responsive style -->
    <link href="css/responsive.css" rel="stylesheet" />
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load("current", {packages: ["corechart"]});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Category', 'Số lượng sản phẩm'],
                ['Makeup', 6],
                ['skincares', 5],
                ['Haircare', 4],
                ['Fragrance', 5],
                ['Bodycare', 3]
            ]);

            var options = {
                title: 'Các sản phẩm của nhãn hàng',
                is3D: true,
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
            chart.draw(data, options);
        }
    </script>
</head>


<body onload="time()" class="app sidebar-mini rtl">
    <!-- Navbar-->
    <header class="app-header bg-white"> <!-- Thêm lớp bg-white từ Bootstrap để đặt màu nền là màu trắng -->
        <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                        aria-label="Hide Sidebar"></a>
        <!-- Navbar Right Menu-->
        <ul class="app-nav">


            <!-- User Menu-->
            <jsp:include page="menu.jsp"/>

            </li>
        </ul>
    </header>

    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
        <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="images/User-avatar.svg.png" width="50px"
                                            alt="User Image">
            <div>
                <p class="app-sidebar__user-name"><b>${sessionScope.name}</b></p>
                <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
            </div>
        </div>
        <hr>
        <ul class="app-menu">
            <li><a class="app-menu__item" href="manage.jsp"><i class='app-menu__icon bx bx-tachometer'></i><span
                        class="app-menu__label">Bảng điều khiển</span></a></li>
            <li><a class="app-menu__item" href="adminaccount"><i class='app-menu__icon bx bx-user-voice'></i><span
                        class="app-menu__label">Quản lý khách hàng</span></a></li>
            <li><a class="app-menu__item" href="adminproduct"><i
                        class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
            </li>
            <li><a class="app-menu__item" href="managerbill"><i class='app-menu__icon bx bx-task'></i><span
                        class="app-menu__label">Quản lý đơn hàng</span></a></li>
        </ul>
    </aside>

    <main class="app-content">
        <div class="row">
            <div class="col-md-12 col-lg-12">
                <form action="thongke" method="get">
                    <div class="row">
                         <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small primary coloured-icon"><i class='icon bx bxs-user-account fa-3x'></i>
                                <div class="info">
                                    <h4>Tổng khách hàng</h4>
                                    <p><b>${requestScope.acc} khách hàng</b></p>
                                    <p class="info-tong">Tổng số khách hàng được quản lý.</p>
                                </div>
                            </div>
                        </div>
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small info coloured-icon"><i class='icon bx bxs-data fa-3x'></i>
                                <div class="info">
                                    <h4>Các loại sản phẩm</h4>
                                    <p><b>${requestScope.pro} sản phẩm</b></p>
                                    <p class="info-tong">Tổng số sản phẩm được quản lý.</p>
                                </div>
                            </div>
                        </div>
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small warning coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
                                <div class="info">
                                    <h4>Tổng đơn hàng</h4>
                                    <p><b>${requestScope.numb} đơn hàng</b></p>
                                    <p class="info-tong">Tổng số hóa đơn bán hàng trong tháng.</p>
                                </div>
                            </div>
                        </div>
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small danger coloured-icon"><i class='icon bx bxs-error-alt fa-3x'></i>
                                <div class="info">
                                    <h4>Sản phẩm đã bán ra</h4>
                                    <p><b>${requestScope.nump} sản phẩm</b></p>
                                    <p class="info-tong">Số sản phẩm cần chú ý để nhập.</p>
                                </div>
                            </div>
                        </div>
                        <!-- col-12 -->
                       
                        <!-- / col-12 -->
                    </div>
                </form>
            </div>
        </div>
    </main>
</body>
</html>
