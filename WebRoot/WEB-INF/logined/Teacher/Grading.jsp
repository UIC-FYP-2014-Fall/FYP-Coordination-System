<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.uic.domain.Student"%>
<%@ page import="com.uic.domain.StuTopic"%>
<%@ page import="com.uic.domain.StudentGrade"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="no-js">

<head>
<title>FYP Coordination System</title>
<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"
	media="screen">
<link href="assets/styles.css" rel="stylesheet" media="screen">
<link href="assets/DT_bootstrap.css" rel="stylesheet" media="screen">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>

<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="${pageContext.request.contextPath }/goUI.do">FYP
					Coordination System</a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" role="button"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="icon-user"></i> ${teacherinfo.name } <i class="caret"></i></a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" data-target="#logout"
									data-toggle="modal">Logout</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>

	<div class="modal hide fade" id="logout">
		<div class="modal-header">
			<h4>Logout</h4>
		</div>
		<div class="modal-body">Are you sure?</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			<a href="${pageContext.request.contextPath }/logout.do"
				class="btn btn-danger">Logout</a>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3" id="sidebar">
				<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
					<li><a href="${pageContext.request.contextPath }/goUI.do"><i
							class="icon-chevron-right"></i> Main</a></li>
					<li><a
						href="${pageContext.request.contextPath }/uploadFYP.do?flag=uploadTopicUi"><i
							class="icon-chevron-right"></i> Upload Topic</a></li>
					<li><a
						href="${pageContext.request.contextPath }/editFYP.do?flag=topicListUi"><i
							class="icon-chevron-right"></i> Topic List</a></li>
					<li><a
						href="${pageContext.request.contextPath }/setObserver.do?flag=chooseObserverUi"><i
							class="icon-chevron-right"></i> Choose Observer</a></li>
					<li><a
						href="${pageContext.request.contextPath }/timetable.do?flag=timetableUi"><i
							class="icon-chevron-right"></i> Timetable</a></li>
					<li><a
						href="${pageContext.request.contextPath }/changPwd.do?flag=teacherChangePwdUi"><i
							class="icon-chevron-right"></i> Change Password</a></li>
					<li><a
						href="${pageContext.request.contextPath }/printAssessmentTable.do"><i
							class="icon-chevron-right"></i> Print Assessment Table</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath }/grading.do?flag=goGradingUI"><i
							class="icon-chevron-right"></i> Grading</a></li>
				</ul>
			</div>





			<%
				ArrayList<StuTopic> supStuTopics = (ArrayList<StuTopic>) request.getAttribute("superviseStudentTopicList");
				ArrayList<StuTopic> obserStuTopics = (ArrayList<StuTopic>) request.getAttribute("observateStudentTopicList");
				ArrayList<StuTopic> examStuTopics = (ArrayList<StuTopic>) request.getAttribute("examineStudentTopicList");
				HashMap<String,StudentGrade> studentGrade = (HashMap<String,StudentGrade>)request.getAttribute("studentGrade");
			%>
			<!--/span-->
			<div class="span9" id="content">
				<div class="row-fluid">
				
					<%-- <c:if test="${PwdError!=null }">
						<div class="alert alert-error">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Error</h4>
							The operation failed. ${PwdError }
						</div>
						<%
							request.removeAttribute("setObserverSuccess");
								request.removeAttribute("setObserverInfo");
						%>
					</c:if> --%>
					<c:if test="${requestScope.gradeSavedSuccess=='true' }">
						<div class="alert alert-success SuccessInfo">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Success</h4>
							${requestScope.gradeSavedSuccessInfo}
						</div>
						<%
							request.removeAttribute("gradeSavedSuccess");
							request.removeAttribute("gradeSavedSuccessInfo");
						%>
					</c:if>
					
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Grading - Student List</div>
						</div>
						<div class="block-content collapse in">
							<table class="table table-striped table-bordered"
								id="individualTopic">
								<thead>
									<tr>
										<th>Name</th>
										<th>Topic</th>
										<th>Role</th>
										<th>Grade</th>
										<th>Method</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (StuTopic supStuTopic : supStuTopics) {
											out.println("<tr>");
											out.println("<td>" + supStuTopic.getStudent().getName() + "</td>");
											out.println("<td>" + supStuTopic.getTopic().getTitle() + "</td>");
											out.println("<td>Supervisor</td>");
											if(studentGrade.get(supStuTopic.getStudent().getName())==null){
												out.println("<td>&nbsp;</td>");
											}else{
												out.println("<td>"+studentGrade.get(supStuTopic.getStudent().getName()).getTotalScore()+"</td>");
											}
											out.println("<td><button class=\"btn btn-primary btn-mini\" onclick=\"location.href='" + request.getContextPath() + "/grading.do?flag=goEditGradeUI&sid=" + supStuTopic.getStudent().getSid() + "&role=supervisor'\">Edit Grade</button></td>");
											if(studentGrade.get(supStuTopic.getStudent().getName())==null){
												out.println("<td><span class=\"label label-warning\">Incomplete</td>");
											}else{
												if(studentGrade.get(supStuTopic.getStudent().getName()).getSupervisorGrade()==null){
													out.println("<td><span class=\"label label-warning\">Incomplete</td>");
												}else{
													out.println("<td><span class=\"label label-success\">Complete</td>");
												}
											}
											out.println("</tr>");
										}
									%>
									<%
										for (StuTopic obserStuTopic : obserStuTopics) {
											out.println("<tr>");
											out.println("<td>" + obserStuTopic.getStudent().getName() + "</td>");
											out.println("<td>" + obserStuTopic.getTopic().getTitle() + "</td>");
											out.println("<td>Observer</td>");
											if(studentGrade.get(obserStuTopic.getStudent().getName())==null){
												out.println("<td>&nbsp;</td>");
											}else{
												out.println("<td>"+studentGrade.get(obserStuTopic.getStudent().getName()).getTotalScore()+"</td>");
											}
											out.println("<td><button class=\"btn btn-primary btn-mini\" onclick=\"location.href='" + request.getContextPath() + "/grading.do?flag=goEditGradeUI&sid=" + obserStuTopic.getStudent().getSid() + "&role=observer'\">Edit Grade</button></td>");
											if(studentGrade.get(obserStuTopic.getStudent().getName())==null){
												out.println("<td><span class=\"label label-warning\">Incomplete</td>");
											}else{
												if(studentGrade.get(obserStuTopic.getStudent().getName()).getObserverGrade()==null){
													out.println("<td><span class=\"label label-warning\">Incomplete</td>");
												}else{
													out.println("<td><span class=\"label label-success\">Complete</td>");
												}
											}
											out.println("</tr>");
										}
									%>
									<%
										for (StuTopic examStuTopic : examStuTopics) {
											out.println("<tr>");
											out.println("<td>" + examStuTopic.getStudent().getName() + "</td>");
											out.println("<td>" + examStuTopic.getTopic().getTitle() + "</td>");
											out.println("<td>Examiner</td>");
											if(studentGrade.get(examStuTopic.getStudent().getName())==null){
												out.println("<td>&nbsp;</td>");
											}else{
												out.println("<td>"+studentGrade.get(examStuTopic.getStudent().getName()).getTotalScore()+"</td>");
											}
											out.println("<td><button class=\"btn btn-primary btn-mini\" onclick=\"location.href='" + request.getContextPath() + "/grading.do?flag=goEditGradeUI&sid=" + examStuTopic.getStudent().getSid() + "&role=examiner'\">Edit Grade</button></td>");
											if(studentGrade.get(examStuTopic.getStudent().getName())==null){
												out.println("<td><span class=\"label label-warning\">Incomplete</td>");
											}else{
												if(studentGrade.get(examStuTopic.getStudent().getName()).getExaminerGrade()==null){
													out.println("<td><span class=\"label label-warning\">Incomplete</td>");
												}else{
													out.println("<td><span class=\"label label-success\">Complete</td>");
												}
											}
											out.println("</tr>");
										}
									%>

									<!-- <tr>
										<td>Deng Weiyilang</td>
										<td>FYP Coordination System</td>
										<td>Judy</td>
										<td>B+</td>
										<td><button class="btn btn-primary btn-mini"
												onclick="location.href='detailGrading.html'">Edit
												Grade</button></td>
										<td><span class="label label-success">Complete</td>
									</tr>
									<tr>
										<td>Wang Zhenyu</td>
										<td>FYP Coordination System</td>
										<td>Judy</td>
										<td></td>
										<td><button class="btn btn-primary btn-mini"
												onclick="location.href=' '">Edit Grade</button></td>
										<td><span class="label label-warning">Incomplete</td>
									</tr> -->
								</tbody>
							</table>
						</div>
					</div>

				</div>


				<hr>
			</div>
		</div>
	</div>

	<!--/.fluid-container-->
	<script src="vendors/jquery-1.9.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="vendors/datatables/js/jquery.dataTables.min.js"></script>
	<script src="assets/scripts.js"></script>
	<script src="assets/DT_bootstrap.js"></script>
	<script type="text/javascript"
		src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>
	<script src="assets/form-validation.js"></script>
	<script src="js/bootstrap-confirmation.js"></script>
	<script src="js/bootstrap-tooltip.js"></script>
</body>

</html>
