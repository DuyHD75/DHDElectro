<%-- 
    Document   : wishList
    Created on : Mar 8, 2023, 4:58:21 PM
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
        <title>wishlist</title>
        <link rel="icon" href="images/userImgs/Logo_DHD_Raumgestaltung-350x164.png"/>

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

        <!-- custom css file link  -->
        <style>
            <%@include file="../../css/style.css" %>
        </style>

    </head>
    <body>

        <%@include file="../user/userHeader.jsp" %>

        <section class="products">

            <h3 class="heading">your wishlist</h3>

            <div class="box-container">
                <c:set var="grandTotal" value="0" />

                <c:choose>
                    <c:when test='${sessionScope["wishs"] != null}'>
                        <c:forEach items="${wishs}" var="wish">
                            <form action="" method="post" class="box">
                                <input type="hidden" name="pid" value="${wish.getPid()}">
                                <input type="hidden" name="wishlist_id" value="">
                                <input type="hidden" name="name" value="${wish.getName()}">
                                <input type="hidden" name="price" value="${wish.getPrice()}">
                                <input type="hidden" name="image" value="${wish.getImg()}">
                                <a href="?action=quickView&uid=${user.getId()}&pid=${wish.getPid()}"
                                   class="fas fa-eye"></a>

                                <img src="images/productImgs/${wish.getImg()}" alt="">
                                <div class="name">${wish.getName()}</div>
                                <div class="flex">
                                    <div class="price">$${wish.getPrice()}/-</div>
                                    <input type="number" name="qty" class="qty" min="1" max="99" onkeypress="if (this.value.length == 2)
                                                return false;" value="1">
                                </div>
                                <input type="submit" value="Add To Cart" class="btn" name="submit_btn">
                                <input type="submit" value="delete" 
                                       onclick="return confirm('Delete this from wishlist?');" class="delete-btn" name="submit_btn">
                            </form>
                            <c:set var="grandTotal" value="${grandTotal +  wish.getPrice()}" />
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="box-container">
                            <p class="empty">Your Wish List is empty!</p>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div>

            <div class="wishlist-total">
                <p>Grand Total : <span>$ ${grandTotal}/-</span></p>
                <a href="?action=shop&uid=${user.getId()}" class="option-btn">Continue shopping</a>
                <a href="?action=viewWishList&uid=${user.getId()}&delAll=true" 
                   class="delete-btn ${grandTotal > 1 ? "" : "disabled"}"
                   onclick="return confirm('delete all from cart?');">delete all item</a>
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