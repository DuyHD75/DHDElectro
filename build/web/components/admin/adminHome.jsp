<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | Home</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link rel="icon" href="images/userImgs/Logo_DHD_Raumgestaltung-350x164.png"/>

        <style>
            <%@include file="../../css/admin_style.css" %>
        </style>

    </head>
    <body>
        <%@include file="adminHeader.jsp" %>

        <section class="dashboard">
            <div class="dashboard_container">
                <h1 class="heading">dashboard</h1>

                <div class="box-container">

                    <div class="box">
                        <h3>Welcome!</h3>
                        <p>${admin.getName().toUpperCase()}</p>
                        <a href="?action=update_admin&id=${admin.getId()}" class="btn">Update profile</a>
                    </div>

                    <div class="box">

                        <h3><span>$</span>${pendingTotal}<span>/-</span></h3>
                        <p>Total Pending</p>
                        <a href="?action=viewOrders" class="btn">See Orders</a>
                    </div>

                    <div class="box">
                        <h3><span>$</span>${compeleteTotal}<span>/-</span></h3>
                        <p>Completed Orders</p>
                        <a href="?action=viewOrders" class="btn">see orders</a>
                    </div>

                    <div class="box">
                        <h3>${totalOrders}</h3>
                        <p>Orders Placed</p>
                        <a href="?action=viewOrders" class="btn">see orders</a>
                    </div>

                </div>
            </div>
        </section>

        <%@include file="../common/footer.jsp" %>

        <script>
            <%@include file="../../js/admin_script.js" %>
        </script>
        
        
        
    </body>
</html>
