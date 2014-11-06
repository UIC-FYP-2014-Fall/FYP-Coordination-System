<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.uic.domain.TeaTopic"%>
<%@ page import="com.uic.domain.Teacher"%>
<%@ page import="com.uic.domain.Topic"%>
<%@ page import="java.util.List;"%>

<!DOCTYPE html>
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
				</a> <a class="brand" href="index.html">FYP Coordination System</a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" role="button"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="icon-user"></i> Teacher <i class="caret"></i>

						</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1"
									href="${pageContext.request.contextPath }/logout.do">Logout</a>
								</li>
							</ul></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3" id="sidebar">
				<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
					<li><a href="${pageContext.request.contextPath }/goUI.do"><i
							class="icon-chevron-right"></i> Main</a></li>
					<li><a
						href="${pageContext.request.contextPath }/teacherPageControl.do?flag=uploadTopic"><i
							class="icon-chevron-right"></i> Upload Topic</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath }/teacherPageControl.do?flag=topicList"><i
							class="icon-chevron-right"></i> Topic List</a></li>
					<li><a
						href="${pageContext.request.contextPath }/teacherPageControl.do?flag=chooseObserver"><i
							class="icon-chevron-right"></i> Choose Observer</a></li>
					<li><a
						href="${pageContext.request.contextPath }/teacherPageControl.do?flag=timetable"><i
							class="icon-chevron-right"></i> Timetable</a></li>
					<li><a
						href="${pageContext.request.contextPath }/teacherPageControl.do?flag=changePwd"><i
							class="icon-chevron-right"></i> Change Password</a></li>
				</ul>
			</div>

			<!--/span-->

			<div class="span9" id="content">
				<div class="row-fluid">
					<div class="alert alert-success SuccessInfo">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<h4>Success</h4>
						The operation completed successfully
					</div>
					<div class="alert alert-error ErrorInfo">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<h4>Error</h4>
						The operation failed

					</div>
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Individual Topic List</div>
						</div>
						<div class="block-content collapse in">
							<table class="table table-striped table-bordered"
								id="individualTopic">
								<thead>
									<tr>
										<th>#</th>
										<th>Title</th>
										<th>Supervisor</th>
										<th>Group/Individual</th>
										<th>Credits</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<%
										List<TeaTopic> teaTopic = (List<TeaTopic>) request
												.getAttribute("teaTopicList");
										System.out.println("get List size " + teaTopic.size());
										for (int i = 0; i < teaTopic.size(); i++) {
											out.println("<tr>");
											out.println("<td>" + i + "</td>");
											out.println("<td>" + teaTopic.get(i).getTopic().getTitle()
													+ "</td>");
											out.println("<td>" + teaTopic.get(i).getTeacher().getName()
													+ "</td>");
											out.println("<td>" + teaTopic.get(i).getTopic().getIndividual()
													+ "</td>");
											out.println("<td>" + teaTopic.get(i).getTopic().getCredit()
													+ "</td>");
											out.println("<td><form action=\""
													+ request.getContextPath()
													+ "/teacherPageControl.do?flag=editTopic\" method=\"post\"><input name=\"id\" type=\"hidden\" value=\""
													+ teaTopic.get(i).getId()
													+ "\"><button class=\"btn btn-primary btn-mini\" onclick=\"location.href='editTopic.html'\">Edit</button></form></td>");
											out.println("</tr>");
										}
									%>
								</tbody>
							</table>
							<div class="table-toolbar">
								<a class="btn btn-success"
									herf="${pageContext.request.contextPath }/teacherPageControl.do?flag=uploadTopic">Add
									New <i class="icon-plus icon-white"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Group Topic List</div>
						</div>
						<div class="block-content collapse in">
							<table class="table table-striped table-bordered" id="groupTopic">
								<thead>
									<tr>
										<th>#</th>
										<th>Title</th>
										<th>Supervisor</th>
										<th>Group/Individual</th>
										<th>Credits</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>aaa</td>
										<td>aaa</td>
										<td>Group</td>
										<td>3</td>
										<td><a class="btn btn-primary btn-mini"
											data-toggle="confirmation-singleton" data-placement="left"
											onclick="location.href='${pageContext.request.contextPath }/goEditTopicUi.do'"><i
												class="icon-pencil icon-white"></i> Edit</a> <a
											class="btn btn-danger btn-mini"
											data-toggle="confirmation-singleton" data-placement="left"
											onclick=""><i class="icon-remove icon-white"></i> Delete</a>
										</td>
									</tr>
									<tr>
										<td>2</td>
										<td>bbb</td>
										<td>bbb</td>
										<td>Group</td>
										<td>3</td>
										<td><button class="btn btn-primary btn-mini"
												onclick="location.href='${pageContext.request.contextPath }/goEditTopicUi.do'">
												<i class="icon-pencil icon-white"></i> Edit
											</button>
											<button class="btn btn-danger btn-mini"
												data-confirm="Are you sure you want to delete the topic?"
												href="">
												<i class="icon-remove icon-white"></i> Delete
											</button></td>
									</tr>
									<tr>
										<td>3</td>
										<td>ccc</td>
										<td>ccc</td>
										<td>Group</td>
										<td>6</td>
										<td><button class="btn btn-primary btn-mini"
												onclick="location.href='${pageContext.request.contextPath }/goEditTopicUi.do'">
												<i class="icon-pencil icon-white"></i> Edit
											</button>
											<button class="btn btn-danger btn-mini"
												data-confirm="Are you sure you want to delete the topic?"
												href="">
												<i class="icon-remove icon-white"></i> Delete
											</button></td>
									</tr>
								</tbody>
							</table>
							<div class="table-toolbar">
								<a class="btn btn-success"
									herf="${pageContext.request.contextPath }/teacherPageControl.do?flag=uploadTopic">Add
									New <i class="icon-plus icon-white"></i>
								</a>
							</div>

						</div>
					</div>
					<hr>
				</div>
				<!--/.fluid-container-->
				<script src="vendors/jquery-1.9.1.min.js"></script>
				<script src="bootstrap/js/bootstrap.min.js"></script>
				<script src="assets/scripts.js"></script>
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
