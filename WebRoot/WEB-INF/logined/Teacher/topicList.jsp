<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ page import="com.uic.domain.TeaTopic"%>
<%@ page import="java.util.ArrayList"%>
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
				</a> <a class="brand" href="${pageContext.request.contextPath }/goUI.do">FYP Coordination System</a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" role="button"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="icon-user"></i> ${teacherinfo.name } <i class="caret"></i></a>
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
					<li><a href="${pageContext.request.contextPath }/goUI.do"><i
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
					<li><a href="${pageContext.request.contextPath }/printAssessmentTable.do"><i
							class="icon-chevron-right"></i> Print Assessment Table</a></li>
					<li><a href="${pageContext.request.contextPath }/grading.do?flag=goGradingUI"><i class="icon-chevron-right"></i>
							Grading</a></li>
				</ul>
			</div>

			<!--/span-->

			<div class="span9" id="content">

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
				<c:if test="${requestScope.noUpLoadTime=='true' }">
					<div class="alert alert-error">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<h4>Error</h4>
						Coordinator has not set the upload
						time.${requestScope.noUpLoadTime }
					</div>
				</c:if>
				<c:if test="${requestScope.noUpLoadTime=='false' }">
					<div class="row-fluid">
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
												<th>Operation</th>
											</c:if>
											<c:if test="${requestScope.isUploadTopicDate=='after' }">
												<th>Students</th>
											</c:if>
										</tr>
									</thead>

									<tbody>
										<%
											String uploadState = (String) request.getAttribute("isUploadTopicDate");
											ArrayList<TeaTopic> indTeaTopic = (ArrayList<TeaTopic>) request.getAttribute("indTeaTopic");
											ArrayList<String> indSupervisor = (ArrayList<String>) request.getAttribute("indSupervisor");
											ArrayList<String> indStudent = (ArrayList<String>) request.getAttribute("indStudent");
											
											int index = 0;
											for (int i = 0; i < indTeaTopic.size(); i++) {
												if (indTeaTopic.get(i).getTopic().getIndividual()) {
													index = i+1;
													out.println("<tr>");
													out.println("<td>" + index + "</td>");
													out.println("<td>" + indTeaTopic.get(i).getTopic().getTitle() + "</td>");
													out.println("<td>" + indSupervisor.get(i) + "</td>");
													if (indTeaTopic.get(i).getTopic().getIndividual()) {
														out.println("<td>" + "Individual" + "</td>");
													} else {
														out.println("<td>" + "Group" + "</td>");
													}
													out.println("<td>" + indTeaTopic.get(i).getTopic().getCredit() + "</td>");
													if (uploadState != null) {
														
														if (uploadState.equals("true")) {
															out.println("<td>");
															out.println("<a class=\"btn btn-primary btn-mini\" href=\"" + request.getContextPath() + "/editFYP.do?flag=editTopicUi&eid=" + indTeaTopic.get(i).getTopic().getFid() + "\"><i class=\"icon-pencil icon-white\"></i> Edit</a>");
															/* out.println("<a class=\"btn btn-danger btn-mini\" data-confirm=\"Are you sure to delete the topic?\" href=\"" + request.getContextPath() + "/editFYP.do?flag=removeTopic&rid=" + indTeaTopic.get(i).getTopic().getFid() + "\"><i class=\"icon-remove icon-white\"></i> Delete</a>"); */
															out.println("<a class=\"btn btn-danger btn-mini\" data-target=\"#confirm"+indTeaTopic.get(i).getTopic().getFid()+"\" data-toggle=\"modal\"> <i class=\"icon-remove icon-white\"></i> Delete</a>");
															out.println("<div class=\"modal hide fade\" id=\"confirm"+indTeaTopic.get(i).getTopic().getFid()+"\"><div class=\"modal-header\"><h4>Delete</h4></div><div class=\"modal-body\">Are you sure?</div><div class=\"modal-footer\"><button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Cancel</button><a href=\""+request.getContextPath() + "/editFYP.do?flag=removeTopic&rid=" + indTeaTopic.get(i).getTopic().getFid() +"\" class=\"btn btn-danger\">Delete</a></div></div>");
															out.println("</td>");
														} else {
															if(uploadState.equals("before")){
																//out.println("None");
															}else{
																out.println("<td>");
																out.println(indStudent.get(i));
																out.println("</td>");
															}
														}
														
													}
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
								<table class="table table-striped table-bordered"
									id="groupTopic">
									<thead>
										<tr>
											<th>#</th>
											<th>Title</th>
											<th>Supervisor</th>
											<th>Group/Individual</th>
											<th>Credits</th>
											<c:if test="${requestScope.isUploadTopicDate=='true' }">
												<th>Operation</th>
											</c:if>
											<c:if test="${requestScope.isUploadTopicDate=='after' }">
												<th>Students</th>
											</c:if>
										</tr>
									</thead>
									<tbody>
										<%
												ArrayList<TeaTopic> groTeaTopic = (ArrayList<TeaTopic>) request.getAttribute("groTeaTopic");
												ArrayList<String> groSupervisor = (ArrayList<String>) request.getAttribute("groSupervisor");
												ArrayList<String> groStudent = (ArrayList<String>) request.getAttribute("groStudent");
												index=0;
												for (int i = 0; i < groTeaTopic.size(); i++) {
													if (!groTeaTopic.get(i).getTopic().getIndividual()) {
														index=i+1;
														out.println("<tr>");
														out.println("<td>" + index + "</td>");
														out.println("<td>" + groTeaTopic.get(i).getTopic().getTitle() + "</td>");
														out.println("<td>" + groSupervisor.get(i) + "</td>");
														if (groTeaTopic.get(i).getTopic().getIndividual()) {
															out.println("<td>" + "Individual" + "</td>");
														} else {
															out.println("<td>" + "Group" + "</td>");
														}
														out.println("<td>" + groTeaTopic.get(i).getTopic().getCredit() + "</td>");
														if (uploadState != null) {
															
															if (uploadState.equals("true")) {
																out.println("<td>");
																out.println("<a class=\"btn btn-primary btn-mini\" href=\"" + request.getContextPath() + "/editFYP.do?flag=editTopicUi&eid=" + groTeaTopic.get(i).getTopic().getFid() + "\"><i class=\"icon-pencil icon-white\"></i> Edit</a>");
																//out.println("<a class=\"btn btn-danger btn-mini\" data-confirm=\"Are you sure to delete the topic?\" href=\"" + request.getContextPath() + "/editFYP.do?flag=removeTopic&rid=" + groTeaTopic.get(i).getTopic().getFid() + "\"><i class=\"icon-remove icon-white\"></i> Delete</a>");
																out.println("<a class=\"btn btn-danger btn-mini\" data-target=\"#confirm"+groTeaTopic.get(i).getTopic().getFid()+"\" data-toggle=\"modal\"> <i class=\"icon-remove icon-white\"></i> Delete</a>");
																out.println("<div class=\"modal hide fade\" id=\"confirm"+groTeaTopic.get(i).getTopic().getFid()+"\"><div class=\"modal-header\"><h4>Delete</h4></div><div class=\"modal-body\">Are you sure?</div><div class=\"modal-footer\"><button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Cancel</button><a href=\""+request.getContextPath() + "/editFYP.do?flag=removeTopic&rid=" + groTeaTopic.get(i).getTopic().getFid() +"\" class=\"btn btn-danger\">Delete</a></div></div>");
																out.println("<td>");
															} else {
																if(uploadState.equals("before")){
																	
																	//out.println("Avaliable");
																}else{
																	out.println("<td>");
																	out.println(groStudent.get(i));
																	out.println("<td>");
																}
															}
															
														}
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
					</div>
				</c:if>

				
			</div>
		</div>
		<hr>
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
