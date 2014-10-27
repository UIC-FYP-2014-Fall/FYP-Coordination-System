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
                        <li  class="active">
                            <a href="${pageContext.request.contextPath }/teacherPageControl.do?flag=topicList"><i class="icon-chevron-right"></i> Topic List</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/teacherPageControl.do?flag=chooseObserver"><i class="icon-chevron-right"></i> Choose Observer</a>
                        </li>
                        <li>
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

                        <div class="span6">
                            <!-- block -->

                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <ul class="breadcrumb">
                                        <i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
                                        <i class="icon-chevron-right show-sidebar" style="display:none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
                                        <li>
                                            <a href="topicList.html">Topic List</a> <span class="divider">/</span>    
                                        </li>                                       
                                        <li class="active">Edit Topic</li>
                                    </ul>                                     
                                </div>
                                <div class="block-content collapse in">

                                    <div class="control-group">

                                        <label class="control-label" for="focusedInput">Title <span class="required">*</span></label>
                                        <div class="controls">
                                            <input class="input-xlarge focused" id="focusedInput" type="text" value="">
                                        </div>

                                        <table>
                                            <tr>
                                                <td>
                                                    <label class="control-label" for="select01">Supervisor</label>
                                                    <div class="controls">
                                                        <select id="select01" class="chzn-select">
                                                            <option>aaa</option>
                                                            <option>bbb</option>
                                                            <option>ccc</option>
                                                            <option>ddd</option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td>
                                                    <label class="control-label" for="select01">Credits</label>
                                                    <div class="controls">
                                                        <select id="select01" class="chzn-select">
                                                            <option>3</option>
                                                            <option>6</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="control-label" for="select01">Group/Individual</label>
                                                    <div class="controls">
                                                        <select id="group" class="chzn-select" onclick="javascript:doit(this);">
                                                            <option value="individual">Individual</option>
                                                            <option value="group">Group</option>                                                            
                                                        </select>
                                                    </div>
                                                </td>
                                                <td>
                                                    <label class="control-label" for="select01">Number of students</label>
                                                    <div class="controls">
                                                        <select id="numofStu" class="chzn-select" disabled="false">
                                                            <option value="1">Please select</option>                                                            
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                                            <option value="4">4</option>
                                                        </select>
                                                    </div>
                                                </td>     
                                            </tr>
                                        </table>

                                    </div>    
                                     
                                    <div class="control-group">
                                        <label class="control-label" for="textarea2">Description <span class="required">*</span></label>
                                        <div class="controls">
                                            <textarea class="input-xlarge textarea" placeholder="Enter text ..." style="width: 810px; height: 200px"></textarea>
                                        </div>

                                        <button type="submit" class="btn btn-primary">Submit</button>

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
        <script src="vendors/jquery-1.9.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/scripts.js"></script>
        
    </body>

</html>