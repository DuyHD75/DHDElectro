<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | Update Profile</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
     <link rel="icon" href="images/userImgs/Logo_DHD_Raumgestaltung-350x164.png"/>

        <style>
            <%@include file="../../css/admin_style.css" %>
        </style>
    </head>
    <body>


        <%@include file="adminHeader.jsp" %>

        <div class="bg">
            <section class="form-container">
                <h3 class="heading">Welcome To <span style="color: ">DHD</span> Admin</h3>
                <form method="post">
                    <h3>update profile</h3>

                    <input type="hidden" name="prev_pass" value="${admin.getPassword()}">

                    <input type="text" name="name" value="${admin.getName()}" required placeholder="Enter username" 
                           maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')" required>

                    <input type="password" name="old_pass" placeholder="Enter old password" 
                           maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')" required>

                    <input type="password" name="new_pass" placeholder="Enter new password" 
                           maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')" required>

                    <input type="password" name="confirm_pass" placeholder="Confirm new password" 
                           maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')" required>

                    <input type="submit" value="Update Profile" class="btn" name="submit">
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
