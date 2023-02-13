<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.musclebeach.mem.model.MemVO" %>

<%
    MemVO memVO = (MemVO) request.getSession().getAttribute("memVO");
%>
<!DOCTYPE html>
<html>
<head>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta content="Free Website Template" name="keywords"/>
    <meta content="Free Website Template" name="description"/>
    <title>Msucle Beach: 會員資料修改</title>

    <link href="img/favicon.ico" rel="icon"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/front-end/member/lib/flaticon/font/flaticon.css" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/front-end/member/css/style.min.css" rel="stylesheet"/>

</head>
<body class="bg-white">
<!-- Navbar Start -->
<div class="container-fluid p-0 nav-bar">
    <nav
            class="navbar navbar-expand-lg bg-none navbar-dark p-0 bg-secondary position-fixed justify-content-between"
            style="width: 100vw">
        <a href="/front-end/index.html" class="navbar-brand">
            <h1 class="m-0 display-4 font-weight-bold text-uppercase text-white"
                style="padding-left: 15px">Muscle beach</h1>
        </a>
        <button type="button" class="navbar-toggler" data-toggle="collapse"
                data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between"
             id="navbarCollapse">
            <div class="navbar-nav ml-auto p-4 bg-secondary">
                <a href="<%=request.getContextPath()%>/front-end/product/shop.jsp"
                   class="nav-item nav-link">線上商城</a>
                <a href="<%=request.getContextPath()%>/front-end/room/listAllRoom.jsp"
                   class="nav-item nav-link">找場地</a>
                <a href="#" class="nav-item nav-link">找教練</a>
                <a href="<%=request.getContextPath()%>/front-end/course/class.html" class="nav-item nav-link">找課程</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-item nav-link dropdown-toggle active"
                       data-toggle="dropdown">會員專區</a>
                    <form method="post" action="<%=request.getContextPath()%>/back-end/member/mem.do">
                        <div class="dropdown-menu text-capitalize">
                            <a href="<%=request.getContextPath()%>/front-end/member/mem_info.jsp"
                               class="dropdown-item active">會員資料</a>
                            <a href="#" class="dropdown-item">教練課管理</a>
                            <a href="<%=request.getContextPath()%>/front-end/course/myClassOrders.html"
                               class="dropdown-item">團課管理</a>
                            <a href="<%=request.getContextPath()%>/front-end/course/myAbsence.html"
                               class="dropdown-item">查看團課缺席</a>
                            <a href="<%=request.getContextPath()%>/front-end/room/room_order_info.jsp"
                               class="dropdown-item">場地管理</a>
                            <input class="btn text-danger" style="margin-left:10px;" type="submit" value="登出">
                            <input type="hidden" name="action" value="logout"/>
                        </div>
                    </form>
                </div>
                <a href="<%=request.getContextPath()%>/front-end/article/listAllArticle.jsp"
                   class="nav-link">會員交流區</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-item nav-link dropdown-toggle"
                       data-toggle="dropdown">聯絡我們</a>
                    <div class="dropdown-menu text-capitalize">
                        <a href="<%=request.getContextPath()%>/front-end/question/listAllQuestion.jsp"
                           class="dropdown-item">常見問題</a>
                        <a href="<%=request.getContextPath()%>/front-end/news/listAllNews.jsp" class="dropdown-item">最新資訊</a>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</div>
<!-- Navbar End -->

<!-- Main Strat -->
<div style="height: 400px; position: relative; top: 100px">
    <div style="margin-left: 30px">
        <h1 class="display-6">
            <i class="flaticon-barbell text-danger"></i>會員資料修改
        </h1>
    </div>
    <form class="g-3" method="post"
          action="<%=request.getContextPath()%>/back-end/member/mem.do" name="form1">
        <div class="container" style="width: 1200px;">
            <div class="row">
                <div class="col-md-1">
                    <label for="inputId" class="form-label">會員編號</label>
                    <input
                            type="text" class="form-control" id="inputId"
                            value="<%=memVO.getMemID()%>" disabled readonly/>
                </div>
                <div class="col-md-3">
                    <label for="inputName" class="form-label">會員姓名</label>
                    <input
                            type="text" class="form-control" id="inputName" name="memName"
                            value="<%=memVO.getMemName()%>" required/>
                </div>
                <div class="col-md-2">
                    <label for="inputAccount" class="form-label">帳號</label>
                    <input
                            type="text" class="form-control" id="inputAccount"
                            value="<%=memVO.getAccount()%>" disabled readonly/>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-6 col-md-3">
                    <label for="inputTel" class="form-label">手機</label>
                    <input
                            type="text" class="form-control" id="inputTel" name="memPhone"
                            maxlength="10" pattern="09\d{8}" oninput="setCustomValidity('');"
                            oninvalid="setCustomValidity('請輸入正確的手機號碼格式:09xxxxxxxx');"
                            value="<%=memVO.getMemPhone()%>" required/>
                </div>
                <div class="col-6 col-md-3">
                    <label for="inputBirth" class="form-label">生日</label>
                    <input
                            type="text" class="form-control" id="inputBirth"
                            value="<%=memVO.getMemBirthday()%>" disabled readonly/>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12 col-md-6">
                    <label for="inputEmail" class="form-label">信箱</label> <input
                        type="email" class="form-control" id="inputEmail" name="memMail"
                        value="<%=memVO.getMemMail()%>" required/>
                </div>
                <div class="col-12 col-md-8 mt-3">
                    <label for="inputAddress" class="form-label">通訊地址</label> <input
                        type="text" class="form-control" id="inputAddress"
                        name="memAddress" value="<%=memVO.getMemAddress()%>" required/>
                </div>

            </div>
            <div class="row mt-4">
                <div class="col-6 col-md-3">
                    <input type="password" class="form-control" id="inputPassword" name="password"
                           placeholder="輸入密碼，以進行資料修改" required/>
                </div>
                <div class="mx-2">
                    <input type="hidden" name="memID" value="<%=memVO.getMemID()%>"/>
                    <input type="hidden" name="memAccount" value="<%=memVO.getAccount()%>"/>
                    <input type="hidden" name="action" value="update"/>
                    <input type="submit" class="btn btn-outline-primary" value="確定變更"/>
                </div>
                <div class="mt-2 mx-2">
                    <c:if test="${not empty errorMsgs}">
                        <c:forEach var="message" items="${errorMsgs}">
                            <p style="color: red">${message}</p>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- Main End -->

<!-- Footer Start -->
<div
        class="footer container-fluid mt-5 py-5 px-sm-3 px-md-5 text-white"
        style="position: relative; top: 150px">
    <div style="display: inline; padding: 0px">
        <div class="col-lg-0 col-md-10" style="margin: auto">
            <h5 class="text-white mb-4">聯絡我們</h5>
            <p style="display: inline-block">
                <i class="fa fa-map-marker-alt mr-2"></i>住址
            </p>
            <p style="display: inline-block; position: absolute; right: 420px">
                <i class="fa fa-phone-alt mr-2"></i>0987-654-321
            </p>
            <p style="display: inline; float: right" ;>
                <i class="fa fa-envelope mr-2"></i>abc信箱@gmail.com
            </p>
        </div>
    </div>
    <div class="container border-top border-dark pt-2">
        <p class="m-0 text-center text-white">
            &copy; <a class="text-white font-weight-bold" href="#">Your Site
            Name</a>. All Rights Reserved. Designed by <a
                class="text-white font-weight-bold" href="https://htmlcodex.com">HTML
            Codex</a>
        </p>
    </div>
</div>
<!-- Footer End -->

<!-- Back to Top -->
<a href="#" class="btn btn-outline-primary back-to-top"><i
        class="fa fa-angle-double-up"></i></a>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/front-end/member/lib/easing/easing.min.js"></script>
<script src="<%=request.getContextPath()%>/front-end/member/lib/waypoints/waypoints.min.js"></script>

<!-- Contact Javascript File -->
<script src="<%=request.getContextPath()%>/front-end/member/mail/jqBootstrapValidation.min.js"></script>
<script src="<%=request.getContextPath()%>/front-end/member/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="<%=request.getContextPath()%>/front-end/member/js/main.js"></script>
</body>
</html>