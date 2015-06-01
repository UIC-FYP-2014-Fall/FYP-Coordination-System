<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.uic.domain.Student"%>
<%@ page import="com.uic.domain.AssessItem"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="no-js">

<head>
<title>FYP Coordination System</title>
<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"
	media="screen">

<link href="assets/styles.css" rel="stylesheet" media="screen">

<link href="assets/DT_bootstrap.css" rel=	"stylesheet" media="screen">
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
						<li class="dropdown">
                        	<a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i> ${teacherinfo.name } <i class="caret"></i></a>
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
					<li><a
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
					<li class="active"><a href="${pageContext.request.contextPath }/printAssessmentTable.do"><i
							class="icon-chevron-right"></i> Print Assessment Table</a></li>
					<li><a href="${pageContext.request.contextPath }/grading.do?flag=goGradingUI"><i class="icon-chevron-right"></i>
							Grading</a></li>
				</ul>
			</div>
			<%
				ArrayList<Student> supStu = (ArrayList<Student>)request.getAttribute("superviseStudentList");
				ArrayList<Student> obserStu = (ArrayList<Student>)request.getAttribute("observateStudentList");
				ArrayList<Student> examStu = (ArrayList<Student>)request.getAttribute("examineStudentList");
				ArrayList<AssessItem> assessItemList = (ArrayList<AssessItem>)request.getAttribute("assessItemslist");
			%>
			<div class="span9" id="content">
				<div class="row-fluid">
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Print Assessment Table</div>
						</div>
						<div class="block-content collapse in">
							
							<div class="span12">
								<table cellpadding="0" cellspacing="0" border="0"
									class="table table-striped table-bordered" id="preTable">
									<thead>
										<tr>
											<th>Name</th>
											<th>Role</th>
											<%
											for(AssessItem assessItem:assessItemList){
												out.println("<th>"+assessItem.getName()+"</th>");
												System.out.println(assessItem.getSupervisor());
											}
											
											%>
										</tr>
									</thead>
									<tbody>
										<%
											for(Student s:supStu){
												out.println("<tr>");
												out.println("<td>"+s.getName()+"</td>");
												out.println("<td>Supervisor</td>");
												for(AssessItem assessItem:assessItemList){
													if(assessItem.getSupervisor().equals("1")){
														out.println("<td>&nbsp</td>");
													}else{
														out.println("<td>-</td>");
													}
												}
												out.println("</tr>");
											}
									
											for(Student s:obserStu){
												out.println("<tr>");
												out.println("<td>"+s.getName()+"</td>");
												out.println("<td>Observer</td>");
												for(AssessItem assessItem:assessItemList){
													if(assessItem.getObserver().equals("1")){
														out.println("<td>&nbsp</td>");
													}else{
														out.println("<td>-</td>");
													}
												}
												out.println("</tr>");
											}
									
											for(Student s:examStu){
												out.println("<tr>");
												out.println("<td>"+s.getName()+"</td>");
												out.println("<td>Examiner</td>");
												for(AssessItem assessItem:assessItemList){
													if(assessItem.getExaminer().equals("1")){
														out.println("<td>&nbsp</td>");
													}else{
														out.println("<td>-</td>");
													}
												}
												out.println("</tr>");
											}
										%>
									</tbody>
								</table>
								<div class="table-toolbar"></div>
								
								<!-- <div class="form-actions">
									<button type="submit" class="btn btn-primary">
										<i class="icon-print icon-white"></i> Print
									</button>
								</div> -->
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
	<script src="vendors/datatables/js/jquery.dataTables.min.js"></script>
	<script src="vendors/datatables/js/dataTables.tableTools.min.js"></script>
	<script src="assets/DT_bootstrap.js"></script>
	<script>
	$(document).ready(function() {
		var table = $('#preTable').dataTable({
			"sDom": "<'row'<'span5'l><'span7'f>r>t<'row'<'span3'i><'span9'p>>",
			"sPaginationType": "bootstrap",
			"oLanguage": {
				"sLengthMenu": "_MENU_ records per page"
			},
			"bStateSave": true,
			"aoColumnDefs": [{
				"aTargets": [0],
				"bSortable":true,
				"bFilter":true
            },{
				"aTargets": [1],
				"bSortable":true,
				"bFilter":true
            },{
				"aTargets": ["_all"],
				"bSortable":false,
				"bFilter":false
            }]
		} );
		var tableTools = new $.fn.dataTable.TableTools( table, {
			
				"sSwfPath":  "../FYP_system/vendors/datatables/swf/copy_csv_xls_pdf.swf",
	           	"aButtons": [
	                "copy",
	                {
						"sExtends": "csv",
						"sTitle": "FYP Assessment"
					},
	                {
						"sExtends": "xls",
						"sTitle": "FYP Assessment",
					},
	                {
	                    "sExtends": "pdf",
						"sTitle": "FYP Assessment",
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

