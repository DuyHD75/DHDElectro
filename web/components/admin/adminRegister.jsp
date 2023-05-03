<%-- 
    Document   : adminRegister
    Created on : Feb 27, 2023, 9:12:58 PM
    Author     : This PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | Register New Admin</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

     <link rel="icon" href="images/userImgs/Logo_DHD_Raumgestaltung-350x164.png"/>
        
        <style>
            <%@include file="../../css/admin_style.css" %>
        </style>

    </head>
    <body>

        <%@include file="../admin/adminHeader.jsp" %>

        <div class="bg">
            <section class="form-container">
                <h3 class="heading">Welcome To DHD Admin</h3>
                <form method="post">
                    <h3>Register new</h3>
                    <input type="text" name="name" required placeholder="Enter your username"
                           maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
                    <input type="password" name="pass" required placeholder="Enter your password"
                           maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
                    <input type="password" name="cpass" required placeholder="Confirm your password"
                           maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
                    <input type="submit" value="register now" class="btn" name="submit">
                </form>
                <h2 class="title2">DHD Electro .</h2>
            </section>

        </div>
        <%@include file="../common/footer.jsp" %>

        <script>
            <%@include file="../../js/admin_script.js" %>
        </script>
    </body>
</html>
