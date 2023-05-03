<%-- 
    Document   : userHeader
    Created on : Mar 7, 2023, 11:19:30 AM
    Author     : This PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    </head>
    <body>
        <c:choose>
            <c:when test="${not empty error}">
                <div class="error">
                    <span>${error}</span>
                    <i class="fa-sharp fa-solid fa-xmark" onclick="this.parentElement.remove();"></i>
                </div>
            </c:when>

            <c:when test="${not empty message}">
                <div class="message">
                    <span>${message}</span>
                    <i class="fa-sharp fa-solid fa-xmark" onclick="this.parentElement.remove();"></i>
                </div>
            </c:when>
        </c:choose>

        <header class="header">

            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
                        <li><a href="#"><i class="fa-sharp fa-solid fa-envelope"></i>DHDCompany@email.com</a></li>
                        <li><a href="#"><i class="fa-sharp fa-solid fa-location-dot"></i>Quang Nam, Viet Nam</a></li>
                    </ul>

                    <ul class="header-links pull-right">
                        <li><a href="#"><i class="fa-sharp fa-solid fa-bell"></i></i>Notification</a></li>
                        <li><a href="#"><i class="fa-sharp fa-solid fa-user"></i></i> ${user.getName() != null ? user.getName() : "Username"}</a></li>
                    </ul>
                </div>
            </div>

            <section class="flex">

                <a href="?action=homePage&uid=${user.getId()}" class="logo">DHD <span>Electro.</span></a>

                <nav class="navbar">
                    <a href="?action=homePage&uid=${user.getId()}" class="nav">home</a>
                    <a href="?action=about" class="nav">about</a>
                    <a href="?action=orders&uid=${user.getId()}" class="nav">orders</a>
                    <a href="?action=shop&uid=${user.getId()}" class="nav">shop</a>
                    <a href="?action=contact&uid=${user.getId()}"class="nav">contact</a>
                </nav>

                <div class="icons">

                    <a href="?action=search&uid=${user.getId()}">
                        <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
                    </a>
                    <a href="?action=viewWishList&uid=${user.getId()}">
                        <i class="fa-sharp fa-solid fa-heart"></i>
                        <span>${wishs.size()}</span>
                    </a>

                    <a href="?action=viewCart&uid=${user.getId()}">
                        <i class="fas fa-shopping-cart"></i>
                        <span>${sumPrdInCart}</span>
                    </a>

                    <div id="user-btn" class="fas fa-user"></div>
                    <div id="menu-btn" class="fas fa-bars"></div>

                </div>

                <div class="profile">
                    <c:choose>
                        <c:when test="${user != null}">
                            <p>${user.getName()}</p>
                            <a href="?action=updateProfile&uid=${user.getId()}" class="btn"> update profile</a>
                            <a href="?action=logout" class="delete-btn" onclick="return confirm('Logout from the website?');">Logout</a> 
                        </c:when>
                        <c:otherwise>
                            <p style="text-transform: capitalize; margin-top: 2rem;">please login or register first!</p>
                            <div class="flex-btn">
                                <a href="?action=register" class="option-btn">register</a>
                                <a href="?action=login" class="option-btn">login</a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </section>

        </header>

        <script>
            <%@include file="../../js/script.js" %>
        </script>

    </body>
</html>
