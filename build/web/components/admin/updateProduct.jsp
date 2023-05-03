

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | Update Product</title>
        <link rel="icon" href="images/userImgs/Logo_DHD_Raumgestaltung-350x164.png"/>
        <style>
            <%@include file="../../css/admin_style.css" %>
        </style>
    </head>
    <body>

       
        <%@include file="./adminHeader.jsp" %>

        <section class="update-product">

            <h1 class="heading">update product</h1>


            <form action="" method="post">
                <input type="hidden" name="pid" value="${product.getId()}>
                       <input type="hidden" name="old_image_01" value="${product.getImg1()}">
                <input type="hidden" name="old_image_02" value="${product.getImg2()}">
                <input type="hidden" name="old_image_03" value="${product.getImg3()}">
                <div class="image-container">
                    <div class="main-image">
                        <img src="images/productImgs/${product.getImg1()}" alt="">
                    </div>
                    <div class="sub-image">
                        <img src="images/productImgs/${product.getImg1()}" alt="">
                        <img src="images/productImgs/${product.getImg2()}" alt="">
                        <img src="images/productImgs/${product.getImg3()}" alt="">
                    </div>
                </div>
                <span>Update Name</span>
                <input type="text" name="name" required class="box" maxlength="100" placeholder="enter product name" value="${product.getName()}">
                <span>Update Price</span>
                <input type="number" name="price" required class="box" min="0" max="9999999999" placeholder="Enter product price" onkeypress="if (this.value.length == 10)
                            return false;" value="${product.getPrice()}">
                <span>Update Details</span>
                <textarea name="details" class="box" required cols="30" rows="10">${product.getDetail()}</textarea>
                <span>update image 01</span>
                <input type="file" name="image_01" 
                       accept="image/jpg, image/jpeg, image/png, image/webp" 
                       class="box" value="${product.getImg1()}">
                <span>Update Image 02</span>
                <input type="file" name="image_02" 
                       accept="image/jpg, image/jpeg, image/png, image/webp" class="box" value="${product.getImg2()}">
                <span>Update Image 03</span>
                <input type="file" name="image_03" 
                       accept="image/jpg, image/jpeg, image/png, image/webp" class="box" value="${product.getImg1()}">
                <div class="flex-btn">
                    <input type="submit" name="update" class="btn" value="update">
                    <a href="/DHDShop/admin?action=create_product&adminId=${product.getAdminId()}" class="option-btn">go back</a>
                </div>
            </form>



        </section>


        <%@include file="../common/footer.jsp" %>
        <script>
            <%@include file="../../js/admin_script.js" %>
        </script>
    </body>
</html>
