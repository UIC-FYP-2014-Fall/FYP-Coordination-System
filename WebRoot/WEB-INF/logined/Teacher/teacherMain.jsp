<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
<%@ page import="com.uic.domain.ObsTopic"%>
<%@ page import="com.uic.domain.Stuexaminer" %>
<%@ page import="java.util.List;"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>FYP Coordination System</title>
<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"
	media="screen">

<link href="assets/styles.css" rel="stylesheet" media="screen">
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
				</a> <a class="brand" href="index.html">FYP Coordination System</a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" role="button"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="icon-user"></i> ${teacherinfo.name } <i class="caret"></i>

						</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" data-target="#logout"
									data-toggle="modal" href="">Logout</a></li>
							</ul></li>
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
					<li class="active"><a
						href="${pageContext.request.contextPath }/goUI.do"><i
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
				</ul>
			</div>

	

			<div class="span9" id="content">
				<div class="row-fluid">

					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Schedule</div>
						</div>
						<div class="block-content collapse in">
							<table class="table table-striped table-bordered" id="groupTopic">
								<thead>
									<tr>
										<th>State</th>
										<th>Time</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Upload/Edit Topic</td>
										<td>${requestScope.uploadTopicTime}</td>
									</tr>

									<tr>
										<td>View Student's choice & Choose Observer</td>
										<td>${requestScope.chooseTopicTime}</td>
									</tr>
									<tr>
										<td>Select Available Time</td>
										<td>${requestScope.choosePreTime}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					
					
					<c:if test="${requestScope.showObserver=='true' }">
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Observation</div>
						</div>
						<div class="block-content collapse in">
							<table class="table table-striped table-bordered" id="groupTopic">
								<thead>
									<tr>
										<th>Project</th>
									</tr>
								</thead>
								<tbody>
								<%
									List<ObsTopic> obsTopicList = (List<ObsTopic>)request.getAttribute("obsTopicList");
									for(ObsTopic obsTopic:obsTopicList){
										out.println("<tr><td>"+obsTopic.getTopic().getTitle()+"</td></tr>");
									}
								%>
								</tbody>
							</table>
						</div>
					</div>
					</c:if>
					<c:if test="${requestScope.showExaminer=='true' }">
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Examination</div>
						</div>
						<div class="block-content collapse in">
							<table class="table table-striped table-bordered" id="groupTopic">
								<thead>
									<tr>
										<th>Student</th>
									</tr>
								</thead>
								<tbody>
									<%
										List<Stuexaminer> stuExaminerList = (List<Stuexaminer>)request.getAttribute("stuExaminerList");
										for(Stuexaminer stuExaminer:stuExaminerList){
											out.println("<tr><td>"+stuExaminer.getStudent().getSid()+" "+stuExaminer.getStudent().getName()+"</td></tr>");
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
					</c:if>
					
					
				</div>
			</div>
		</div>
		<hr>
	</div>
	<!--/.fluid-container-->
	<script src="vendors/jquery-1.9.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>

	<script src="assets/scripts.js"></script>

</body>

</html>