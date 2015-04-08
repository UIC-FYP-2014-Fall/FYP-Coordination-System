<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand"
					href="${pageContext.request.contextPath }/goStudentMain.do">FYP
					Coordination System</a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="#" role="button"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="icon-user"></i> ${studentinfo.name } <i class="caret"></i>

						</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1"
									href="${pageContext.request.contextPath }/changPwd.do?flag=goPwdUi">Settings</a>
								</li>
								<li class="divider"></li>
								<li><a tabindex="-1" data-target="#logout"
									data-toggle="modal" href="">Logout</a></li>
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
			<a href="${pageContext.request.contextPath }/logout.do"
				class="btn btn-danger">Logout</a>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3" id="sidebar">
				<ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
					<li><a
						href="${pageContext.request.contextPath }/goStudentMain.do"><i
							class="icon-chevron-right"></i> Main</a></li>
					<li><a
						href="${pageContext.request.contextPath }/chooseTopic.do?flag=goChooseTopic"><i
							class="icon-chevron-right"></i> Choose Topic</a></li>
					<li><a
						href="${pageContext.request.contextPath }/chooseExaminer.do?flag=goChooseExaminer"><i
							class="icon-chevron-right"></i> Choose Examiner</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath }/choosePretime.do?flag=goChoosePretime"><i
							class="icon-chevron-right"></i> Choose Presentation Time</a></li>
					<li><a
						href="${pageContext.request.contextPath }/changPwd.do?flag=goPwdUi"><i
							class="icon-chevron-right"></i> Settings</a></li>
				</ul>
			</div>
			<!--/span-->
			<div class="span9" id="content">
				<div class="row-fluid">
					<c:if test="${requestScope.timetableStart=='false' }">
						<div class="alert alert-error ErrorInfo">
							<!-- <button type="button" class="close" data-dismiss="alert">&times;</button> -->
							<h4>Note:</h4>
							It is not in the select time
							period.(${requestScope.timetablePeriod })
						</div>
						<%
							request.removeAttribute("timetableStart");
						%>
					</c:if>
					<c:if test="${requestScope.timetableSelected=='false' }">
						<div class="alert alert-error ErrorInfo">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Note:</h4>
							${requestScope.timetableSelectInfo }
						</div>
						<%
							request.removeAttribute("timetableSelected");
							request.removeAttribute("timetableSelectInfo");
						%>
					</c:if>
					<c:if test="${requestScope.timetableSelected=='true' }">
						<div class="alert alert-success SuccessInfo">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Success</h4>
							${requestScope.timetableSelectInfo }
						</div>
						<%
							request.removeAttribute("timetableSelected");
							request.removeAttribute("timetableSelectInfo");
						%>
					</c:if>
					<c:if test="${requestScope.timeHaveBeenSelected=='true' }">
						<div class="alert alert-error ErrorInfo">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h4>Note:</h4>
							${requestScope.timetableSelectInfo }
						</div>
						<%
							request.removeAttribute("timeHaveBeenSelected");
							request.removeAttribute("timetableSelectInfo");
						%>
					</c:if>
					<!-- block -->

					<c:if test="${requestScope.timetableStart=='true' }">
						<div class="block">
							<div class="navbar navbar-inner block-header">
								<div class="muted pull-left">Timetable</div>
								<form name="selectWeek">
									<div class="muted pull-right">
										<select id="select" name="week" id="week"
											onchange="setChange()">
											<%
												ArrayList<String> timeTableTime=(ArrayList<String>)request.getAttribute("timeTableTime");
												String weeks=(String)request.getAttribute("numOfWeek");
	                                      		request.getSession().setAttribute("numOfWeek", weeks);
	                                        	for(int i=1;i<=Integer.parseInt(weeks);i++){
	                                        		out.println("<option value=\""+i+"\">Week"+i+" "+timeTableTime.get(i-1)+"</option>");
	                                        	}
											%>
										</select>
									</div>
								</form>
							</div>

							<div class="block-content collapse in">
								<form name="week" class="form-horizontal"
									action="${pageContext.request.contextPath }/choosePretime.do?flag=updateChooseTopic"
									method="post">
									<%
										String[] timeArray={"9:00-9:30","9:30-10:00","10:00-10:30","10:30-11:00","11:00-11:30","11:30-12:00","14:00-14:30","14:30-15:00","15:00-15:30","15:30-16:00","16:00-16:30","16:30-17:00","17:00-17:30","17:30-18:00"};
                                    	ArrayList<String> timeslots=(ArrayList<String>)request.getAttribute("timeslots");
                                    	System.out.println(timeArray.length);
                                    	String beginWeekDay = (String)request.getAttribute("beginWeekDay");
                                    	String endWeekDay = (String)request.getAttribute("endWeekDay");
                                    	String selectedTimeslot=(String)request.getAttribute("selectedTimeslot");

                                    	for(int week=1;week<=Integer.parseInt(weeks);week++){
                                            if(week==1){
                                                out.println("<table id=\"week"+week+"\" border=\"0\" class=\"table table-bordered\" style='DISPLAY:'>");
                                            }else{
                                    			out.println("<table id=\"week"+week+"\" border=\"0\" class=\"table table-bordered\" style='DISPLAY:none'>");
                                            }
                                    		out.println("<thead>");
                                    		out.println("<tr>");
                                    		out.println("<th>Week"+week+"</th>");
                                    		out.println("<th>Mon</th>");
                                    		out.println("<th>Tue</th>");
                                    		out.println("<th>Wed</th>");
                                    		out.println("<th>Thur</th>");
                                    		out.println("<th>Fri</th>");
                                    		out.println("</tr>");
                                    		out.println("</thead>");
                                    		out.println("<tbody>");
                                    		for(int time=1;time<7;time++){
                                    			out.println("<tr>");
                                    			out.println("<td width=\"150px\">"+timeArray[time-1]+"</td>");
                                    			for(int day=1;day<=5;day++){
                                    				String tempslot=week+","+day+","+time;
                                    				if(timeslots.contains(tempslot)){
                                    					//red
                                    					out.println("<td bgcolor=\"#FF2D2D\"><input type=\"radio\" name=\"timeslot\" value=\""+tempslot+"\"></td>");
                                    				}else{
                                    					if(selectedTimeslot!=null){
                                    						String[] select=selectedTimeslot.split(",");
                                    						if(week==Integer.parseInt(select[0])&&day==Integer.parseInt(select[1])&&time==Integer.parseInt(select[2])){
                                    							//green
                                    							out.println("<td bgcolor=\"#28FF28\"><input type=\"radio\" name=\"timeslot\" value=\""+tempslot+"\" checked=\"checked\"></td>");
                                    						}else if(week==1&&day<Integer.parseInt(beginWeekDay)){
                                								out.println("<td bgcolor=\"#F0F0F0\"><input type=\"radio\" name=\"timeslot\" value=\""+tempslot+"\" disabled=\"disabled\"></td>");
                                							}else if(week==Integer.parseInt(weeks)&&day>Integer.parseInt(endWeekDay)){
                                								out.println("<td bgcolor=\"#F0F0F0\"><input type=\"radio\" name=\"timeslot\" value=\""+tempslot+"\" disabled=\"disabled\"></td>");
                                							}else{
                                								out.println("<td bgcolor=\"#F0F0F0\"><input type=\"radio\" name=\"timeslot\" value=\""+tempslot+"\" disabled=\"disabled\"></td>");
                                							}
                                    					}else{
                                    						if(week==1&&day<Integer.parseInt(beginWeekDay)){
                                								out.println("<td bgcolor=\"#F0F0F0\"><input type=\"radio\" name=\"timeslot\" value=\""+tempslot+"\" disabled=\"disabled\"></td>");
                                							}else if(week==Integer.parseInt(weeks)&&day>Integer.parseInt(endWeekDay)){
                                								out.println("<td bgcolor=\"#F0F0F0\"><input type=\"radio\" name=\"timeslot\" value=\""+tempslot+"\" disabled=\"disabled\"></td>");
                                							}else{
                                								out.println("<td bgcolor=\"#F0F0F0\"><input type=\"radio\" name=\"timeslot\" value=\""+tempslot+"\" disabled=\"disabled\"></td>");
                                							}
                                    					}
                                    				}
                                    			}
                                    			out.println("</tr>");
                                    		}
                                    		out.println("<tr><td colspan=\"6\"></td></tr>");
                                    		for(int time=7;time<14;time++){
                                    			out.println("<tr>");
                                    			out.println("<td width=\"150px\">"+timeArray[time-1]+"</td>");
                                    			for(int day=1;day<=5;day++){
                                    				String tempslot=week+","+day+","+time;
                                    				if(timeslots.contains(tempslot)){	
                                    					//red
                                    					out.println("<td  bgcolor=\"#FF2D2D\"><input type=\"radio\" name=\"timeslot\" value=\""+tempslot+"\"></td>");
                                    				}else{
                                    					if(selectedTimeslot!=null){
                                    						String[] select=selectedTimeslot.split(",");
                                    						if(week==Integer.parseInt(select[0])&&day==Integer.parseInt(select[1])&&time==Integer.parseInt(select[2])){
                                    							//green
                                    							out.println("<td bgcolor=\"#28FF28\"><input type=\"radio\" name=\"timeslot\" value=\""+tempslot+"\" checked=\"checked\"></td>");
                                    						}else if(week==1&&day<Integer.parseInt(beginWeekDay)){
                                								out.println("<td bgcolor=\"#F0F0F0\"><input type=\"radio\" name=\"timeslot\" value=\""+tempslot+"\" disabled=\"disabled\"></td>");
                                							}else if(week==Integer.parseInt(weeks)&&day>Integer.parseInt(endWeekDay)){
                                								out.println("<td bgcolor=\"#F0F0F0\"><input type=\"radio\" name=\"timeslot\" value=\""+tempslot+"\" disabled=\"disabled\"></td>");
                                							}else{
                                								out.println("<td bgcolor=\"#F0F0F0\"><input type=\"radio\" name=\"timeslot\" value=\""+tempslot+"\" disabled=\"disabled\"></td>");
                                							}
                                    					}else{
                                    						if(week==1&&day<Integer.parseInt(beginWeekDay)){
                                								out.println("<td bgcolor=\"#F0F0F0\"><input type=\"radio\" name=\"timeslot\" value=\""+tempslot+"\" disabled=\"disabled\"></td>");
                                							}else if(week==Integer.parseInt(weeks)&&day>Integer.parseInt(endWeekDay)){
                                								out.println("<td bgcolor=\"#F0F0F0\"><input type=\"radio\" name=\"timeslot\" value=\""+tempslot+"\" disabled=\"disabled\"></td>");
                                							}else{
                                								out.println("<td bgcolor=\"#F0F0F0\"><input type=\"radio\" name=\"timeslot\" value=\""+tempslot+"\" disabled=\"disabled\"></td>");
                                							}
                                    					}
                                    				}
                                    			}
                                    			out.println("</tr>");
                                    		}
                                    		out.println("</table>");
                                    	}
									%>
									<div class="form-actions">
										<button type="submit" class="btn btn-primary">Submit</button>

									</div>
								</form>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!--/.fluid-container-->
	<script src="vendors/jquery-1.9.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/scripts.js"></script>
	<script>
		function setChange() {
			if (document.selectWeek.select.value == "1") {
				document.all.week1.style.display = "";
			} else {
				document.all.week1.style.display = "none";
			}
			if (document.selectWeek.select.value == "2") {
				document.all.week2.style.display = "";
			} else {
				document.all.week2.style.display = "none";
			}
			if (document.selectWeek.select.value == "3") {
				document.all.week3.style.display = "";
			} else {
				document.all.week3.style.display = "none";
			}
		}
	</script>
</body>
</html>
