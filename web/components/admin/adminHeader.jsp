

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            <%@include file="../../css/admin_style.css" %>
        </style>
    </head>

    <body>

        <c:choose>
            <c:when test="${not empty message}">
                <div class="message">
                    <span>${message}</span>
                    <i class="fa-sharp fa-solid fa-xmark" onclick="this.parentElement.remove();"></i>
                </div>
            </c:when>
            <c:when test="${not empty error}">
                <div class="error">
                    <span>${error}</span>
                    <i class="fa-sharp fa-solid fa-xmark" onclick="this.parentElement.remove();"></i>
                </div>
            </c:when>
        </c:choose>
        <header class="header">
            <section class="flex">
                <a href="" class="logo">DHDShop<span> Admin.</span></a>

                <nav class="navbar">
                    <a href="?action=homePage">Home</a>
                    <a href="?action=create_product&adminId=${admin.getId()}">Products</a>
                    <a href="?action=viewOrders&adminId=${admin.getId()}">Orders</a>
                    <a href="?action=viewAdmins&adminId=${admin.getId()}">Admins</a>
                    <a href="?action=viewUsers&adminId=${admin.getId()}">Users</a>
                </nav>

                <div class="icons">
                    <div id="menu-btn" class="fas fa-bars"></div>
                    <div id="user-btn" class="fas fa-user"></div>
                </div>

                <div class="profile ">
                    <p>${admin.getName().toUpperCase()}</p>
                    <a href="?action=update_admin&id=${admin.getId()}" class="btn">Update Profile</a>

                    <div class="flex-btn">
                        <a href="?action=create_admin&id=${admin.getId()}" class="option-btn">Register</a>
                        <a href="/DHDShop/admin" class="option-btn">Login</a>
                    </div>
                    <a href="?action=logout" class="delete-btn" onclick="return confirm('Logout from the website?');">logout</a> 
                </div>

            </section>
        </header>

        <<script src="">
            <%@include file="../../js/admin_script.js" %>
        </script>
    </body>
</html>
