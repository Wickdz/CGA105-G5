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
    <title>Msucle Beach: 會員資料</title>

    <link href="../images/favicon.ico" rel="icon"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/front-end/member/lib/flaticon/font/flaticon.css" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/front-end/member/css/style.min.css" rel="stylesheet"/>

</head>
<body class="bg-white" id="body">
<!-- Navbar Start -->
<div class="container-fluid p-0 nav-bar">
    <nav
            class="navbar navbar-expand-lg bg-none navbar-dark p-0 bg-secondary position-fixed justify-content-between"
            style="width: 100vw">
        <a href="<%=request.getContextPath()%>/front-end/index.html" class="navbar-brand">
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
            <i class="flaticon-barbell text-danger"></i>會員資料
        </h1>
    </div>
    <div class="container" style="width: 1500px">
        <div class="row">
            <div class="col-md-1">
                <label for="inputId" class="form-label">會員編號</label> <input
                    type="text" class="form-control" id="showId"
                    value="<%=memVO.getMemID()%>" disabled readonly/>
            </div>
            <div class="col-md-3">
                <label for="inputName" class="form-label">會員姓名</label> <input
                    type="text" class="form-control" id="showName" name="memName"
                    value="<%=memVO.getMemName()%>" disabled readonly/>
            </div>
            <div class="col-md-3">
                <label for="inputAccount" class="form-label">帳號</label> <input
                    type="text" class="form-control" id="showAccount"
                    value="<%=memVO.getAccount()%>" disabled readonly/>
            </div>
            <div class="col-md-2">
                <label for="showAccess" class="form-label">會員資格</label>
                <%
                    if (memVO.getMemAccess() == 0) {
                %>
                <input type="text" class="form-control" id="showAccess"
                       value="一般會員" disabled readonly/>
                <%
                } else if (memVO.getMemAccess() == 1) {
                %>
                <input type="text" class="form-control" id="showAccess"
                       value="健身會員" disabled readonly/>
                <%
                } else {
                %>
                <input type="text" class="form-control" id="showAccess"
                       value="停課會員" disabled readonly/>
                <%
                    }
                %>
            </div>
            <%
                if (memVO.getMemAccess() == 1) {
            %>
            <div class="col-md-3">
                <label for="showMembership" class="form-label">會籍有效期限</label> <input
                    type="text" class="form-control" id="showMembership"
                    value="<%=memVO.getMembership()%>" disabled readonly/>
            </div>
            <%
                }
            %>
        </div>
        <div class="row mt-3">
            <div class="col-6 col-md-3">
                <label for="inputTel" class="form-label">手機</label> <input
                    type="text" class="form-control" id="showTel" name="memPhone"
                    value="<%=memVO.getMemPhone()%>" disabled readonly/>
            </div>
            <div class="col-6 col-md-3">
                <label for="inputBirth" class="form-label">生日</label> <input
                    type="text" class="form-control" id="showBirth"
                    value="<%=memVO.getMemBirthday()%>" disabled readonly/>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-12 col-md-6">
                <label for="inputEmail" class="form-label">信箱</label> <input
                    type="email" class="form-control" id="showEmail" name="memMail"
                    value="<%=memVO.getMemMail()%>" disabled readonly/>
            </div>
            <div class="col-12 col-md-8 mt-3">
                <label for="inputAddress" class="form-label">通訊地址</label> <input
                    type="text" class="form-control" id="showAddress"
                    name="memAddress" value="<%=memVO.getMemAddress()%>" disabled
                    readonly/>
            </div>

        </div>
        <div class="row mt-4">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                    data-bs-target="#staticBackdrop">修改密碼
            </button>

            <!-- Modal -->
            <form>
                <div class="modal fade" id="staticBackdrop"
                     data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                     aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog" style="width: 350px">
                        <div class="modal-content position-relative">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel"></h5>
                            </div>
                            <div class="modal-body w-75 mx-auto">
                                <label for="inputOldPassword" class="form-label">請輸入舊密碼</label>
                                <input type="password" class="form-control" id="inputOldPassword" name="oldPassword"
                                       required/>
                                <label for="inputNewPassword" class="form-label mt-2">請輸入新密碼</label>
                                <input type="password" class="form-control" id="inputNewPassword" name="newPassword"/>
                                <label for="ConfirmPassword" class="form-label mt-2">請確認新密碼</label>
                                <input type="password" class="form-control" id="ConfirmPassword"
                                       name="ConfirmPassword"/>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                                <input type="button" id="submitBotton" class="btn btn-primary" value="確定變更">
                                <input type="hidden" id="memberPassword" value="<%=memVO.getPassword()%>">
                                <input type="hidden" id="memberId" value="<%=memVO.getMemID()%>">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <a class="btn btn-outline-primary" href="<%=request.getContextPath()%>/front-end/member/mem_info_update.jsp"
               role="button">修改資料</a>
        </div>
    </div>
    <!-- Main End -->

    <!-- Footer Start -->
    <div
            class="footer container-fluid mt-3 py-5 px-sm-3 px-md-5 text-white"
            style="position: relative; top: 30px">
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
                &copy; <a class="text-white font-weight-bold" href="#">Your
                Site Name</a>. All Rights Reserved. Designed by <a
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
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/member/lib/easing/easing.min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/member/lib/waypoints/waypoints.min.js"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-lpyLfhYuitXl2zRZ5Bn2fqnhNAKOAaM/0Kr9laMspuaMiZfGmfwRNFh8HlMy49eQ"
            crossorigin="anonymous"></script>
    <!-- Contact Javascript File -->
    <script src="<%=request.getContextPath()%>/front-end/member/mail/jqBootstrapValidation.min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/member/mail/contact.js"></script>
    <!-- Template Javascript -->
    <script src="<%=request.getContextPath()%>/front-end/member/js/main.js"></script>
    <script>
        $("#submitBotton").click(function () {
            const regrex = /^(?=.*\d)(?=.*[a-zA-Z]).{8,}$/
            var memberPassword = $("#memberPassword").val();
            var oldPassword = $("#inputOldPassword").val();
            var newPassword = $("#inputNewPassword").val();
            var confirmPassword = $("#ConfirmPassword").val();
            var memberId = $("#memberId").val();
            if (memberPassword === "" || oldPassword === "" || newPassword === "") {
                Swal.fire({
                    icon: 'info',
                    title: '輸入資料不完整',
                })
            } else if (!regrex.test(newPassword)) {
                Swal.fire({
                    icon: 'info',
                    title: '請輸入正確的密碼格式:\n含英數至少8個字元',
                })
            } else if (confirmPassword !== newPassword) {
                Swal.fire({
                    icon: 'info',
                    title: '密碼不吻合',
                })
            } else if (memberPassword === oldPassword) {
                $.ajax({
                    url: `<%=request.getContextPath()%>/updatePassword`,
                    type: "POST",
                    data: {newPassword: newPassword, memberId: memberId},
                    success: function (response) {
                        $("#staticBackdrop").removeClass("show"); // hide modal
                        $("#staticBackdrop").css("display", "none");
                        $("#staticBackdrop").attr("aria-hidden", "true");
                        $("#staticBackdrop").removeAttr("aria-modal");
                        $("#staticBackdrop").removeAttr("role");
                        $("#body").removeAttr("style");
                        $("#body").removeClass("modal-open"); // hide modal
                        Swal.fire({
                            icon: 'info',
                            title: response,
                        })
                        $(".modal-backdrop").remove(); // remove background
                    },
                    error: function () {
                        $("#staticBackdrop").removeClass("show");
                        $("#staticBackdrop").css("display", "none");
                        $("#staticBackdrop").attr("aria-hidden", "true");
                        Swal.fire({
                            icon: 'info',
                            title: '系統忙碌中⛔變更失敗',
                        })
                        $(".modal-backdrop").remove(); // remove background
                    }
                })
            } else {
                Swal.fire({
                    icon: 'info',
                    title: '舊密碼不符合，請重新填入',
                })
            }
        }) // end function
    </script>
</body>
</html>