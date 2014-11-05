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
                        <li class="active">
                            <a href="${pageContext.request.contextPath }/teacherPageControl.do?flag=uploadTopic"><i class="icon-chevron-right"></i> Upload Topic</a>
                        </li>
                        <li>
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
                            <!-- block -->

                            <div class="block">
                                <div class="navbar navbar-inner block-header">
                                    <div class="muted pull-left">Upload Topic</div>               
                                </div>
                                <div class="block-content collapse in">
                                    <form action="${pageContext.request.contextPath }/uploadFYP.do?flag=uploadFYP" method="post" class="form-horizontal">
                                        <div class="control-group">
                                            <label class="control-label" for="focusedInput">Title <span class="required">*</span></label>
                                            <div class="controls">
                                                <input name="title" class="input-xlarge focused" id="focusedInput" type="text" value="">
                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <label class="control-label" for="multiSelect">Supervisor <span class="required">*</span></label>
                                            <div class="controls">
                                                <select name="supervisor" multiple="multiple" id="multiSelect" class="chzn-select span4">
                                                  <option>Judy Feng</option><option>WF Su</option><option>Dyce Zhao</option><option>Amy Zhang</option><option>Haichuan Zhou</option><option>Colorado</option><option>Connecticut</option><option>Delaware</option><option>District Of Columbia</option><option>Florida</option><option>Georgia</option>
                                                </select>                           
                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <label class="control-label" for="select01">Credits <span class="required">*</span></label>
                                            <div class="controls">
                                                <select name="credit" id="select01">
                                                    <option>3</option>
                                                    <option>6</option>
                                                </select>
                                            </div>
                                        </div>
                                                    
                                        <div class="control-group">                          
                                            <label class="control-label">Group/Individual <span class="required">*</span></label>
                                            <div class="controls">
                                                <select name="individual" id="group" onclick="javascript:doit(this);">
                                                    <option value="individual">Individual</option>
                                                    <option value="group">Group</option>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="control-group">
                                            <label class="control-label">Number of students <span class="required">*</span></label>
                                            <div class="controls">
                                                <select name="numOfStu" id="numofStu" disabled="false">
                                                    <option value="1">Please select</option>           
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                </select>
                                            </div>   
                                        </div>



                                        <div class="control-group">
                                            <label class="control-label" for="textarea2">Description <span class="required">*</span></label>
                                            <div class="controls">
                                                <textarea name="description" class="input-xlarge textarea" placeholder="Enter text ..." style="width: 810px; height: 200px"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-actions">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                            <button type="button" class="btn">Reset</button>

                                        </div>
                                    </form>
                                    
                                </div>
                            </div>
                 
                    </div>
                </div>

      		</div>
        </div>

        <!--/.fluid-container-->
        <link href="vendors/datepicker.css" rel="stylesheet" media="screen">
        <link href="vendors/uniform.default.css" rel="stylesheet" media="screen">
        <link href="vendors/chosen.min.css" rel="stylesheet" media="screen">
        <link href="vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen">
        <script src="vendors/jquery-1.9.1.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="vendors/jquery.uniform.min.js"></script>
        <script src="vendors/chosen.jquery.min.js"></script>
        <script src="vendors/bootstrap-datepicker.js"></script>
        <script src="vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
        <script src="vendors/wysiwyg/bootstrap-wysihtml5.js"></script>
        <script src="vendors/wizard/jquery.bootstrap.wizard.min.js"></script>
        <script type="text/javascript" src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>
        <script src="assets/form-validation.js"></script>       
        <script src="assets/scripts.js"></script>
        <script>
        jQuery(document).ready(function() {   
           FormValidation.init();
        });
    
            $(function() {
                $(".datepicker").datepicker();
                $(".uniform_on").uniform();
                $(".chzn-select").chosen();
                $('.textarea').wysihtml5();

                $('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index) {
                    var $total = navigation.find('li').length;
                    var $current = index+1;
                    var $percent = ($current/$total) * 100;
                    $('#rootwizard').find('.bar').css({width:$percent+'%'});
                    // If it's the last tab then hide the last button and show the finish instead
                    if($current >= $total) {
                        $('#rootwizard').find('.pager .next').hide();
                        $('#rootwizard').find('.pager .finish').show();
                        $('#rootwizard').find('.pager .finish').removeClass('disabled');
                    } else {
                        $('#rootwizard').find('.pager .next').show();
                        $('#rootwizard').find('.pager .finish').hide();
                    }
                }});
                $('#rootwizard .finish').click(function() {
                    alert('Finished!, Starting over!');
                    $('#rootwizard').find("a[href*='tab1']").trigger('click');
                });
            });
        </script>

        <script type="text/javascript">
        function doit(o){
           if(o.options[o.selectedIndex].value=='individual'){
              document.getElementById('numofStu').disabled=true;
           }else{
              document.getElementById('numofStu').disabled=false;

           }
           o.disabled=false;
        }
        </script>
        
    </body>

</html>