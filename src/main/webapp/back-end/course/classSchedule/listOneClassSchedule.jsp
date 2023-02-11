<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5" %>
<%@ page import="com.musclebeach.classSchedule.model.*" %>


<%
    ClassScheduleVO classScheduleVO = (ClassScheduleVO) request.getAttribute("classScheduleVO");
%>
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

    <style>
        table#table-1 {
            width: 95%;
            background-color: brown;
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
    </style>

    <style>
        div#v-pills-class {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
        }

        table#table-2 {
            width: 100%;
            border: 2px solid black;
            text-align: center;
        }

        table {
            width: 600px;
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
            style="width: 220px; background-color: rgb(110, 109, 109)"
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
                        class="nav-link  text-white"
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


            <table id="table-2">
                <tr>
                    <th>時間編號</th>
                    <th>課程編號</th>
                    <th>開始時間</th>
                    <th>結束時間</th>


                </tr>
                <tr>
                    <td><%=classScheduleVO.getTimeID()%>
                    </td>
                    <td><%=classScheduleVO.getClassID()%>
                    </td>
                    <td><%=classScheduleVO.getStartTime()%>
                    </td>
                    <td><%=classScheduleVO.getEndTime()%>
                    </td>
                    <td>
                        <FORM METHOD="post"
                              ACTION="classSchedule.do"
                              style="margin-bottom: 0px;">
                            <input type="submit" value="課程點名表">
                            <input type="hidden" name="time_id" value="<%=classScheduleVO.getTimeID()%>">
                            <input type="hidden" name="action" value="listClassSchedules_ByCompositeQuery"></FORM>
                    </td>
                </tr>
            </table>
        </div>

</main>
<script src="<%=request.getContextPath()%>/back-end/course/resources/Back_end_workspace/js/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/back-end/course/resources/Back_end_workspace/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/back-end/course/resources/Back_end_workspace/assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/back-end/course/resources/Back_end_workspace/index/sidebars.js"></script>


</body>
</html>