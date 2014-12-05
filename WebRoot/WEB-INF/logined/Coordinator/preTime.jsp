<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


<link href="bootstrap/css/datepicker.css" rel="stylesheet"
	type="text/css">
<link href="bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet"
	type="text/css">

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
                         <li>
                            <a href="${pageContext.request.contextPath }/goUI.do"><i class="icon-chevron-right"></i> Main</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/goManageAccountUi.do?flag=goUi"><i class="icon-chevron-right"></i> Manage Account</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/export.do?flag=goExportUi"><i class="icon-chevron-right"></i> Export</a>
                        </li>
                        <li  class="active">
                            <a href="${pageContext.request.contextPath }/preTime.do?flag=goPreTimeUi"><i class="icon-chevron-right"></i> Set Pre Time</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/quota.do?flag=goUi"><i class="icon-chevron-right"></i> Set Quota</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/openTime.do?flag=goUi"><i class="icon-chevron-right"></i> Set Open Time</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/setWorkload.do?flag=goUi"><i class="icon-chevron-right"></i> Set Workload</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/clearProject.do?flag=goClearProjectUi"><i class="icon-chevron-right"></i> Clear Project</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/changPwd.do?flag=goPwdUi"><i class="icon-chevron-right"></i> Change Password</a>
                        </li>
                    </ul>
                </div>
                 <!--/span-->
    <div class="span9" id="content">
      <div class="row-fluid">
      
        <c:if test="${PreTimeOperation=='success'}">
      	<div class="alert alert-success SuccessInfo">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Success</h4>
            The operation completed successfully
        </div>
      </c:if>
      <c:if test="${PreTimeOperation=='error'}">
      	<div class="alert alert-error ErrorInfo">
          <button type="button" class="close" data-dismiss="alert">&times;</button>
          <h4>Error</h4>
          The operation failed! Presentation start or end time error! Please check.
       	</div>
      </c:if>
      
          <!-- block -->
          <div class="block">
            <div class="navbar navbar-inner block-header">
              <div class="muted pull-left">Set Presentation Time</div>
            </div>
            <div class="block-content collapse in">
            <div class="span12">
            <c:if test="${PreDateTime=='true' }">
            	<div class="alert alert-info">
					<p>From: <strong>${PreStartDateTime }</strong></p>
					<p>To:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>${PreEndDateTime }</strong>.</p>
					<p>Click <a href="#edit" onclick="btn()">here</a> to change.</p>
				</div>
				<div id="edit" style="display:none;">
					<!-- BEGIN FORM-->
              <form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/preTime.do?flag=setPreTime" id="form_sample_1">
              <fieldset>
                <legend>Change Presentation Time</legend>

                <div class="alert alert-error hide">
                  <button class="close" data-dismiss="alert"></button>
                  Error! Please check.
                </div>
          
                <div class="control-group">
                  <label class="control-label">From</label>
                  <div class="controls">
                  
                  	<div class="input-prepend">
                    	<span class="add-on"><i class="icon-calendar"></i></span>
                    	<input type="text" name="startDate" data-required="1" class="span10" value='<c:if test="${startDate!=null }">${startDate }</c:if>' id="dpd1" readonly>
                    </div>
                    <div id="starttime" class="input-append">
    					<input data-format="hh:mm:ss" name="startTime" type="text" class="span5" readonly></input>
    					<span class="add-on">
      						<i data-time-icon="icon-time" data-date-icon="icon-calendar">
      						</i>
    					</span>
  					</div>
                    
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">To</label>
                  <div class="controls">
                 	<div class="input-prepend">
                  		<span class="add-on"><i class="icon-calendar"></i></span>
                    	<input type="text" name="endDate" class="span10" value="<c:if test="${endDate!=null }">${endDate }</c:if>" id="dpd2" readonly />
                   	</div>
                    <div id="endtime" class="input-append">
    					<input data-format="hh:mm:ss" name="endTime" type="text" class="span5" readonly></input>
    					<span class="add-on">
      						<i data-time-icon="icon-time" data-date-icon="icon-calendar">
      						</i>
    					</span>
  					</div>
                  </div>
                </div>
                <div class="form-actions">
                  <button type="submit" class="btn btn-primary">Submit</button>
                  <button type="reset" class="btn">Reset</button>
                </div>
                </fieldset>
              </form>
			</div>
            </c:if>
            <c:if test="${PreDateTime=='false' }">
            	<c:if test="${OpenTime=='true' }">
            		<div class="alert alert-error alert-block">
					<h4 class="alert-heading">Error!</h4>
					<p>System open time is not completed. Please check <a href="${pageContext.request.contextPath }/openTime.do?flag=goUi">here</a> to set up.</p>
				</div>
            	</c:if>
            <c:if test="${OpenTime=='false' }">
            <!-- BEGIN FORM-->
              <form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/preTime.do?flag=setPreTime" id="form_sample_1">
              <fieldset>
                <legend>Presentation Time</legend>

                <div class="alert alert-error hide">
                  <button class="close" data-dismiss="alert"></button>
                  You have some form errors. Please check below.
                </div>
          
                <div class="control-group">
                  <label class="control-label">From</label>
                  <div class="controls">
                  
                  	<div class="input-prepend">
                    	<span class="add-on"><i class="icon-calendar"></i></span>
                    	<input type="text" name="startDate" data-required="1" class="span10" value='' id="dpd1" readonly>
                    </div>
                    <div id="starttime" class="input-append">
    					<input data-format="hh:mm:ss" name="startTime" type="text" class="span5" readonly></input>
    					<span class="add-on">
      						<i data-time-icon="icon-time" data-date-icon="icon-calendar">
      						</i>
    					</span>
  					</div>
                    
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">To</label>
                  <div class="controls">
                 	<div class="input-prepend">
                  		<span class="add-on"><i class="icon-calendar"></i></span>
                    	<input type="text" name="endDate" class="span10" value="<c:if test="${endDate!=null }">${endDate }</c:if>" id="dpd2" readonly />
                   	</div>
                    <div id="endtime" class="input-append">
    					<input data-format="hh:mm:ss" name="endTime" type="text" class="span5" readonly></input>
    					<span class="add-on">
      						<i data-time-icon="icon-time" data-date-icon="icon-calendar">
      						</i>
    					</span>
  					</div>
                  </div>
                </div>
                <div class="form-actions">
                  <button type="submit" class="btn btn-primary">Submit</button>
                  <button type="reset" class="btn">Reset</button>
                </div>
                </fieldset>
              </form>
              </c:if>
              </c:if>
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
<script src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>


<script src="bootstrap/js/bootstrap-datepicker.js"></script>
<script src="bootstrap/js/bootstrap-datetimepicker.min.js"></script>



<script>
var nowTemp = new Date();
var now = new Date(<%=request.getAttribute("CEyear")%>, <%=request.getAttribute("CEmonth")%>, <%=request.getAttribute("CEday")%>, 0, 0, 0, 0);
<%
	if(request.getAttribute("startHH")!=null){
%>
var now1 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), <%=request.getAttribute("startHH")%>, <%=request.getAttribute("startMM")%>, <%=request.getAttribute("startSS")%>, 0);
<%}else{%>
var now1 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 9, 0, 0, 0);
<%}%>
<%
	if(request.getAttribute("endHH")!=null){
%>
var now2 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), <%=request.getAttribute("endHH")%>, <%=request.getAttribute("endMM")%>, <%=request.getAttribute("endSS")%>, 0);
<%}else{%>
var now2 = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 18, 0, 0, 0);
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
          checkout.hide();
        }).data('datepicker');
jQuery(document).ready(function() {   
	   FormValidation.init();
	});
$('#starttime').datetimepicker({
    pickDate: false
});
$('#endtime').datetimepicker({
    pickDate: false
});

$("#starttime").data('datetimepicker').setLocalDate(now1);
$("#endtime").data('datetimepicker').setLocalDate(now2);

var edit=document.getElementById('edit');
function btn(){ 
	edit.style.display='';
}
</script>
</body>
</html>