<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.uic.domain.Topic"%>
<%@ page import="com.uic.domain.Student"%>
<%@ page import="com.uic.domain.StuTopic"%>
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
				</a> <a class="brand"
					href="${pageContext.request.contextPath }/goStudentMain.do">FYP
					Coordination System</a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" role="button"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="icon-user"></i> ${studentinfo.name } <i class="caret"></i>

						</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1"
									href="${pageContext.request.contextPath }/changPwd.do?flag=goPwdUi">Settings</a>
								</li>
								<li class="divider"></li>
								<li><a tabindex="-1" data-target="#logout"
									data-toggle="modal" href="">Logout</a></li>
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
					<li><a
						href="${pageContext.request.contextPath }/goStudentMain.do"><i
							class="icon-chevron-right"></i> Main</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath }/chooseTopic.do?flag=goChooseTopic"><i
							class="icon-chevron-right"></i> Choose Topic</a></li>
					<li><a
						href="${pageContext.request.contextPath }/chooseExaminer.do?flag=goChooseExaminer"><i
							class="icon-chevron-right"></i> Choose Examiner</a></li>
					<li><a
						href="${pageContext.request.contextPath }/choosePretime.do?flag=goChoosePretime"><i
							class="icon-chevron-right"></i> Choose Presentation Time</a></li>
					<li><a
						href="${pageContext.request.contextPath }/changPwd.do?flag=goPwdUi"><i
							class="icon-chevron-right"></i> Settings</a></li>
				</ul>
			</div>
			<div class="span9" id="content">
				<div class="row-fluid">
					
					<c:if test="${requestScope.FYPHasBeenSelected=='true' }">
						<div class="alert alert-error">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Error</h4>
							The topic is selected by other. Please select another topic.
						</div>
						<%
							request.removeAttribute("FYPHasBeenSelected");
						%>
					</c:if>
					<c:if test="${requestScope.chooseGroupTopicSuccess=='true' }">
						<div class="alert alert-success SuccessInfo">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Success</h4>
							Choose group topic success.
						</div>
						<%
							request.removeAttribute("chooseGroupTopicSuccess");
						%>
					</c:if>
					<c:if test="${requestScope.dropTopicSuccess=='true' }">
						<div class="alert alert-success SuccessInfo">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Success</h4>
							Drop topic success.
						</div>
						<%
							request.removeAttribute("dropTopicSuccess");
						%>
					</c:if>
					<c:if test="${requestScope.dropTopicSuccess=='false' }">
						<div class="alert alert-error">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Error</h4>
							Drop Topic failed.
						</div>
						<%
							request.removeAttribute("dropTopicSuccess");
						%>
					</c:if>
					<c:if test="${requestScope.chooseIndividualTopicSuccess=='true' }">
						<div class="alert alert-success SuccessInfo">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Success</h4>
							Choose topic success.
						</div>
						<%
							request.removeAttribute("chooseIndividualTopicSuccess");
						%>
					</c:if>
					<c:if test="${requestScope.SupervisorQuotaIsFull=='true' }">
						<div class="alert alert-error">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Error</h4>
							Supervisor quota is full, Please select other topic.
						</div>
						<%
							request.removeAttribute("SupervisorQuotaIsFull");
						%>
					</c:if>
					<c:if test="${requestScope.chooseTopicStart=='false' }">
						<div class="alert alert-error">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Note:</h4>
							The choose topic time start from ${requestScope.timetablePeriod}.
						</div>
						<%
							request.removeAttribute("timetablePeriod");
						%>
					</c:if>
					<c:if test="${requestScope.coordinatorHasNotSetOpenTime=='false' }">
						<div class="alert alert-error">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Note:</h4>
							Coordinator does not set the choose topic time.
						</div>
						<%
							request.removeAttribute("coordinatorHasNotSetOpenTime");
						%>
					</c:if>
					<c:if test="${requestScope.state=='viewTopic' }">
						<div class="alert alert-info alert-block">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4 class="alert-heading">Info!</h4>
							You could view Topic now.
						</div>
					</c:if>
					<c:if test="${requestScope.state=='chooseTopic' }">
						<div class="alert alert-info alert-block">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4 class="alert-heading">Info!</h4>
							You could choose Topic now.
						</div>
					</c:if>
					<!-- block -->
					<c:if test="${requestScope.chooseTopicStart=='true' }">
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Choose Topic</div>
						</div>
						<div class="block-content collapse in">
							<c:if test="${requestScope.ifStudentHasChoosedTopic=='true' }">
								<table cellpadding="0" cellspacing="0" border="0"
									class="table table-striped table-bordered" id="topicTable">
									<thead>
										<tr>
											<th>#</th>
											<th>Title</th>
											<th>Supervisor</th>
											<th>Group/Individual</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<%
												ArrayList<String> supervisorList = (ArrayList<String>) request.getAttribute("supervisorList");
												String afterChooseTopic = (String)request.getAttribute("afterChooseTopic");
												StuTopic stuTopic = (StuTopic) request.getAttribute("stuTopic");
												out.println("<tr>");
												out.println("<td>#</td>");
												out.println("<td><a href=\"#topic1\" data-toggle=\"modal\">" + stuTopic.getTopic().getTitle() + "</a></td>");
												out.println("<td>" + supervisorList.get(0) + "</td>");
												if (stuTopic.getTopic().getIndividual()) {
													out.println("<td>Individual</td>");
												} else {
													out.println("<td>Group</td>");
												}
												if(afterChooseTopic.equals("true")){
													out.println("<td></td>");
												}else{
													out.println("<td><form action=\"" + request.getContextPath() + "/chooseTopic.do?flag=dropTopic\" method=\"post\">");
													out.println("<input type=\"hidden\" name=\"topicId\" value=\"" + stuTopic.getTopic().getFid() + "\"/>");
													//out.println("<input type=\"submit\" value=\"Drop\" class=\"btn btn-primary btn-mini\" data-toggle=\"confirmation-singleton\" data-placement=\"left\"/>");
													out.println("<a class=\"btn btn-danger btn-mini\" data-target=\"#confirm\" data-toggle=\"modal\"> <i class=\"icon-remove icon-white\"></i> Drop</a>");
													out.println("<div class=\"modal hide fade\" id=\"confirm\"><div class=\"modal-header\"><h4>Drop</h4></div>");
													out.println("<div class=\"modal-body\">Are you sure?</div>");
													out.println("<div class=\"modal-footer\"><button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Cancel</button><a href=\""+request.getContextPath() + "/chooseTopic.do?flag=dropTopic&topicId="+stuTopic.getTopic().getFid()+"\" class=\"btn btn-danger\">Drop</a></div></div>");
													out.println("</form></td>");
													
												}
												out.println("</tr>");
										%>
									</tbody>
								</table>

							</c:if>


							<c:if test="${requestScope.ifStudentHasChoosedTopic=='false' }">
								<table cellpadding="0" cellspacing="0" border="0"
									class="table table-striped table-bordered" id="topicTable">
									<thead>
										<tr>
											<th>#</th>
											<th>Title</th>
											<th>Supervisor</th>
											<th>Group/Individual</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<%
											ArrayList<Topic> topicList = (ArrayList<Topic>) request.getAttribute("allTopicList");
											ArrayList<String> supervisorList = (ArrayList<String>) request.getAttribute("supervisorList");
											String state = (String)request.getAttribute("state");
											System.out.println("topicList size " + topicList.size());
											for (int i = 0; i < topicList.size(); i++) {
												int index = i + 1;
												out.println("<tr>");
												out.println("<td>" + index + "</td>");
												out.println("<td><a href=\"#topic" + index + "\" data-toggle=\"modal\">" + topicList.get(i).getTitle() + "</a></td>");
												out.println("<td>" + supervisorList.get(i) + "</td>");
												if (topicList.get(i).getIndividual()) {
													out.println("<td>Individual</td>");
												} else {
													out.println("<td>Group</td>");
												}
												
												if(state.equals("viewTopic")){
													out.println("<td></td>");
												}else{
													if (topicList.get(i).getIsfull()) {
														out.println("<td><span class=\"label label-important\">Full</span></td>");
													} else {
														if (topicList.get(i).getIndividual()) {
															out.println("<td><form action=\"" + request.getContextPath() + "/chooseTopic.do?flag=selectIndividualTopic\" method=\"post\">");
															out.println("<input type=\"hidden\" name=\"topicId\" value=\"" + topicList.get(i).getFid() + "\"/>");
															out.println("<input type=\"submit\" value=\"Select\" class=\"btn btn-primary btn-mini\" data-toggle=\"confirmation-singleton\" data-placement=\"left\"/>");
															out.println("</form></td>");
														} else {
															out.println("<td><form action=\"" + request.getContextPath() + "/chooseTopic.do?flag=goChooseGroupTopicUi\" method=\"post\">");
															out.println("<input type=\"hidden\" name=\"topicId\" value=\"" + topicList.get(i).getFid() + "\"/>");
															out.println("<input type=\"submit\" value=\"Select\" class=\"btn btn-primary btn-mini\" data-toggle=\"confirmation-singleton\" data-placement=\"left\"/>");
															out.println("</form></td>");
														}
													}
												}
												out.println("</tr>");
											}
										%>
									</tbody>
								</table>
							</c:if>
							
						</div>
					</div>
					</c:if>
				</div>
			</div>
		</div>
		
		<c:if test="${requestScope.chooseTopicStart=='true' }">
		<c:if test="${requestScope.ifStudentHasChoosedTopic=='false' }">
			<%
				ArrayList<Topic> topicList2 = (ArrayList<Topic>) request.getAttribute("allTopicList");
					ArrayList<String> supervisorList2 = (ArrayList<String>) request.getAttribute("supervisorList");
					for (int i = 0; i < topicList2.size(); i++) {
						int index = i + 1;
						out.println("<div class=\"modal hide fade\" id=\"topic" + index + "\">");
						out.println("<div class=\"modal-header\">");
						out.println("<a href=\"#\" class=\"close\" data-dismiss=\"modal\"><i class=\"icon-remove\"></i></a>");
						out.println("<h4>" + topicList2.get(i).getTitle() + "</h4>");
						out.println("</div>");
						out.println("<div class=\"modal-body\">");
						out.println("<form class=\"form-horizontal\">");
						out.println("<table class=\"table\">");
						out.println("<thead>");
						out.println("<tr>");
						out.println("<th>Title</th>");
						out.println("<td>" + topicList2.get(i).getTitle() + "</td>");
						out.println("</tr>");
						out.println("</thead>");
						out.println("<tbody>");
						out.println("<tr>");
						out.println("<td><strong>Supervisor</strong></td>");
						out.println("<td>" + supervisorList2.get(i) + "</td>");
						out.println("<tr><td><strong>Credits</strong></td><td>" + topicList2.get(i).getCredit() + "</td></tr>");
						out.println("<tr><td><strong>No. of Students</strong></td><td>" + topicList2.get(i).getNumOfStudent() + "</td></tr><tr>");
						if (topicList2.get(i).getIndividual()) {
							out.println("<tr><td><strong>Individual/Group</strong></td><td>Individual</td></tr>");
						} else {
							out.println("<tr><td><strong>Individual/Group</strong></td><td>Group</td></tr>");
						}
						out.println("<tr><td><strong>Description</strong></td><td>" + topicList2.get(i).getDescription() + "</td></tr>");
						out.println("</tbody></table></form></div><div class=\"modal-footer\"></div></div>");
					}
			%>
		</c:if>
		<c:if test="${requestScope.ifStudentHasChoosedTopic=='true' }">
			<%
				ArrayList<String> supervisorList = (ArrayList<String>) request.getAttribute("supervisorList");
					StuTopic stuTopic = (StuTopic) request.getAttribute("stuTopic");
					out.println("<div class=\"modal hide fade\" id=\"topic1\">");
					out.println("<div class=\"modal-header\">");
					out.println("<a href=\"#\" class=\"close\" data-dismiss=\"modal\"><i class=\"icon-remove\"></i></a>");
					out.println("<h4>" + stuTopic.getTopic().getTitle() + "</h4>");
					out.println("</div>");
					out.println("<div class=\"modal-body\">");
					out.println("<form class=\"form-horizontal\">");
					out.println("<table class=\"table\">");
					out.println("<thead>");
					out.println("<tr>");
					out.println("<th>Title</th>");
					out.println("<td>" + stuTopic.getTopic().getTitle() + "</td>");
					out.println("</tr>");
					out.println("</thead>");
					out.println("<tbody>");
					out.println("<tr>");
					out.println("<td><strong>Supervisor</strong></td>");
					out.println("<td>" + supervisorList.get(0) + "</td>");
					out.println("<tr><td><strong>Credits</strong></td><td>" + stuTopic.getTopic().getCredit() + "</td></tr>");
					out.println("<tr><td><strong>No. of Students</strong></td><td>" + stuTopic.getTopic().getNumOfStudent() + "</td></tr><tr>");
					if (stuTopic.getTopic().getIndividual()) {
						out.println("<tr><td><strong>Individual/Group</strong></td><td>Individual</td></tr>");
					} else {
						out.println("<tr><td><strong>Individual/Group</strong></td><td>Group</td></tr>");
					}
					out.println("<tr><td><strong>Description</strong></td><td>" + stuTopic.getTopic().getDescription() + "</td></tr>");
					out.println("</tbody></table></form></div><div class=\"modal-footer\"></div></div>");
			%>
		</c:if>
		</c:if>
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


</body>
</html>
