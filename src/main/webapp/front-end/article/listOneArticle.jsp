<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.musclebeach.article.model.ArticleVO" %>
<%@ page import="com.musclebeach.common.util.ApplicationContextUtil" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="com.musclebeach.articleType.model.ArticleTypeService" %>
<%@ page import="com.musclebeach.articleType.model.ArticleTypeVO" %>

<%
    ArticleVO articleVO = (ArticleVO) request.getAttribute("articleVO");
    ApplicationContext ctx = ApplicationContextUtil.getContext();
    assert ctx != null;
    ArticleTypeService articleTypeService = ctx.getBean(ArticleTypeService.class);
    List<ArticleTypeVO> typeList = articleTypeService.getAll();
    pageContext.setAttribute("typeList", typeList);
%>

<html>

<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS v5.2.1 -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
            crossorigin="anonymous">

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
            <form class="col-12 col-lg-4 mb-3 mb-lg-0 me-lg-3"
                  style="display: flex; flex-wrap: wrap;">
                <input type="search" class="form-control form-control-dark"
                       style="width: 340px;" placeholder="Search..." aria-label="Search">
                <button type="submit" class="btn btn-dark text-white"
                        style="margin-left: auto;">送出
                </button>
            </form>

            <ul
                    class="nav col-12 col-lg-4  me-lg-auto mb-2 justify-content-end mb-md-0">

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
        style="left: 208px; top: 73.333px; right: 0; background-color: white; height: calc(100vh - 73.33px); width: calc(100vw-208px); position: absolute; overflow: auto;">
    <div id="article_list"
         style="width: 800px; position: relative; left: 136px;">


        <div class="col-md-12">
            <div class="card shadow-sm mb-4 mt-2"
                 style="max-width: 650px; position: relative;">
                <div class="card-body d-flex flex-column position-static">
                    <article class="blog-post mt-3">
                        <%-- 檢舉錯誤表列 --%>
                        <div style="float: right; margin-top: 50px">
                            <c:if test="${not empty errorMsgs1}">
                                <font style="color:red">請修正以下錯誤:</font>
                                <ul>
                                    <c:forEach var="message" items="${errorMsgs1}">
                                        <li style="color:red">${message}</li>
                                    </c:forEach>
                                </ul>
                            </c:if>
                        </div>
                        <%-- 檢舉錯誤表列 --%>
                        <strong class="text-dark" style="font-size: 14px;">${articleVO.memID}</strong>
                        <h1 class="blog-post-title">${articleVO.artTitle}</h1>
                        <p class="blog-post-meta">${articleVO.artStime}</p>
                        <p>${articleVO.artContent}</p>
                    </article>
                </div>

                <div class="btn-group"
                     style="position: absolute; right: 20px; top: 20px;">
                    <!-- 檢舉按鈕 Button trigger modal -->
                    <button type="button" class="btn btn-light btn-sm" data-bs-toggle="modal"
                            data-bs-target="#ArticleReport">
                        檢舉
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="ArticleReport" tabindex="-1" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <FORM METHOD="post"
                                  ACTION="articleReport.do"
                                  name="form1">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">檢舉原因</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <textarea required name="reportContent" value="" rows="4"
                                                  class="col-12"></textarea>
                                    </div>
                                    <div class="modal-footer">
                                        <input type="hidden" name="memID" value="4">
                                        <input type="hidden" name="artID" value="${articleVO.artID}">
                                        <input type="hidden" name="action" value="insert">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消
                                        </button>
                                        <button type="submit" class="btn btn-primary">確認</button>
                                    </div>
                                </div>
                            </FORM>
                        </div>
                    </div>
                    <!-- 檢舉按鈕 -->
                </div>
            </div>
        </div>

        <!-- 留言 -->
        <div>
            <div class="card shadow-sm mb-4"
                 style="max-width: 650px; position: relative;">
                <div class="card-header">留言區</div>
                <div class="card-body">
                    <blockquote class="blockquote mb-0">
                        <!-- 留言 -->
                        <c:forEach var="articleMessageVO" items="${articleVO.articleMessageVO}">
                            <div style="max-width: 650px; position: relative;">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="d-flex flex-column">
                                        <strong class="text-dark"
                                                style="font-size: 14px;">${articleMessageVO.memID}</strong>
                                        <span class="text-muted small"
                                              style="font-size: 12px;">${articleMessageVO.msgStime}</span>
                                    </div>
                                </div>
                                <p style="font-size: 1rem;">${articleMessageVO.msgContent}</p>
                                <div class="btn-group"
                                     style="position: absolute; right: 5px; top: 0px;">
                                    <button class="btn btn-light btn-sm">檢舉</button>
                                </div>
                            </div>

                            <!-- 留言 -->
                            <hr>
                        </c:forEach>


                    </blockquote>
                </div>
            </div>
        </div>
        <!-- 留言 -->
        <!-- 新增留言 -->
        <!-- 第一種 -->
        <!-- 			<div id="expandable-div" -->
        <!-- 				style="max-width: 650px; display: none;; position: sticky; bottom: 0px; background-color: white; border: rgba(0, 0, 0, 0.2) 1px solid;"> -->
        <!-- 				<div class=" mb-3 mt-3" style="margin-left: 20px;"> -->
        <!-- 					<input type="text" id="exampleFormControlTextarea1" class="col-9" -->
        <!-- 						placeholder="留言"></input> -->
        <!-- 				</div> -->
        <!-- 			</div> -->
        <!-- 第一種 -->
        <!-- 第二種 -->
        <div id="expandable-div"
             style="height: 230px; max-width: 650px; position: sticky; bottom: 0px; background-color: white; border: rgba(0, 0, 0, 0.2) 1px solid;">
            <div style="margin-top: 20px;">
                <%-- 留言錯誤表列 --%>
                <div style="text-align: center;  display: inline-block; position:absolute; right: 50%; transform: translate(50%, 0);">
                    <c:if test="${not empty errorMsgs2}">
                        <ul style=" list-style: none ;display: inline-block;">
                            <c:forEach var="message" items="${errorMsgs2}">
                                <li style="color:red ;display: inline-block;">${message}</li>
                            </c:forEach>
                        </ul>
                    </c:if>
                </div>
                <%-- 留言錯誤表列 --%>
                <FORM METHOD="post" ACTION="articleMessage.do"
                      name="form1">
                    <div class=" mb-3 mt-3" style="margin-left: 50px; margin-right: 50px;">
                        <textarea required name="msgContent" value="" class="form-control"
                                  id="exampleFormControlTextarea1" rows="4" placeholder="敘述"
                                  aria-label=".form-control-lg example"></textarea>
                    </div>
                    <div style="position: absolute; right: 10px;">
                        <input type="hidden" name="memID" value="4">
                        <input type="hidden" name="artID" value="${articleVO.artID}">
                        <input type="hidden" name="action" value="insert">
                        <button type="button" class="btn btn-light">取消</button>
                        <button type="submit" class="btn btn-dark">送出</button>
                    </div>
                </FORM>
            </div>
        </div>

        <!-- 第二種 -->

        <!-- 新增留言 -->
    </div>
</main>
<!-- 主要 -->


<script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous">

</script>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
        integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
        crossorigin="anonymous">

</script>
</body>

</html>