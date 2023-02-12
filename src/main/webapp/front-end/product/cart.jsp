<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>購物車</title>
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

    <style>
        .login {
            display: inline;
            position: relative;
            Left: calc(100% - 150px);
            top: 5px;
        }

        .register {
            display: inline;
            position: relative;
            Left: calc(100% - 150px);
            top: 5px;
            color: white;
        }
    </style>
    <style>
        table {
            border-collapse: collapse;
            width: 60%;
            margin: 20px auto;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: lightgray;
        }

        input[type="number"] {
            width: 50px;
        }

        #total {
            font-weight: bold;
        }

        button {
            padding: 10px 20px;
            background-color: lightgray;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }
    </style>
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
                    <h2>購物車清單</h2>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Cart Start -->
<table>
    <tr>
        <th>商品名稱</th>
        <th>數量</th>
        <th>價格</th>
        <th>總金額</th>
    </tr>
    <tr>
        <td>專業家用瑜伽啞鈴</td>
        <td>
            <input type="number" value="1" class="quantity">
        </td>
        <td class="price">$10</td>
        <td class="total">$10</td>
    </tr>
    <tr>
        <td>實心包膠啞鈴</td>
        <td>
            <input type="number" value="1" class="quantity">
        </td>
        <td class="price">$20</td>
        <td class="total">$20</td>
    </tr>
</table>
<p>總金額: $<span id="total">".total"</span></p>
<button id="checkout">結帳</button>

<script>
    const quantities = document.querySelectorAll(".quantity");
    const prices = document.querySelectorAll(".price");
    const totals = document.querySelectorAll(".total");
    const totalEl = document.querySelector("#total");
    const checkoutBtn = document.querySelector("#checkout");

    function updateTotal() {
        let total = 0;
        for (let i = 0; i < quantities.length; i++) {
            const quantity = parseInt(quantities[i].value);
            const price = parseInt(prices[i].textContent.slice(1));
            totals[i].textContent = "$" + (price * quantity);
            total += price * quantity;
        }
        totalEl.textContent = total;
    }
</script>
<!-- Cart End -->


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
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.2/axios.min.js"></script>
<script>
    getAll();

    function getAll() {
        axios.get("../../carts").then((res) => {
            console.log(res.data.data);
        })
    }
</script>
</body>

</html>