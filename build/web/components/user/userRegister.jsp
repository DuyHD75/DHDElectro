<%-- 
    Document   : userRegister
    Created on : Mar 7, 2023, 3:18:05 PM
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
        <title>register</title>

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
        <link rel="icon" href="images/userImgs/Logo_DHD_Raumgestaltung-350x164.png"/>

        <!-- custom css file link  -->
        <style>
            <%@include file="../../css/style.css" %>
        </style>

    </head>
    <body>



        <%@include file="../../components/user/userHeader.jsp" %>
        <div class="bg">
            <section class="form-container">
                <h3 class="heading text_center">Welcome To DHD Electro .</h3>

                <form action="" method="post">
                    <h3>register now</h3>
                    <input type="text" name="name" required placeholder="Enter your username" maxlength="50"  class="box">

                    <input type="text" name="address" required placeholder="Enter your address" maxlength="100"  class="box">

                    <input type="number" name="phone" required placeholder="Enter your phone number" maxlength="10"  class="box">

                    <input type="email" name="email" required placeholder="Enter your email" 
                           maxlength="50"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
                    <input type="password" name="pass" required placeholder="Enter your password" 
                           maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
                    <input type="password" name="cpass" required placeholder="Confirm your password" 
                           maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
                    <input type="submit" value="register now" class="btn" name="submit">
                    <p>Already have an account?</p>
                    <a href="?action=login" class="option-btn">login now</a>
                </form>
                <h2 class="title2">DHD Electro .</h2>
            </section>
        </div>


        <%@include file="../common/footer.jsp" %>

        <script >
            <%@include file="../../js/script.js" %>
        </script>

    </body>
</html>