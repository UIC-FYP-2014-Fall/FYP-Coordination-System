<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js">
<head>
	<title>FYP Coordination System</title>
	<!-- Bootstrap -->
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
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
				<a class="brand" href="${pageContext.request.contextPath }/goStudentMain.do">FYP Coordination System</a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown">
							<a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i>
								${studentinfo.name } <i class="caret"></i>

							</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1"
									href="${pageContext.request.contextPath }/changPwd.do?flag=goPwdUi">Settings </a>
								</li>
								<li class="divider"></li>
								<li><a tabindex="-1" data-target="#logout"
									data-toggle="modal" href="">Logout</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<!-- Start logout -->
	<div class="modal hide fade" id="logout">
		<div class="modal-header">
			<h4>Logout</h4>
		</div>
		<div class="modal-body">Are you sure?</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			<a href="${pageContext.request.contextPath }/logout.do" class="btn btn-danger">Logout</a>
		</div>
	</div>
	<!-- end logout -->
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3" id="sidebar">
				<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
					<li class="active">
						<a href="${pageContext.request.contextPath }/goStudentMain.do">
							<i class="icon-chevron-right"></i>
							Main
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/chooseTopic.do?flag=goChooseTopic">
							<i class="icon-chevron-right"></i>
							Choose Topic
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/chooseExaminer.do?flag=goChooseExaminer">
							<i class="icon-chevron-right"></i>
							Choose Examiner
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/choosePretime.do?flag=goChoosePretime">
							<i class="icon-chevron-right"></i>
							Choose Presentation Time
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/changPwd.do?flag=goPwdUi">
							<i class="icon-chevron-right"></i>
							Settings 
						</a>
					</li>
				</ul>
			</div>
			<!--/span-->

			<div class="span9" id="content">
				<div class="row-fluid">

					<!-- block -->
					<c:choose>
						<c:when test="${timeType==0 }">
							<div class="alert alert-error alert-block">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								<h4 class="alert-heading">Sorry!</h4>
								The FYP Coordination System has not open yet. Please come back later.
							</div>
						</c:when>
						<c:when test="${timeType==8 }">
							<div class="alert alert-success alert-block">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								<h4 class="alert-heading">Success!</h4>
								Operation complete! You can view your FYP information.
							</div>
						</c:when>
						<c:otherwise>
							<div class="alert alert-info alert-block">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								<h4 class="alert-heading">News!</h4>
								<c:if test="${timeType==1 }">
									The FYP topics are still in preparation.You can view all the FYP topics information from <strong> ${end } </strong>.
								</c:if>
								<c:if test="${timeType==2 }">
									You can view all the FYP topics information now! Open time for Select Topic period:<strong> ${start } </strong>to<strong> ${end } </strong>.
								</c:if>
								<c:if test="${timeType==3 }">
									You can select your topic now! Open time for Select Topic period:<strong> ${start } </strong>to<strong> ${end } </strong>.
								</c:if>
								<c:if test="${timeType==4 }">Open time for Choose Examiner period: <strong>${start }</strong> to<strong> ${end }</strong>.</c:if>
								<c:if test="${timeType==5 }">
									You can choose your examiner now! Open time for Choose Examiner period: <strong>${start }</strong> to<strong> ${end }</strong>.
								</c:if>
								<c:if test="${timeType==6 }">
									Open time for Choose Presentation Time period:<strong> ${start }</strong> to <strong>${end }</strong>.
								</c:if>
								<c:if test="${timeType==7 }">
									You can choose your Presentation Time now! Open time for Choose Presentation Time period:<strong> ${start } </strong>to<strong> ${end } </strong>.
								</c:if>
								<c:if test="${timeType==9 }">
									You can view all topics information now! Open time for Select Topic period: To be continued.
								</c:if>
								<c:if test="${timeType==10 }">Open time for Choose Examiner period: To be continued.</c:if>
								<c:if test="${timeType==11 }">Open time for Choose Presentation Time: To be continued.</c:if>
							</div>
						</c:otherwise>
					</c:choose>

					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">INFORMATION</div>
						</div>
						<div class="block-content collapse in">
							<c:if test="${PhoneState=='error' }">
								<div class="alert alert-error alert-block">					
									<h4 class="alert-heading">Important!</h4>
									Please update your mobile phone number to ensure that it is available! Please click<a href="${pageContext.request.contextPath }/changPwd.do?flag=goPwdUi"> <strong>here</strong> </a>to update.
								</div>
							</c:if>
							<c:choose>
								<c:when test="${timeType==0||timeType==1||timeType==2||timeType==9 }">
									<c:if test="${timeType==0 }">
										<div class="alert alert-error alert-block">
											<h4 class="alert-heading">Sorry!</h4>
											The FYP Coordination System has not open yet. Please come back later.									
										</div>
									</c:if>
									<c:if test="${timeType==1||timeType==9 }">
										<div class="alert alert-error alert-block">
											<h4 class="alert-heading">Sorry!</h4>
											The final year project topics are still in preparation. You can view topic on <stong>${end }</stong>. Please come back later.
										</div>
									</c:if>
									<c:if test="${timeType==2 }">
										<div class="alert alert-block">
											<h4 class="alert-heading">Info!</h4>
											Please pay attention to select topic time will start from <strong>${start }</strong> to <strong>${end }</strong>. Click <a href="${pageContext.request.contextPath }/chooseTopic.do?flag=goChooseTopic">here</a> to view topic.
										</div>
									</c:if>
								</c:when>

								<c:otherwise>

									<c:if test="${timeType==3 && chooseTopic=='false' }">
										<div class="alert alert-info alert-block">
											<h4 class="alert-heading">News!</h4>
											You can select your FYP topic now! Please click<a href="${pageContext.request.contextPath }/chooseTopic.do?flag=goChooseTopic"> <strong>here</strong> </a>to select.
										</div>
									</c:if>

									<c:if test="${chooseTopic=='true' }">
										<table class="table table-striped table-bordered">
											<tbody>
												<tr>
													<td>
														<strong>Project Name</strong>
													</td>
													<td>${stuTopic }</td>
												</tr>
												<tr>
													<td>
														<strong>Supervisor</strong>
													</td>
													<td>${stuSupervisor }</td>
												</tr>
												<tr>
													<td>
														<strong>Observer</strong>
													</td>
													<td>
														<c:if test="${chooseObserver=='true' }">${stuObserver }</c:if>
														<c:if test="${chooseObserver=='false' }">
															<span class="label label-info">To Be Determined</span>
														</c:if>
														
													</td>
												</tr>
												<tr>
													<td>
														<strong>Examiner</strong>
													</td>
													<td>
														<c:if test="${chooseExaminer=='true' }">${Examiner }</c:if>
														<c:if test="${chooseExaminer=='false' }">
															<c:if test="${timeType==4 }">
																<span class="label label-info">Open time for Choose Examiner period: ${start } to ${end }</span>
															</c:if>
															<c:if test="${timeType==10 }">
																<span class="label">Start Later</span>
															</c:if>
															<c:if test="${timeType==5 }">
																<a href="${pageContext.request.contextPath }/chooseExaminer.do?flag=goChooseExaminer">
																	<button class="btn btn-primary btn-mini">Choose</button>
																</a>
															</c:if>
														</c:if>
													</td>
												</tr>
												<tr>
													<td>
														<strong>Presentation time</strong>
													</td>
													<td>
														<c:if test="${choosePretime=='true' }">${Pretime }</c:if>
														<c:if test="${choosePretime=='false' }">
															<c:if test="${timeType==6 }">
																<span class="label label-info">
																	Choose presentation time will start from ${start } to ${end }
																</span>
															</c:if>
															<c:if test="${timeType==11 }">
																<span class="label">To be announced. Please come back later.</span>
															</c:if>
															<c:if test="${timeType==7 }">
																				
																	<a href="${pageContext.request.contextPath }/choosePretime.do?flag=goChoosePretime">
																		<button class="btn btn-primary btn-mini">Choose</button>
																	</a>
																
															</c:if>
														</c:if>
													</td>
												</tr>
											</tbody>
										</table>
									</c:if>

								</c:otherwise>
							</c:choose>
						</div>
					</div>

				</div>
			</div>
		</div>
		<hr></div>
	<!--/.fluid-container-->
	<script src="vendors/jquery-1.9.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/scripts.js"></script>

</body>
</html>