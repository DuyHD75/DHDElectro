
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | Products</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
      <link rel="icon" href="images/userImgs/Logo_DHD_Raumgestaltung-350x164.png"/>

        <style>
            <%@include file="../../css/admin_style.css" %>
        </style>
    </head>
    <body>
       


        <%@include file="adminHeader.jsp" %>

        <section class="add-products">

            <h1 class="heading">Add Product</h1>

            <form method="post" >
                <div class="flex">
                    <div class="inputBox">
                        <span>Product name </span>
                        <input type="text" name="namePrd" class="box" required maxlength="100" placeholder="Enter product name" >
                    </div>
                    <div class="inputBox">
                        <span>Product Price</span>
                        <input type="number" min="0" class="box" required max="9999999999" placeholder="Enter product price"
                               onkeypress="if (this.value.length == 10)
                                           return false;" name="price">
                    </div>
                    <div class="inputBox">
                        <span>Image 01 </span>
                        <input type="file" name="image_01" accept="image/jpg, image/jpeg, image/png, image/webp" class="box" required>
                    </div>
                    <div class="inputBox">
                        <span>Image 02</span>
                        <input type="file" name="image_02" accept="image/jpg, image/jpeg, image/png, image/webp" class="box" required>
                    </div>
                    <div class="inputBox">
                        <span>Image 03 </span>
                        <input type="file" name="image_03" accept="image/jpg, image/jpeg, image/png, image/webp" class="box" required>
                    </div>
                     <div class="inputBox">
                        <span>Product Category </span>
                        <input placeholder="Enter Category" name="category"  class="box" required maxlength="100">
                    </div>
                    <div class="inputBox">
                        <span>Product Details </span>
                        <textarea name="details" placeholder="Enter product details" class="box" required maxlength="500" cols="40" rows="10"></textarea>
                    </div>
                </div>

                <input type="submit" value="add product" class="btn" name="add_product">
            </form>
        </section>

        <section class="show-products">

            <h1 class="heading">Products added</h1>

            <div class="box-container">
                <c:choose>
                    <c:when test='${requestScope["products"] != null}'>
                        <c:forEach items="${products}" var="prd">
                            <div class="box">
                                <img src="images/productImgs/${prd.getImg1()}" alt="">
                                <div class="product_content">
                                    <div class="product_info">
                                        <div class="name">${prd.getName()}</div>
                                        <div class="price">$<span>${prd.getPrice()}</span>/-</div>
                                        <div class="details"><span>${prd.getDetail()}</span></div>
                                    </div>
                                    <div class="flex-btn action_btn">
                                        <a href="/DHDShop/admin?action=update_product&pid=${prd.getId()}&adminId=${prd.getAdminId()}" class="option-btn">Update</a>
                                        <a href="/DHDShop/admin?action=delete_product&pid=${prd.getId()}" class="delete-btn" onclick="return confirm('Delete This Product?');">Delete</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p class="empty">Empty Products, Register Now !</p>
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
