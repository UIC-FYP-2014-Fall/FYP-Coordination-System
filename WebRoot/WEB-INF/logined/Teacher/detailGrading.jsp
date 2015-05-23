<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.uic.domain.AssessItem"%>
<%@ page import="com.uic.domain.Student"%>
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
<link href="vendors/easypiechart/jquery.easy-pie-chart.css"
	rel="stylesheet" media="screen">
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
				</a> <a class="brand" href="index.html">FYP Coordination System</a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" role="button"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="icon-user"></i> Teacher <i class="caret"></i>

						</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="login.html">Logout</a></li>
							</ul></li>
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
					<li><a href="${pageContext.request.contextPath }/printAssessmentTable.do"><i
							class="icon-chevron-right"></i> Print Assessment Table</a></li>
					<li class="active"><a href="${pageContext.request.contextPath }/grading.do?flag=goGradingUI"><i class="icon-chevron-right"></i>
							Grading</a></li>
				</ul>
			</div>


			<%
				String record = (String)request.getAttribute("record");
				String[] gradeLevel = {"A","A-","B+","B","B-","C+","C","C-","D","F"};
				HashMap<String, String> sgMap = null;
				if(record == "hasRecord"){
					System.out.println("detail grading has record");
					sgMap = (HashMap<String, String>)request.getAttribute("grade");
				}
				ArrayList<AssessItem> assessItemslist = (ArrayList<AssessItem>)request.getAttribute("assementItemList");
				Student curStudent = (Student)request.getAttribute("curStudent");
				
			
			%>
			<!--/span-->
			<div class="span9" id="content">
				<div class="row-fluid">
					<!-- block -->

					
					
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<ul class="breadcrumb">
								<i class="icon-chevron-left hide-sidebar"><a href='#'
									title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
								<i class="icon-chevron-right show-sidebar" style="display:none;"><a
									href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
								<li><a href="Grading.html">Student List</a> <span
									class="divider">/</span></li>
								<li class="active">Edit Grade</li>
							</ul>
						</div>
						<div class="block-content collapse in">
							<!-- <form>
                                    <legend></legend>
                                        <table cellpadding="10">
                                            <tr>
                                                <td>Name</td>
                                                <td><strong>Deng Weiyilang</strong></td>
                                                <td>Student ID</td>
                                                <td><strong>1130300009</strong></td>
                                            </tr>                                             
                                            <tr>  
                                                <td><label class="control-label">Attitude</label></td>
                                                <td>                                
                                                    <select id="as1" class="">
                                                        <option>A</option>
                                                        <option>A-</option>
                                                        <option>B+</option>
                                                        <option>B</option>
                                                        <option>B-</option>
                                                        <option>C+</option>
                                                        <option>C</option>
                                                        <option>C-</option>
                                                        <option>D</option>
                                                        <option>F</option>
                                                    </select>                            
                                                </td>
                                                <td><label class="control-label">Literature</label></td>
                                                <td>
                                                    <select id="as2">
                                                            <option>A</option>
                                                            <option>A-</option>
                                                            <option>B+</option>
                                                            <option>B</option>
                                                            <option>B-</option>
                                                            <option>C+</option>
                                                            <option>C</option>
                                                            <option>C-</option>
                                                            <option>D</option>
                                                            <option>F</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><label class="control-label">Report</label></td>
                                                <td>
                                                
                                                        <select id="as3">
                                                            <option>A</option>
                                                            <option>A-</option>
                                                            <option>B+</option>
                                                            <option>B</option>
                                                            <option>B-</option>
                                                            <option>C+</option>
                                                            <option>C</option>
                                                            <option>C-</option>
                                                            <option>D</option>
                                                            <option>F</option>
                                                        </select>
               
                                                </td>
                                                <td><label class="control-label">Presentation</label></td>
                                                <td>                                 
                                                        <select id="">
                                                            <option>A</option>
                                                            <option>A-</option>
                                                            <option>B+</option>
                                                            <option>B</option>
                                                            <option>B-</option>
                                                            <option>C+</option>
                                                            <option>C</option>
                                                            <option>C-</option>
                                                            <option>D</option>
                                                            <option>F</option>
                                                        </select>                                 
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="form-actions">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                            <button type="reset" class="btn">Reset</button>
                                        </div>    
                                    </form> -->

							<form class="form-horizontal" action="${pageContext.request.contextPath }/grading.do?flag=editGrade"" method="post">
								<fieldset>
								<%
									out.println("<input  style=\"display:none;\" type=\"text\" name=\"studentID\" value=\""+curStudent.getSid()+"\">");
									for(AssessItem assessItem:assessItemslist){
										out.println("<div class=\"control-group\">");
										out.println("<label class=\"control-label\">"+assessItem.getName()+"</label>");
										out.println("<div class=\"controls\">");
										out.println("<select name=\""+assessItem.getName()+"\"class=\"input-xlarge\">");
										if(record != "hasRecord"){
											System.out.println(record +"  not match has Record");
											for(String gl:gradeLevel){
												out.println("<option value=\""+gl+"\">"+gl+"</option>");
											}
											
										}else{
											System.out.println(record +" match has Record");
											for(String gl:gradeLevel){
												System.out.print(sgMap.get(assessItem.getName())+" "+gl);
												if(sgMap.get(assessItem.getName()).equals(gl)){
													System.out.println("  match");
													out.println("<option selected value=\""+gl+"\">"+gl+"</option>");
												}else{
													System.out.println("  not match");
													out.println("<option value=\""+gl+"\">"+gl+"</option>");
												}
											}
										}
										out.println("</select>");
										out.println("<iframe id=\"tmp_downloadhelper_iframe\" style=\"display: none;\"></iframe>");
										out.println("</div>");
										out.println("</div>");
									}
								
								%>
									<div class="form-actions">
										<button type="submit" class="btn btn-primary">Submit</button>
										<button class="btn" onclick="location.href='${pageContext.request.contextPath }/grading.do?flag=goGradingUI'">Back</button>
									</div>
									
								</fieldset>
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