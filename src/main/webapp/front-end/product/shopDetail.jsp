<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>商品詳情</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free Website Template" name="keywords">
    <meta content="Free Website Template" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- all css -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front-end/product/resources/frontStage/lib/flaticon/font/flaticon.css"
          rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front-end/product/resources/frontStage/css/style.min.css"
          rel="stylesheet">
    <link href="https://kit.fontawesome.com/db0445c7fa.css" rel="stylesheet" crossorigin="anonymous">

</head>

<body class="bg-white">

<!-- header -->
<%@include file="/front-end/common/header.jsp" %>

<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <a href="<%=request.getContextPath()%>/front-end/product/shop.jsp"
                   class="btn btn-info mb-3">返回商城</a>
                <ul class="breadcrumb">
                    <h2>商品詳情</h2>
                    <i class="fa-sharp fa-solid fa-cart-shopping"></i>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- shopDetail -->
<div class="col-lg-8 col-md-12 col-sm-12 ">
    <div style="display: flex;">
        <img src="<%=request.getContextPath()%>/front-end/product/ShowProdImgFront?proID=${prodVO.proID}" width="300px"
             class="img-fluid">
        <div class="text-block NopaddingDetails">
            <h3 class="mb-4">${prodVO.proName}</h3>
            <p class="mb-2">庫存：${prodVO.proQty}</p>
            <p class="mb-2">價格：${prodVO.proPrice}</p>
            <p class="mb-2">詳情：${prodVO.proContent}</p>
            <a href="<%=request.getContextPath()%>/front-end/product/cart.jsp" class="btn btn-info mb-3">加入購物車</a>
        </div>
    </div>
</div>

<!-- shopDetail -->


<!-- Footer -->
<%@include file="/front-end/common/footer.jsp" %>

<!-- Back to Top -->
<a href="#" class="btn btn-outline-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- all js -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/front-end/product/resources/frontStage/lib/easing/easing.min.js"></script>
<script src="<%=request.getContextPath()%>/front-end/product/resources/frontStage/lib/waypoints/waypoints.min.js"></script>
<script src="<%=request.getContextPath()%>/front-end/product/resources/frontStage/mail/jqBootstrapValidation.min.js"></script>
<script src="<%=request.getContextPath()%>/front-end/product/resources/frontStage/mail/contact.js"></script>
<script src="<%=request.getContextPath()%>/front-end/product/resources/frontStage/js/main.js"></script>
<script src="https://kit.fontawesome.com/db0445c7fa.js" crossorigin="anonymous"></script>
</body>

</html>