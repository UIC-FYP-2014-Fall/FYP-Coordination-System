<!DOCTYPE html>
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
                                </div>

                                <div class="block-content collapse in">
                                    <form class="form-horizontal" action="" method="post">
                                        <table class="table table-striped table-bordered">
                                            <th></th>
                                            <th>Mon</th>
                                            <th>Tue</th>
                                            <th>Wed</th>
                                            <th>Thur</th>
                                            <th>Fri</th>
                                            <tr>
                                                <td width="150px">9:00-9:50</td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                            </tr>
                                            <tr>
                                                <td>10:00-10:50</td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                            </tr>
                                            <tr>
                                                <td>11:00-11:50</td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="6"></td>
                                            </tr>
                                            <tr>
                                                <td>14:00-14:50</td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                            </tr>
                                            <tr>
                                                <td>15:00-15:50</td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                            </tr>
                                            <tr>
                                                <td>16:00-16:50</td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                            </tr>
                                            <tr>
                                                <td>17:00-17:50</td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                                <td><input type="checkbox" name="name"></td>
                                            </tr>
                                        </table>
                                                                            
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

    </body>

</html>