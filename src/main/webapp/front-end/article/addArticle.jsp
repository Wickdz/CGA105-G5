<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.musclebeach.article.model.ArticleVO" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="com.musclebeach.common.util.ApplicationContextUtil" %>
<%@ page import="com.musclebeach.articleType.model.ArticleTypeService" %>
<%@ page import="com.musclebeach.articleType.model.ArticleTypeVO" %>


<%
    ArticleVO articleVO = (ArticleVO) request.getAttribute("articleVO");
    ApplicationContext ctx = ApplicationContextUtil.getContext();
    assert ctx != null;
    ArticleTypeService articleTypeService = ctx.getBean(ArticleTypeService.class);
    List<ArticleTypeVO> list = articleTypeService.getAll();
    pageContext.setAttribute("list", list);
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

<body class="bg-dark overflow-hidden">
<!-- ⾴⾸ -->
<header class="p-3 bg-dark fixed-top">
    <div>
        <div class="d-flex flex-wrap justify-content-lg-start">
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

<FORM METHOD="post" ACTION="article.do" name="form1"
      enctype="multipart/form-data">
    <!-- 主要 -->
    <main
            style="left: 100px;top: 80px;right: 100px; ;height: calc(100vh - 73.33px); width: calc(100vw-208px); position: absolute; overflow:auto;">
        <div class="p-5 mb-4 bg-light rounded-3">
            <div style="float: left;">
                <div class="btn-group">
                    <select name="typeID" class="btn btn-secondary text-white" style="text-align:left;">
                        <option>點此選擇發文類別</option>
                        <c:forEach var="articleTypeVO" items="${list}">
                            <option value="${articleTypeVO.typeID}"${(articleVO.typeID==articleTypeVO.typeID)? 'selected':'' }>${articleTypeVO.typeName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div>
                    <p class="text-dark fs-4 mt-3" style="float: left;">發文者</p>
                </div>
            </div>
            <%-- 錯誤表列 --%>
            <div style="float: right;">
                <c:if test="${not empty errorMsgs}">
                    <font style="color:red">請修正以下錯誤:</font>
                    <ul>
                        <c:forEach var="message" items="${errorMsgs}">
                            <li style="color:red">${message}</li>
                        </c:forEach>
                    </ul>
                </c:if>
            </div>
            <%-- 錯誤表列 --%>
            <div class="mb-2">
                <input name="artTitle" value="<%= (articleVO==null)? "" : articleVO.getArtTitle()%>"
                       class="form-control" id="exampleFormControlInput1" placeholder="標題" style="font-size: larger;">
            </div>
            <div class="mb-3">
                <textarea name="artContent" class="form-control" id="exampleFormControlTextarea1" rows="6"
                          placeholder="敘述"
                          aria-label=".form-control-lg example"><%= (articleVO == null) ? "" : articleVO.getArtContent()%></textarea>
            </div>
            <div class="container-fluid py-4">
                <button type="button" class="btn btn-outline-light" style="float: left;">
                    <label class="atm_9j_tlke0l atm_9s_1txwivl atm_f_1h6ojuz l8leymb" for="editor-image">
                        <svg viewBox="0 0 24 24" class="jsx-952c5c783df17c88 atm_mj_glywfm atm_tl_glywfm sgb9dab"
                             focusable="false" width="20" height="20" role="img" aria-hidden="true"
                             style="fill: var(--color-text-default);">
                            <path d="M19 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2zM16.5 5.5a2 2 0 0 0-2 2 2 2 0 0 0 2 2 2 2 0 0 0 2-2 2 2 0 0 0-2-2zm2.5 13v-3l-2.37-2.77a1 1 0 0 0-1.38-.13L13.5 14 9.7 9.78a1 1 0 0 0-1.45-.04L5 13v5.5a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5z">
                            </path>
                        </svg>
                        <input name="artImg" type="file" accept="image/jpeg,image/png,image/gif,image/webp,image/tiff"
                               id="editor-image" class="atm_9s_glywfm i1k8vwk9" value="" multiple>
                    </label>
                </button>
                <button class="btn btn-primary btn-md" type="button" style="float: right;" data-bs-toggle="modal"
                        data-bs-target="#exampleModal">下一步
                </button>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body text-body fs-4">
                                確認送出
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" name="memID" value="4">
                                <input type="hidden" name="action" value="insertwithImg">
                                <button type="button" class="btn btn-secondary text-white" data-bs-dismiss="modal">否
                                </button>
                                <button type="submit" class="btn btn-primary">是</button>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="btn btn-light btn-md" type="button" onclick="history.back()" style="float: right;">取消
                </button>
            </div>
        </div>
    </main>
</FORM>
>
<!-- 主要 -->


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
        integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
</script>
</body>

</html>