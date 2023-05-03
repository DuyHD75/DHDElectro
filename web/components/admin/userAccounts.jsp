<%-- 
    Document   : userAccounts
    Created on : Feb 28, 2023, 11:48:20 AM
    Author     : This PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | View User Accounts</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="icon" href="images/userImgs/Logo_DHD_Raumgestaltung-350x164.png"/>

        <style>
            <%@include file="../../css/admin_style.css" %>
        </style>

    </head>
    <body>
        <%@include file="adminHeader.jsp" %>
        <section class="accounts">
            <h1 class="heading">user accounts</h1>
            <div class="box-container">
                <c:choose>
                    <c:when test='${requestScope["users"] != null}'>
                        <c:forEach items="${users}" var="user">
                            <div class="box">
                                <p> USER ID : <span>${user.getId()}</span> </p>
                                <p> <i class="fa-sharp fa-solid fa-user"></i> <span>${user.getName()}</span> </p>
                                <p> <i class="fa-sharp fa-solid fa-location-arrow"></i> <span>${user.getAddress()}</span> </p>
                                <p> <i class="fa-sharp fa-solid fa-phone"></i> <span>${user.getPhone()}</span> </p>
                                <p> <i class="fas fa-envelope"></i> <span>${user.getEmail()}</span> </p>

                                <a href="/DHDShop/admin?action=delete_user&id=${user.getId()}"
                                   onclick="return confirm('Delete This Account? The User Related Information Will Also Be Delete!')" class="delete-btn">Delete</a>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p class="empty">No Accounts Available, Register Now !</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>

        <%@include file="../common/footer.jsp" %>

        <script>
            <%@include file="../../js/admin_script.js" %>
        </script>
    </body>
</html>
