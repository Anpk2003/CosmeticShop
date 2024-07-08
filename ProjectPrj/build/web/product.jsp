<%-- 
    Document   : product
    Created on : Feb 18, 2024, 9:41:04 PM
    Author     : Phung An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <link rel="icon" href="images/fevicon/fevicon.png" type="image/gif" />
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <title>TheCosmetics</title>


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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </head>

    <body class="sub_page">

        <div class="hero_area">
            <!-- header section strats -->
            <jsp:include page="menu.jsp"/>
            <!-- end header section -->
        </div>
        <!-- selects products -->
        <div class="container">
            <!-- search -->
            <form class="d-flex" action="product?action=search" method="post">
                <input class="form-control me-2" type="text" name="key2" placeholder="Nhập tên, miêu tả" style="width: 400px;margin-left: 300px">
                <button class="btn btn-outline-success" type="submit" value="Search">Search</button>
                <!-- Thêm button sắp xếp -->
                <select name="sort" class="form-select" style="margin-left: 10px;">
                    <option value="asc">Giá tăng dần</option>
                    <option value="desc">Giá giảm dần</option>
                </select>
                <button class="btn btn-outline-secondary" type="submit" value="Sort">Sắp xếp</button>
            </form>
            <!--bang category-->
            <div class="row" style="margin-top: 20px">
                <div class="col-sm-3" style="display: block">
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase d-flex justify-content-between align-items-center" data-bs-toggle="collapse" href="#categoryCollapse" role="button" aria-expanded="false" aria-controls="categoryCollapse">
                            <span><i class="fa fa-list"></i> Categories</span>
                            <i class="fa fa-chevron-down"></i>
                        </div>
                        <ul class="list-group category_block collapse" id="categoryCollapse">
                            <li class="list-group-item text-white"><a href="product?action=category&cid=0">All</a></li>
                                <c:forEach items="${requestScope.listcategory}" var="o">
                                <li class="list-group-item text-white"><a href="product?action=category&cid=${o.id}">${o.name}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                    <div style="border: 1px solid black; padding: 10px; border-radius: 5px; width: 200px;">
                        <form action="product?action=checkbox" method="post">
                            <input type="checkbox" name="dc" value="0"> 300'000đ trở xuống<br/>
                            <input type="checkbox" name="dc" value="1"> 300'000đ-1'000'000đ<br/>
                            <input type="checkbox" name="dc" value="2"> 1'000'000đ trở lên<br/>
                            <!-- Add more checkboxes as needed -->
                            <input type="submit" value="Submit">
                        </form>
                    </div>

                </div>
                <div class="col-sm-9">
                    <div class="row">
                        <c:set value="${requestScope.listproduct}" var="list"/>
                        <c:if test="${((list==null)||(list.size()==0))}">
                            <h3 style="color: red; margin :30px auto">Chưa có sản phẩm </h3>
                        </c:if>
                        <c:if test="${((list!=null)||(list.size()>0))}">
                            <c:forEach items="${list}" var="c">
                                <div class="col-12 col-md-6 col-lg-4">
                                    <div class="card" style=" margin: 10px auto">
                                        <img class="card-img-top" src="${c.thumbnail}" alt="Card image cap">
                                        <div class="card-body">
                                            <h4 class="card-title show_txt"><a href="#" title="View Product">${c.title}</a></h4>
                                         <!--   <p class="card-text show_txt">${c.description}</p>-->
                                            <div class="row">
                                                <div class="col">
                                                    <p class="btn btn-danger btn-block">${c.price} đ</p>
                                                </div>
                                                <div class="col">
                                                    <a href="product?action=details&product_id=${c.id}" class="btn btn-success btn-block">Xem sản phẩm</a>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </c:forEach> 
                        </c:if>

                    </div>
                </div>

            </div>


        </div>
        <!--end select product>

        <!-- info section -->
        <section class="info_section layout_padding2">
            <div class="container">
                <div class="info_logo">
                    <h2>
                        Cosmetic SHOP
                    </h2>
                </div>
                <div class="row">

                    <div class="col-md-3">
                        <div class="info_contact">
                            <h5>
                                Thông tin cửa hàng
                            </h5>
                            <div>
                                <div class="img-box">
                                    <img src="images/location-white.png" width="18px" alt="">
                                </div>
                                <p>
                                    <a href="https://www.google.com/maps/place/Tr%C6%B0%E1%BB%9Dng+%C4%90%E1%BA%A1i+h%E1%BB%8Dc+FPT/@21.0124217,105.5227143,17z/data=!3m1!4b1!4m6!3m5!1s0x3135abc60e7d3f19:0x2be9d7d0b5abcbf4!8m2!3d21.0124167!4d105.5252892!16s%2Fm%2F02rsytm?entry=ttu" style="color: white"> Địa chỉ</a>

                                </p>
                            </div>
                            <div>
                                <div class="img-box">
                                    <img src="images/telephone-white.png" width="12px" alt="">
                                </div>
                                <p>
                                    +01 1234567890
                                </p>
                            </div>
                            <div>
                                <div class="img-box">
                                    <img src="images/envelope-white.png" width="18px" alt="">
                                </div>
                                <p>
                                    anpk2300@gmail.com
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="info_info">
                            <h5>
                                MỸ PHẨM
                            </h5>
                            <p>
                                Khám phá vẻ đẹp tự nhiên - Nơi tôn vinh sắc đẹp và chăm sóc làn da của bạn, cửa hàng mỹ phẩm của chúng tôi là hành trình của sự quan tâm và phong cách cá nhân
                            </p>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="info_insta">
                            <h5>
                                Instagram
                            </h5>
                            <div class="insta_container">
                                <div class="row m-0">
                                    <div class="col-4 px-0">
                                        <a href="">
                                            <div class="insta-box b-1">
                                                <img src="images/w1.jpg" alt="">
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-4 px-0">
                                        <a href="">
                                            <div class="insta-box b-1">
                                                <img src="images/w2.jpg" alt="">
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-4 px-0">
                                        <a href="">
                                            <div class="insta-box b-1">
                                                <img src="images/w3.GIF" alt="">
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-4 px-0">
                                        <a href="">
                                            <div class="insta-box b-1">
                                                <img src="images/w4.jpg" alt="">
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-4 px-0">
                                        <a href="">
                                            <div class="insta-box b-1">
                                                <img src="images/w5.jpg" alt="">
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-4 px-0">
                                        <a href="">
                                            <div class="insta-box b-1">
                                                <img src="images/w6.jpg" alt="">
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d59599.049986103804!2d105.74331424921067!3d20.9950170919113!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac927ce95957%3A0xe230355f8983adb9!2zVGhhbmggWHXDom4sIEjDoCBO4buZaSwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2sus!4v1710175530570!5m2!1svi!2sus" height="200" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>    <!-- footer section -->

                    </div>
                </div>
            </div>
        </section>
        <!-- end info_section -->

        <!-- footer section -->
        <section class="footer_section">
            <div class="container">
                <p>
                    &copy; <span id="displayYear"></span> All Rights Reserved By
                    <a href="https://html.design/">Free Html Templates</a>
                </p>
            </div>
        </section>
        <!-- footer section -->
        <!-- jQery -->
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- popper js -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
        </script>
        <!-- bootstrap js -->
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <!-- custom js -->
        <script type="text/javascript" src="js/custom.js"></script>
        <!-- Google Map -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
        </script>
        <!-- End Google Map -->

    </body>

</html>
