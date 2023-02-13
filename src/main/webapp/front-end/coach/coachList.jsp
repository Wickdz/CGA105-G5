<%@page import="com.coachtime.model.CoachTimeService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.emp.model.*"%>
<%@page import="com.coachtime.model.CoachTimeVO"%>

<%
EmpService empSvc = new EmpService();
List<EmpVO> list = empSvc.getCoachByEmp();
pageContext.setAttribute("list", list);
%>

<%
CoachTimeService coachTimeSvc = new CoachTimeService();
List<CoachTimeVO> list2 = coachTimeSvc.getAll();
pageContext.setAttribute("list2", list2);
%>

<%
CoachTimeVO coachTimeVO = (CoachTimeVO) request.getAttribute("coachTimeVO");
%>
<jsp:useBean id="EmpSvc" scope="page" class="com.emp.model.EmpService" />
<html>
<head>
<title>教練清單</title>

<link href="<%=request.getContextPath()%>/front-end/resources/img/favicon.ico" rel="icon">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/64c29c5210.js"
	crossorigin="anonymous"></script>

<link href="<%=request.getContextPath()%>/front-end/resources/lib/flaticon/font/flaticon.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/front-end/resources/css/style.min.css" rel="stylesheet">


<style>
.coachdata {
	border: 0;
	background-color: #003C9D;
	color: #fff;
	border-radius: 10px;
	cursor: pointer;
}

.coachdata:hover {
	color: #003C9D;
	background-color: #fff;
	border: 2px #003C9D solid;
}

table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
	width: 100%;
}

table#table-2 {
	background-color: cyan;
	border: 3px solid black;
	text-align: center;
	width: 100%;
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

* {
        font-family: 微軟正黑體;
    }

    #username,
    #password,
    #fullname,
    #comfirm_password,
    #username2,
    #password2 {
        width: 200px;
        height: 20px;
        margin: 10px;
        color: #df5334;
    }

    h5 {
        margin: 20px;
        color: #a3a2a3;
    }

    h5:hover {
        color: black;
    }

    

    .system_name {
        /*定位對齊*/
        position: relative;
        margin: auto;
        top: 100px;
        text-align: center;
    }

    .submit {
        color: white;
        background: #df5334;
        width: 200px;
        height: 30px;
        margin: 10px;
        padding: 5px;
        border-radius: 5px;
        border: 0px;
    }

    .submit:hover {
        background: #db6937;
    }

    #container2 {
        visibility: hidden;
        /*剛開始消失*/
        height: 350px;
    }


    #copyright {
        text-align: center;
        color: #a3a2a3;
        margin: -200px 0px 0px 0px;
        font-size: 14px;
    }

    input {
        padding: 5px;
        border: none;
        border: solid 1px #ccc;
        border-radius: 5px;
    }
</style>



</head>



<body bgcolor='white'>

	<!-- Navbar Start -->
	 <%@include file="/front-end/common/header.jsp"%>
	<!-- Navbar End -->



	<!-- Team Start -->
	<div class="container pt-5 team">
		<div class="d-flex flex-column text-center mb-5">
			<h4 class="text-primary font-weight-bold">_</h4>
			<h4 class="display-4 font-weight-bold">我們的教練</h4>
		</div>
		<div class="row">

			<c:forEach var="empVO" items="${list}" begin="0">
				<div class="col-lg-3 col-md-6 mb-5">
					<div class="card border-0 bg-secondary text-center text-white">
						<img src="${pageContext.request.contextPath}/back-end/emp/emp.do?action=getImg&empID=${empVO.empID}">
						<div
							class="card-social d-flex align-items-center justify-content-center">
							<!--               <a class="btn btn-outline-light rounded-circle text-center mr-2 px-0"  
                            style="width: 40px; height: 40px;"  href="/CGA105G5/back-end/coachclass/coachdata.html"><i class="fa-solid fa-money-check"></i></a>
                            
           -->
							<FORM METHOD="post" ACTION="/CGA105G5/front-end/coach/coachdata.do">
								<select size="0" name="empID" style="display: none;">
									
										<option value="${empVO.empID}">${empVO.empID}
								</select> 
								
								<input type="hidden" name="action" value="getCoachData_For_Display">
								<input type="submit" class="coachdata" value="查看教練資訊">
							</FORM>

						</div>
						<div class="card-body bg-secondary">
							<h4 class="card-title text-primary">${empVO.empName}</h4>
							<p class="card-text">教練</p>
						</div>
					</div>
				</div>

			</c:forEach>

		</div>
	</div>
	<!-- Team End -->

	 <%@include file="/front-end/common/footer.jsp"%>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/resources/lib/easing/easing.min.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/resources/lib/waypoints/waypoints.min.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/resources/mail/jqBootstrapValidation.min.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/resources/mail/contact.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/resources/js/main.js"></script>



</body>
</html>