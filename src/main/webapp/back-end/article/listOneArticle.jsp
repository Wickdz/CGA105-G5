<%@ page import="com.musclebeach.article.model.ArticleVO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
    ArticleVO articleVO = (ArticleVO) request.getAttribute("articleVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
    <title>員工資料 - listOneEmp.jsp</title>

    <style>
        table#table-1 {
            background-color: #CCCCFF;
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
    </style>

</head>
<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
    <tr>
        <td>
            <h3>員工資料 - ListOneEmp.jsp</h3>
            <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
        </td>
    </tr>
</table>

<table>
    <tr>
        <th>文章編號</th>
        <th>會員編號</th>
        <th>文章類別編號</th>
        <th>文章標題</th>
        <th>文章內容</th>
        <th>發表時間</th>
        <th>最後編輯時間</th>
        <th>文章狀態</th>
    </tr>
    <tr>
        <td>${articleVO.artID}</td>
        <td>${articleVO.memID}</td>
        <td>${articleVO.typeID}</td>
        <td>${articleVO.artTitle}</td>
        <td>${articleVO.artContent}</td>
        <td>${articleVO.artStime}</td>
        <td>${articleVO.artLtime}</td>
        <td>${articleVO.artStatus==1?'顯示':'隱藏'}</td>
    </tr>
</table>

</body>
</html>