<%@ page language="java" import="java.util.*,javax.servlet.http.HttpSession" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
				<a class="brand" href="${pageContext.request.contextPath }/goUI.do">
					FYP
					Coordination System
				</a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown">
							<a href="#" role="button"
							class="dropdown-toggle" data-toggle="dropdown">
								<i
								class="icon-user"></i>
								${coordinatorinfo.name } <i class="caret"></i>
							</a>
							<ul class="dropdown-menu">
								<li>
									<a tabindex="-1" data-target="#logout" data-toggle="modal" href="">Logout</a>
								</li>
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
					<li>
						<a href="${pageContext.request.contextPath }/goUI.do"> <i class="icon-chevron-right"></i>
							Main
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/goManageAccountUi.do?flag=goUi">
							<i class="icon-chevron-right"></i>
							Manage Account
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/quota.do?flag=goUi">
							<i class="icon-chevron-right"></i>
							Set Quota
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/openTime.do?flag=goUi">
							<i class="icon-chevron-right"></i>
							Set Open Time
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/setWorkload.do?flag=goUi">
							<i class="icon-chevron-right"></i>
							Set Workload
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/preTime.do?flag=goPreTimeUi">
							<i class="icon-chevron-right"></i>
							Set Pre Time
						</a>
					</li>
					<li class="active">
						<a href="${pageContext.request.contextPath }/import.do?flag=goImportUi">
							<i class="icon-chevron-right"></i>
							Import
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/export.do?flag=goExportUi">
							<i class="icon-chevron-right"></i>
							Export
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/changPwd.do?flag=goPwdUi">
							<i class="icon-chevron-right"></i>
							Change Password
						</a>
					</li>
				</ul>
			</div>

			<!--/span-->
			<div class="span9" id="content">
				<!-- morris stacked chart -->
				<div class="row-fluid">
					<c:if test="${importResult=='true' }">
						<div class="alert alert-success">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Success</h4>
							The operation completed successfully
						</div>
					</c:if>
					<c:if test="${importResult=='false'}">
						<div class="alert alert-error">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Error</h4>
							The operation failed! ${ErrorInfo}
						</div>
					</c:if>
					<div class="alert alert-error">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<h4>Warning!</h4>
						Do not repeat the import! Otherwise, there will be unexpected errors.
					</div>

					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Import</div>
						</div>

						<div class="block-content collapse in">
							<div class="span12">
								<form class="form-horizontal" action="${pageContext.request.contextPath }/import.do?flag=importStudents" method="post"
									enctype="multipart/form-data">
									<fieldset>
										<legend>Import Students</legend>
										<div class="control-group">
											<label class="control-label" for="fileInput">File
												input</label>
											<div class="controls">
												<div id="uploader">
													<input class="input-file uniform_on" id="fileInput"
														type="file" accept=".xls" required="required"
														name="excelFile">
												</div>
											</div>
										</div>
										<div class="form-actions">
											<input type="submit" class="btn btn-primary" value="Import" />
											<button type="button" id="clear" class="btn">Clear</button>
										</div>
										<%
											//下面代码用来 实现防刷新 
											Integer flag22=(int)(Math.random()*999999999);
											//System.out.println(flag22);
											session.setAttribute("flag", flag22);
										%>
										<input type="hidden" name="flag2" value="<%=flag22%>">
									</fieldset>
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
	<link href="vendors/datepicker.css" rel="stylesheet" media="screen">
	<link href="vendors/uniform.default.css" rel="stylesheet"
		media="screen">
	<link href="vendors/chosen.min.css" rel="stylesheet" media="screen">

	<link href="vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet"
		media="screen">

	<script src="vendors/jquery-1.9.1.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="vendors/jquery.uniform.min.js"></script>
	<script src="vendors/chosen.jquery.min.js"></script>
	<script src="vendors/bootstrap-datepicker.js"></script>

	<script src="vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
	<script src="vendors/wysiwyg/bootstrap-wysihtml5.js"></script>

	<script src="vendors/wizard/jquery.bootstrap.wizard.min.js"></script>

	<script type="text/javascript" src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>
	<script src="assets/form-validation.js"></script>

	<script src="assets/scripts.js"></script>

	<script>

	jQuery(document).ready(function() {   
	   FormValidation.init();
	});
        $(function() {
            $(".datepicker").datepicker();
            $(".uniform_on").uniform();
            $(".chzn-select").chosen();
            $('.textarea').wysihtml5();

            $('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index) {
                var $total = navigation.find('li').length;
                var $current = index+1;
                var $percent = ($current/$total) * 100;
                $('#rootwizard').find('.bar').css({width:$percent+'%'});
                // If it's the last tab then hide the last button and show the finish instead
                if($current >= $total) {
                    $('#rootwizard').find('.pager .next').hide();
                    $('#rootwizard').find('.pager .finish').show();
                    $('#rootwizard').find('.pager .finish').removeClass('disabled');
                } else {
                    $('#rootwizard').find('.pager .next').show();
                    $('#rootwizard').find('.pager .finish').hide();
                }
            }});
            $('#rootwizard .finish').click(function() {
                alert('Finished!, Starting over!');
                $('#rootwizard').find("a[href*='tab1']").trigger('click');
            });
        });
        
       
        
		function refreshUploader() {
			u = document.getElementById('uploader');
			u.innerHTML = "<input class='input-file uniform_on' id='fileInput' type='file' />";
		}
		$("#clear").on("click", function() {
			refreshUploader();
		});
	</script>
	<%if(request.getAttribute("tipMessage")!=null){ %>
	<script type="text/javascript">
		//Show Message
		alert("<%=request.getAttribute("tipMessage")%>");
	</script>
	<%} %>
	<%if(request.getAttribute("totalCount")!=null){ %>
	<script type="text/javascript">
		//Show Message
		alert("Result: delete previous data <%=request.getAttribute("deletePreData")%>");
		var message = "" + '${totalCount}';
		if (message != "") {
			message = "Result: delete previous data "+'${deletePreData}'+", total "+'${totalCount}'+" records, success "+'${successfulCount}'+", fail "+'${failedCount}'+"."
			alert(message);
		}
	</script>
	<%} %>
</body>
</html>