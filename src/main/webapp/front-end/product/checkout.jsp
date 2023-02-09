<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>買家資訊填寫</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free Website Template" name="keywords">
    <meta content="Free Website Template" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- all css -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front-end/product/resources/frontStage/lib/flaticon/font/flaticon.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front-end/product/resources/frontStage/css/style.min.css" rel="stylesheet">

    <style>
        .login {
            display: inline;
            position: relative;
            Left: calc(100% - 150px);
            top: 5px;
        }
        .register{
            display: inline;
            position: relative;
            Left: calc(100% - 150px);
            top: 5px;
            color: white;
        }
    </style>
    <style>
        form {
          width: 500px;
          float: left;
          text-align: left;
          padding: 20px;
        }
        .shopping-cart {
          width: 300px;
          float: right;
          text-align: left;
          padding: 20px;
          border: 1px solid #ccc;
          border-radius: 5px;
        }
        label {
          font-weight: bold;
          display: block;
          margin-bottom: 10px;
        }
        input[type="text"],
        input[type="email"] {
          width: 100%;
          padding: 10px;
          margin-bottom: 20px;
          box-sizing: border-box;
          border-radius: 5px;
          border: 1px solid #ccc;
        }
        input[type="submit"] {
          width: 100%;
          padding: 10px;
          background-color: #4CAF50;
          color: white;
          border: none;
          border-radius: 5px;
          cursor: pointer;
          margin-top: 20px;
        }
        input[type="submit"]:hover {
          background-color: #3e8e41;
        }
        .cart-item {
          margin-bottom: 20px;
        }
      </style>
</head>

<body class="bg-white">

    <!-- header -->
    <%@include file="/front-end/common/header.jsp"%>

    <!-- Checkout Start -->
    <h1>訂單資訊</h1>
    <table>
     <form action="https://www.example.com/charge" method="post">
       <label for="name">姓名</label>
       <input type="text" id="name" name="name" size="45" required><br><br>
       <label for="email">電話</label>
       <input type="email" id="email" name="email" required><br><br>
       <label for="address">地址</label>
       <input type="text" id="address" name="address" required><br><br>
       <label for="card-number">信用卡卡號</label>
       <input type="text" id="card-number" name="card-number" required><br><br>
       <label for="expiration">到期日/年份</label>
       <input type="text" id="expiration" name="expiration" required><br><br>
       <label for="cvv">CVV</label>
       <input type="text" id="cvv" name="cvv" required><br><br>
       <input type="submit" value="結帳">
     </form>
    </table>
    <!-- Checkout End -->

   
    <!-- Footer -->
    <%@include file="/front-end/common/footer.jsp"%>

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
</body>

</html>