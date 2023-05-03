<%-- 
    Document   : contactPage
    Created on : Mar 10, 2023, 2:59:32 PM
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
        <title>contact</title>
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

        <section class="contact">
            <form action="" method="post">
                <h3>get in touch</h3>
                <input type="text" name="name" placeholder="Enter your name" required maxlength="20" class="box" value="${name}">
                <input type="email" name="email" placeholder="Enter your email" required maxlength="50" class="box" value="${email}">
                <input type="number" name="number" min="0" max="9999999999" value="${phone}"
                       placeholder="Enter your number" required onkeypress="if (this.value.length == 10)
                            return false;" class="box">
                <textarea name="msg" class="box" placeholder="Enter your message" cols="30" rows="10"></textarea>
                <input type="submit" value="send message" name="send" class="btn">
            </form>
        </section>



        <%@include file="../common/footer.jsp" %>

        <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

        <script >
            <%@include file="../../js/script.js" %>
        </script>


        <script >
            <%@include file="../../js/sliderScript.js" %>
        </script>

    </body>
</html>