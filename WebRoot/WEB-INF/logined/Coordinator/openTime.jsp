<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FYP Coordination System</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
		<link href="assets/styles.css" rel="stylesheet" media="screen">	
		<link href="bootstrap/css/datepicker.css" rel="stylesheet" type="text/css">
		<link href="bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
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
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i> ${coordinatorinfo.name } <i class="caret"></i>

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
						<li class="active"><a href="${pageContext.request.contextPath }/openTime.do?flag=goUi"><i class="icon-chevron-right"></i>
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
                <!--/span-->
                <div class="span9" id="content">
                     <div class="row-fluid">
                     
                     <c:if test="${TimeOperation=='success'}">
      					<div class="alert alert-success SuccessInfo">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
            				<h4>Success</h4>
            				The operation completed successfully! ${message }
        				</div>
      				</c:if>
      				
      				<c:if test="${TimeOperation=='error'}">
      					<div class="alert alert-error ErrorInfo">
          					<button type="button" class="close" data-dismiss="alert">&times;</button>
          					<h4>Error</h4>
          					The operation failed! ${message }
       					</div>
      				</c:if>
                			<!-- block -->
                            <div class="block">  
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">Set Open Time for Teachers</div>
                                </div>

                                <div class="block-content collapse in">
                                    <div class="span4">
                                        <fieldset>
                                            <legend>Upload Topics</legend>
                                            <c:if test="${UploadTopicsDateTime=='false' }">
                                            <form class="form-inline" method="post" action="${pageContext.request.contextPath }/openTime.do?flag=saveUploadTopicsDateTime" id="form_sample_1">
                                            <div class="alert alert-error hide">
                                                <button class="close" data-dismiss="alert"></button>
                                                You must complete your selection. Please check.
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">Start</label>
                                                <div class="controls">
                                                    <div class="input-prepend">
                                                        <span class="add-on"><i class="icon-calendar"></i></span>
                                                        <input type="text" name="startDate" style="width:100px" value="<c:if test="${UTstartDate!=null }">${UTstartDate }</c:if>" id="dpd1"  readonly>
                                                    </div>
                                                    <div id="starttime" class="input-append">
                                                        <input data-format="hh:mm:ss" name="startTime" type="text" style="width:60px" readonly></input>
                                                        <span class="add-on">
                                                            <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">End</label>
                                                <div class="controls">
                                                    <div class="input-prepend">
                                                        <span class="add-on"><i class="icon-calendar"></i></span>
                                                        <input type="text" name="endDate" style="width:100px" value="<c:if test="${UTendDate!=null }">${UTendDate }</c:if>" id="dpd2" readonly>
                                                    </div>
                                                    <div id="endtime" class="input-append">
                                                        <input data-format="hh:mm:ss" name="endTime" type="text" style="width:60px" readonly></input>
                                                        <span class="add-on">
                                                            <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-actions">
                                                <button type="submit" class="btn btn-primary">Save</button>
                                                <button type="reset" class="btn">Reset</button>
                                            </div>
                                        </form>
                                        </c:if>
                                        <c:if test="${UploadTopicsDateTime=='true' }">
                                        	<div class="alert alert-info">
												<p>From: <strong>${UploadTopicsStartDateTime }</strong> </p>
												<p>To:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>${UploadTopicsEndDateTime }</strong>. </p>
												<p>Click <a href="#edit" onclick="btn()"><strong>here</strong></a> to change.</p>
											</div>                           
                                        </c:if>
                                        <div id="edit" style="display:none;">
                                        	<form class="form-inline" method="post" action="${pageContext.request.contextPath }/openTime.do?flag=saveUploadTopicsDateTime" id="form_sample_1">
                                            <div class="alert alert-error hide">
                                                <button class="close" data-dismiss="alert"></button>
                                                You must complete your selection. Please check.
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">Start</label>
                                                <div class="controls">
                                                    <div class="input-prepend">
                                                        <span class="add-on"><i class="icon-calendar"></i></span>
                                                        <input type="text" name="startDate" style="width:100px" value="<c:if test="${UTstartDate!=null }">${UTstartDate }</c:if>" id="dpd1"  readonly>
                                                    </div>
                                                    <div id="starttime" class="input-append">
                                                        <input data-format="hh:mm:ss" name="startTime" type="text" style="width:60px" readonly></input>
                                                        <span class="add-on">
                                                            <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">End</label>
                                                <div class="controls">
                                                    <div class="input-prepend">
                                                        <span class="add-on"><i class="icon-calendar"></i></span>
                                                        <input type="text" name="endDate" style="width:100px" value="<c:if test="${UTendDate!=null }">${UTendDate }</c:if>" id="dpd2" readonly>
                                                    </div>
                                                    <div id="endtime" class="input-append">
                                                        <input data-format="hh:mm:ss" name="endTime" type="text" style="width:60px" readonly></input>
                                                        <span class="add-on">
                                                            <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-actions">
                                                <button type="submit" class="btn btn-primary">Save</button>
                                                <button type="reset" class="btn">Reset</button>
                                            </div>
                                        </form>
                                        </div>
                                        
                                        </fieldset>
                                    </div>
									                                   
								</div>
							</div>
								
							<div class="block">  
	                        	<div class="navbar navbar-inner block-header">
	                            	<div class="muted pull-left">Set Open Time for Students</div>
	                            </div>
	                            <div class="block-content collapse in">
	                            	<div class="span4">
                                        
                                        <fieldset>
                                            <legend>Choose Topic</legend>
                                            
                                            <c:if test="${ChooseTopicDateTime=='false' }">
                                            
                                            <form class="form-inline" method="post" action="${pageContext.request.contextPath }/openTime.do?flag=saveChooseTopicDateTime" id="form_sample_2">
                                            <div class="alert alert-error hide">
                                                <button class="close" data-dismiss="alert"></button>
                                                You must complete your selection. Please check.
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">Start</label>
                                                <div class="controls">
                                                    <div class="input-prepend">
                                                        <span class="add-on"><i class="icon-calendar"></i></span>
                                                        <input type="text" name="CT_startDate" style="width:100px" value="<c:if test="${CTstartDate!=null }">${CTstartDate }</c:if>" id="dpd3" readonly>
                                                    </div>
                                                    <div id="ct_starttime" class="input-append">
                                                        <input data-format="hh:mm:ss" name="CT_startTime" type="text" style="width:60px" readonly></input>
                                                        <span class="add-on">
                                                            <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">End</label>
                                                <div class="controls">
                                                    <div class="input-prepend">
                                                        <span class="add-on"><i class="icon-calendar"></i></span>
                                                        <input type="text" name="CT_endDate" style="width:100px" value="<c:if test="${CTendDate!=null }">${CTendDate }</c:if>" id="dpd4" readonly>
                                                    </div>
                                                    <div id="ct_endtime" class="input-append">
                                                        <input data-format="hh:mm:ss" name="CT_endTime" type="text" style="width:60px" readonly></input>
                                                        <span class="add-on">
                                                            <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-actions">
                                                <button type="submit" class="btn btn-primary">Save</button>
                                                <button type="reset" class="btn">Reset</button>
                                            </div>
                                            </form>
                                            </c:if>
                                            
                                            <c:if test="${ChooseTopicDateTime=='true' }">
                                        		<div class="alert alert-info">
													<p>From: <strong>${ChooseTopicStartDateTime }</strong></p>
													<p>To:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>${ChooseTopicEndDateTime }</strong>.</p>
													<p>Click <a href="#edit2" onclick="btn2()"><strong>here</strong></a> to change.</p>
												</div>
											</c:if>
											
											<div id="edit2" style="display:none;">
											<form class="form-inline" method="post" action="${pageContext.request.contextPath }/openTime.do?flag=saveChooseTopicDateTime" id="form_sample_2">
                                            <div class="alert alert-error hide">
                                                <button class="close" data-dismiss="alert"></button>
                                                You must complete your selection. Please check.
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">Start</label>
                                                <div class="controls">
                                                    <div class="input-prepend">
                                                        <span class="add-on"><i class="icon-calendar"></i></span>
                                                        <input type="text" name="CT_startDate" style="width:100px" value="<c:if test="${CTstartDate!=null }">${CTstartDate }</c:if>" id="dpd3" readonly>
                                                    </div>
                                                    <div id="ct_starttime" class="input-append">
                                                        <input data-format="hh:mm:ss" name="CT_startTime" type="text" style="width:60px" readonly></input>
                                                        <span class="add-on">
                                                            <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="control-group">
                                                <label class="control-label">End</label>
                                                <div class="controls">
                                                    <div class="input-prepend">
                                                        <span class="add-on"><i class="icon-calendar"></i></span>
                                                        <input type="text" name="CT_endDate" style="width:100px" value="<c:if test="${CTendDate!=null }">${CTendDate }</c:if>" id="dpd4" readonly>
                                                    </div>
                                                    <div id="ct_endtime" class="input-append">
                                                        <input data-format="hh:mm:ss" name="CT_endTime" type="text" style="width:60px" readonly></input>
                                                        <span class="add-on">
                                                            <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-actions">
                                                <button type="submit" class="btn btn-primary">Save</button>
                                                <button type="reset" class="btn">Reset</button>
                                            </div>
                                            </form>
											</div>
                                            </fieldset>
                                        
                                    </div>
	                            	<div class="span4">                                        
	                                        <fieldset>
	                                            <legend>Choose Examiners</legend>
	                                            <c:if test="${ChooseExaminersDateTime=='false' }">
	                                            <form class="form-inline" method="post" action="${pageContext.request.contextPath }/openTime.do?flag=saveChooseExaminersDateTime" id="form_sample_3">
	                                            <div class="alert alert-error hide">
	                                                <button class="close" data-dismiss="alert"></button>
	                                                You must complete your selection. Please check.
	                                            </div>
	                                            <div class="control-group">
	                                                <label class="control-label">Start</label>
	                                                <div class="controls">
	                                                    <div class="input-prepend">
	                                                        <span class="add-on"><i class="icon-calendar"></i></span>
	                                                        <input type="text" name="CE_startDate" style="width:100px" value="<c:if test="${CEstartDate!=null }">${CEstartDate }</c:if>" id="dpd5" readonly>
	                                                    </div>
	                                                    <div id="ce_starttime" class="input-append">
	                                                        <input data-format="hh:mm:ss" name="CE_startTime" type="text" style="width:60px" readonly></input>
	                                                        <span class="add-on">
	                                                            <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
	                                                        </span>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="control-group">
	                                                <label class="control-label">End</label>
	                                                <div class="controls">
	                                                    <div class="input-prepend">
	                                                        <span class="add-on"><i class="icon-calendar"></i></span>
	                                                        <input type="text" name="CE_endDate" style="width:100px" value="<c:if test="${CEendDate!=null }">${CEendDate }</c:if>" id="dpd6" readonly>
	                                                    </div>
	                                                    <div id="ce_endtime" class="input-append">
	                                                        <input data-format="hh:mm:ss" name="CE_endTime" type="text" style="width:60px" readonly></input>
	                                                        <span class="add-on">
	                                                            <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
	                                                        </span>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="form-actions">
	                                                <button type="submit" class="btn btn-primary">Save</button>
	                                                <button type="reset" class="btn">Reset</button>
	                                            </div>
	                                            </form>
	                                            </c:if>
	                                            
	                                            <c:if test="${ChooseExaminersDateTime=='true' }">
	                                        		<div class="alert alert-info">
														<p>From: <strong>${ChooseExaminersStartDateTime }</strong></p> 
														<p>To:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>${ChooseExaminersEndDateTime }</strong>.</p>
														<p>Click <a href="#edit3" onclick="btn3()"><strong>here</strong></a> to change.</p>
													</div>
													</c:if>
													<div id="edit3" style="display:none;">
														<form class="form-inline" method="post" action="${pageContext.request.contextPath }/openTime.do?flag=saveChooseExaminersDateTime" id="form_sample_3">
	                                            <div class="alert alert-error hide">
	                                                <button class="close" data-dismiss="alert"></button>
	                                                You must complete your selection. Please check.
	                                            </div>
	                                            <div class="control-group">
	                                                <label class="control-label">Start</label>
	                                                <div class="controls">
	                                                    <div class="input-prepend">
	                                                        <span class="add-on"><i class="icon-calendar"></i></span>
	                                                        <input type="text" name="CE_startDate" style="width:100px" value="<c:if test="${CEstartDate!=null }">${CEstartDate }</c:if>" id="dpd5" readonly>
	                                                    </div>
	                                                    <div id="ce_starttime" class="input-append">
	                                                        <input data-format="hh:mm:ss" name="CE_startTime" type="text" style="width:60px" readonly></input>
	                                                        <span class="add-on">
	                                                            <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
	                                                        </span>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="control-group">
	                                                <label class="control-label">End</label>
	                                                <div class="controls">
	                                                    <div class="input-prepend">
	                                                        <span class="add-on"><i class="icon-calendar"></i></span>
	                                                        <input type="text" name="CE_endDate" style="width:100px" value="<c:if test="${CEendDate!=null }">${CEendDate }</c:if>" id="dpd6" readonly>
	                                                    </div>
	                                                    <div id="ce_endtime" class="input-append">
	                                                        <input data-format="hh:mm:ss" name="CE_endTime" type="text" style="width:60px" readonly></input>
	                                                        <span class="add-on">
	                                                            <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
	                                                        </span>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="form-actions">
	                                                <button type="submit" class="btn btn-primary">Save</button>
	                                                <button type="reset" class="btn">Reset</button>
	                                            </div>
	                                            </form>
												</div>
	                                                                                  
	                                         </fieldset>
	                                        
	                                    </div>
	                               
	                                    <div class="span4">                                        
	                                        <fieldset>
	                                            <legend>Choose Presentation Time</legend>
	                                            <c:if test="${ChoosePresentationDateTime=='false' }">
	                                            <form class="form-inline" method="post" action="${pageContext.request.contextPath }/openTime.do?flag=saveChoosePresentationDateTime" id="form_sample_4">
	                                            <div class="alert alert-error hide">
	                                                <button class="close" data-dismiss="alert"></button>
	                                                You must complete your selection. Please check.
	                                            </div>
	                                            <div class="control-group">
	                                                <label class="control-label">Start</label>
	                                                <div class="controls">
	                                                    <div class="input-prepend">
	                                                        <span class="add-on"><i class="icon-calendar"></i></span>
	                                                        <input type="text" name="CP_startDate" style="width:100px" value="<c:if test="${CPstartDate!=null }">${CPstartDate }</c:if>" id="dpd7" readonly>
	                                                    </div>
	                                                    <div id="cp_starttime" class="input-append">
	                                                        <input data-format="hh:mm:ss" name="CP_startTime" type="text" style="width:60px" readonly></input>
	                                                        <span class="add-on">
	                                                            <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
	                                                        </span>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="control-group">
	                                                <label class="control-label">End</label>
	                                                <div class="controls">
	                                                    <div class="input-prepend">
	                                                        <span class="add-on"><i class="icon-calendar"></i></span>
	                                                        <input type="text" name="CP_endDate" style="width:100px" value="<c:if test="${CPendDate!=null }">${CPendDate }</c:if>" id="dpd8" readonly>
	                                                    </div>
	                                                    <div id="cp_endtime" class="input-append">
	                                                        <input data-format="hh:mm:ss" name="CP_endTime" type="text" style="width:60px" readonly></input>
	                                                        <span class="add-on">
	                                                            <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
	                                                        </span>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="form-actions">
	                                                <button type="submit" class="btn btn-primary">Save</button>
	                                                <button type="reset" class="btn">Reset</button>
	                                            </div>
	                                            </form>
	                                            </c:if>
	                                            
	                                            <c:if test="${ChoosePresentationDateTime=='true' }">
	                                        		<div class="alert alert-info">
														<p>From: <strong>${ChoosePresentationStartDateTime }</strong></p> 
														<p>To:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>${ChoosePresentationEndDateTime }</strong>.</p>
														<p>Click <a href="#edit4" onclick="btn4()"><strong>here</strong></a> to change.</p>
													</div>
													</c:if>
													<div id="edit4" style="display:none;">
														<form class="form-inline" method="post" action="${pageContext.request.contextPath }/openTime.do?flag=saveChoosePresentationDateTime" id="form_sample_4">
	                                            <div class="alert alert-error hide">
	                                                <button class="close" data-dismiss="alert"></button>
	                                                You must complete your selection. Please check.
	                                            </div>
	                                            <div class="control-group">
	                                                <label class="control-label">Start</label>
	                                                <div class="controls">
	                                                    <div class="input-prepend">
	                                                        <span class="add-on"><i class="icon-calendar"></i></span>
	                                                        <input type="text" name="CP_startDate" style="width:100px" value="<c:if test="${CPstartDate!=null }">${CPstartDate }</c:if>" id="dpd7" readonly>
	                                                    </div>
	                                                    <div id="cp_starttime" class="input-append">
	                                                        <input data-format="hh:mm:ss" name="CP_startTime" type="text" style="width:60px" readonly></input>
	                                                        <span class="add-on">
	                                                            <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
	                                                        </span>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="control-group">
	                                                <label class="control-label">End</label>
	                                                <div class="controls">
	                                                    <div class="input-prepend">
	                                                        <span class="add-on"><i class="icon-calendar"></i></span>
	                                                        <input type="text" name="CP_endDate" style="width:100px" value="<c:if test="${CPendDate!=null }">${CPendDate }</c:if>" id="dpd8" readonly>
	                                                    </div>
	                                                    <div id="cp_endtime" class="input-append">
	                                                        <input data-format="hh:mm:ss" name="CP_endTime" type="text" style="width:60px" readonly></input>
	                                                        <span class="add-on">
	                                                            <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
	                                                        </span>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div class="form-actions">
	                                                <button type="submit" class="btn btn-primary">Save</button>
	                                                <button type="reset" class="btn">Reset</button>
	                                            </div>
	                                            </form>
												</div>
	                                                                                  
	                                         </fieldset>
	                                        
	                                    </div>
	  								                                  
	                                
								</div>
                                    
                            </div>
                        </div>
                    </div>

            </div>
			
        </div>


<!--/.fluid-container-->
<script src="vendors/jquery-1.9.1.min.js"></script> 
<script src="bootstrap/js/bootstrap.min.js"></script> 
<script src="assets/scripts.js"></script> 

<script src="assets/form-validation.js"></script>
<script src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>


<script src="bootstrap/js/bootstrap-datepicker.js"></script>
<script src="bootstrap/js/bootstrap-datetimepicker.min.js"></script>

<script>
var nowTemp = new Date();

var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
		  
<%
if(request.getAttribute("UTstartHH")!=null){
%>
var now1 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), <%=request.getAttribute("UTstartHH")%>, <%=request.getAttribute("UTstartMM")%>, <%=request.getAttribute("UTstartSS")%>, 0);
<%}else{%>
var now1 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 9, 0, 0, 0);
<%}%>

<%
	if(request.getAttribute("UTendHH")!=null){
%>
var now2 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), <%=request.getAttribute("UTendHH")%>, <%=request.getAttribute("UTendMM")%>, <%=request.getAttribute("UTendSS")%>, 0);
<%}else{%>
var now2 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 18, 0, 0, 0);
<%}%>

<%
if(request.getAttribute("CTstartHH")!=null){
%>
var now3 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), <%=request.getAttribute("CTstartHH")%>, <%=request.getAttribute("CTstartMM")%>, <%=request.getAttribute("CTstartSS")%>, 0);
<%}else{%>
var now3 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 9, 0, 0, 0);
<%}%>
<%
if(request.getAttribute("CTendHH")!=null){
%>
var now4 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), <%=request.getAttribute("CTendHH")%>, <%=request.getAttribute("CTendMM")%>, <%=request.getAttribute("CTendSS")%>, 0);
<%}else{%>
var now4 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 18, 0, 0, 0);
<%}%>

<%
if(request.getAttribute("CEstartHH")!=null){
%>
var now5 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), <%=request.getAttribute("CEstartHH")%>, <%=request.getAttribute("CEstartMM")%>, <%=request.getAttribute("CEstartSS")%>, 0);
<%}else{%>
var now5 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 9, 0, 0, 0);
<%}%>
<%
if(request.getAttribute("CEendHH")!=null){
%>
var now6 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), <%=request.getAttribute("CEendHH")%>, <%=request.getAttribute("CEendMM")%>, <%=request.getAttribute("CEendSS")%>, 0);
<%}else{%>
var now6 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 18, 0, 0, 0);
<%}%>
<%
if(request.getAttribute("CPstartHH")!=null){
%>
var now7 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), <%=request.getAttribute("CPstartHH")%>, <%=request.getAttribute("CPstartMM")%>, <%=request.getAttribute("CPstartSS")%>, 0);
<%}else{%>
var now7 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 9, 0, 0, 0);
<%}%>
<%
if(request.getAttribute("CPendHH")!=null){
%>
var now8 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), <%=request.getAttribute("CPendHH")%>, <%=request.getAttribute("CPendMM")%>, <%=request.getAttribute("CPendSS")%>, 0);
<%}else{%>
var now8 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 18, 0, 0, 0);
<%}%>

          var checkin = $('#dpd1').datepicker({
           format: 'yyyy-mm-dd',
           onRender: function(date) {
            return date.valueOf() < now.valueOf() ? 'disabled' : '';
          }
        }).on('changeDate', function(ev) {
          if (ev.date.valueOf() > checkout.date.valueOf()) {
            var newDate = new Date(ev.date)
            newDate.setDate(newDate.getDate() + 1);
            checkout.setValue(newDate);
          }
          checkin.hide();
          $('#dpd2')[0].focus();
        }).data('datepicker');
        var checkout = $('#dpd2').datepicker({
         format: 'yyyy-mm-dd',
         onRender: function(date) {
          return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
        }
      }).on('changeDate', function(ev) {
		var newDate1 = new Date(ev.date)
            newDate1.setDate(newDate1.getDate() + 1);
            checkin_ct.setValue(newDate1);
        checkout.hide();
		$('#dpd3')[0].focus();
      }).data('datepicker');
	  
      /* jQuery(document).ready(function() {   
        FormValidation.init();
      });
	  
	  choose topic date */
	  var checkin_ct = $('#dpd3').datepicker({
           format: 'yyyy-mm-dd',
           onRender: function(date) {
            return date.valueOf() < checkout.date.valueOf() ? 'disabled' : '';
          }
        }).on('changeDate', function(ev) {
          if (ev.date.valueOf() > checkout_ct.date.valueOf()) {
            var newDate = new Date(ev.date)
            newDate.setDate(newDate.getDate() + 1);
            checkout_ct.setValue(newDate);
          }
          checkin_ct.hide();
          $('#dpd4')[0].focus();
        }).data('datepicker');
		 var checkout_ct = $('#dpd4').datepicker({
         format: 'yyyy-mm-dd',
         onRender: function(date) {
          return date.valueOf() <= checkin_ct.date.valueOf() ? 'disabled' : '';
        }
      }).on('changeDate', function(ev) {
		 var newDate2 = new Date(ev.date)
         newDate2.setDate(newDate2.getDate() + 1);
       	 checkin_ce.setValue(newDate2);
		 
        checkout_ct.hide();
		$('#dpd5')[0].focus();
      }).data('datepicker');
	  
	  //choose examiner 
	  
	  var checkin_ce = $('#dpd5').datepicker({
           format: 'yyyy-mm-dd',
           onRender: function(date) {
            return date.valueOf() < checkout_ct.date.valueOf() ? 'disabled' : '';
          }
        }).on('changeDate', function(ev) {
          if (ev.date.valueOf() > checkout_ce.date.valueOf()) {
            var newDate = new Date(ev.date)
            newDate.setDate(newDate.getDate() + 1);
            checkout_ce.setValue(newDate);
          }
          checkin_ce.hide();
          $('#dpd6')[0].focus();
        }).data('datepicker');
		 var checkout_ce = $('#dpd6').datepicker({
         format: 'yyyy-mm-dd',
         onRender: function(date) {
          return date.valueOf() <= checkin_ce.date.valueOf() ? 'disabled' : '';
        }
      }).on('changeDate', function(ev) {
    	var newDate3 = new Date(ev.date)
        newDate3.setDate(newDate3.getDate() + 1);
    	checkin_cp.setValue(newDate3);
    	
        checkout_ce.hide();
        $('#dpd7')[0].focus();
      }).data('datepicker');
		
	//choose presentation
	
	var checkin_cp = $('#dpd7').datepicker({
           format: 'yyyy-mm-dd',
           onRender: function(date) {
            return date.valueOf() < checkout_ce.date.valueOf() ? 'disabled' : '';
          }
        }).on('changeDate', function(ev) {
          if (ev.date.valueOf() > checkout_cp.date.valueOf()) {
            var newDate = new Date(ev.date)
            newDate.setDate(newDate.getDate() + 1);
            checkout_cp.setValue(newDate);
          }
          checkin_cp.hide();
          $('#dpd8')[0].focus();
        }).data('datepicker');
		 var checkout_cp = $('#dpd8').datepicker({
         format: 'yyyy-mm-dd',
         onRender: function(date) {
          return date.valueOf() <= checkin_cp.date.valueOf() ? 'disabled' : '';
        }
      }).on('changeDate', function(ev) {		 
        checkout_cp.hide();
      }).data('datepicker');
	
	  ///////////////////////////
	  
      $('#starttime').datetimepicker({
        pickDate: false
      });
	  $('#ct_starttime').datetimepicker({
        pickDate: false
      });
	  $('#ce_starttime').datetimepicker({
        pickDate: false
      });
	  $('#cp_starttime').datetimepicker({
	        pickDate: false
	      });
      $('#endtime').datetimepicker({
        pickDate: false
      });
	   $('#ct_endtime').datetimepicker({
        pickDate: false
      });
	   $('#ce_endtime').datetimepicker({
        pickDate: false
      });
	   $('#cp_endtime').datetimepicker({
	        pickDate: false
	      });

      $("#starttime").data('datetimepicker').setLocalDate(now1);
      $("#endtime").data('datetimepicker').setLocalDate(now2);
      
	  $("#ct_starttime").data('datetimepicker').setLocalDate(now3);
	  $("#ct_endtime").data('datetimepicker').setLocalDate(now4);
	  
	  $("#ce_starttime").data('datetimepicker').setLocalDate(now5);
	  $("#ce_endtime").data('datetimepicker').setLocalDate(now6);
	  
	  $("#cp_starttime").data('datetimepicker').setLocalDate(now7);
	  $("#cp_endtime").data('datetimepicker').setLocalDate(now8);
	  
	  
	  var edit=document.getElementById('edit');
	  var edit2=document.getElementById('edit2');
	  var edit3=document.getElementById('edit3');
	  var edit4=document.getElementById('edit4');
	  
	  function btn(){ 
	  	edit.style.display='';
	  	edit2.style.display='none';
	  	edit3.style.display='none';
	  	edit4.style.display='none';
	  }
	  function btn2(){ 
		  	edit.style.display='none';
		  	edit2.style.display='';
		  	edit3.style.display='none';
		  	edit4.style.display='none';
		  }
	  function btn3(){ 
		  	edit.style.display='none';
		  	edit2.style.display='none';
		  	edit3.style.display='';
		  	edit4.style.display='none';
		  }
	  function btn4(){ 
		  	edit.style.display='none';
		  	edit2.style.display='none';
		  	edit3.style.display='none';
		  	edit4.style.display='';
		  }
      </script>
</body>
</html>
