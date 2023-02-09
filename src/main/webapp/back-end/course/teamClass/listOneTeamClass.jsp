<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5" %>
<%@ page import="com.musclebeach.teamClass.model.*" %>
<%
    TeamClassVO teamClassVO = (TeamClassVO) request.getAttribute("teamClassVO"); //TeamClassServlet.java(Concroller), 存入req的empVO物件
%>
<html>
<head>
    <title>課程資料 - listOneTeamClass.jsp</title>

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


<table id="table-1">
    <tr>
        <td>
            <h3>課程資料 - ListOneTeamClass.jsp</h3>
            <h4><a href="<%=request.getContextPath()%>/back-end/teamClass/select_page.jsp"
                   width="100" height="32" border="0">回首頁</a></h4>
        </td>
    </tr>
</table>

<table>
    <tr>
        <th>課程編號</th>
        <th>員工編號</th>
        <th>課程類別</th>
        <th>課程名稱</th>
        <th>課程人數上限</th>
        <th>課程內容</th>
        <th>課程狀態</th>
    </tr>
    <tr>
        <td><%=teamClassVO.getClassID()%>
        </td>
        <td><%=teamClassVO.getEmpID()%>
        </td>
        <td><%=teamClassVO.getTypeID()%>
        </td>
        <td><%=teamClassVO.getClassName()%>
        </td>
        <td><%=teamClassVO.getPeopleMax()%>
        </td>
        <td><%=teamClassVO.getClassContent()%>
        </td>
        <td><%=teamClassVO.getClassStatus()%>
        </td>
    </tr>
</table>

</body>
</html>