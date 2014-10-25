<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  class="no-js">
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
                    <a class="brand" href="${pageContext.request.contextPath }/goUI.do">FYP Coordination System</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i> Coordinator <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                	<li>
                                		<a tabindex="-1">Hello, ${coordinatorinfo.name }</a>
                                	</li>
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
                        <li class="active">
                            <a href="${pageContext.request.contextPath }/goManageAccountUi.do"><i class="icon-chevron-right"></i> Manage Account</a>
                        </li>
                        <li>
                            <a href="export.html"><i class="icon-chevron-right"></i> Export</a>
                        </li>
                        <li>
                            <a href="preTime.html"><i class="icon-chevron-right"></i> Set Pre Time</a>
                        </li>
                        <li>
                            <a href="quota.html"><i class="icon-chevron-right"></i> Set Quota</a>
                        </li>
                        <li>
                            <a href="openTime.html"><i class="icon-chevron-right"></i> Set Open Time</a>
                        </li>
                        <li>
                            <a href="workload.html"><i class="icon-chevron-right"></i> Set Workload</a>
                        </li>
                        <li>
                            <a href="clearProject.html"><i class="icon-chevron-right"></i> Clear Project</a>
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
                                    <div class="muted pull-left">Teachers' Account</div>
                                </div>

                                <div class="block-content collapse in">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Account</th>
                                                <th>Name</th>
                                                <th>E-mail</th>
                                                <th> </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>WF.SU</td>
                                                <td>WeiFeng</td>
                                                <td>wfsu@uic.edu.hk</td>
                                                <td>
                                                    <button class="btn btn-primary"><i class="icon-pencil icon-white"></i> Reset</button>
                                                    <button class="btn btn-danger"><i class="icon-remove icon-white"></i> Delete</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Judy</td>
                                                <td>XinFeng</td>
                                                <td>xinfeng@uic.edu.hk</td>
                                                <td>
                                                    <button class="btn btn-primary"><i class="icon-pencil icon-white"></i> Reset</button>
                                                    <button class="btn btn-danger"><i class="icon-remove icon-white"></i> Delete</button>                 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Vincent</td>
                                                <td>Gabriel</td>
                                                <td>xxx@uic.edu.hk</td>
                                                <td>
                                                    <button class="btn btn-primary"><i class="icon-pencil icon-white"></i> Reset</button>
                                                    <button class="btn btn-danger"><i class="icon-remove icon-white"></i> Delete</button>
                                                </td>
                                            </tr>                                    
                                        </tbody>
                                    </table>
                                    <button type="submit" class="btn btn-primary" onclick="location.href='addAccount.html'">Add</button>
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
        <script src="vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="assets/scripts.js"></script>
</body>
</html>