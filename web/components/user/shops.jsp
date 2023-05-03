<%-- 
    Document   : shops
    Created on : Mar 9, 2023, 8:22:55 PM
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
        <title>shop</title>

        <link rel="icon" href="images/userImgs/Logo_DHD_Raumgestaltung-350x164.png"/>
        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <!-- custom css file link  -->
        <style>
            <%@include file="../../css/style.css" %>
        </style>

    </head>
    <body>

        <%@include file="../../components/user/userHeader.jsp" %>

        <section class="products">

            <h1 class="heading">Latest products</h1>

            <c:set var="pageSize" value="9" />

            <c:set var="currentPage" value="${param.size eq null ? 1 : param.size}" />


            <c:set var="endIndex" value="${(currentPage * pageSize) - 1}" />


            <div class="box-container">


                <c:choose>
                    <c:when test='${requestScope["products"] != null}'>
                        <c:forEach items="${products}" var="prd" begin="0" end="${endIndex}">
                            <form action="" method="post" class="box" >
                                <input type="hidden" name="pid" value="${prd.getId()}">
                                <input type="hidden" name="name" value="${prd.getName()}">
                                <input type="hidden" name="price" value="${prd.getPrice()}">
                                <input type="hidden" name="image" value="${prd.getImg1()}">

                                <button class="fas fa-heart" type="submit" name="submit_btn" value="Add To WishList"></button>
                                <a href="?action=quickView&uid=${user.getId()}&pid=${prd.getId()}" class="fas fa-eye"></a>


                                <a href="?action=quickView&uid=${user.getId()}&pid=${prd.getId()}" >
                                    <img src="images/productImgs/${prd.getImg1()}" alt="">
                                </a>

                                <div class="name">${prd.getName()}</div>

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
                        <p class="empty">Empty Products !</p>
                    </c:otherwise>
                </c:choose>
            </div>

            <c:choose>
                <c:when test="${endIndex < products.size()}" >
                    <a href="?action=shop&uid=${user.getId()}&size=${currentPage + 1}" class="btn view_more">View more</a>  
                </c:when>
                <c:otherwise>
                    <a href="?action=shop&uid=${user.getId()}&size=${currentPage + 1}" 
                       class="btn view_more" style="display: none;">
                        View more
                    </a>  
                </c:otherwise>
            </c:choose>


        </section>



        <%@include file="../common/footer.jsp" %>

        <script >
            <%@include file="../../js/script.js" %>
        </script>

    </body>
</html>