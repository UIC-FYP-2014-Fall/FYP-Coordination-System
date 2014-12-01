<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
    <head>
        <title>FYP Coordination System</title>
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
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
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="index.html">FYP Coordination System</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i> Teacher <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="${pageContext.request.contextPath }/logout.do">Logout</a>
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
                            <a href="${pageContext.request.contextPath }/goUI.do"><i class="icon-chevron-right"></i> Main</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/teacherPageControl.do?flag=uploadTopic"><i class="icon-chevron-right"></i> Upload Topic</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/teacherPageControl.do?flag=topicList"><i class="icon-chevron-right"></i> Topic List</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/teacherPageControl.do?flag=chooseObserver"><i class="icon-chevron-right"></i> Choose Observer</a>
                        </li>
                        <li class="active">
                            <a href="${pageContext.request.contextPath }/teacherPageControl.do?flag=timetable"><i class="icon-chevron-right"></i> Timetable</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/teacherPageControl.do?flag=changePwd"><i class="icon-chevron-right"></i> Change Password</a>
                        </li>
                    </ul>
                </div>
                
                <!--/span-->
                <div class="span9" id="content">
                     <div class="row-fluid">
                            <!-- block -->
                            <div class="block">
                                
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">Timetable</div>
                                    <form name="selectWeek">
                                   	<div class="muted pull-right">
                                        <select id="select" name="week" id="week" onchange="setChange()">
                                        <%
                                       		String weeks=(String)request.getAttribute("numOfWeek");
                                      		request.getSession().setAttribute("numOfWeek", weeks);
                                        	for(int i=1;i<=Integer.parseInt(weeks);i++){
                                        		out.println("<option value=\""+i+"\">Week"+i+"</option>");
                                        	}
                                        %>
                                        </select>
                                     </div>
                                     </form>
                                </div>

                                <div class="block-content collapse in">
                                    <form name="week" class="form-horizontal" action="${pageContext.request.contextPath }/timetable.do" method="post">
                                    <%
                                    	String[] timeArray={"9:00-9:50","10:00-10:50","11:00-11:50","14:00-14:50","15:00-15:50","16:00-16:50","17:00-17:50"};
                                    	ArrayList<String> timeslots=(ArrayList<String>)request.getAttribute("timeslots");
                                    	System.out.println(timeArray.length);
                                    	for(int week=1;week<=Integer.parseInt(weeks);week++){
                                            if(week==1){
                                                out.println("<table id=\"week"+week+"\" border=\"0\" class=\"table table-striped table-bordered\" style='DISPLAY:block'>");
                                            }else{
                                    			out.println("<table id=\"week"+week+"\" border=\"0\" class=\"table table-striped table-bordered\" style='DISPLAY:none'>");
                                            }
                                    		out.println("<thead>");
                                    		out.println("<tr>");
                                    		out.println("<th>week"+week+"</th>");
                                    		out.println("<th>Mon</th>");
                                    		out.println("<th>Tue</th>");
                                    		out.println("<th>Wed</th>");
                                    		out.println("<th>Thur</th>");
                                    		out.println("<th>Fri</th>");
                                    		out.println("</tr>");
                                    		out.println("</thead>");
                                    		out.println("<tbody>");
                                    		for(int time=1;time<4;time++){
                                    			out.println("<tr>");
                                    			out.println("<td width=\"150px\">"+timeArray[time-1]+"</td>");
                                    			for(int day=1;day<=5;day++){
                                    				String tempslot=week+","+day+","+time;
                                    				if(timeslots.contains(tempslot)){
                                    					out.println("<td><input type=\"checkbox\" name=\"timeslot\" value=\""+tempslot+"\" checked=\"checked\"></td>");
                                    				}else{
                                    					out.println("<td><input type=\"checkbox\" name=\"timeslot\" value=\""+tempslot+"\"></td>");
                                    				}
                                    			}
                                    			out.println("</tr>");
                                    		}
                                    		out.println("<tr><td colspan=\"6\"></td></tr>");
                                    		for(int time=4;time<8;time++){
                                    			out.println("<tr>");
                                    			out.println("<td width=\"150px\">"+timeArray[time-1]+"</td>");
                                    			for(int day=1;day<=5;day++){
                                    				String tempslot=week+","+day+","+time;
                                    				if(timeslots.contains(tempslot)){
                                    					out.println("<td><input type=\"checkbox\" name=\"timeslot\" value=\""+tempslot+"\" checked=\"checked\"></td>");
                                    				}else{
                                    					out.println("<td><input type=\"checkbox\" name=\"timeslot\" value=\""+tempslot+"\"></td>");
                                    				}
                                    			}
                                    			out.println("</tr>");
                                    		}
                                    		//out.println("</tbody>");
                                    		out.println("</table>");
                                    	}
                                    
                                    %>                         
	                                    <div class="form-actions">
		                                	<button type="submit" class="btn btn-primary">Submit</button>
		                                    <button type="reset" class="btn">Reset</button>
	                                    </div>
	                                </form>
                                </div>
                            </div>

                    </div>
                </div>
            </div>
            </div>
        <!--/.fluid-container-->
        <script src="vendors/jquery-1.9.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="assets/scripts.js"></script>
        <script>   
		function setChange(){   
			if(document.selectWeek.select.value == "1"){       
        		document.all.week1.style.display = "block";                   
		  	}                   
		  	else{                           
		     	document.all.week1.style.display = "none";                   
		  	}   
		  	if(document.selectWeek.select.value == "2"){  
                document.all.week2.style.display = "block";                   
		  	}                   
		  	else{                           
		   		document.all.week2.style.display = "none";                   
		  	}  
		  	if(document.selectWeek.select.value == "3"){       
		  		document.all.week3.style.display = "block";                   
		  	}                   
		  	else{                           
		  		document.all.week3.style.display = "none";                   
		  	}          
		}   
		    
		 </script>   
    </body>

</html>