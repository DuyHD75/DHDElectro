<%-- 
    Document   : ClientHome
    Created on : Mar 7, 2023, 11:18:02 AM
    Author     : This PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Page</title>

        <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
        <link rel="icon" href="images/userImgs/Logo_DHD_Raumgestaltung-350x164.png"/>

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>


        <!<!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">


        <!-- Custom CSS file link  -->
        <style>
            <%@include file="../../css/style.css" %>
        </style>

    </head>
    <body>


        <%@include file="../user/userHeader.jsp" %>

        <div class="home-bg" style=" background:url(../images/userImgs/home-bg.png) no-repeat;">

            <section class="home">

                <div class="swiper home-slider">

                    <div class="swiper-wrapper">

                        <div class="swiper-slide slide">

                            <div class="content">
                                <h3>${products.get(2).getName()}</h3>
                                <span>${products.get(2).getDetail()}</span>
                                <div class="product-rating">
                                    <i class='bx bxl-docker'></i>

                                    <span>$${products.get(2).getPrice()}/-</span>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <a href="?action=shop&uid=${user.getId()}" class="btn">shop now</a>
                            </div>

                            <div class="image">
                                <img src="images/productImgs/${products.get(2).getImg1()}" alt="">
                            </div>
                        </div>

                        <div class="swiper-slide slide">
                            <div class="content">
                                <h3>${products.get(1).getName()}</h3>
                                <span>${products.get(1).getDetail()}</span>

                                <div class="product-rating">
                                    <i class='bx bxl-docker'></i>

                                    <span >$${products.get(1).getPrice()}/-</span>

                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <a href="?action=shop&uid=${user.getId()}" class="btn">shop now</a>
                            </div>

                            <div class="image">
                                <img src="images/productImgs/${products.get(1).getImg1()}" alt="">
                            </div>
                        </div>

                        <div class="swiper-slide slide">
                            <div class="content">
                                <h3>${products.get(6).getName()}</h3>
                                <span>${products.get(6).getDetail()}</span>
                                <div class="product-rating">
                                    <i class='bx bxl-docker'></i>

                                    <span>$${products.get(6).getPrice()}/-</span>

                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <a href="?action=shop&user=${user.getId()}" class="btn">shop now</a>
                            </div>

                            <div class="image">
                                <img src="images/productImgs/${products.get(6).getImg1()}" alt="">
                            </div>
                        </div>

                    </div>

                    <div class="swiper-pagination"></div>

                </div>

            </section>

        </div>

        <section class="category">

            <h1 class="heading">shop by category</h1>

            <div class="swiper category-slider">

                <div class="swiper-wrapper">
                    <a href="?action=category&uid=${user.getId()}&category=Laptop" class="swiper-slide slide">
                        <img src="images/userImgs/icon-1.png" alt="">
                        <h3>laptop</h3>
                    </a>

                    <a href="?action=category&uid=${user.getId()}&category=PC" class="swiper-slide slide">
                        <img src="images/userImgs/cpu.jfif" alt="">
                        <h3>PC Gaming / Office</h3>
                    </a>

                    <a href="?action=category&uid=${user.getId()}&category=Mouse" class="swiper-slide slide">
                        <img src="images/userImgs/icon-4.png" alt="">
                        <h3>Mouse</h3>
                    </a>

                    <a href="?action=category&uid=${user.getId()}&category=Monitor" class="swiper-slide slide">
                        <img src="images/userImgs/monitor-icon-6.jpg" alt="">
                        <h3>Monitor</h3>
                    </a>

                    <a href="?action=category&uid=${user.getId()}&category=Keyboard" class="swiper-slide slide">
                        <img src="images/userImgs/keyboard.png" alt="">
                        <h3>KeyBoard</h3>
                    </a>

                    <a href="?action=category&uid=${user.getId()}&category=Headphone" class="swiper-slide slide">
                        <img src="images/userImgs/img_336189.png" alt="">
                        <h3>Headphone</h3>
                    </a>
                </div>

                <div class="swiper-pagination"></div>

            </div>

        </section>

        <div id="hot-deal" class="section" style="background-image: url('images/productImgs/ASUSVivo1.webp');">
            <!-- row -->
            <div class="hot-deal">
                <ul class="hot-deal-countdown">
                    <li>
                        <div>
                            <h3>02</h3>
                            <span>Days</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <h3>10</h3>
                            <span>Hours</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <h3>34</h3>
                            <span>Mins</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <h3>60</h3>
                            <span>Secs</span>
                        </div>
                    </li>
                </ul>
                <h2 class="text-uppercase">hot deal this week</h2>
                <p>New Collection Up to 50% OFF</p>
            </div>
        </div>

        <section class="home-products">

            <h1 class="heading">latest products</h1>

            <div class="swiper products-slider">
                <div class="swiper-wrapper">

                    <c:choose>
                        <c:when test='${requestScope["products"] != null}'>
                            <c:forEach items="${products}" var="prd" begin="0" end="10">
                                <form action="" method="post" class="swiper-slide slide" 
                                      style="display: flex; flex-direction: column; ">
                                    <input type="hidden" name="pid" value="${prd.getId()}">
                                    <input type="hidden" name="name" value="${prd.getName()}">
                                    <input type="hidden" name="price" value="${prd.getPrice()}">
                                    <input type="hidden" name="image" value="${prd.getImg1()}">
                                    
                                    <button class="fas fa-heart" type="submit" name="submit_btn" value="Add To WishList"></button>

                                    <a href="?action=quickView&uid=${user.getId()}&pid=${prd.getId()}" class="fas fa-eye"></a>
                                    <a href="?action=quickView&uid=${user.getId()}&pid=${prd.getId()}">
                                        <img src="images/productImgs/${prd.getImg1()}" alt="">
                                    </a>

                                    <div class="name" style="height: 50px;">${prd.getName()}</div>
                                    <div class="flex">
                                        <div class="price">
                                            <i class='bx bxl-docker'></i>
                                            <span>$</span>${prd.getPrice()}<span>/-</span></div>

                                        <div class="product-rating">
                                            <i class='bx bxs-star'></i>
                                            <i class='bx bxs-star'></i>
                                            <i class='bx bxs-star'></i>
                                            <i class='bx bxs-star'></i>
                                            <i class='bx bxs-star-half' ></i>
                                        </div>
                                        <input type="number" name="qty" class="qty" min="1" max="99" onkeypress="if (this.value.length == 2)
                                                    return false;" value="1">
                                    </div>

                                    <input type="submit" value="Add To Cart" class="btn" name="submit_btn">
                                </form>
                            </c:forEach>
                        </c:when>

                    </c:choose>


                </div>

                <div class="swiper-pagination"></div>

            </div>

        </section>

        <%@include file="../common/footer.jsp" %>

        <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

        <script >
            <%@include file="../../js/script.js" %>
        </script>


        <script >
            <%@include file="../../js/sliderScript.js" %>
        </script>


    </body>
</html>
