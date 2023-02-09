<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.musclebeach.article.model.ArticleVO" %>
<%@ page import="com.musclebeach.article.model.ArticleService" %>
<%@ page import="com.musclebeach.common.util.ApplicationContextUtil" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="com.musclebeach.articleType.model.ArticleTypeVO" %>
<%@ page import="com.musclebeach.articleType.model.ArticleTypeService" %>

<%
    ApplicationContext ctx = ApplicationContextUtil.getContext();
    assert ctx != null;
    ArticleService articleService = ctx.getBean(ArticleService.class);
    List<ArticleVO> list = articleService.getAll();
    pageContext.setAttribute("list", list);
    ArticleTypeService articleTypeService = ctx.getBean(ArticleTypeService.class);
    List<ArticleTypeVO> typeList = articleTypeService.getAll();
    pageContext.setAttribute("typeList", typeList);
%>

<html>

<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <style>
        #article_aside::-webkit-scrollbar {
            width: 5px;
        }

        #article_aside::-webkit-scrollbar-thumb {
            border-radius: 100px;
            -webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
            background: gray;

        }
    </style>
</head>

<body>
<!-- ⾴⾸ -->
<header class="p-3 bg-dark fixed-top">
    <div>
        <div class="d-flex flex-wrap justify-content-lg-start ">
            <span class="fs-4 col-lg-2" style="color: white;"><a href="listAllArticle.jsp"
                                                                 style="color: white;text-decoration: none;">Muscle Beach</a></span>
            <form class="col-12 col-lg-4 mb-3 mb-lg-0 me-lg-3" style="display: flex; flex-wrap: wrap;">
                <input type="search" class="form-control form-control-dark" style="width: 340px;"
                       placeholder="Search..."
                       aria-label="Search">
                <button type="submit" class="btn btn-dark text-white" style="margin-left: auto;">送出</button>
            </form>

            <ul class="nav col-12 col-lg-4  me-lg-auto mb-2 justify-content-end mb-md-0">

                <li>
                    <button class="nav-link px-2 btn btn-dark text-white"><a href="addArticle.jsp"
                                                                             style="color: white;text-decoration: none;">發文</a>
                    </button>
                </li>
                <li>
                    <button class="nav-link px-2 btn btn-dark text-white">發文</button>
                </li>
                <li>
                    <button class="nav-link px-2 btn btn-dark text-white">發文</button>
                </li>
                <li>
                    <button class="nav-link px-2 btn btn-dark text-white">發文</button>
                </li>
            </ul>


            <div class="text-end ">
                <button type="button" class="btn btn-outline-light me-2">Login</button>
                <button type="button" class="btn btn-light">Sign-up</button>
            </div>
        </div>
    </div>
</header>
<!-- ⾴⾸ -->


<!-- 側邊欄位 -->
<aside class="d-flex flex-nowrap" style="top:73.333px; position: absolute;">
    <div class="d-flex flex-column flex-shrink-0 p-3 bg-dark"
         style="width: 208px; height: calc(100vh - 73.33px); overflow: auto;" id="article_aside">
        <ul class="nav nav-pills flex-column mb-auto" id="v-pills-tab" role="tablist" aria-orientation="vertical"
            style="text-align: center">
            <li class="nav-item">
                <a class="nav-link active text-white" id="v-pills-home-tab" data-bs-toggle="pill"
                   data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home"
                   aria-selected="true"
                   aria-current="page" style="font-size: 1.5rem">
                    <i class="bi bi-house-door" style="margin-right: 8px"></i>
                    首頁
                </a>
            </li>
            <hr/>
            <c:forEach var="articleTypeVO" items="${typeList}">
                <form class="mb-2" METHOD="post" ACTION="article.do"
                      name="form1">
                    <li class="nav-item">
                        <input type="hidden" name="action" value="getOne_For_Display_BY_TypeID">
                        <input type="hidden" name="typeID" value="${articleTypeVO.typeID}">
                        <button style="margin-left: 32.5px" type="submit" class="nav-link text-white"
                                id="v-pills-employee-tab" data-bs-toggle="pill"
                                data-bs-target="#v-pills-employee" type="button" role="tab"
                                aria-controls="v-pills-employee"
                                aria-selected="false">
                            <i class="bi bi-person" style="color: white; margin: 5px"></i>
                                ${articleTypeVO.typeName}
                        </button>
                    </li>
                </form>
            </c:forEach>
        </ul>


        <div class="tab-content" id="v-pills-tabContent">
</aside>

<!-- 側邊欄位 -->


<!-- 主要 -->
<main
        style="left: 208px; top: 73.333px;right:0 ;background-color: white ;height: calc(100vh - 73.33px); width: calc(100vw-208px); position: absolute; overflow:auto;">
    <div id="article_list" style="width: 800px;position: relative;left: 136px;">
        <%@ include file="page1.file" %>
        <c:forEach var="articleVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
            <c:if test="${articleVO.artStatus == 1}"> <%-- 判斷是否隱藏文章  --%>
                <!-- 按紐一 -->
                <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#article${articleVO.artID}"
                        style="text-align: start;min-width: 800px">
                    <div class="col-md-12">
                        <div class="row g-0 border rounded overflow-hidden flex-md-row mb-2 shadow-sm h-md-250 position-relative">
                            <div class="col p-4 d-flex flex-column position-static">
                                <strong class="d-inline-block mb-2 text-primary">${articleVO.articleTypeVO.typeName}</strong>
                                <h3 class="mb-0">${articleVO.artTitle}</h3>
                                <div class="mb-1 text-muted">${articleVO.artStime}</div>
                                <p class="card-text mb-auto"
                                   style="overflow: hidden;text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;">
                                        ${articleVO.artContent}
                                </p>
                            </div>
                            <div class="col-auto d-none d-lg-block">
                                <svg class="bd-placeholder-img" width="200" height="200"
                                     xmlns="http://www.w3.org/2000/svg" role="img"
                                     aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice"
                                     focusable="false">
                                    <title>Placeholder</title>
                                    <rect width="100%" height="100%" fill="#55595c"></rect>
                                    <!-- 圖片-->
                                    <image xlink:href="https://images.pexels.com/photos/14854648/pexels-photo-14854648.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
                                           width="200" height="200"></image>
                                </svg>
                            </div>
                        </div>
                    </div>
                </button>

                <!-- 按鈕一 -->
                <!-- Modal 文章 -->
                <div class="modal fade" id="article${articleVO.artID}" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">${articleVO.artTitle}</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                    ${articleVO.artContent}
                            </div>
                            <div class="modal-footer">
                                <form class='col-12' METHOD="post"
                                      ACTION="article.do" name="form1"
                                ">
                                <input type="hidden" name="artID" value="${articleVO.artID}">
                                <input type="hidden" name="action" value="getOne_For_Display">
                                <button type="submit" class="col-12 btn btn-secondary" data-bs-dismiss="modal">
                                    查看留言
                                </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
        <%@ include file="page2.file" %>
        <!-- Modal 文章 -->
    </div>
</main>
<!-- 主要 -->

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
        integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
</script>
</body>

</html>