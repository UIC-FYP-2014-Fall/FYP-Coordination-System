<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.uic.domain.Topic"%>
<%@ page import="com.uic.domain.ObsTopic"%>
<%@ page import="com.uic.domain.Teacher"%>
<%@ page import="java.util.ArrayList;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
						href="${pageContext.request.contextPath }/uploadFYP.do?flag=uploadTopicUi"><i
							class="icon-chevron-right"></i> Upload Topic</a></li>
					<li><a
						href="${pageContext.request.contextPath }/editFYP.do?flag=topicListUi"><i
							class="icon-chevron-right"></i> Topic List</a></li>
					<li class="active"><a
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

			<!--/span-->

			<div class="span9" id="content">
				<div class="row-fluid">
					<c:if test="${requestScope.setObserverSuccess=='true' }">
						<div class="alert alert-success SuccessInfo">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Success</h4>
							${requestScope.setObserverInfo}
						</div>
						<%
							request.removeAttribute("setObserverSuccess");
								request.removeAttribute("setObserverInfo");
						%>
					</c:if>
					<c:if test="${requestScope.setObserverSuccess=='false' }">
						<div class="alert alert-error">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Success</h4>
							${requestScope.setObserverInfo}
						</div>
						<%
							request.removeAttribute("setObserverSuccess");
								request.removeAttribute("setObserverInfo");
						%>
					</c:if>
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Choose Observer</div>
						</div>
						<div class="block-content collapse in">
							<form class="form-horizontal"
								action="${pageContext.request.contextPath }/setObserver.do?flag=setObserver"
								method="post">
								<legend>Individual Projects</legend>
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>#</th>
											<th>Project Title</th>
											<th>Observer</th>
										</tr>
									</thead>
									<tbody>
										<%
											ArrayList<ObsTopic> indObsTopics = (ArrayList<ObsTopic>) request.getAttribute("indObsTopics");
											ArrayList<String> indObserverList = (ArrayList<String>) request.getAttribute("indObserverList");
											int index=0;
											for (int i = 0; i < indObsTopics.size(); i++) {
												index=i+1;
												out.println("<tr>");
												out.println("<td>" + index + "</td>");
												out.println("<td>" + indObsTopics.get(i).getTopic().getTitle() + "</td>");
												out.println("<td><select name=\"obsTopic\" class=\"chzn-select\">");
												String[] tempObserver1 = indObserverList.get(i).split(";");
												for(int j = 0; j<tempObserver1.length;j++){
													String[] temp=tempObserver1[j].split(",");
													if(indObsTopics.get(i).getObserver().getName().equals(temp[1])){
														out.println("<option value=\"" + indObsTopics.get(i).getTopic().getFid() + "," + temp[0] + "\" selected>" + temp[1] + "</option>");
													}else{
														out.println("<option value=\"" + indObsTopics.get(i).getTopic().getFid() + "," + temp[0] + "\">" + temp[1] + "</option>");
													}
												}
												out.println("</select></td>");
												out.println("</tr>");
											}
										%>
									</tbody>
								</table>

								<legend>Group Projects</legend>
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>#</th>
											<th>Project Title</th>
											<th>Observer</th>
										</tr>
									</thead>
									<tbody>
										<%
											ArrayList<ObsTopic> groObsTopics = (ArrayList<ObsTopic>) request.getAttribute("groObsTopics");
											ArrayList<String> groObserverList = (ArrayList<String>) request.getAttribute("groObserverList");
											index=0;
											for (int i = 0; i < groObsTopics.size(); i++) {
												index=i+1;
												out.println("<tr>");
												out.println("<td>" + index + "</td>");
												out.println("<td>" + groObsTopics.get(i).getTopic().getTitle() + "</td>");
												out.println("<td><select name=\"obsTopic\" class=\"chzn-select\">");
												String[] tempObserver2 = groObserverList.get(i).split(";");
												for(int j = 0; j<tempObserver2.length;j++){
													String[] temp=tempObserver2[j].split(",");
													if(groObsTopics.get(i).getObserver().getName().equals(temp[1])){
														out.println("<option value=\"" + groObsTopics.get(i).getTopic().getFid() + "," + temp[0] + "\" selected>" + temp[1] + "</option>");
													}else{
														out.println("<option value=\"" + groObsTopics.get(i).getTopic().getFid() + "," + temp[0] + "\">" + temp[1] + "</option>");
													}
												}
												
												out.println("</select></td>");
												out.println("</tr>");
											}
										%>
									</tbody>
								</table>
								<div class="form-actions">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form>
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