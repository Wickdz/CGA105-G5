<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.musclebeach.classSchedule.model.*" %>
<%@ page import="com.musclebeach.common.util.ApplicationContextUtil" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%
    ApplicationContext ctx = ApplicationContextUtil.getContext();
    assert ctx != null;
    ClassScheduleService classScheduleService = ctx.getBean(ClassScheduleService.class);
%>
<jsp:useBean id="listClassSchedules_ByCompositeQuery" scope="request"
             type="java.util.List<com.musclebeach.classSchedule.model.ClassScheduleVO>"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Muscle Beach 後台首頁</title>
    <link
            rel="canonical"
            href="https://getbootstrap.com/docs/5.3/examples/headers/"
    />
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"
    />
    <link
            rel="canonical"
            href="https://getbootstrap.com/docs/5.3/examples/sidebars/"
    />
    <link href="<%=request.getContextPath()%>/back-end/course/resources/Back_end_workspace/assets/dist/css/bootstrap.min.css"
          rel="stylesheet"/>
    <style type="text/css"></style>
    <link href="<%=request.getContextPath()%>/back-end/course/resources/Back_end_workspace/index/index.css"
          rel="stylesheet"/>
    <!-- Flaticon Font -->
    <link href="<%=request.getContextPath()%>/back-end/course/resources/Back_end_workspace/lib/flaticon/font/flaticon.css"
          rel="stylesheet"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <style>
        table#table-1 {
            width: 95%;
            background-color: #CDA581;
            border: 2px solid black;
            text-align: center;
        }

        table#table-1 h4 {
            color: red;
            display: block;
            margin-bottom: 1px;
        }

        h4 {
            color: blue;
            display: inline;
        }

        div#v-pills-class {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
        }

        table#table-2 {
            width: 95%;
            border: 2px solid black;
            text-align: center;
        }

        #table-2 td {
            background-color: azure;
            color: silver;
            text-align: center;
            transition: all 0.5s ease-in-out;
        }

        #table-2 tr:hover td {
            background-color: lightblue;
            transition: all 0.5s ease-in-out;
        }

        #table-2 tr td {
            color: maroon;

            transition: all 0.5s ease-in-out;
        }

        #table-2 tr:hover td {
            color: blue;
            height: 35px;
            border-left: 5px solid rgba(79, 192, 210, 0.6);
            transition: all 0.5s ease-in-out;
        }

        #table-2 tr:hover .show {
            display: block;

        }

        #table-2 tr {
            border-bottom: 1px solid #2a2a2a;
        }

        #table-2 tr:last-of-type {
            border-bottom: none;
        }

    </style>

    <style>
        table {
            width: 800px;
            background-color: white;
            margin-top: 5px;
            margin-bottom: 5px;
        }

        table, th, td {
            border: 1px solid #CCCCFF;
        }

        th, td {
            padding: 5px;
            text-align: center;
        }
    </style>

</head>
<body bgcolor='white'>
<!-- ======================================== header 開始 ======================================== -->
<header class="p-3 text-bg-dark">
    <div class="container">
        <div
                class="d-flex flex-wrap align-items-center justify-content-between"
        >
            <div class="header_1">
                <i class="flaticon-barbell"></i>
                <span>Muscle Beach</span>
            </div>
            <div class="header_2">
                <span style="margin-right: 50px">Welcome, user !</span>
                <button
                        type="button"
                        class="btn btn-outline-light"
                        style="margin-right: 5px"
                >
                    修改密碼
                </button>
                <button type="button" class="btn btn-outline-light">登出</button>
            </div>
        </div>
    </div>
</header>
<!-- ======================================== sidebar 開始 ======================================== -->
<main class="d-flex flex-nowrap">
    <div
            class="d-flex flex-column flex-shrink-0 p-3"
            style="width: 280px; background-color: rgb(110, 109, 109)"
    >
        <ul
                class="nav nav-pills flex-column mb-auto"
                id="v-pills-tab"
                role="tablist"
                aria-orientation="vertical"
                style="text-align: center"
        >
            <li class="nav-item">
                <a
                        class="nav-link text-white"
                        id="v-pills-home-tab"
                        data-bs-toggle="pill"
                        data-bs-target="#v-pills-home"
                        type="button"
                        role="tab"
                        aria-controls="v-pills-home"
                        aria-selected="true"
                        aria-current="page"
                        style="font-size: 1.5rem"
                >
                    <i class="bi bi-house-door" style="margin-right: 8px"></i>
                    首頁
                </a>
            </li>
            <hr/>
            <li class="nav-item">
                <a
                        class="nav-link text-white"
                        id="v-pills-employee-tab"
                        data-bs-toggle="pill"
                        data-bs-target="#v-pills-employee"
                        type="button"
                        role="tab"
                        aria-controls="v-pills-employee"
                        aria-selected="false"
                >
                    <i class="bi bi-person" style="color: white; margin: 5px"></i>
                    員工管理
                </a>
            </li>
            <li>
                <a
                        class="nav-link text-white"
                        id="v-pills-member-tab"
                        data-bs-toggle="pill"
                        data-bs-target="#v-pills-member"
                        type="button"
                        role="tab"
                        aria-controls="v-pills-member"
                        aria-selected="false"
                >
                    <i
                            class="bi bi-person-circle"
                            style="color: white; margin: 5px"
                    ></i>
                    會員管理
                </a>
            </li>
            <li>
                <a
                        class="nav-link text-white"
                        id="v-pills-shop-tab"
                        data-bs-toggle="pill"
                        data-bs-target="#v-pills-shop"
                        type="button"
                        role="tab"
                        aria-controls="v-pills-shop"
                        aria-selected="false"
                >
                    <i class="bi bi-shop" style="color: white; margin: 5px"></i>
                    商城管理
                </a>
            </li>
            <li>
                <a
                        class="nav-link text-white"
                        id="v-pills-coach-tab"
                        data-bs-toggle="pill"
                        data-bs-target="#v-pills-coach"
                        type="button"
                        role="tab"
                        aria-controls="v-pills-coach"
                        aria-selected="false"
                >
                    <i
                            class="bi bi-universal-access"
                            style="color: white; margin: 5px"
                    ></i>
                    教練管理
                </a>
            </li>
            <li>
                <a
                        class="nav-link active text-white"
                        id="v-pills-class-tab"
                        data-bs-toggle="pill"
                        data-bs-target="#v-pills-class"
                        type="button"
                        role="tab"
                        aria-controls="v-pills-class"
                        aria-selected="false"
                        onclick="location.href='<%=request.getContextPath()%>/back-end/course/classSchedule/select_page.jsp';"
                >
                    <i
                            class="bi bi-calendar2-week"
                            style="color: white; margin: 5px"
                    ></i>
                    課程管理
                </a>
            </li>
            <li>
                <a
                        class="nav-link text-white"
                        id="v-pills-room-tab"
                        data-bs-toggle="pill"
                        data-bs-target="#v-pills-room"
                        type="button"
                        role="tab"
                        aria-controls="v-pills-room"
                        aria-selected="false"
                >
                    <i class="bi bi-building" style="color: white; margin: 5px"></i>
                    場地管理
                </a>
            </li>
            <li>
                <a
                        class="nav-link text-white"
                        id="v-pills-article-tab"
                        data-bs-toggle="pill"
                        data-bs-target="#v-pills-article"
                        type="button"
                        role="tab"
                        aria-controls="v-pills-article"
                        aria-selected="false"
                >
                    <i
                            class="bi bi-chat-right-text"
                            style="color: white; margin: 5px"
                    ></i>
                    論壇管理
                </a>
            </li>
            <li>
                <a
                        class="nav-link text-white"
                        id="v-pills-service-tab"
                        data-bs-toggle="pill"
                        data-bs-target="#v-pills-service"
                        type="button"
                        role="tab"
                        aria-controls="v-pills-service"
                        aria-selected="false"
                >
                    <i class="bi bi-envelope" style="color: white; margin: 5px"></i>
                    客服管理
                </a>
            </li>
        </ul>
        <hr/>
        <div class="mx-auto d-flex mt-3 mb-3 text-muted">&copy; 2022</div>
    </div>
    <div class="tab-content" id="v-pills-tabContent">
        <!-- ============================================ 首頁 ============================================ -->
        <div
                class="tab-pane fade "
                id="v-pills-home"
                role="tabpanel"
                aria-labelledby="v-pills-home-tab"
                tabindex="0"
        >
            <img src="/image/welcome.gif" style="width: 96%" alt=""/>
        </div>

        <!-- ========================================= 課程管理 ========================================= -->
        <div
                class="tab-pane fade show active"
                id="v-pills-class"
                role="tabpanel"
                aria-labelledby="v-pills-class-tab"
                tabindex="0"
                style="border: 2px solid purple "
        >


            <table id="table-1">
                <tr>
                    <td>
                        <h3>單筆課程點名表</h3>

                    </td>
                </tr>
            </table>


            <table id="table-2">
                <tr>
                    <th>時間編號</th>
                    <th>課程編號</th>
                    <th>開始時間</th>
                    <th>結束時間</th>
                    <th>會員編號</th>
                    <th>團課點名</th>

                </tr>
                <%@ include file="page1_ByCompositeQuery.file" %>
                <c:forEach var="classScheduleVO" items="${listClassSchedules_ByCompositeQuery}" begin="<%=pageIndex%>"
                           end="<%=pageIndex+rowsPerPage-1%>">
                    <tr>
                        <td>${classScheduleVO.timeID}</td>
                        <td>${classScheduleVO.classID}</td>
                        <td>${classScheduleVO.startTime}</td>
                        <td>${classScheduleVO.endTime}</td>
                        <td>${classScheduleVO.memID}</td>

                        <td>
                            <FORM METHOD="post"
                                  ACTION="<%=request.getContextPath()%>/back-end/absentMember/absentMember.do"
                                  style="margin-bottom: 0px;">
                                <input type="submit" value="缺席">
                                <input type="hidden" name="classID" value="${classScheduleVO.classID}">
                                <input type="hidden" name="timeID" value="${classScheduleVO.timeID}">
                                <input type="hidden" name="memID" value="${classScheduleVO.memID}">
                                <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
                                <!--送出本網頁的路徑給Controller-->
                                <input type="hidden" name="whichPage" value="<%=whichPage%>">
                                <!--送出當前是第幾頁給Controller-->
                                <input type="hidden" name="action" value="insertandgetCount">
                            </FORM>
                        </td>
                        <!-- 			<td> -->
                            <%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" style="margin-bottom: 0px;"> --%>
                        <!-- 			     <input type="submit" value="刪除"> -->
                            <%-- 			     <input type="hidden" name="empno"      value="${empVO.empno}"> --%>
                            <%-- 			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller--> --%>
                            <%-- 			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller--> --%>
                        <!-- 			     <input type="hidden" name="action"     value="delete"></FORM> -->
                        <!-- 			</td> -->
                    </tr>
                </c:forEach>
            </table>
            <%@ include file="page2_ByCompositeQuery.file" %>
        </div>
</main>
<script src="<%=request.getContextPath()%>/back-end/course/resources/Back_end_workspace/js/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/back-end/course/resources/Back_end_workspace/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/back-end/course/resources/Back_end_workspace/assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/back-end/course/resources/Back_end_workspace/index/sidebars.js"></script>


<!-- <h4> -->
<!-- ☆萬用複合查詢  - 可由客戶端 select_page.jsp 隨意增減任何想查詢的欄位<br> -->
<!-- ☆此頁作為複合查詢時之結果練習，<font color=red>已增加分頁、送出修改、刪除之功能</font></h4> -->


<!-- <br>本網頁的路徑:<br><b> -->
<%--    <font color=blue>request.getServletPath():</font> <%=request.getServletPath()%><br> --%>
<%--    <font color=blue>request.getRequestURI(): </font> <%=request.getRequestURI()%> </b> --%>

</body>
</html>