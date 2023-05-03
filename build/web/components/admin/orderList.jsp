

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | Orders List</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
     <link rel="icon" href="images/userImgs/Logo_DHD_Raumgestaltung-350x164.png"/>


        <style>
            <%@include file="../../css/admin_style.css" %>
        </style>
    </head>
    <body>

        <%@include file="adminHeader.jsp" %>

        <section class="orders">

            <h1 class="heading">placed orders</h1>

            <div class="box-container">

                <c:choose>
                    <c:when test='${not empty requestScope["orders"]}'>
                        <c:forEach items="${orders}" var="ord">
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

                                <form  method="post">
                                    <input type="hidden" name="order_id" value="${ord.getId()}">
                                    <input type="hidden" name="order_date" value="${ord.getOrderDate()}">
                                    <input type="hidden" name="uid" value="${ord.getUser().getId()}">
                                    <input type="hidden" name="payMethod" value="${ord.getPaymentMethod()}">

                                    <select name="payment_status" class="select">
                                        <option selected disabled>${ord.getStatus()}</option>
                                        <option value="Pending">Pending</option>
                                        <option value="Completed">Completed</option>
                                    </select>
                                    <div class="flex-btn">
                                        <input type="submit" value="update" class="option-btn" name="update_payment">
                                        <a href="?action=delete_order&id=${ord.getId()}" class="delete-btn" onclick="return confirm('Delete this order?');">Delete</a>
                                    </div>
                                </form>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p class="empty">Empty Orders !</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>

    </section>
    <%@include file="../common/footer.jsp" %>

    <script>
        <%@include file="../../js/admin_script.js" %>
    </script>

</body>
</html>
