<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>FYP Coordination System</title>
<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"
	media="screen">
<link href="assets/styles.css" rel="stylesheet" media="screen">
<link href="assets/DT_bootstrap.css" rel="stylesheet" media="screen">
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
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
				</a> <a class="brand" href="${pageContext.request.contextPath }/goUI.do">FYP
					Coordination System</a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" role="button"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="icon-user"></i> ${coordinatorinfo.name } <i class="caret"></i>

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
					<li><a href="${pageContext.request.contextPath }/goUI.do"><i
							class="icon-chevron-right"></i> Main</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath }/goManageAccountUi.do?flag=goUi"><i
							class="icon-chevron-right"></i> Manage Account</a></li>
					<li><a
						href="${pageContext.request.contextPath }/quota.do?flag=goUi"><i
							class="icon-chevron-right"></i> Set Quota</a></li>
					<li><a
						href="${pageContext.request.contextPath }/openTime.do?flag=goUi"><i
							class="icon-chevron-right"></i> Set Open Time</a></li>
					<li><a
						href="${pageContext.request.contextPath }/setWorkload.do?flag=goUi"><i
							class="icon-chevron-right"></i> Set Workload</a></li>
					<li><a
						href="${pageContext.request.contextPath }/preTime.do?flag=goPreTimeUi"><i
							class="icon-chevron-right"></i> Set Pre Time</a></li>
					<li><a
						href="${pageContext.request.contextPath }/import.do?flag=goImportUi"><i
							class="icon-chevron-right"></i> Import</a></li>
					<li><a
						href="${pageContext.request.contextPath }/export.do?flag=goExportUi"><i
							class="icon-chevron-right"></i> Export</a></li>
					<li><a
						href="${pageContext.request.contextPath }/changPwd.do?flag=goPwdUi"><i
							class="icon-chevron-right"></i> Change Password</a></li>
					<li><a
						href="${pageContext.request.contextPath }/assessItem.do?flag=goAssessItemUi">
							<i class="icon-chevron-right"></i> Assessment Item
					</a></li>
				</ul>
			</div>

			<!--/span-->
			<div class="span9" id="content">
				<div class="row-fluid">
					<c:if test="${requestScope.TeacherOperation=='success'}">
						<div class="alert alert-success SuccessInfo">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Success</h4>
							The operation completed successfully
						</div>
					</c:if>
					<c:if test="${requestScope.TeacherOperation=='error'}">
						<div class="alert alert-error ErrorInfo">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Error</h4>
							The operation failed! ${ErrorInfo}
						</div>
					</c:if>

					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Teachers' Account</div>
						</div>
						<div class="block-content collapse in">
							<div class="span12">
								<table cellpadding="0" cellspacing="0" border="0"
									class="table table-striped table-bordered" id="teacherTable">
									<thead>
										<tr>
											<th>Name</th>
											<th>Account</th>
											<th>Phone</th>
											<th>E-mail</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${teacherList }" var="teacher">
											<tr>
												<td>${teacher.name }</td>
												<td>${teacher.account }</td>
												<td>${teacher.phone }</td>
												<td>${teacher.email }</td>
												<td><a class="btn btn-primary btn-mini"
													data-confirm="Are you sure you reset the teacher '${teacher.name }' password?"
													href="${pageContext.request.contextPath }/goManageAccountUi.do?flag=reset&tid=${teacher.id}"><i
														class="icon-pencil icon-white"></i> Reset</a> <a
													class="btn btn-danger btn-mini"
													data-confirm="Are you sure you want to delete the teacher '${teacher.name }'?"
													href="${pageContext.request.contextPath }/goManageAccountUi.do?flag=delete&tid=${teacher.id}"><i
														class="icon-remove icon-white"></i> Delete</a></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
								<div class="table-toolbar">
									<a href="#add" data-toggle="modal">
										<button class="btn btn-success">
											Add New <i class="icon-plus icon-white"></i>
										</button>
									</a>
								</div>
								<div class="modal hide fade" id="add">
									<div class="modal-header">
										<a href="#" class="close" data-dismiss="modal"><i class="icon-remove"></i></a>
										<h4>Create A New Account</h4>
									</div>
									<form class="form-horizontal" method="post"
										action="${pageContext.request.contextPath }/goManageAccountUi.do?flag=add"
										id="form_sample_1">
										<div class="modal-body">
											<div class="alert alert-error hide">
												<button class="close" data-dismiss="alert"></button>
												You have some form errors. Please check below.
											</div>
											<div class="control-group">
												<label class="control-label">Name<span
													class="required">*</span></label>
												<div class="controls">
													<input type="text" name="name" data-required="1"
														class="m-wrap">
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Account<span
													class="required">*</span></label>
												<div class="controls">
													<input type="text" name="account" class="m-wrap">
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Phone<span
													class="required">*</span></label>
												<div class="controls">
													<input type="text" name="phone" class="m-wrap">
												</div>
											</div>
											<div class="control-group">
												<label class="control-label">Email<span
													class="required">*</span></label>
												<div class="controls">
													<input name="email" type="text" class="m-wrap">
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary">Submit</button>
											<button type="reset" class="btn">Reset</button>
										</div>
									</form>
								</div>

							</div>
						<!-- <a href="addAccount.html">
              <button class="btn btn-success">Add New <i class="icon-plus icon-white"></i></button>
              </a> -->
					</div>
				</div>
			</div>
			<!-- /block -->
		</div>
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

	<script type="text/javascript">
		jQuery(document).ready(function() {
			FormValidation.init();
		});
		
		$(document).ready(function() {
			$('a[data-confirm]').click(function(ev) {
				var href = $(this).attr('href');
				if (!$('#dataConfirmModal').length) {
					$('body').append('<div id="dataConfirmModal" class="modal" role="dialog" aria-labelledby="dataConfirmLabel" aria-hidden="true"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><h3 id="dataConfirmLabel">Please Confirm</h3></div><div class="modal-body"></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button><a class="btn btn-danger" id="dataConfirmOK">OK</a></div></div>');}
					$('#dataConfirmModal').find('.modal-body').text($(this).attr('data-confirm'));
					$('#dataConfirmOK').attr('href', href);
					$('#dataConfirmModal').modal({show : true});
					return false;
				});
		});
		$(".alert-success").alert();
		window.setTimeout(function() {
			$(".SuccessInfo").alert('close');
		}, 5000);
		$(".alert-error").alert();
		window.setTimeout(function() {
			$(".ErrorInfo").alert('close');
		}, 5000);
	</script>

</body>
</html>