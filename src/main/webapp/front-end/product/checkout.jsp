<%@ page import="com.musclebeach.mem.model.MemVO" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="com.musclebeach.common.util.ApplicationContextUtil" %>
<%@ page import="com.musclebeach.mem.model.MemService" %>
<%@ page import="com.musclebeach.creditCard.model.CreditCardVO" %>
<%@ page import="com.musclebeach.creditCard.model.CreditCardService" %>
<%@ page import="com.musclebeach.cart.service.CartService" %>
<%@ page import="com.musclebeach.cart.entity.CartItem" %>
<%@ page import="com.musclebeach.cart.entity.CartProduct" %>
<%@ page import="com.musclebeach.cart.service.CartProductService" %>
<%@ page import="static jdk.internal.org.jline.reader.impl.LineReaderImpl.CompletionType.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    ApplicationContext context = ApplicationContextUtil.getContext();
    MemService memSvc = context.getBean(MemService.class);
    MemVO memVO = memSvc.getOneMem(1);
    pageContext.setAttribute("memVO", memVO);

    CartProductService cartSvc = context.getBean(CartProductService.class);
    List<CartProduct> cartList =cartSvc.getCartProduct(List<CartItem>);
    pageContext.setAttribute("cartList", cartList);
//    ApplicationContext context = ApplicationContextUtil.getContext();
//    CreditCardService creSVC = context.getBean(CreditCardService.class);
//    CreditCardVO creVO = creSVC.getOneCard(1);
//    pageContext.setAttribute("creVO", creVO);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>買家資訊填寫</title>

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- all css -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front-end/product/resources/frontStage/lib/flaticon/font/flaticon.css"
          rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front-end/product/resources/frontStage/css/style.min.css"
          rel="stylesheet">
    <link href="https://kit.fontawesome.com/db0445c7fa.css" rel="stylesheet" crossorigin="anonymous">

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

        * {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            outline: none;
            border: none;
            text-decoration: none;
            text-transform: uppercase;
        }

        .container {
            min-height: 100vh;
            background: rgb(238, 238, 238);
            display: flex;
            align-items: center;
            justify-content: center;
            flex-flow: column;
            padding-bottom: 60px;
            font-size: smaller;
            width: 90%;
        }

        .container form {
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 600px;
            padding-top: 160px;
        }

        .container form .inputBox {
            margin-top: 20px;
        }

        .container form .inputBox span {
            display: block;
            color: #999;
            padding-bottom: 5px;
        }

        .container form .inputBox input,
        .container form .inputBox select {
            width: 100%;
            padding: 10px;
            border-radius: 10px;
            border: 1px solid rgba(0, 0, 0, .3);
            color: rgb(68, 68, 68);
        }

        .container form .flexbox {
            display: flex;
            gap: 15px;
        }

        .container form .flexbox .inputBox {
            flex: 1 1 150px;
        }

        .container form .submit-btn {
            width: 100%;
            background: linear-gradient(45deg, rgb(43, 226, 223), rgb(20, 28, 255));
            margin-top: 20px;
            padding: 10px;
            font-size: 20px;
            color: rgb(255, 255, 255);
            border-radius: 10px;
            cursor: pointer;
            transition: .2s linear;
        }

        .container form .submit-btn:hover {
            letter-spacing: 2px;
            opacity: .8;
        }

        .container .card-container {
            margin-bottom: -150px;
            position: relative;
            height: 250px;
            width: 400px;
        }

        .container .card-container .front {
            position: absolute;
            height: 80%;
            width: 100%;
            top: 0;
            left: 0;
            background: linear-gradient(45deg, rgb(43, 125, 226), rgb(20, 204, 255));
            border-radius: 5px;
            backface-visibility: hidden;
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.2);
            padding: 20px;
            transform: perspective(1000px) rotateY(0deg);
            transition: transform .4s ease-out;
        }

        .container .card-container .front .image {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-top: 10px;
        }

        .container .card-container .front .image img {
            height: 50px;
        }

        .container .card-container .front .card-number-box {
            padding: 30px 0;
            font-size: 22px;
            color: rgb(255, 255, 255);
        }

        .container .card-container .front .flexbox {
            display: flex;
        }

        .container .card-container .front .flexbox .box:nth-child(1) {
            margin-right: auto;
        }

        .container .card-container .front .flexbox .box {
            font-size: 15px;
            color: rgb(255, 255, 255);
        }

        .container .card-container .back {
            position: absolute;
            top: 0;
            left: 0;
            height: 80%;
            width: 100%;
            background: linear-gradient(45deg, rgb(43, 226, 159), rgb(20, 24, 255));
            border-radius: 5px;
            padding: 20px 0;
            text-align: right;
            backface-visibility: hidden;
            box-shadow: 0 15px 25px rgba(0, 0, 0, 0.2);
            transform: perspective(1000px) rotateY(180deg);
            transition: transform .4s ease-out;
        }

        .container .card-container .back .stripe {
            background: rgb(0, 0, 0);
            width: 100%;
            margin: 10px 0;
            height: 50px;
        }

        .container .card-container .back .box {
            padding: 0 20px;
        }

        .container .card-container .back .box span {
            color: rgb(255, 255, 255);
            font-size: 15px;
        }

        .container .card-container .back .box .cvv-box {
            height: 50px;
            padding: 10px;
            margin-top: 5px;
            color: rgb(51, 51, 51);
            background: rgb(255, 255, 255);
            border-radius: 5px;
            width: 100%;
        }

        .container .card-container .back .box img {
            margin-top: 30px;
            height: 30px;
        }
    </style>
</head>

<body class="bg-white">

<!-- header -->
<%@include file="/front-end/common/header.jsp" %>

<!-- Checkout Start -->
<h1><i class="fa-solid fa-truck-fast"></i>訂單資訊</h1>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
    <font style="color:red">請修正以下錯誤:</font>
    <ul>
        <c:forEach var="message" items="${errorMsgs}">
            <li style="color:red">${message}</li>
        </c:forEach>
    </ul>
</c:if>
<table>

    <div class="container">
        <div class="memData-container">

            <div class="card-container">

                <div class="front">
                    <div class="image">

                    </div>
                    <div class="card-number-box">################</div>
                    <div class="flexbox">
                        <div class="box">
                            <span>card holder</span>
                            <div class="card-holder-name">full name</div>
                        </div>
                        <div class="box">
                            <span>expires</span>
                            <div class="expiration">
                                <span class="exp-month">mmyy</span>

                            </div>
                        </div>
                    </div>
                </div>
                <td>總金額:</td>
                <td><input type="TEXT" name="totalPrice" size="45"
                           value="${}"/></td>
                <div class="back">
                    <div class="stripe"></div>
                    <div class="box">
                        <span>ccvc</span>
                        <div class="cvv-box"></div>
                        <img src="image/visa.png" alt="">
                    </div>
                </div>

            </div>

            <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/order/" name="form1">

                <div class="inputBox">
                    <!--<span>會員編號</span> -->
                    <input type="hidden" name="memID" value="1"/>
                </div>
                <div class="inputBox">
                    <span>信用卡卡號</span>
                    <input type="text" maxlength="16" name="ccNumber" class="card-number-input"/>

                </div>
                <div class="inputBox">
                    <span>持卡人姓名</span>
                    <input type="text" name="orderRecName" class="card-holder-input"
                           value="<%= (memVO == null) ? "" : memVO.getMemName()%>" required/>
                </div>
                <div class="flexbox">
                    <div class="inputBox">
                        <span>信用卡期限</span>
                        <input type="text" maxlength="4" name="ccTime" class="month-input"/>

                    </div>

                    <div class="inputBox">
                        <span>驗證碼</span>
                        <input type="text" maxlength="3" name="ccvc" class="cvv-input"/>
                    </div>
                    <div class="inputBox">
                        <span>電話</span>
                        <input type="tel" type="tel" id="phone" name="orderRecPhone"
                               pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
                               value="<%= (memVO == null) ? "" : memVO.getMemPhone()%>" required/><br><br>
                    </div>
                    <div class="inputBox">
                        <span>地址</span>
                        <input type="text" id="address" name="orderAddress"
                               value="<%= (memVO == null) ? "" : memVO.getMemAddress()%>" required/><br><br>
                    </div>
                </div>

                <input type="hidden" name="action" value="insertOrder">
                <input type="hidden" name="memID" value="${memVO.memID}">
                <input type="submit" value="確認付款" class="submit-btn"></FORM>
            </form>

        </div>
    </div>
</table>
<!-- Checkout End -->


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
<script>

    document.querySelector('.card-number-input').oninput = () => {
        document.querySelector('.card-number-box').innerText = document.querySelector('.card-number-input').value;
    }

    document.querySelector('.card-holder-input').oninput = () => {
        document.querySelector('.card-holder-name').innerText = document.querySelector('.card-holder-input').value;
    }

    document.querySelector('.month-input').oninput = () => {
        document.querySelector('.exp-month').innerText = document.querySelector('.month-input').value;
    }


    document.querySelector('.cvv-input').onmouseenter = () => {
        document.querySelector('.front').style.transform = 'perspective(1000px) rotateY(-180deg)';
        document.querySelector('.back').style.transform = 'perspective(1000px) rotateY(0deg)';
    }

    document.querySelector('.cvv-input').onmouseleave = () => {
        document.querySelector('.front').style.transform = 'perspective(1000px) rotateY(0deg)';
        document.querySelector('.back').style.transform = 'perspective(1000px) rotateY(180deg)';
    }

    document.querySelector('.cvv-input').oninput = () => {
        document.querySelector('.cvv-box').innerText = document.querySelector('.cvv-input').value;
    }

</script>
<script src="https://kit.fontawesome.com/db0445c7fa.js" crossorigin="anonymous"></script>

</body>

</html>