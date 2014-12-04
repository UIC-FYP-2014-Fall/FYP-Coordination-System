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
                    <a class="brand" href="${pageContext.request.contextPath }/goStudentMain.do">FYP Coordination System</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i> ${studentinfo.name } <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" data-target="#logout" data-toggle="modal">Logout</a>
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
                        <li class="active">
                            <a href="${pageContext.request.contextPath }/chooseTopic.do?flag=goChooseTopic"><i class="icon-chevron-right"></i> Choose Topic</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/chooseExaminer.do?flag=goChooseExaminer"><i class="icon-chevron-right"></i> Choose Examiner</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/choosePretime.do?flag=goChoosePretime"><i class="icon-chevron-right"></i> Choose Presentation Time</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/changPwd.do?flag=goPwdUi"><i class="icon-chevron-right"></i> Change Password</a>
                        </li>
                    </ul>
                </div>
                <div class="span9" id="content">
                     <div class="row-fluid">
                        
                            <!-- block -->								                   		
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">Choose Topic</div>                                  
                                </div>
                                <div class="block-content collapse in">
                                    <table  cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered"  id="topicTable">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Title</th>
                                                <th>Supervisor</th>
                                                <th>Group/Individual</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td><a href="#topic1" data-toggle="modal">FYP Coordination System</a></td>
                                                <td>Judy Feng</td>
                                                <td>Group</td>
                                                <td>
                                                    <a class="btn btn-primary btn-mini" data-placement="left" href="#groupinfo" data-toggle="modal">Select</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td><a href="#topic2" data-toggle="modal">C Assignments Grading System</a></td>
                                                <td>Judy Feng</td>
                                                <td>Individual</td>
                                                <td>
                                                    <a class="btn btn-primary btn-mini" data-toggle="confirmation-singleton" data-placement="left" onclick="location.href=''">Select</a>    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td><a href="#topic3" data-toggle="modal">A Test Case Management System</a></td>
                                                <td>Judy Feng</td>
                                                <td>Individual</td>
                                                <td>
                                                    <span class="label label-important">Full</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td><a href="#topic4" data-toggle="modal">Evaluation of Commercial Testing Tools</a></td>
                                                <td>Judy Feng</td>
                                                <td>Individual</td>
                                                <td>
                                                    <a class="btn btn-primary btn-mini" data-toggle="confirmation-singleton" data-placement="left" onclick="location.href=''">Select</a>
                                                </td>
                                            </tr>                                      
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                    </div>
                </div>
              </div>
              <hr>
              
              <div class="modal hide fade" id="topic1">
              	<div class="modal-header">
                    <a href="#" class="close" data-dismiss="modal"><i class="icon-remove"></i></a>
                    <h4>FYP Coordination System</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <td>FYP Coordination System</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><strong>Supervisor</strong></td>
                                    <td>Judy Feng</td>
                                </tr>
                                <tr>
                                    <td><strong>Credits</strong></td>
                                     <td>3 (can be extended to 6 credits)</td>
                                </tr>
                                <tr>
                                    <td><strong>No. of Students</strong></td>
                                    <td>3</td>
                                    </tr>
                                <tr>
                                    <td><strong>Individual/Group</strong></td>
                                    <td>Group</td>
                                </tr>
                                <tr>
                                    <td><strong>Prerequisites</strong></td>
                                    <td>Nil</td>
                                </tr>
                                <tr>
                                    <td><strong>Description</strong></td>
                                    <td>This project is to develop an online FYP coordination system to facilitate the management of FYP work. This system will mainly help students to select the project topics, choose examiner and mark the available time for the presentation. The teachers can use this system to input the project topics, approve students' application, mark the available time and do some set up job. The system should be able to create the presentation time for students and teachers. </td>
                                </tr>       
                            </tbody>
                        </table>
                    </form>
                </div>
                <div class="modal-footer">
                    
                </div>
            </div>
            
            <div class="modal hide fade" id="topic2">
                <div class="modal-header">
                    <a href="#" class="close" data-dismiss="modal"><i class="icon-remove"></i></a>
                    <h4>FYP Coordination System</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <td>C Assignments Grading System</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><strong>Supervisor</strong></td>
                                    <td>Judy Feng</td>
                                </tr>
                                <tr>
                                    <td><strong>Credits</strong></td>
                                     <td>3</td>
                                </tr>
                                <tr>
                                    <td><strong>No. of Students</strong></td>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td><strong>Prerequisites</strong></td>
                                    <td>Nil</td>
                                </tr>
                                <tr>
                                    <td><strong>Individual/Group</strong></td>
                                    <td>Individual</td>
                                </tr> 
                                <tr>
                                    <td><strong>Description</strong></td>
                                    <td>In the last semester, a student has already finished this job in using c language. In this semester. The project in this semester is to upgrade the project in C into C++ with the GUI interface. The main job is to be able to import the C assignments, compile and run and compare with the standard answer input by TA. </td>
                                </tr>       
                            </tbody>
                        </table>
                    </form>
                </div>
                <div class="modal-footer">
                    
                </div>
            </div>

            <div class="modal hide fade" id="topic3">
                <div class="modal-header">
                    <a href="#" class="close" data-dismiss="modal"><i class="icon-remove"></i></a>
                    <h4>FYP Coordination System</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <td>A Test Case Management System</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><strong>Supervisor</strong></td>
                                    <td>Judy Feng</td>
                                </tr>
                                <tr>
                                    <td><strong>Credits</strong></td>
                                     <td>3</td>
                                </tr>
                                <tr>
                                    <td><strong>No. of Students</strong></td>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td><strong>Prerequisites</strong></td>
                                    <td>Nil</td>
                                </tr>
                                <tr>
                                    <td><strong>Individual/Group</strong></td>
                                    <td>Individual</td>
                                </tr> 
                                <tr>
                                    <td><strong>Description</strong></td>
                                    <td>This system is to develop a management system to manage all the test cases used in some experiments. This system should be able to add, remove and retrieve the test case and their history.  </td>
                                </tr>       
                            </tbody>
                        </table>
                    </form>
                </div>
                <div class="modal-footer">
                    
                </div>
            </div>

            <div class="modal hide fade" id="topic4">
                <div class="modal-header">
                    <a href="#" class="close" data-dismiss="modal"><i class="icon-remove"></i></a>
                    <h4>FYP Coordination System</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <td>Evaluation of Commercial Testing Tools</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><strong>Supervisor</strong></td>
                                    <td>Judy Feng</td>
                                </tr>
                                <tr>
                                    <td><strong>Credits</strong></td>
                                     <td>3</td>
                                </tr>
                                <tr>
                                    <td><strong>No. of Students</strong></td>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <td><strong>Prerequisites</strong></td>
                                    <td>Nil</td>
                                </tr>
                                <tr>
                                    <td><strong>Individual/Group</strong></td>
                                    <td>Individual</td>
                                </tr> 
                                <tr>
                                    <td><strong>Description</strong></td>
                                    <td>This project is to evaluate some commercial testing tools available in the market and compare them. The objective of this project is to let students have a brief view of marketing tools and learn how to choose the right tools for a company. The evaluated tools should not be chosen by previous graduate students. </td>
                                </tr>       
                            </tbody>
                        </table>
                    </form>
                </div>
                <div class="modal-footer">
                </div>
            </div>
            
            
            
            <div class="modal hide fade" id="groupinfo">
            	<form class="form-horizontal" id="form_sample_1">
	                <div class="modal-header">
	                    <a href="#" class="close" data-dismiss="modal"><i class="icon-remove"></i></a>
	                    <h4>Team Infomation</h4>
	                </div>
	                <div class="modal-body">   
	                    <div class="control-group">
	                    	<label class="control-label"><strong>Team Leader</strong><span class="required">*</span></label>
	  						<div class="controls">
	  							<input name="digits" type="text" placeholder="Please input Student ID">	  							
	  						</div>   	
	                    </div>
	                    <div class="control-group">
	                    	<label class="control-label"><strong>Team Member</strong><span class="required">*</span></label>
	  						<div class="controls">
	  							<input name="digits" type="text" placeholder="Please input Student ID">
	  						</div>   	
	                    </div>   
	                    <div class="control-group">	               
	  						<div class="controls">
	  							<input name="digits" type="text" placeholder="Please input Student ID">
	  						</div>   	
	                    </div>                             
	                </div>
	                <div class="modal-footer">
	                	<button type="submit" class="btn btn-primary">Submit</button>   
	                </div>
	        	</form>
            </div>
              
         </div>
<!--/.fluid-container-->
        <script src="vendors/jquery-1.9.1.min.js"></script> 
        <script src="bootstrap/js/bootstrap.min.js"></script>       
        <script src="vendors/datatables/js/jquery.dataTables.min.js"></script>      
        <script src="assets/scripts.js"></script> 
        <script src="assets/DT_bootstrap.js"></script>   
        <script type="text/javascript" src="vendors/jquery-validation/dist/jquery.validate.min.js"></script> 
        <script src="assets/form-validation.js"></script> 
        
        		
</body>
</html>