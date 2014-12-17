<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.uic.domain.Topic"%>
<%@ page import="com.uic.domain.Student"%>
<!DOCTYPE html>
<html class="no-js">
    
    <head>
        <title>FYP Coordination System</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="assets/styles.css" rel="stylesheet" media="screen">
        <link href="assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
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
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="index.html">FYP Coordination System</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i> Student <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="login.html">Logout</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>                       
                    </div>
                    <!--/.nav-collapse -->
                </div>
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
                
                <!--/span-->

                <div class="span9" id="content">
                    <div class="row-fluid">
                        <div class="span6">
                            <!-- block -->								                   		
                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                     <ul class="breadcrumb">
                                        <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
                                        <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
                                        <li>
                                            <a href="chooseTopic.html">Choose Topic</a> <span class="divider">/</span>    
                                        </li>                                       
                                        <li class="active">Group Member Information</li>
                                    </ul>                                   
                                </div>
                                <div class="block-content collapse in">
                                    <div class="span12">
                                        <form action="${pageContext.request.contextPath }/chooseTopic.do?flag=selectGroupTopic" method="post" form-horizontal">
                                        <%
                                        	Topic topic = (Topic)request.getAttribute("topic");
                                       		ArrayList<Student> allStudentList= (ArrayList<Student>)request.getAttribute("allStudentList");
                                       		Student curStu=(Student)request.getAttribute("curStudent");
                                        	out.println("<legend>"+topic.getTitle()+"</legend>");
                                        	out.println("<div class=\"control-group\">");
                                        	out.println("<label class=\"control-label\" for=\"select01\">Member</label>");
                                        	out.println("<div class=\"controls\"><input value=\""+curStu.getSid()+"\"type=\"text\" class=\"m-wrap\" readonly=\"readonly\"></div>");
                                        	out.println("<input type=\"hidden\" name=\"member\"value=\""+curStu.getId()+"\"/>");
                                        	out.println("</div>");
                                        	out.println("<input type=\"hidden\" name=\"topicId\"value=\""+topic.getFid()+"\"/>");
                                        	for(int i=0;i<topic.getNumOfStudent();i++){
                                        		out.println("<div class=\"control-group\">");
                                        		out.println("<label class=\"control-label\" for=\"select01\">Member</label>");
                                        		out.println("<div class=\"controls\">");
                                        		out.println("<select name=\"member\"id=\"select01\" class=\"chzn-select\">");
                                        		for(int j=0; j<allStudentList.size(); j++){
                                        			if(allStudentList.get(j).getSid().equals(curStu.getSid())){
                                        				//do not print
                                        			}else{
                                        				out.println("<option value=\""+allStudentList.get(j).getId()+"\">"+allStudentList.get(j).getSid()+" "+allStudentList.get(j).getName()+"</option>");
                                        			}
                                        		}
                                        		out.println("</select></div></div>");
                                        	}
                                        
                                        %>
                                            <div class="form-actions">
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                                <button type="reset" class="btn">Cancel</button>
                                            </div>
                                        </form>      
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
        <link href="vendors/uniform.default.css" rel="stylesheet" media="screen">
        <link href="vendors/chosen.min.css" rel="stylesheet" media="screen">
        <script src="vendors/jquery-1.9.1.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/jquery.uniform.min.js"></script>
        <script src="vendors/chosen.jquery.min.js"></script>
        <script type="text/javascript" src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>
        <script src="assets/form-validation.js"></script>           
        <script src="assets/scripts.js"></script>
        <script>
        jQuery(document).ready(function() {   
           FormValidation.init();
        });
        
        $(function() {
            $(".chzn-select").chosen();
        });
        </script>
    </body>
</html>