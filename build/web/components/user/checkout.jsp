<%-- 
    Document   : checkout
    Created on : Mar 10, 2023, 5:17:28 PM
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
        <title>checkout</title>

        <!-- font awesome cdn link  -->
        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <link rel="icon" href="images/userImgs/Logo_DHD_Raumgestaltung-350x164.png"/>

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

        <section class="checkout-orders">

            <div class="col-md-7">
                <form action="" method="post">

                    <h3 class="heading">BILLING ADDRESS</h3>

                    <div class="flex">
                        <div class="inputBox">
                            <span>Your name :</span>
                            <input type="text" name="name" placeholder="Enter your name" 
                                   value="${user.getName()}"
                                   class="box" maxlength="20" required>
                        </div>

                        <div class="inputBox">
                            <span>your number :</span>
                            <input type="number" name="number" placeholder="enter your number" 
                                   value="${user.getPhone()}"
                                   class="box" min="0" max="9999999999" onkeypress="if (this.value.length == 10)
                                               return false;" required>
                        </div>

                        <div class="inputBox">
                            <span>your email :</span>
                            <input type="email" name="email" placeholder="enter your email"
                                   value="${user.getEmail()}"
                                   class="box" maxlength="50" required>
                        </div>

                        <div class="inputBox">
                            <span>payment method :</span>
                            <select name="method" id="payment-method" class="box" required onChange="toggleCreditCard()">
                                <option value="Cash On Delivery">Cash On Delivery</option>
                                <option value="Credit Card">Credit Card</option>
                                <option value="Pay ATM">ATM</option>
                                <option value="PayPal">PayPal</option>
                            </select>
                        </div>

                        <div class="credit_box" id="credit_box">
                            <div class="inputBox" id="" >
                                <span>Account Number: </span>
                                <input type="number" name="accountNumber" placeholder="Enter your account number" 
                                       value=""
                                       class="box" min="0" max="9999999999" >
                            </div>
                            
                            <div class="inputBox" id="">
                                <span>Bank Name: </span>
                                <input type="text" name="bank_name" placeholder="Enter bank name" 
                                       value=""
                                       class="box" maxlength="50"  >
                            </div>
                        </div>

                        <div class="inputBox">
                            <span>address line:</span>
                            <input type="text" name="flat" placeholder="e.g. flat number" 
                                   value="${user.getAddress()}"
                                   class="box" maxlength="50" required>
                        </div>

                        <div class="inputBox">
                            <span>Address Line 2 :</span>
                            <input type="text" name="city" placeholder="e.g. mumbai" class="box" maxlength="50">
                        </div>

                    </div>

                    <input type="submit" name="order" 
                           class="btn primary-btn order-submit" 
                           value="place order">

                </form>

            </div>

            <div class="col-md-6">
                <div class="orders-container">
                    <div class="section-title text-center">
                        <h3 class="heading" style="font-size: 2.5rem;">Your Order</h3>
                    </div>
                    <div class="display-orders">
                        <c:choose>
                            <c:when test='${requestScope["carts"] != null}'>
                                <c:set var="totalPro" value="0" />
                                <c:set var="grandTotal" value="0" />


                                <div class="order-summary">
                                    <div class="order-col">
                                        <div><strong>PRODUCT</strong></div>
                                        <div><strong>TOTAL</strong></div>
                                    </div>

                                    <div class="order-products">
                                        <c:forEach items="${carts}" var="cart">
                                            <input type="hidden" name="total_products" value="${totalPro + cart.getQuantity()}">
                                            <input type="hidden" name="total_price" value="${cart.getPrice() * cart.getQuantity()}" value="">

                                            <div class="order-col">
                                                <div>${cart.getQuantity()} x ${cart.getName()}</div>
                                                <div style="color: var(--main-color); font-weight: 700;">$${cart.getPrice()}</div>
                                            </div>
                                            <c:set var="grandTotal" value="${grandTotal + (cart.getPrice()* cart.getQuantity())}" />
                                        </c:forEach>
                                    </div>


                                    <div class="order-col">
                                        <div><strong>SHIPING</strong></div>
                                        <div><strong>FREE</strong></div>
                                    </div>
                                    <div class="order-col">
                                        <div><strong>TOTAL</strong></div>
                                        <div><strong class="order-total">$${grandTotal}</strong></div>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div>
                                    <p class="empty">your cart is empty!</p>
                                </div>
                            </c:otherwise> 
                        </c:choose>


                        <div class="input-checkbox">
                            <input type="checkbox" id="terms">
                            <label for="terms">
                                <span></span>
                                I've read and accept the <a href="#">terms & conditions</a>
                            </label>
                        </div>


                    </div>

                </div>


            </div>
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

    <script >

    </script>

</body>
</html>
