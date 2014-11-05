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
<link href="vendors/easypiechart/jquery.easy-pie-chart.css"
	rel="stylesheet" media="screen">
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

					<div class="span6">
						<!-- block -->


						<div class="block">
							<div class="navbar navbar-inner block-header">
								<div class="muted pull-left">Topic List</div>
							</div>
							<div class="block-content collapse in">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>#</th>
											<th>Title</th>
											<th>Supervisor</th>
											<th>Group/Individual</th>
											<th>Create Time</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
									<% 
									List<TeaTopic> teaTopic=(List<TeaTopic>)request.getAttribute("teaTopicList");
									System.out.println("get List size "+ teaTopic.size());
									for(int i=0;i<teaTopic.size();i++){
										out.println("<tr>");
										out.println("<td>"+i+"</td>");
										out.println("<td>"+teaTopic.get(i).getTopic().getTitle()+"</td>");
										out.println("<td>"+teaTopic.get(i).getTeacher().getName()+"</td>");
										out.println("<td>"+teaTopic.get(i).getTopic().getIndividual()+"</td>");
										out.println("<td>"+teaTopic.get(i).getTopic().getCredit()+"</td>");
										out.println("<td><form action=\"??\" method=\"post\"><input name=\"????\" type=\"hidden\" value=\"??\"><button class=\"btn btn-primary btn-mini\" onclick=\"location.href='editTopic.html'\">Edit</button></form></td>");
										out.println("</tr>");
									}
									
									%>
									</tbody>
								</table>


							</div>
						</div>



					</div>
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