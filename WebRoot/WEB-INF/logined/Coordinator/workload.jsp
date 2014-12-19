<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
						<li><a href="${pageContext.request.contextPath }/openTime.do?flag=goUi"><i class="icon-chevron-right"></i>
								Set Open Time</a></li>
						<li class="active"><a href="${pageContext.request.contextPath }/setWorkload.do?flag=goUi"><i class="icon-chevron-right"></i>
								Set Workload</a></li>
						<li><a href="${pageContext.request.contextPath }/preTime.do?flag=goPreTimeUi"><i class="icon-chevron-right"></i>
								Set Pre Time</a></li>
						<li><a href="${pageContext.request.contextPath }/export.do?flag=goExportUi"><i class="icon-chevron-right"></i>
								Export</a></li>				
						<li><a href="${pageContext.request.contextPath }/clearProject.do?flag=goClearProjectUi"><i
								class="icon-chevron-right"></i> Clear Project</a></li>
						<li><a href="${pageContext.request.contextPath }/changPwd.do?flag=goPwdUi"><i class="icon-chevron-right"></i>
								Change Password</a></li>
                    </ul>
                </div>
                 <!--/span-->
                <div class="span9" id="content">
                     <div class="row-fluid">
                        <c:if test="${SaveWorkloadOperation=='success'}">
      					<div class="alert alert-success SuccessInfo">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
            				<h4>Success</h4>
            					Save workload operation completed successfully
        					</div>
      				</c:if>
      				<c:if test="${SaveWorkloadOperation=='error'}">
      					<div class="alert alert-error ErrorInfo">
          					<button type="button" class="close" data-dismiss="alert">&times;</button>
          					<h4>Error</h4>
          					Save workload operation failed!
       						</div>
      				</c:if>
                            <!-- block -->
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">Set Workload</div>
                                </div>
                                <div class="block-content collapse in">
                                
                                <form action="${pageContext.request.contextPath }/setWorkload.do?flag=saveWorkload" method="post">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Teacher</th>
                                                <th>Supervisor</th>
                                                <th>Observer</th>
                                                <th>Examiner Workload</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${teacherList }" var="teacher" varStatus="status">
                                        <tr>
                                        	<td>${status.index + 1}</td>
                                            <td>${teacher.name }</td>
                                            <td>${teacher.numOfsupervisor}</td>
                                            <td>${teacher.numOfobserver }</td>
                                            <td>
                                            	<select name="workload" class="input-small">                                       	
                                                          <option value="${teacher.tid },1" <c:if test="${teacher.workload=='1' }">selected</c:if> >1</option>
                                                          <option value="${teacher.tid },2" <c:if test="${teacher.workload=='2' }">selected</c:if> >2</option>
                                                          <option value="${teacher.tid },3" <c:if test="${teacher.workload=='3' }">selected</c:if> >3</option>
                                                          <option value="${teacher.tid },4" <c:if test="${teacher.workload=='4' }">selected</c:if> >4</option>
                                                          <option value="${teacher.tid },5" <c:if test="${teacher.workload=='5' }">selected</c:if> >5</option>
                                                </select>
                                           	</td>
                                        </tr>
                                        </c:forEach>                              
                                        </tbody>
                                    </table>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    </form>
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
</body>
</html>