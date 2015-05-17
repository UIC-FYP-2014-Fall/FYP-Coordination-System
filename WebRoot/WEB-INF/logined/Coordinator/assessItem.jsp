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
					<li class="active"><a
						href="${pageContext.request.contextPath }/assessItem.do?flag=goAssessItemUi">
							<i class="icon-chevron-right"></i> Assessment Item
					</a></li>
					<li><a
						href="${pageContext.request.contextPath }/gradeLevel.do?flag=goGradeLevelUi">
							<i class="icon-chevron-right"></i> Grade Level
					</a></li>
				</ul>
			</div>

			<!--/span-->
			<div class="span9" id="content">
				<div class="row-fluid">
					<c:if test="${requestScope.AssessItemOperation=='success'}">
						<div class="alert alert-success SuccessInfo">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Success</h4>
							Save assessment item percentage successfully! 
						</div>
					</c:if>
					<c:if test="${requestScope.AssessItemOperation=='error'}">
						<div class="alert alert-error ErrorInfo">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Error</h4>
							Save assessment item percentage failed! ${ErrorInfo}
						</div>
					</c:if>
					<c:if test="${addAvailable=='false'}">
						<div class="alert alert-info alert-block">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Info</h4>
							The sum of the percentage is 100%. ${LockInfo }
						</div>
					</c:if>
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Set Assessment Item Percentage</div>
						</div>
						<div class="block-content collapse in">
							<div class="span12">
								<table cellpadding="0" cellspacing="0" border="0"
									class="table table-striped table-hover" id="aitemTable">
									<thead>
										<tr>
											<th>#</th>
											<th>Assessment Item</th>
											<th>Percentage</th>
											<th>Supervisor</th>
											<th>Observer</th>
											<th>Examiner</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${assessItemList }" var="assessItem"
											varStatus="status">
											<tr>
												<td>${status.index+1 }</td>
												<td>${assessItem.name }</td>
												<td>${assessItem.percent }%</td>

												<c:if test="${assessItem.supervisor eq 1 }">
													<td><img src="images/ok.png" title="Ok" width="16"
														height="16" /></td>
												</c:if>
												<c:if test="${assessItem.supervisor eq 0 }">
													<td><img src="images/block_gray.png" title="Block"
														width="16" height="16" /></td>
												</c:if>

												<c:if test="${assessItem.observer eq 1 }">
													<td><img src="images/ok.png" title="Ok" width="16"
														height="16" /></td>
												</c:if>
												<c:if test="${assessItem.observer eq 0 }">
													<td><img src="images/block_gray.png" title="Block"
														width="16" height="16" /></td>
												</c:if>

												<c:if test="${assessItem.examiner eq 1 }">
													<td><img src="images/ok.png" title="Ok" width="16"
														height="16" /></td>
												</c:if>
												<c:if test="${assessItem.examiner eq 0 }">
													<td><img src="images/block_gray.png" title="Block"
														width="16" height="16" /></td>
												</c:if>
												<td>
													<button class="btn btn-primary btn-mini edit_button"
														data-toggle="modal" data-target="#myEdit"
														data-supervisor="${assessItem.supervisor }"
														data-observer="${assessItem.observer }"
														data-examiner="${assessItem.examiner }"
														data-name="${assessItem.name }"
														data-percent="${assessItem.percent }"
														data-id="${assessItem.id }" title="Edit">
														<i class="icon-pencil icon-white"></i> Edit
													</button>
													<a class="btn btn-danger btn-mini" title="Delete"
													data-confirm="Are you sure you want to delete the assess item '${assessItem.name }'?"
													href="${pageContext.request.contextPath }/assessItem.do?flag=delete&aid=${assessItem.id}"><i
														class="icon-remove icon-white"></i> Delete</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<c:if test="${addAvailable=='true' }">
									<div class="table-toolbar">
										<a href="#add" data-toggle="modal">
											<button class="btn btn-success">
												Add New <i class="icon-plus icon-white"></i>
											</button>
										</a>
									</div>
									<div id="add" class="modal hide fade">
										<div class="modal-header">
											<a href="#" class="close" data-dismiss="modal"><i
												class="icon-remove"></i></a>
											<h4>Add New Item</h4>
										</div>
										<form class="form-horizontal" method="post"
											action="${pageContext.request.contextPath }/assessItem.do?flag=add"
											id="form_sample_1">
											<div class="modal-body">
												<div class="alert alert-error hide">
													<button class="close" data-dismiss="alert"></button>
													You have some form errors. Please check below.
												</div>
												<div class="control-group">
													<label class="control-label">Assessment Item<span
														class="required">*</span></label>
													<div class="controls">
														<input type="text" name="assessName" data-required="1"
															class="m-wrap">
													</div>
												</div>
												<div class="control-group">
													<label class="control-label">Percentage<span
														class="required">*</span></label>
													<div class="controls">
														<input type="number" class="span3 m-wrap" min="1" max="${100-totalPercent }"
															name="percentage" data-required="1" /> %
													</div>
												</div>
												<div class="control-group">
													<label class="control-label">Type<span
														class="required">*</span></label>
													<div class="controls">
														<label class="checkbox inline"> <input
															type="checkbox" name="teacherType" value="supervisor">
															Supervisor
														</label> <label class="checkbox inline"> <input
															type="checkbox" name="teacherType" value="observer">
															Observer
														</label> <label class="checkbox inline"> <input
															type="checkbox" name="teacherType" value="examiner">
															Examiner
														</label>
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-primary">Submit</button>
												<button type="reset" class="btn">Reset</button>
											</div>
										</form>
									</div>
								</c:if>

								<div id="myEdit" class="modal fade hide" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h4>Edit</h4>
											</div>
											<form class="form-horizontal" method="post"
												action="${pageContext.request.contextPath }/assessItem.do?flag=edit">
												<div class="modal-body">
													<div class="control-group">
														<input type="hidden" name="assessId" class="assessItem_id" />
														<label class="control-label">Assessment Item<span
															class="required">*</span></label>
														<div class="controls">
															<input type="text" disabled="" name="assessName" data-required="1" class="m-wrap disabled assessItem_name">
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Percentage<span
															class="required">*</span></label>
														<div class="controls">
															<input type="number" class="span3 m-wrap assessItem_percent" min="1" max="${100-totalPercent }" name="percentage" data-required="1" /> %
														</div>
													</div>
													<div class="control-group">
														<label class="control-label">Type<span
															class="required">*</span></label>
														<div class="controls">
															<label class="checkbox inline">
																<input type="checkbox" class="teacherType_supervisor" name="teacherType" value="supervisor" required>
																Supervisor
															</label>
															<label class="checkbox inline">
																<input type="checkbox" class="teacherType_observer" name="teacherType" value="observer">
																Observer
															</label>
															<label class="checkbox inline">
															<input type="checkbox" class="teacherType_examiner" name="teacherType" value="examiner">
																Examiner
															</label>
														</div>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn" data-dismiss="modal">Close</button>
													<button type="submit" class="btn btn-primary">Save changes</button>
												</div>
											</form>
										</div>
									</div>
								</div>

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
	<script type="text/javascript" src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>
	<script src="assets/form-validation.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			FormValidation.init();
		});
		$(document).ready(function() {
			$('a[data-confirm]').click(function(ev) {
				var href = $(this).attr('href');
				if (!$('#dataConfirmModal').length) {
					$('body').append('<div id="dataConfirmModal" class="modal fade" role="dialog" aria-labelledby="dataConfirmLabel" aria-hidden="true"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><h3 id="dataConfirmLabel">Please Confirm</h3></div><div class="modal-body"></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button><a class="btn btn-danger" id="dataConfirmOK">OK</a></div></div>');
				}
				$('#dataConfirmModal').find('.modal-body').text($(this).attr('data-confirm'));
				$('#dataConfirmOK').attr('href', href);
				$('#dataConfirmModal').modal({show : true});
				return false;
			});
		});
		
		$(document).on( "click", '.edit_button',function(e) {
			var id = $(this).data('id');
	        var name = $(this).data('name');
	        var percent = $(this).data('percent');
	        var supervisor = $(this).data('supervisor');
	        var observer = $(this).data('observer');
	        var examiner = $(this).data('examiner');
	        var max = ${100-totalPercent}+percent;
	        //alert(supervisor+' '+observer+' '+examiner);
	        /* $("#teacherType_supervisor").removeAttr("checked");
	        $("#teacherType_observer").removeAttr("checked");
	        $("#teacherType_examiner").removeAttr("checked"); */
	
	        $(".assessItem_id").val(id);
	        $(".assessItem_name").val(name);
	        $(".assessItem_percent").val(percent);
	        
	        $(".assessItem_percent").attr("max",max);
	                	       	        
	        if(supervisor==1){
	        	$(".teacherType_supervisor").prop("checked",true);
	        }
	        else{
	        	$(".teacherType_supervisor").prop("checked",false);
	        }
	        
	        if(observer==1){
	        	$(".teacherType_observer").prop("checked",true);
	        }
	        else{
	        	$(".teacherType_observer").prop("checked",false);
	        }
	        
	        if(examiner==1){
	        	$(".teacherType_examiner").prop("checked",true);
	        }
	        else{
	        	$(".teacherType_examiner").prop("checked",false);
	        }
	       
	    });
	</script>
</body>
</html>
