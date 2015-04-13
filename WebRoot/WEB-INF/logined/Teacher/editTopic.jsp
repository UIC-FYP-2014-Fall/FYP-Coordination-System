<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.uic.domain.TeaTopic"%>
<%@ page import="com.uic.domain.Teacher"%>
<%@ page import="com.uic.domain.Topic"%>
<%@ page import="java.util.List"%>

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
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"
	type="text/javascript"></script>
</head>

<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</a> 
				<a class="brand" href="index.html">FYP Coordination System</a>
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
					<li><a
						href="${pageContext.request.contextPath }/goUI.do"><i
							class="icon-chevron-right"></i> Main</a></li>
					<li><a
						href="${pageContext.request.contextPath }/uploadFYP.do?flag=uploadTopicUi"><i
							class="icon-chevron-right"></i> Upload Topic</a></li>
					<li  class="active"><a
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
						<!-- block -->
						<div class="block">
							<div class="navbar navbar-inner block-header">
								<ul class="breadcrumb">
									<i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
									<i class="icon-chevron-right show-sidebar" style="display: none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
									<li><a href="${pageContext.request.contextPath }/editFYP.do?flag=topicListUi">Topic List</a> <span
										class="divider">/</span></li>
									<li class="active">Edit Topic</li>
								</ul>
							</div>

							<div class="block-content collapse in">
								<form action="${pageContext.request.contextPath }/editFYP.do?flag=editFYP" method="post" class="form-horizontal">
									<div class="control-group">
										<label class="control-label" for="focusedInput">Title<span
											class="required">*</span></label>
										<div class="controls">
											<%
												List<TeaTopic> teaTopic = (List<TeaTopic>)request.getAttribute("teaTopic");
												out.println("<input name=\"fid\" type=\"hidden\" value=\""+teaTopic.get(0).getTopic().getFid()+"\">");
												out.println("<input class=\"input-xlarge focused\" name=\"title\"id=\"focusedInput\"type=\"text\" value=\""+teaTopic.get(0).getTopic().getTitle()+"\">");
											%>
										</div>
									</div>

									<div class="control-group">
										<label class="control-label" for="multiSelect">Supervisor
											<span class="required">*</span>
										</label>
										<div class="controls">
											<select name="supervisor" multiple="multiple"
												id="multiSelect" class="chzn-select span4">
												<%
													List<Teacher> teacherList = (List<Teacher>)request.getAttribute("teacherList");
													
													for(int i=0;i<teaTopic.size();i++){
														out.println("<option selected=\"selected\">"+teaTopic.get(i).getTeacher().getName()+"</option>");
														if(teacherList.contains(teaTopic.get(i).getTeacher())){
															teacherList.remove(teaTopic.get(i).getTeacher());
														}
													}
													for(int i=0;i<teacherList.size();i++){
														out.println("<option>"+teacherList.get(i).getName()+"</option>");	
													}
												%>
											</select>
										</div>
									</div>

									<div class="control-group">
										<label class="control-label" for="select01">Credits</label>
										<div class="controls">
											<select name="credit" id="select01">
												<%
													if(teaTopic.get(0).getTopic().getCredit()==3){
														out.println("<option selected=\"selected\">3</option>");
														out.println("<option>6</option>");
													}else{
													out.println("<option>3</option>");
														out.println("<option selected=\"selected\">6</option>");
													}
												%>
											</select>
										</div>
									</div>

									<div class="control-group">
										<label class="control-label" for="select01">Group/Individual</label>
										<div class="controls">
											<select id="group" name="individual" onclick="javascript:doit(this);">
												<%
													if(teaTopic.get(0).getTopic().getIndividual()){
														out.println("<option selected=\"selected\" value=\"individual\">Individual</option>");
														out.println("<option value=\"group\">Group</option>");
													}else{
														out.println("<option value=\"individual\">Individual</option>");
														out.println("<option selected=\"selected\" value=\"group\">Group</option>");
													}
												%>
											</select>
										</div>
									</div>

									<div class="control-group">
										<label class="control-label" for="select01">Number of
											students</label>
										<div class="controls">
											<select name="numOfStu" id="numofStu">
												<%
													if(teaTopic.get(0).getTopic().getNumOfStudent()==1){
														out.println("<option selected=\"selected\" value=\"1\">1<option>");
														out.println("<option value=\"2\">2</option>");
														out.println("<option value=\"3\">3</option>");
														out.println("<option value=\"4\">4</option>"); 
													}else if(teaTopic.get(0).getTopic().getNumOfStudent()==2){
														out.println("<option value=\"1\">1<option>");
														out.println("<option selected=\"selected\" value=\"2\">2</option>");
														out.println("<option value=\"3\">3</option>");
														out.println("<option value=\"4\">4</option>"); 
													}else if(teaTopic.get(0).getTopic().getNumOfStudent()==3){
														out.println("<optionvalue=\"1\">1<option>");
														out.println("<option value=\"2\">2</option>");
														out.println("<option selected=\"selected\" value=\"3\">3</option>");
														out.println("<option value=\"4\">4</option>"); 
													}else if(teaTopic.get(0).getTopic().getNumOfStudent()==4){
														out.println("<option value=\"1\">1<option>");
														out.println("<option value=\"2\">2</option>");
														out.println("<option value=\"3\">3</option>");
														out.println("<option selected=\"selected\" value=\"4\">4</option>"); 
													}
												%>
											</select>
										</div>
									</div>

								<div class="control-group">
									<label class="control-label" for="textarea2">Description
										<span class="required">*</span>
									</label>
									<div class="controls">
										<%
											out.println("<textarea name=\"description\" class=\"input-xlarge textarea\" style=\"width: 98%; height: 200px\" >"+teaTopic.get(0).getTopic().getDescription()+"</textarea>");
										%>
									</div>
								</div>
								
								<div class="form-actions">
									<button type="submit" class="btn btn-primary">Submit</button>
									<button
										href="${pageContext.request.contextPath }/editFYP.do?flag=topicListUi"
										class="btn">Cancel</button>
								</div>
							</form>
							</div>
						</div>
					</div>
				
		</div>
	</div>
</div>




	<!--/.fluid-container-->
	<link href="vendors/uniform.default.css" rel="stylesheet"
		media="screen">
	<link href="vendors/chosen.min.css" rel="stylesheet" media="screen">
	<link href="vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet"
		media="screen">
	<script src="vendors/jquery-1.9.1.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="vendors/jquery.uniform.min.js"></script>
	<script src="vendors/chosen.jquery.min.js"></script>
	<script src="vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
	<script src="vendors/wysiwyg/bootstrap-wysihtml5.js"></script>
	<script src="vendors/wizard/jquery.bootstrap.wizard.min.js"></script>
	<script type="text/javascript"
		src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>
	<script src="assets/form-validation.js"></script>
	<script src="assets/scripts.js"></script>
	<script>
		jQuery(document).ready(function() {
			FormValidation.init();
		});

		$(function() {
			$(".uniform_on").uniform();
			$(".chzn-select").chosen();
			$('.textarea').wysihtml5();
		});
	</script>

	<script type="text/javascript">
		function doit(o) {
			if (o.options[o.selectedIndex].value == 'individual') {
				document.getElementById('numofStu').disabled = true;
			} else {
				document.getElementById('numofStu').disabled = false;

			}
			o.disabled = false;
		}
	</script>

</body>
</html>
