<%-- 
    Document   : detail
    Created on : Mar 11, 2024, 11:14:17 PM
    Author     : Phung An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <!--Plugins CSS--> 
        <link rel="stylesheet" href="assets/css/plugins.css">
        <!--Main Style CSS--> 
        <link rel="stylesheet" href="assets/css/style.css">
        <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                margin-top: 15%;
                width: 100% !important;
                height: auto !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"/>
        <div class="col-sm-9" >
            <div class="container">
                <div class="card">
                    <div class="row">
                        <aside class="col-sm-5 border-right">
                            <article class="gallery-wrap"> 
                                <div class="img-big-wrap">
                                    <div> <a href="#"><img src="${productdetail.thumbnail}"></a></div>
                                </div> <!-- slider-product.// -->
                                <div class="img-small-wrap">
                                </div> <!-- slider-nav.// -->
                            </article> <!-- gallery-wrap .end// -->
                        </aside>
                        <aside class="col-sm-7">

                            <form action="cart?action=listall" method="get">
                                <div style="display: none">
                                    <input name="product_id" value="${productdetail.id}">
                                </div>
                                <article class="card-body p-5">                                           
                                    <h3 class="title mb-3 text-secondary">${productdetail.title}</h3>
                                    <p class="price-detail-wrap"> 
                                        <span class="price h3 text-warning"> 
                                            <span class="currency">Giá: </span><span class="num">${productdetail.price} đ</span>
                                        </span> 
                                    </p> <!-- price-detail-wrap .// -->
                                    <dl class="item-property">
                                        <span class="text-dark">Số lượng:${productdetail.quantity} </span>
                                        <br/>
                                        <span class="text-dark">Miêu tả: </span>                                    
                                        <i class="fa-regular fa-hand-point-right"></i>
                                        ${productdetail.description}
                                        </p></dd>

                                    </dl>

                                    <hr>

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="quantity">
                                                <input type="number" name="quantity" max="${productdetail.quantity}">
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <c:if test="${sessionScope.account.username!=null}">
                                        <button type="submit">
                                            <i class="fas fa-shopping-cart"></i> Add to cart 
                                        </button>
                                    </c:if>
                                </article> <!-- card-body.// -->
                            </form>
                        </aside> <!-- col.// -->
                    </div> <!-- row.// -->
                </div> <!-- card.// -->


            </div>
        </div>

    </body>
</html>
