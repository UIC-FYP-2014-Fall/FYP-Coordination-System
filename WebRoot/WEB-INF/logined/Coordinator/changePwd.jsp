<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                	 <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                </a>
				<a class="brand" href="${pageContext.request.contextPath }/goUI.do">FYP Coordination System</a>
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
                        <li><a href="${pageContext.request.contextPath }/goUI.do"><i class="icon-chevron-right"></i> Main</a></li>
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
						<li><a href="${pageContext.request.contextPath }/import.do?flag=goImportUi"><i class="icon-chevron-right"></i>
								Import</a></li>
						<li><a href="${pageContext.request.contextPath }/export.do?flag=goExportUi"><i class="icon-chevron-right"></i>
								Export</a></li>				
						<li class="active"><a href="${pageContext.request.contextPath }/changPwd.do?flag=goPwdUi"><i class="icon-chevron-right"></i>
								Change Password</a></li>
						<li><a href="${pageContext.request.contextPath }/assessItem.do?flag=goAssessItemUi"><i class="icon-chevron-right"></i>
								Assessment Item</a></li>
						<li><a href="${pageContext.request.contextPath }/gradeLevel.do?flag=goGradeLevelUi">
							<i class="icon-chevron-right"></i>
								Grade Level</a></li>
						<li><a href="${pageContext.request.contextPath }/gradeReport.do">
							<i class="icon-chevron-right"></i>
							    Grade Report</a></li>
                    </ul>
			</div>

			<!--/span-->
			<div class="span9" id="content">
				<div class="row-fluid">
				
				<c:if test="${PwdError!=null }">

					<div class="alert alert-error">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<h4>Error</h4>
						The operation failed. ${PwdError }
					</div>
					
					</c:if>

					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Change Password</div>
						</div>
						<div class="block-content collapse in">
							<div class="span12">
								<form class="form-horizontal" action="${pageContext.request.contextPath }/changPwd.do?flag=changePwd" id="form_sample_1"
									method="post">
									<div class="alert alert-error hide">
										<button class="close" data-dismiss="alert"></button>
										You have some form errors. Please check below.
									</div>
									<div class="control-group">
										<label class="control-label">Original Password: <span
											class="required">*</span></label>
										<div class="controls">
											<input type="password" name="oldPwd" class="m-wrap" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">New Password: <span
											class="required">*</span></label>
										<div class="controls">
											<input type="password" name="newPwd" class="m-wrap"
												id="newPwd" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">Confirm Password: <span
											class="required">*</span></label>
										<div class="controls">
											<input name="confirmPwd" type="password" class="m-wrap" />
										</div>
									</div>
									<div class="form-actions">
										<button type="submit" class="btn btn-primary">Submit</button>
										<button type="reset" class="btn">Reset</button>
									</div>

								</form>
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
	<script src="assets/form-validation.js"></script>
	<script type="text/javascript"
		src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>

	<script>
		jQuery(document).ready(function() {
			FormValidation.init();

		});
	</script>
</body>
</html>