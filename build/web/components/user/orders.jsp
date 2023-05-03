<%-- 
    Document   : orders
    Created on : Mar 8, 2023, 9:44:28 PM
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
        <title>orders</title>
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

        <%@include file="../user/userHeader.jsp" %>

        <section class="orders">

            <h1 class="heading">placed orders</h1>

            <div class="box-container">

                <c:choose>
                    <c:when test='${requestScope["orders"] != null}'>

                        
                        <c:forEach items="${orders}" var="ord" >
                            <div class="box">
                                <p> Placed on : <span>${ord.getOrderDate()}</span> </p>
                                <p> Name : <span>${ord.getUser().getName()}</span> </p>
                                <p> Email : <span>${ord.getUser().getEmail()}</span> </p>
                                <p> Phone Number : <span>${ord.getUser().getPhone()}</span> </p>
                                <p> Address : <span>${ord.getUser().getAddress()}</span> </p>
                                <p> Payment method : <span 
                                        style="color: ${ord.getPaymentMethod()} == "Pending" ? red : green">
                                        ${ord.getPaymentMethod()}
                                    </span>
                                </p>
                                <c:set var="totalPrice" value="0" />
                                <p>Products: 
                                    <c:forEach items="${ord.getOrderDetails()}" var="orderDetail" >
                                        <span>
                                           [ ${orderDetail.getPrd().getName()} x ${orderDetail.getQuantity()} ]
                                        </span>
                                           <c:set  var="totalPrice" 
                                                   value="${totalPrice + (orderDetail.getPrd().getPrice() * orderDetail.getQuantity()) }"/>
                                    </c:forEach>
                                </p>

                                <p>Grand Total: <span>${totalPrice}</span></p>


                            </div>
                        </c:forEach>

                    </c:when>
                    <c:otherwise>
                        <p class="empty">Please login to see your orders</p>
                    </c:otherwise>

                </c:choose>

            </div>

        </section>


        <%@include file="../common/footer.jsp" %>

        <script >
            <%@include file="../../js/script.js" %>
        </script>



    </body>
</html>