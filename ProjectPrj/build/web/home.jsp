<%-- 
    Document   : index
    Created on : Feb 18, 2024, 9:37:36 PM
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
        <link rel="icon" href="images/fevicon/fevicon.jpg" type="image/gif" />
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <title>The Cosmetic</title>


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

    </head>

    <body>

        <div class="hero_area">
            <jsp:include page="menu.jsp"/>
        </header>
        <!-- end header section -->
        <!-- slider section -->
        <section class="slider_section ">
            <div class="slider_bg_box">
                <img src="images/slider-bg.jpg" alt="">
            </div>
            <div id="customCarousel1" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">                 
                    <div class="carousel-item active">  
                        <div class="container ">     
                            <div class="row">
                                <div class="col-md-7">
                                    <div class="detail-box" style="color: chocolate">
                                        <h1>
                                            Cosmetic in the world
                                        </h1>
                                        <p>
                                        </p>
                                        <div class="btn-box">
                                            <a href="register.jsp" class="btn1">
                                                Đăng Ký
                                            </a>
                                            <a href="about.jsp" class="btn2">
                                                Giới Thiệu
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="container ">
                            <div class="row">
                                <div class="col-md-7" >
                                    <div class="detail-box" style="color: chocolate">
                                        <h1>
                                            The Cosmetic
                                        </h1>
                                        <p>
                                            Cửa hàng bán mỹ phẩm chất lượng, chính hãng, giá rẻ phù hợp cho mọi lứa tuổi.
                                        </p>
                                        <div class="btn-box">
                                            <a href="product" class="btn1">
                                                Sản Phẩm
                                            </a>
                                            <a href="login.jsp" class="btn2">
                                                Đăng Nhập
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <ol class="carousel-indicators">
                    <li data-target="#customCarousel1" data-slide-to="0" class="active"></li>
                    <li data-target="#customCarousel1" data-slide-to="1"></li>
                    <li data-target="#customCarousel1" data-slide-to="2"></li>

                </ol>
            </div>

        </section>
        <!-- end slider section -->
    </div>




    <!-- about section -->

    <section class="about_section layout_padding">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6">
                    <div class="img_container">
                        <div class="img-box b1">
                            <img src="images/a-1.jpg" alt="">
                        </div>
                        <div class="img-box b2">
                            <img src="images/a-2.jpg" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="detail-box">
                        <h2>
                            1 chút thông tin về cửa hàng
                        </h2>
                        <p>

                            Chào mừng bạn đến với cửa hàng mỹ phẩm của chúng tôi - nơi tận hưởng trải nghiệm làm đẹp hoàn hảo. Với một bộ sưu tập đa dạng và chọn lọc từ các thương hiệu uy tín, chúng tôi cam kết mang đến cho bạn những sản phẩm chăm sóc da hàng đầu. Từ những công thức tự nhiên đến công nghệ tiên tiến, cửa hàng của chúng tôi đem đến sự lựa chọn đa dạng cho mọi loại da. Hãy bước vào thế giới làm đẹp tại đây, nơi nâng cao vẻ đẹp tự tin của bạn, mỗi ngày một cách hoàn hảo
                        </p>
                        <a href="about.jsp">
                            Read More
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end about section -->


    <!-- product section -->

    <section class="product_section ">
        <div class="container">
            <div class="product_heading">
                <h2>
                    Top 3 Sản Phẩm mới
                </h2>
            </div>

            <div class="col-sm-12">
                <div class="row">
                    <c:forEach items="${requestScope.data1}" var="c">
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="card" style=" margin-top: 10px">
                                <img class="card-img-top" src="${c.thumbnail}" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title show_txt"><a href="#" title="View Product">${c.title}</a></h4>
                                   <!-- <p class="card-text show_txt">${c.description}</p>-->
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn btn-danger btn-block">${c.price} đ</p>
                                        </div>
                                        <div class="col">
                                            <a href="detailp?product_id=${c.id}" class="btn btn-success btn-block">Xem sản phẩm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </div>
    </section>

    <!-- end product section -->
    <!-- product section -->

    <section class="product_section ">
        <div class="container">
            <div class="product_heading">
                <h2>
                    Top 3 Sản phẩm được ưa chuộng
                </h2>
            </div>

            <div class="col-sm-12">
                <div class="row">
                    <c:forEach items="${requestScope.data2}" var="c">
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="card" style=" margin-top:10px;margin-bottom: 10px">
                                <img class="card-img-top" src="${c.thumbnail}" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title show_txt"><a href="#" title="View Product">${c.title}</a></h4>
                                  <!--  <p class="card-text show_txt">${c.description}</p>-->
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn btn-danger btn-block">${c.price} đ</p>
                                        </div>
                                        <div class="col">
                                            <a href="detailp?product_id=${c.id}" class="btn btn-success btn-block">Xem sản phẩm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </div>
    </section>

    <!-- end product section -->





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
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d59599.049986103804!2d105.74331424921067!3d20.9950170919113!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac927ce95957%3A0xe230355f8983adb9!2zVGhhbmggWHXDom4sIEjDoCBO4buZaSwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2sus!4v1710175530570!5m2!1svi!2sus" height="220" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>    <!-- footer section -->

                </div>
            </div>
        </div>
    </section>

    <!-- end info_section -->
    <section class="footer_section">
        <div class="container">
            <p>
                &copy; <span id="displayYear"></span> All Rights Reserved By
                <a href="https://html.design/">Cosmetic Shop</a>
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
    <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
    <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
<df-messenger
    intent="WELCOME"
    chat-title="AI-BYAN"
    agent-id="0ab401ed-4696-442c-80cd-0d5e1b252b36"
    language-code="en"
    ></df-messenger>

</body>

</html>
