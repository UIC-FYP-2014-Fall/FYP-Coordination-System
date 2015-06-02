<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
	<script type="text/javascript">
	function _unlock(){
		$("#saveDiv").show();
		$("#uneditable-input").hide();
		$("#telephone").show();
		$("#unlock").hide();
	}
	function cancel(){
		$("#saveDiv").hide();
		$("#uneditable-input").show();
		$("#telephone").hide();
		$("#unlock").show();
		$("#errorTelephone").text("");
	}
	</script>
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
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i> ${studentinfo.name } <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                	<li>
                                        <a tabindex="-1" href="${pageContext.request.contextPath }/changPwd.do?flag=goPwdUi">Settings</a>
                                    </li>
                                    <li class="divider"></li>
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
                        <li>
                            <a href="${pageContext.request.contextPath }/goStudentMain.do"><i class="icon-chevron-right"></i> Main</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/chooseTopic.do?flag=goChooseTopic"><i class="icon-chevron-right"></i> Choose Topic</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/chooseExaminer.do?flag=goChooseExaminer"><i class="icon-chevron-right"></i> Choose Examiner</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/choosePretime.do?flag=goChoosePretime"><i class="icon-chevron-right"></i> Choose Presentation Time</a>
                        </li>
                        <li class="active">
                            <a href="${pageContext.request.contextPath }/changPwd.do?flag=goPwdUi"><i class="icon-chevron-right"></i> Settings</a>
                        </li>
                    </ul>
                </div>
                <!--/span-->
			<div class="span9" id="content">
				<div class="row-fluid">
					
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Contact Information</div>
						</div>
						<div class="block-content collapse in">
							<div class="span12">
								<form class="form-horizontal" action="${pageContext.request.contextPath }/changPwd.do?flag=updateTelephone" method="post" id="telephoneForm">
									<c:if test="${updateTelephoneState=='failed' }">	
										<div class="alert alert-error">
										<button class="close" data-dismiss="alert">&times;</button>
										<strong>Error!</strong> The operation failed. Please check your telephone number!
									</div>
									</c:if>
									<c:if test="${errors!=null }">	
										<div class="alert alert-error">
											<button class="close" data-dismiss="alert">&times;</button>
											<strong>Error!</strong> The operation failed. ${errors.telephone }
										</div>
									</c:if>
									<c:if test="${updateTelephoneState=='success' }">
										<div class="alert alert-success">
											<button class="close" data-dismiss="alert">&times;</button>
										<strong>Success!</strong> Your telephone number has been saved.
									</div>
									</c:if>
									<div class="control-group" id="teleClass" style="padding-top:20px;padding-bottom:20px;" >
										<label class="control-label">Mobile Phone: <span class="required">*</span></label>
										<div class="controls">
											<input type="text" name="telephone" class="m-wrap" value="" id="telephone" style="display: none"/>
											<span class="input-large uneditable-input" id="uneditable-input">${telephone }</span>
											<span class="help-inline" id="errorTelephone">
												
											</span>
											
												<button class="btn btn-primary tooltip-right" data-original-title="Your mobile phone number must be available!" id="unlock" onclick="_unlock()"><i class="icon-pencil icon-white"> </i> Edit</button>
										
										</div>
									</div>
									<div class="form-actions" id="saveDiv" style="display: none">
										<button type="submit" class="btn btn-primary">Save</button>
										<button type="reset" class="btn" onclick="cancel()">Cancel</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- block -->
				</div>
				<div class="row-fluid">
					
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="muted pull-left">Change Password</div>
						</div>
						<div class="block-content collapse in">
							<div class="span12">
								<form class="form-horizontal" action="${pageContext.request.contextPath }/changPwd.do?flag=changePwd" id="form_sample_1"
									method="post">
									<c:if test="${PwdError!=null }">
										<div class="alert alert-error">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
											<h4>Error</h4>
											The operation failed. ${PwdError }
										</div>
									</c:if>
									<div class="alert alert-error hide">
										<button class="close" data-dismiss="alert"></button>
										Input error. Please check below.
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
										<button type="submit" class="btn btn-primary">Save</button>
										<button type="reset" class="btn">Cancel</button>
									</div>

								</form>
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

	<script src="assets/scripts.js"></script>
	<script src="assets/form-validation.js"></script>
	<script type="text/javascript"
		src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>

	<script>
		jQuery(document).ready(function() {
			FormValidation.init();
		});
		
		$(function(){
			
			$("#unlock").tooltip({ placement: 'right' });
			
			$("#telephoneForm").submit(function(){
				var bool = true;
				if(!validateTelephone()){
					bool = false;
				}
				return bool;	
			});
			/*
			 *1.输入框得到焦点隐藏错误信息 
			 */
			$("#telephone").focus(function(){
				//alert("Hit!");
				$("#teleClass").removeClass("error").removeClass("success");
				$("#errorTelephone").text("");
			});
			/*
			 * 2.输入框失去焦点进行校验
			 */
			$("#telephone").blur(function(){
				validateTelephone();//执行函数调用
			});
		});
		
		function validateTelephone(){
			var id = "telephone";
			var value = $("#"+id).val();//获取输入框值
			var reg = /^0?1[3|4|5|8][0-9]\d{8}$/;
			if(!value){
				$("#teleClass").removeClass("success").addClass("error");
				$("#errorTelephone").text("This field is required.");
				return false;
			}
			
			if (reg.test(value)) {
				$("#teleClass").addClass("success");
			}else{
				$("#teleClass").removeClass("success").addClass("error");
				$("#errorTelephone").text("Please enter a correct mobile phone number.");
				false;
			}
			
			return true;
		}
		
		
	</script>

</body>
</html>