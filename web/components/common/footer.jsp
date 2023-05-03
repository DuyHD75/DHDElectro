<%-- 
    Document   : footer
    Created on : Feb 27, 2023, 11:16:48 PM
    Author     : This PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            <%@include file="../../css/style.css" %>
        </style>
    </head>
    <body>
        <footer class="footer">
            <div class="logo">
                <a href="" >DHD<span> Electro.</span></a>
            </div>
            <section class="grid">

                <div class="box">
                    <h3>quick links</h3>
                    <a href="home.php"> <i class="fas fa-angle-right"></i> home</a>
                    <a href="about.php"> <i class="fas fa-angle-right"></i> about</a>
                    <a href="shop.php"> <i class="fas fa-angle-right"></i> shop</a>
                    <a href="contact.php"> <i class="fas fa-angle-right"></i> contact</a>
                </div>

                <div class="box">
                    <h3>extra links</h3>
                    <a href="user_login.php"> <i class="fas fa-angle-right"></i> login</a>
                    <a href="user_register.php"> <i class="fas fa-angle-right"></i> register</a>
                    <a href="cart.php"> <i class="fas fa-angle-right"></i> cart</a>
                    <a href="orders.php"> <i class="fas fa-angle-right"></i> orders</a>
                </div>

                <div class="box">
                    <h3>contact us</h3>
                    <a href="tel:1234567890"><i class="fas fa-phone"></i> +123 456 7899</a>
                    <a href="tel:11122233333"><i class="fas fa-phone"></i> +111 222 3333</a>
                    <a href="mailto:shaikh@gmail.com"><i class="fas fa-envelope"></i> Duyho@gmail.com</a>
                    <a href="#"><i class="fas fa-map-marker-alt"></i> Quang Nam, VietNam </a>
                </div>

                <div class="box">
                    <h3>follow us</h3>
                    <a href="#"><i class="fab fa-facebook-f"></i>Facebook</a>
                    <a href="#"><i class="fab fa-twitter"></i>Twitter</a>
                    <a href="#"><i class="fab fa-instagram"></i>Instagram</a>
                    <a href="#"><i class="fab fa-linkedin"></i>Linkedin</a>
                </div>

            </section>

            <div class="credit">&copy; copyright @ <?= date('Y'); ?> by <span>DHD web designer</span> | all rights reserved!</div>

        </footer>
    </body>
</html>
