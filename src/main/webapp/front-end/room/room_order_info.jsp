<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.musclebeach.roomOrder.model.RoomOrderVO" %>
<%@ page import="com.musclebeach.mem.model.MemVO" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="com.musclebeach.common.util.ApplicationContextUtil" %>
<%@ page import="com.musclebeach.roomOrder.model.RoomOrderService" %>


<%
    ApplicationContext context = ApplicationContextUtil.getContext();
    MemVO memVO = (MemVO) request.getSession().getAttribute("memVO");
    RoomOrderService roomOrderService = context.getBean(RoomOrderService.class);
    List<RoomOrderVO> orderLists = roomOrderService.getByMem(memVO.getMemID());
    pageContext.setAttribute("orderLists", orderLists);
%>
<!DOCTYPE html>
<html>
<head>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta content="Free Website Template" name="keywords"/>
    <meta content="Free Website Template" name="description"/>
    <title>Msucle Beach: 場地訂單管理</title>

    <link href="<%=request.getContextPath()%>/front-end/room/images/favicon.ico" rel="icon"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/front-end/room/lib/flaticon/font/flaticon.css" rel="stylesheet"/>
    <link href="<%=request.getContextPath()%>/front-end/room/css/style.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body class="bg-white">
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
                <a href="coach.html" class="nav-item nav-link">找教練</a>
                <a href="<%=request.getContextPath()%>/front-end/course/class.html" class="nav-item nav-link">找課程</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-item nav-link dropdown-toggle active"
                       data-toggle="dropdown">會員專區</a>
                    <form method="post" action="<%=request.getContextPath()%>/back-end/member/mem.do">
                        <div class="dropdown-menu text-capitalize">
                            <a href="<%=request.getContextPath()%>/front-end/member/mem_info.jsp" class="dropdown-item">會員資料</a>
                            <a href="#" class="dropdown-item">教練課管理</a>
                            <a href="<%=request.getContextPath()%>/front-end/course/myClassOrders.html"
                               class="dropdown-item">團課管理</a>
                            <a href="<%=request.getContextPath()%>/front-end/course/myAbsence.html"
                               class="dropdown-item">查看團課缺席</a>
                            <a href="<%=request.getContextPath()%>/front-end/room/room_order_info.jsp"
                               class="dropdown-item active">場地管理</a>
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
<div style="min-height: 100vh; position: relative; top: 100px">
    <div style="margin-left: 30px">
        <h1 class="display-6">
            <i class="flaticon-barbell text-danger"></i>場地訂單管理
        </h1>
    </div>
    <% // 如果無訂單資料要顯示查無資料
        if (orderLists == null || orderLists.isEmpty()) {%>
    <div class="alert alert-info text-center" role="alert">
        目前尚無預約訂單資料🙈🙉🙊
    </div>
    <% } else {%>
    <!------------ 有訂單資料 ------------>
    <div class="alert alert-warning text-center" role="alert">
        為了維護及保障會員權益：於租用日期 <strong>3日前</strong> 取消訂單，<strong>可全額退款</strong>；3日內取消，恕無法退款
    </div>
    <table class="table table-dark table-hover mx-auto mt-4 text-center"
           style="width: 80%">
        <thead>
        <tr>
            <th scope="col">訂單編號</th>
            <th scope="col">租用場地</th>
            <th scope="col">租用日期</th>
            <th scope="col">租用時段</th>
            <th scope="col">訂單成立時間</th>
            <th scope="col">訂單狀態</th>
            <th scope="col">最後處理時間</th>
            <th scope="col">取消申請</th>
        </tr>
        </thead>
        <tbody>
        <% for (RoomOrderVO order : orderLists) { %>
        <tr style="height:65px">
            <th class="align-middle" scope="row"><%=order.getOrderID()%>
            </th>

            <td class="align-middle"><%=order.getRoomVO().getRoomName()%>
            </td>

            <td class="align-middle"><%=order.getBorrowDate()%>
            </td>

            <% switch (order.getBorrowTime()) {
                case 0:%>
            <td class="align-middle">上午</td>
            <%
                    break;
                case 1:
            %>
            <td class="align-middle">下午</td>
            <%
                    break;
                case 2:
            %>
            <td class="align-middle">晚上</td>
            <%
                        break;
                    default:
                        break;
                }
            %>

            <td class="align-middle"><%=order.getCreateTime()%>
            </td>

            <% switch (order.getOrderStatus()) {
                case 0:%>
            <td class="align-middle">取消訂單</td>
            <%
                    break;
                case 1:
            %>
            <td class="align-middle">預約成功</td>
            <%
                    break;
                case 2:
            %>
            <td class="align-middle">待處理</td>
            <%
                        break;
                    default:
                        break;
                }
            %>

            <td class="align-middle"><%=order.getUpdateTime()%>
            </td>

            <% Calendar calendar = Calendar.getInstance();
                calendar.set(Calendar.HOUR_OF_DAY, 0);
                calendar.set(Calendar.MINUTE, 0);
                calendar.set(Calendar.SECOND, 0);
                calendar.set(Calendar.MILLISECOND, 0);
                Date today = calendar.getTime();
                java.sql.Date sqlDate = order.getBorrowDate();
                java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                if (today.compareTo(utilDate) > 0 || order.getOrderStatus() != 1) { %>
            <td></td>
            <%
            } else {
            %>
            <td>
                <button type="button" class="cancelBtn btn btn-outline-primary" data-bs-toggle="modal"
                        data-bs-target="#staticBackdrop">
                    取消
                </button>
                <!-- Modal -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                     tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel"><i class="bi bi-clipboard2-x"></i> Room
                                    Cancellation</h5>
                            </div>
                            <div id="text" class="modal-body text-secondary">
                                若在三日內取消(如:租借日1/5，三日內為1/2~1/4)，無法退還租金<br>
                                您是否要取消?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
                                <button type="button" class="submitCancelBtn btn btn-primary">送出取消申請</button>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
            <%
                    }
                }
            %>
        </tr>
        </tbody>
    </table>
    <!-- 有訂單資料 -->
    <% } %>
</div>
<!-- Main End -->

<!-- Footer Start -->
<div
        class="footer container-fluid mt-5 py-5 px-sm-3 px-md-5 text-white position-relative"
        style="top: 150px">
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
                class="text-white font-weight-bold" href="https://htmlcodex.com">HTML Codex</a>
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
<script src="<%=request.getContextPath()%>/front-end/room/lib/easing/easing.min.js"></script>
<script src="<%=request.getContextPath()%>/front-end/room/lib/waypoints/waypoints.min.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-lpyLfhYuitXl2zRZ5Bn2fqnhNAKOAaM/0Kr9laMspuaMiZfGmfwRNFh8HlMy49eQ"
        crossorigin="anonymous"></script>

<!-- Contact Javascript File -->
<script src="<%=request.getContextPath()%>/front-end/room/mail/jqBootstrapValidation.min.js"></script>
<script src="<%=request.getContextPath()%>/front-end/room/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="<%=request.getContextPath()%>/front-end/room/js/main.js"></script>
<script>
    $(".cancelBtn").click(function () {
        var currentRow = $(this).closest("tr");
        const orderID = currentRow.find("th:eq(0)").text().trim();
        console.log(orderID);
        $(".submitCancelBtn").click(function () {
            const data = {
                action: "cancelApply",
                orderID: orderID,
            };
            axios({
                headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                method: "post",
                url: `<%=request.getContextPath()%>/roomOrder.do`,
                data: data
            })
                .then((response) => location.reload())
                .catch((error) => console.log(error))
        });
    });
</script>
</body>
</html>