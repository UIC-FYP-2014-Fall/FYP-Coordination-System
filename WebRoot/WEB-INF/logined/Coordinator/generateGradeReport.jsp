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
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="${pageContext.request.contextPath }/goUI.do">FYP Coordination System</a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown">
							<a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
								<i class="icon-user"></i> ${coordinatorinfo.name } <i class="caret"></i>
							</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" data-target="#logout" data-toggle="modal" href="">Logout</a></li>
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
			<a href="${pageContext.request.contextPath }/logout.do" class="btn btn-danger">Logout</a>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3" id="sidebar">
				<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
					<li><a href="${pageContext.request.contextPath }/goUI.do"><i
							class="icon-chevron-right"></i> Main</a></li>
					<li><a
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
					<li><a
						href="${pageContext.request.contextPath }/gradeLevel.do?flag=goGradeLevelUi">
							<i class="icon-chevron-right"></i> Grade Level
					</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath }/gradeReport.do">
							<i class="icon-chevron-right"></i> Generate Report
					</a></li>
				</ul>
			</div>
			<!--/span-->
			<div class="span9" id="content">
				<div class="row-fluid">
					<c:if test="${warnInfo=='true'}">
						<div class="alert alert-error alert-block">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Info</h4>
							The grade level is disabled. Cause: lacking the students who have been graded.
						</div>
					</c:if>
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<ul class="breadcrumb">
								<i class="icon-chevron-left hide-sidebar"><a href='#'
									title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
								<i class="icon-chevron-right show-sidebar" style="display:none;"><a
									href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
								<li class="active">Student Grade Report</li>
							</ul>
						</div>
						<c:if test="${validateAssessmentItem=='false' }">
							<div class="alert alert-error ErrorInfo">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								<h4>Error</h4>
								The total percentage of assessment item must be 100%.
							</div>
						</c:if>
						<c:if test="${validateAssessmentItem=='true' }">
						<div class="block-content collapse in">
							<div class="span12">
								<table cellpadding="0" cellspacing="0" border="0"
									class="table table-striped table-bordered" id="gradeTable">
									<thead>
										<tr>
											<th>ID</th>
											<th>Name</th>
											<c:forEach items="${assessItemList }" var="assessItem">
												<th>${assessItem.name }</th>
											</c:forEach>
											<th>Total</th>
											<th>Grade</th>
										</tr>
									</thead>
									<tbody>			
										<c:forEach items="${studentGradeList }" var="studentGrade">
											<td>${studentGrade.student.sid }</td>
											<td>${studentGrade.student.name}</td>
											<c:forEach items="${studentGrade.assessItemGrade }" var="assessItemGrade">
												<td>${assessItemGrade.grade }</td>
											</c:forEach>
											<td>${studentGrade.totalScore }</td>
											<td>${studentGrade.totalLetterGrade }</td>
										</c:forEach>
									</tbody>
								</table>
								<div class="table-toolbar"></div>
							</div>
						</div>
						</c:if>
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
	
	<script src="vendors/datatables/js/jquery.dataTables.min.js"></script>
	<script src="vendors/datatables/js/dataTables.tableTools.min.js"></script>

	<script src="assets/DT_bootstrap.js"></script>
	<script>
	$(document).ready(function() {
		var table = $('#gradeTable').dataTable({
			"sDom": "<'row'<'span5'l><'span7'f>r>t<'row'<'span3'i><'span9'p>>",
			"sPaginationType": "bootstrap",
			"oLanguage": {
				"sLengthMenu": "_MENU_ records per page"
			}
		} );
		var tableTools = new $.fn.dataTable.TableTools( table, {
			
				"sSwfPath":  "../FYP_system/vendors/datatables/swf/copy_csv_xls_pdf.swf",
	           	"aButtons": [
	                "copy",
	                {
						"sExtends": "csv",
						"sTitle": "Student FYP Grade Report"
					},
	                {
						"sExtends": "xls",
						"sTitle": "Student FYP Grade Report",
					},
	                {
	                    "sExtends": "pdf",
						"sTitle": "Student FYP Grade Report",
	                    "sPdfOrientation": "landscape",
	                    "sPdfMessage": ""
	                },
	                "print"
	        	],
				
	    } );
		$( tableTools.fnContainer() ).insertAfter('div.table-toolbar');

	} );
	</script>
</body>
</html>