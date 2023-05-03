<%-- 
    Document   : cartList
    Created on : Mar 8, 2023, 5:16:19 PM
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
        <title>shopping cart</title>

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="icon" href="images/userImgs/Logo_DHD_Raumgestaltung-350x164.png"/>

        <!-- custom css file link  -->
        <style>
            <%@include file="../../css/style.css" %>
        </style>

    </head>
    <body>

        <%@include file="../user/userHeader.jsp" %>

        <section class="products shopping-cart">

            <h3 class="heading">shopping cart</h3>

            <c:set var="grandTotal" value="0" />

            <div class="box-container">
                <c:choose>
                    <c:when test='${requestScope["carts"] != null}'>
                        <c:forEach items="${carts}" var="cart">

                            <form method="post" class="box">
                                <input type="hidden" name="cartId" value="${cart.getId()}">
                                <input type="hidden" name="pid" value="${cart.getPid()}">

                                <a href="?action=quickView&pid=${cart.getPid()}"
                                   class="fas fa-eye"></a>


                                <a href="?action=quickView&pid=${cart.getPid()}" >
                                    <img src="images/productImgs/${cart.getImg()}" alt="">
                                </a>


                                <div class="name">${cart.getName()}</div>
                                <div class="flex">
                                    <div class="price">${cart.getPrice()}/-</div>
                                    <input type="number" name="qty" class="qty" min="1" max="99" onkeypress="if (this.value.length == 2)
                                                return false;" value="${cart.getQuantity()}">
                                    <button type="submit" class="fas fa-edit" name="submit_btn" value="updatePrd"></button>
                                </div>
                                <div class="sub-total"> 
                                    Sub Total : 
                                    <span>
                                        $
                                        <c:set var="subTotal" value="${cart.getPrice() * cart.getQuantity()} " />
                                        ${subTotal}
                                        /-
                                    </span>
                                </div>
                                <input type="submit" value="delete" 
                                       onclick="return confirm('Delete this from cart?');" 
                                       class="delete-btn" name="submit_btn">

                                <c:set var="grandTotal" value="${grandTotal + (cart.getQuantity() * cart.getPrice() )}" />
                            </form>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p class="empty">Empty Products, Shopping now!</p>
                    </c:otherwise>
                </c:choose>
            </div>


            <div class="cart-total">
                <p>Grand Total : <span>$ ${grandTotal}/-</span></p>
                <a href="?action=shop&uid=${user.getId()}" class="option-btn">Continue shopping</a>
                <a href="?action=viewCart&uid=${user.getId()}&delAll=true" class="delete-btn ${grandTotal > 1 ? "" : "disabled"}" " onclick="return confirm('delete all from cart?');">delete all item</a>
                <a href="?action=checkout&uid=${user.getId()}" 
                   class="btn ${grandTotal > 1 ? "" : "disabled"}" >Proceed to checkout</a>
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