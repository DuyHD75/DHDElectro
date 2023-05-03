<%-- 
    Document   : updateUser
    Created on : Mar 7, 2023, 4:01:51 PM
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

        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/style.css">
        <style>
            <%@include file="../../css/style.css" %>
        </style>

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


        <%@include file="../../components/user/userHeader.jsp" %>

        <div class="bg">
            <section class="form-container">

                <form  method="post">
                    <h3>update user profile</h3>
                    <input type="hidden" name="prev_pass" value="${user.getPassword()}">
                    <input type="text" name="name" required placeholder="Enter your username" 
                           maxlength="20"  class="box" value="${user.getName()}">

                    <input type="text" name="address" required placeholder="Enter your address" 
                           maxlength="100"  class="box" value="${user.getAddress()}">

                    <input type="number" name="phone" required placeholder="Enter your phone number" 
                           maxlength="10"  class="box" value="${user.getPhone()}">

                    <input type="email" name="email" required placeholder="Enter your email"
                           maxlength="50"  class="box" oninput="this.value = this.value.replace(/\s/g, '')" 
                           value="${user.getEmail()}" >
                    <input type="password" name="old_pass" placeholder="Enter your old password" 
                           maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">

                    <input type="password" name="new_pass" placeholder="Enter your new password" 
                           maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">

                    <input type="password" name="cpass" placeholder="Confirm your new password" 
                           maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">

                    <input type="submit" value="update now" class="btn" name="submit">

                </form>
                <h2>DHD Electro .</h2>
            </section>
        </div>



        <%@include file="../common/footer.jsp" %>

        <script >
            <%@include file="../../js/script.js" %>
        </script>



    </body>
</html>
