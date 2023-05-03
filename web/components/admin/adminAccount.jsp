<%-- 
    Document   : adminAccount
    Created on : Feb 27, 2023, 11:14:40 PM
    Author     : This PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | Admin Accounts</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
       <link rel="icon" href="images/userImgs/Logo_DHD_Raumgestaltung-350x164.png"/>

        <style>
            <%@include file="../../css/admin_style.css" %>
        </style>

    </head>
    <body>
        <%@include file="adminHeader.jsp" %>
        <section class="accounts">

            <h1 class="heading">admin accounts</h1>

            <div class="box-container">

                <div class="box">
                    <p>Add New Admin</p>
                    <a href="/DHDShop/admin?action=create_admin" class="option-btn">Register admin</a>
                </div>

                <c:choose>
                    <c:when test='${requestScope["admins"] != null}'>
                        <c:forEach items="${admins}" var="ad">
                            <div class="box">
                                <p> Admin id : <span>${ad.getId()}</span> </p>
                                <p> Admin name : <span>${ad.getName()}</span> </p>
                                <div class="flex-btn">
                                    <a href="/DHDShop/admin?action=delete_admin&id=${ad.getId()}" 
                                       onclick="return confirm('Delete This Account?')" class="delete-btn">Delete</a>
                                    <a href="/DHDShop/admin?action=update_admin&id=${ad.getId()}" class="option-btn">
                                        Update
                                    </a>
                                </div>
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
