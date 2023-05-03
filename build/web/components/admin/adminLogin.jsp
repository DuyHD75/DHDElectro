
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>

        <%-- FONT AWERSOME --%>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="icon" href="images/userImgs/Logo_DHD_Raumgestaltung-350x164.png"/>

        <style>
            <%@include file="../../css/admin_style.css" %>
        </style>

    </head>
    <body>

      
        
        <c:if test="${not empty message}">
            <div class="message">
                <span>${message}</span>
                <i class="fa-sharp fa-solid fa-xmark" onclick="this.parentElement.remove();"></i>
            </div>
        </c:if>

        <section class="form-container flex-center">
            <form  method="post">
                <h3>Admin Login</h3>
                <input type="text" name="name" required placeholder="Enter username" maxlength="20" 
                       class="box" oninput="this.value = this.value.replace(/\s/g, '')">
                <input type="password" name="password" required placeholder="Enter password" maxlength="20"  
                       class="box" oninput="this.value = this.value.replace(/\s/g, '')">
                <input type="submit" value="Login" class="btn" name="submit">
            </form>
        </section>

    </body>
</html>
