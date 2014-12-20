<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                	 <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                </a>
				<a class="brand" href="${pageContext.request.contextPath }/goUI.do">FYP
					Coordination System</a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" role="button"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="icon-user"></i> ${coordinatorinfo.name } <i class="caret"></i>

						</a>
							<ul class="dropdown-menu">								
								<li>
									<a tabindex="-1" data-target="#logout" data-toggle="modal" href="">Logout</a>
								</li>
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
			<div class="modal-body">
				Are you sure?
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<a href="${pageContext.request.contextPath }/logout.do" class="btn btn-danger">Logout</a>
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
						href="${pageContext.request.contextPath }/goManageAccountUi.do?flag=goUi"><i
							class="icon-chevron-right"></i> Manage Account</a></li>
					<li><a href="${pageContext.request.contextPath }/quota.do?flag=goUi"><i class="icon-chevron-right"></i>
							Set Quota</a></li>
					<li><a href="${pageContext.request.contextPath }/openTime.do?flag=goUi"><i class="icon-chevron-right"></i>
							Set Open Time</a></li>
					<li><a href="${pageContext.request.contextPath }/setWorkload.do?flag=goUi"><i class="icon-chevron-right"></i>
							Set Workload</a></li>
					<li><a href="${pageContext.request.contextPath }/preTime.do?flag=goPreTimeUi"><i class="icon-chevron-right"></i>
							Set Pre Time</a></li>
					<li><a href="${pageContext.request.contextPath }/export.do?flag=goExportUi"><i class="icon-chevron-right"></i>
							Export</a></li>				
					<li><a href="${pageContext.request.contextPath }/changPwd.do?flag=goPwdUi"><i class="icon-chevron-right"></i>
							Change Password</a></li>
				</ul>
			</div>

			<div class="span9" id="content">
				<div class="row-fluid">
					
						<!-- block -->
						<div class="block">
							<div class="navbar navbar-inner block-header">
								<div class="muted pull-left">News</div>
							</div>

							<div class="block-content collapse in">
								<c:choose>
								<c:when test="${UploadTopicsDateTimeState=='true' }">
									<div class="alert alert-success alert-block">
										<h4 class="alert-heading">Upload Topics for Teachers Time</h4>
										<p>From ${UTstartDateTime } to ${UTendDateTime }</p>											
									</div>
									<c:choose>
									<c:when test="${ChooseTopicDateTimeState=='true' }">
										<div class="alert alert-success alert-block">
											<h4 class="alert-heading">Choose Topic for Students Time</h4>
											<p>From ${CTstartDateTime } to ${CTendDateTime }</p>											
										</div>
										<c:choose>
										<c:when test="${ChooseExaminersDateTimeState=='true' }">
											<div class="alert alert-success alert-block">
												<h4 class="alert-heading">Choose Examiners for Students Time</h4>
												<p>From ${CEstartDateTime } to ${CEendDateTime }</p>											
											</div>
											<c:choose>
											<c:when test="${PreDateTimeState=='true' }">
												<div class="alert alert-success alert-block">
													<h4 class="alert-heading">Presentation Time</h4>
													<p>From ${PstartDateTime } to ${PendDateTime }</p>											
												</div>
											</c:when>
											<c:otherwise>
												<div class="alert alert-block">
													<h4 class="alert-heading">Warning!</h4>
													<p>Presentation time is not completed. Please check <a href="${pageContext.request.contextPath }/preTime.do?flag=goPreTimeUi">here</a> to set up.</p>											
												</div>
											</c:otherwise>
											</c:choose>
										
										</c:when>
										<c:otherwise>
											<div class="alert alert-block">
												<h4 class="alert-heading">Warning!</h4>
												<p>Choose examiners for students time is not completed. Please check <a href="${pageContext.request.contextPath }/openTime.do?flag=goUi">here</a> to set up.</p>											
											</div>
										</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<div class="alert alert-block">
											<h4 class="alert-heading">Warning!</h4>
											<p>Choose topic for students time is not completed. Please check <a href="${pageContext.request.contextPath }/openTime.do?flag=goUi">here</a> to set up.</p>											
										</div>
									</c:otherwise>
									</c:choose>
									
								</c:when>
								
								<c:otherwise>
									<div class="alert alert-block">
										<h4 class="alert-heading">Warning!</h4>
										<p>Upload topics for teachers time is not completed. Please check <a href="${pageContext.request.contextPath }/openTime.do?flag=goUi">here</a> to set up.</p>											
									</div>
								</c:otherwise>
								</c:choose>
								
								<c:forEach items="${messageList }" var="message">
									<c:if test="${message.type=='info' }">
										<div class="alert alert-info alert-block">
											<h4 class="alert-heading">Info!</h4>
											<p>${message.content }</p>
											<span class=" pull-right"><small>${message.date }</small></span>
										</div>
									</c:if>
									<c:if test="${message.type=='warning' }">
										<div class="alert alert-block">
											<h4 class="alert-heading">Warning!</h4>
											<p>${message.content }</p>
											<span class=" pull-right"><small>${message.date }</small></span>
										</div>
									</c:if>
									<c:if test="${message.type=='success' }">
										<div class="alert alert-success alert-block">
											<h4 class="alert-heading">Success!</h4>
											<p>${message.content }</p>
											<span class=" pull-right"><small>${message.date }</small></span>
										</div>
									</c:if>
									<c:if test="${message.type=='error' }">
										<div class="alert alert-error alert-block">
											<h4 class="alert-heading">Error!</h4>
											<p>${message.content }</p>
											<span class=" pull-right"><small>${message.date }</small></span>
										</div>
									</c:if>

								</c:forEach>
								<ul class="pager">
									<c:if test="${pageNow>1 }">
										<li class="previous"><a
											href="${pageContext.request.contextPath }/goUI.do?pageNow=${pageNow-1 }">Prev</a></li>
									</c:if>
									<c:if test="${pageNow<pageCount }">
										<li class="next"><a
											href="${pageContext.request.contextPath }/goUI.do?pageNow=${pageNow+1 }">Next</a></li>
									</c:if>
								</ul>
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
	<script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
	<script src="assets/scripts.js"></script>
</body>
</html>
