<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.musclebeach.teamClass.model.*" %>

<%
    TeamClassVO teamClassVO = (TeamClassVO) request.getAttribute("teamClassVO");
%>
--<%= teamClassVO == null %> <!-- line 100 -->
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>課程資料修改 - update_teamClass_input.jsp</title>

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
            width: 450px;
            background-color: white;
            margin-top: 1px;
            margin-bottom: 1px;
        }

        table, th, td {
            border: 0px solid #CCCCFF;
        }

        th, td {
            padding: 1px;
        }
    </style>

</head>
<body bgcolor='white'>

<table id="table-1">
    <tr>
        <td>
            <h3>課程資料修改 - update_teamClass_input.jsp</h3>
            <h4><a href="select_page.jsp" width="100" height="32" border="0">回首頁</a></h4>
        </td>
    </tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
    <font style="color:red">請修正以下錯誤:</font>
    <ul>
        <c:forEach var="message" items="${errorMsgs}">
            <li style="color:red">${message}</li>
        </c:forEach>
    </ul>
</c:if>

<FORM METHOD="post" ACTION="teamClass.do" name="form1">
    <table>
        <tr>
            <td>課程編號:<font color=red><b>*</b></font></td>
            <td><%=teamClassVO.getClassID()%>
            </td>
        </tr>
        <tr>
            <td>員工編號:</td>
            <td><input type="TEXT" name="empID" size="45" value="<%=teamClassVO.getEmpID()%>"/></td>
        </tr>
        <tr>
            <td>課程類別:</td>
            <td><input type="TEXT" name="typeID" size="45" value="<%=teamClassVO.getTypeID()%>"/></td>
        </tr>
        <tr>
            <td>課程名稱:</td>
            <td><input type="TEXT" name="className" size="45" value="<%=teamClassVO.getClassName()%>"/></td>
        </tr>
        <tr>
            <td>課程人數上限:</td>
            <td><input type="TEXT" name="peopleMax" size="45" value="<%=teamClassVO.getPeopleMax()%>"/></td>
        </tr>
        <tr>
            <td>課程內容:</td>
            <td><input type="TEXT" name="classContent" size="45" value="<%=teamClassVO.getClassContent()%>"/></td>
        </tr>


        <tr>
            <td>課程狀態:</td>
            <td><input type="TEXT" name="classStatus" size="45" value="<%=teamClassVO.getClassStatus()%>"/></td>
        </tr>

    </table>
    <br>
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="classID" value="<%=teamClassVO.getClassID()%>">
    <input type="submit" value="送出修改"></FORM>
</body>


</html>