<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.uic.domain.TeaTopic"%>
<%@ page import="com.uic.domain.Teacher"%>
<%@ page import="com.uic.domain.Topic"%>
<%@ page import="java.util.List;"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<li><a
						href="${pageContext.request.contextPath }/goUI.do"><i
							class="icon-chevron-right"></i> Main</a></li>
					<li><a
						href="${pageContext.request.contextPath }/uploadFYP.do?flag=uploadTopicUi"><i
							class="icon-chevron-right"></i> Upload Topic</a></li>
					<li class="active"><a
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

			<!--/span-->

			<div class="span9" id="content">
				<div class="row-fluid">
				<c:if test="${requestScope.ifTopicUploadSuccess=='true' }">
					<div class="alert alert-success SuccessInfo">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<h4>Success</h4>
						${requestScope.operationInfo}
					</div>
					<%
						request.removeAttribute("ifTopicUploadSuccess");
						request.removeAttribute("operationInfo");
					%>
				</c:if>
				<c:if test="${requestScope.ifTopicUploadSuccess=='false' }">
					<div class="alert alert-error">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<h4>Error</h4>
						${requestScope.operationInfo }
					</div>
					<%
						request.removeAttribute("ifTopicUploadSuccess");
						request.removeAttribute("operationInfo");
					%>
				</c:if>
				<c:if test="${requestScope.ifEditSuccess=='true' }">
					<div class="alert alert-success SuccessInfo">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<h4>Success</h4>
						${requestScope.operationInfo }
					</div>
					<%
						request.removeAttribute("ifEditSuccess");
						request.removeAttribute("operationInfo");
					%>
				</c:if>
				<c:if test="${requestScope.ifRemoveSuccess=='true' }">
					<div class="alert alert-success SuccessInfo">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<h4>Success</h4>
						${requestScope.operationInfo }
					</div>
					<%
						request.removeAttribute("ifRemoveSuccess");
						request.removeAttribute("operationInfo");
					%>
				</c:if>
				<c:if test="${requestScope.ifRemoveSuccess=='false' }">
					<div class="alert alert-error">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<h4>Error</h4>
						${requestScope.operationInfo }
					</div>
					<%
						request.removeAttribute("ifRemoveSuccess");
						request.removeAttribute("operationInfo");
					%>
				</c:if>

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
										<c:if test="${requestScope.isUploadTopicDate=='true' }">
										<th></th>
										</c:if>
										<c:if test="${requestScope.isUploadTopicDate=='false' }">
										<th>Students</th>
										</c:if>
									</tr>
								</thead>
								<tbody>
									<%
										String uploadState=(String)request.getAttribute("isUploadTopicDate");
										System.out.println("upload topic state "+uploadState);
										List<TeaTopic> teaTopic = (List<TeaTopic>) request
												.getAttribute("teaTopicList");
										System.out.println("get List size " + teaTopic.size());
										for (int i = 0; i < teaTopic.size(); i++) {
											if (teaTopic.get(i).getTopic().getIndividual()) {
												out.println("<tr>");
												out.println("<td>" + i + "</td>");
												out.println("<td>" + teaTopic.get(i).getTopic().getTitle()
														+ "</td>");
												out.println("<td>" + teaTopic.get(i).getTeacher().getName()
														+ "</td>");
												if(teaTopic.get(i).getTopic().getIndividual()){
													out.println("<td>"
															+ "Individual"
															+ "</td>");
												}else{
													out.println("<td>"
															+ "Group"
															+ "</td>");
												}
												out.println("<td>" + teaTopic.get(i).getTopic().getCredit()
														+ "</td>");
												out.println("<td>");
												if(uploadState!=null){
													if(uploadState.equals("true")){
														out.println("<form action=\""
																+ request.getContextPath()
																+ "/editFYP.do?flag=editTopicUi\" method=\"post\"><input name=\"eid\" type=\"hidden\" value=\""
																+ teaTopic.get(i).getTopic().getFid()
																+ "\"><button type=\"submit\" class=\"btn btn-primary btn-mini\">Edit</button></form>");
														out.println("<form action=\""
																+ request.getContextPath()
																+ "/editFYP.do?flag=removeTopic\" method=\"post\"><input name=\"rid\" type=\"hidden\" value=\""
																+ teaTopic.get(i).getTopic().getFid()
																+ "\"><button type=\"submit\" class=\"btn btn btn-danger btn-mini\">delete</button></form>");
													}else{
														out.println("Student who choose this project");
													}
												}
												out.println("</td>");
												out.println("</tr>");
											} else {
												//do nothing
											}
										}
									%>
								</tbody>
							</table>
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
									<%
										for (int i = 0; i < teaTopic.size(); i++) {
											if (!teaTopic.get(i).getTopic().getIndividual()) {
												out.println("<tr>");
												out.println("<td>" + i + "</td>");
												out.println("<td>" + teaTopic.get(i).getTopic().getTitle()
														+ "</td>");
												out.println("<td>" + teaTopic.get(i).getTeacher().getName()
														+ "</td>");
												if(teaTopic.get(i).getTopic().getIndividual()){
													out.println("<td>"
															+ "Individual"
															+ "</td>");
												}else{
													out.println("<td>"
															+ "Group"
															+ "</td>");
												}
												out.println("<td>" + teaTopic.get(i).getTopic().getCredit()
														+ "</td>");
												out.println("<td>");
												if(uploadState!=null){
													if(uploadState.equals("true")){
														out.println("<form action=\""
																+ request.getContextPath()
																+ "/editFYP.do?flag=editTopicUi\" method=\"post\"><input name=\"eid\" type=\"hidden\" value=\""
																+ teaTopic.get(i).getTopic().getFid()
																+ "\"><button type=\"submit\"class=\"btn btn-primary btn-mini\">Edit</button></form>");
														out.println("<form action=\""
																+ request.getContextPath()
																+ "/editFYP.do?flag=removeTopic\" method=\"post\"><input name=\"rid\" type=\"hidden\" value=\""
																+ teaTopic.get(i).getTopic().getFid()
																+ "\"><button type=\"submit\"class=\"btn btn btn-danger btn-mini\">delete</button></form>");
													}else{
														out.println("Student who choose this project");
													}
												}
												out.println("<td>");
												out.println("</tr>");
											} else {
												//do nothing
											}
										}
									%>
								</tbody>
							</table>
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
