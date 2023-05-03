<%-- 
    Document   : quickView
    Created on : Mar 8, 2023, 7:50:13 AM
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
        <title>quick view</title>

        <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="icon" href="images/userImgs/Logo_DHD_Raumgestaltung-350x164.png"/>

        <!-- custom css file link  -->
        <style>
            <%@include file="../../css/style.css" %>
        </style>

    </head>
    <body>

        <%@include file="../../components/user/userHeader.jsp" %>

        <section class="quick-view">

            <h1 class="heading">quick view</h1>
            <c:choose>
                <c:when test='${requestScope["product"] != null}'>
                    <form action="" method="post" class="box">
                        <input type="hidden" name="pid" value="${product.getId()}">
                        <input type="hidden" name="name" value="${product.getName()}">
                        <input type="hidden" name="price" value="${product.getPrice()}">
                        <input type="hidden" name="image" value="${product.getImg1()}">


                        <div class="row">
                            <div class="image-container">
                                <div class="main-image">
                                    <img src="images/productImgs/${product.getImg1()}" alt="">
                                </div>
                                <div class="sub-image">
                                    <img src="images/productImgs/${product.getImg1()}" alt="">
                                    <img src="images/productImgs/${product.getImg2()}" alt="">
                                    <img src="images/productImgs/${product.getImg3()}" alt="">
                                </div>
                            </div>
                            <div class="content">
                                <div class="name">${product.getName()}</div>
                                <div class="flex">
                                    <div class="price">
                                        <i class='bx bxl-docker'></i>
                                        <span>$</span>${product.getPrice()}<span>/-</span></div>

                                    <input type="number" name="qty" class="qty" min="1" max="99" onkeypress="if (this.value.length == 2)
                                                return false;" value="1">
                                </div>


                                <div class="product-rating">
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star-half' ></i>
                                </div>
                                <div class="details">${product.getDetail()}</div>
                                <div class="flex-btn">
                                    <input type="submit" value="Add To Cart" class="btn" name="submit_btn">

                                    <input class="option-btn" type="submit" name="submit_btn" value="Add To WishList">
                                </div>
                            </div>
                        </div>
                    </form>
                </c:when>

                <c:otherwise>
                    <p class="empty">no products added yet!</p>
                </c:otherwise>
            </c:choose>
        </section>


        <section class="quick-view">
            <div id="product-tab">
                <!-- product tab nav -->
                <ul class="tab-nav">
                    <li class="tab active"><a data-toggle="tab" href="">Description</a></li>
                    <li><a class="tab" data-toggle="tab" href="">Details</a></li>
                    <li><a class="tab" data-toggle="tab" href="">Reviews (3)</a></li>
                </ul>
                <!-- /product tab nav -->

                <!-- product tab content -->
                <div class="tab-content">
                    <!-- tab1  -->
                    <div id="tab1" class="tab-pane fade in ">
                        <div class="row">
                            <div class="col-md-12">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                            </div>
                        </div>
                    </div>
                    <!-- /tab1  -->

                    <!-- tab2  -->
                    <div id="tab2" class="tab-pane fade in">
                        <div class="row">
                            <div class="col-md-12">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                            </div>
                        </div>
                    </div>
                    <!-- /tab2  -->

                    <!-- tab3  -->
                    <div id="tab3" class="tab-pane fade in active">
                        <div class="row">
                            <!-- Rating -->
                            <div class="col-md-3">
                                <div id="rating">
                                    <div class="rating-avg">
                                        <span>4.5</span>
                                        <div class="rating-stars">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                    </div>
                                    <ul class="rating">
                                        <li>
                                            <div class="rating-stars">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="rating-progress">
                                                <div style="width: 80%;"></div>
                                            </div>
                                            <span class="sum">3</span>
                                        </li>
                                        <li>
                                            <div class="rating-stars">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                            </div>
                                            <div class="rating-progress">
                                                <div style="width: 60%;"></div>
                                            </div>
                                            <span class="sum">2</span>
                                        </li>
                                        <li>
                                            <div class="rating-stars">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                            </div>
                                            <div class="rating-progress">
                                                <div></div>
                                            </div>
                                            <span class="sum">0</span>
                                        </li>
                                        <li>
                                            <div class="rating-stars">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                            </div>
                                            <div class="rating-progress">
                                                <div></div>
                                            </div>
                                            <span class="sum">0</span>
                                        </li>
                                        <li>
                                            <div class="rating-stars">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                            </div>
                                            <div class="rating-progress">
                                                <div></div>
                                            </div>
                                            <span class="sum">0</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- /Rating -->

                            <!-- Reviews -->
                            <div class="col-md-6">
                                <div id="reviews">
                                    <ul class="reviews">
                                        <li>
                                            <div class="review-heading">
                                                <h5 class="name">John</h5>
                                                <p class="date">27 DEC 2018, 8:0 PM</p>
                                                <div class="review-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                            <div class="review-body">
                                                <p style="font-size: 16px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="review-heading">
                                                <h5 class="name">John</h5>
                                                <p class="date">27 DEC 2018, 8:0 PM</p>
                                                <div class="review-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                            <div class="review-body">
                                                <p style="font-size: 16px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="review-heading">
                                                <h5 class="name">John</h5>
                                                <p class="date">27 DEC 2018, 8:0 PM</p>
                                                <div class="review-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                            </div>
                                            <div class="review-body">
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                            </div>
                                        </li>
                                    </ul>
                                    <ul class="reviews-pagination">
                                        <li class="active">1</li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- /Reviews -->

                            <!-- Review Form -->
                            <div class="col-md-4">
                                <div id="review-form">
                                    <form class="review-form">
                                        <input class="input" type="text" placeholder="Your Name">
                                        <input class="input" type="email" placeholder="Your Email">
                                        <textarea class="input" placeholder="Your Review"></textarea>
                                        <div class="input-rating">
                                            <span>Your Rating: </span>
                                            <div class="stars">
                                                <input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
                                                <input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
                                                <input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
                                                <input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
                                                <input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
                                            </div>
                                        </div>
                                        <button class="primary-btn">Submit</button>
                                    </form>
                                </div>
                            </div>
                            <!-- /Review Form -->
                        </div>
                    </div>
                    <!-- /tab3  -->
                </div>
                <!-- /product tab content  -->
            </div>

        </section>

















        <section class="home-products">

            <h1 class="heading">Sample Generates</h1>

            <div class="swiper products-slider">
                <div class="swiper-wrapper">

                    <c:choose>
                        <c:when test='${requestScope["samplePrd"] != null}'>
                            <c:forEach items="${samplePrd}" var="prd" begin="0" end="10">
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
                        <c:otherwise>
                            <p class="empty">Empty Products, Register Now !</p>
                        </c:otherwise>
                    </c:choose>


                </div>

                <div class="swiper-pagination"></div>

            </div>

        </section>


        <%@include file="../../components/common/footer.jsp" %>

        <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

        <script >
            <%@include file="../../js/script.js" %>
        </script>

        <script >
            <%@include file="../../js/sliderScript.js" %>
        </script>


    </body>
</html>

