<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is FYP coordinate system login page">
<title>FYP Coordination System</title>
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="assets/styles.css" rel="stylesheet" media="screen">
     <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script src="js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>
<body id="login">
    <div class="container">

      <form class="form-signin" action="${pageContext.request.contextPath }/login.do" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
        <font color="#FF0000">${requestScope.msg}</font><br /><br/>
        <input type="text" class="input-block-level" placeholder="User Name" name="username" required="required">
        <input type="password" class="input-block-level" placeholder="Password" name="password" required="required">
        <select name="type">
        	<option value="student">Student</option>
            <option value="teacher">Teacher</option>
            <option value="coordinator">Coordinator</option>
        </select>
        <label class="checkbox">
          <input type="checkbox" value="remember" name="remember"> Remember me
        </label>
        <button class="btn btn-large btn-primary" type="submit">Sign in</button>
      </form>

    </div> <!-- /container -->
    <script src="vendors/jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>