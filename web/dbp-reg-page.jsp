<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String useritem="";
  String loginitem="<li><a href=\"dbp-login.jsp\">Log in</a></li>";
  if(session.getAttribute("user")!=null){
    response.sendRedirect("/login-warning.html");
    return;
  }
  String firstname="";
  if(request.getParameter("firstname")!=null)
    firstname=(String)request.getParameter("firstname");
  String lastname="";
  if(request.getParameter("lastname")!=null)
    lastname=(String)request.getParameter("lastname");
  String username="";
  if(request.getParameter("username")!=null)
    username=(String)request.getParameter("username");
  String email="";
  if(request.getParameter("email")!=null)
    email=(String)request.getParameter("email");
  String message="";
  if(request.getAttribute("message")!=null) {
    message = (String) request.getAttribute("message");
    message="<div class= 'col-lg-11 col-md-offset-2 alert alert-danger margin-top-20'>"+
            "<p>"+message+"</p>"+
            "</div>";
  }
%>
<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
  <meta charset="utf-8">
  <title>Create new account</title>

  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <meta content="Metronic Shop UI description" name="description">
  <meta content="Metronic Shop UI keywords" name="keywords">
  <meta content="keenthemes" name="author">

  <meta property="og:site_name" content="-CUSTOMER VALUE-">
  <meta property="og:title" content="-CUSTOMER VALUE-">
  <meta property="og:description" content="-CUSTOMER VALUE-">
  <meta property="og:type" content="website">
  <meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
  <meta property="og:url" content="-CUSTOMER VALUE-">

  <link rel="shortcut icon" href="favicon.ico">

  <!-- Fonts START -->
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css">
  <!-- Fonts END -->

  <!-- Global styles START -->          
  <link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Global styles END --> 
   
  <!-- Page level plugin styles START -->
  <link href="assets/global/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
  <link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin styles END -->

  <!-- Theme styles START -->
  <link href="assets/global/css/components.css" rel="stylesheet">
  <link href="assets/frontend/layout/css/style.css" rel="stylesheet">
  <link href="assets/frontend/layout/css/style-responsive.css" rel="stylesheet">
  <link href="assets/frontend/layout/css/themes/red.css" rel="stylesheet" id="style-color">
  <link href="assets/frontend/layout/css/custom.css" rel="stylesheet">
  <!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="corporate">
     <div class="header">
           <div class="container">
<!-- BEGIN NAVIGATION -->
        <div class="header-navigation pull-right font-transform-inherit">
          <ul>
            <li><a href="dbp-index.jsp">Home page</a></li>
            <li><a href="dbp-search.jsp">Search</a></li>
            <li><a href="dbp-shopping-cart.jsp">Shopping cart</a></li>
            <li><a href="dbp-help.jsp">Help</a></li>
            <li><a href="dbp-login.jsp">Log in</a></li>
            <li><now>Create an account</now></li>
          </ul>
        </div>
        <!-- END NAVIGATION -->
   </div>
   </div>
    <div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="dbp-index.jsp">Home</a></li>
            <li class="active">Create new account</li>
        </ul>
        <br>
        <br>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">

<div class="col-md-3">
</div>
          <!-- BEGIN CONTENT -->
          <div class="col-md-9">
            <h1>Create an account</h1>
            <div class="content-form-page">
              <div class="row">
                <div class="col-md-7">
                  <form class="form-horizontal" role="form" method="post" action="Register" id="reg-page" onsubmit="return formatcontrol('reg-page');">
                    <fieldset>
                      <legend>Your personal details</legend>
                      <div class="form-group">
                        <label for="firstname" class="col-lg-4 control-label">First Name <span class="require">*</span></label>
                        <div class="col-lg-8">
                          <input type="text" class="form-control" id="firstname" name="firstname" value="<%=firstname%>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="lastname" class="col-lg-4 control-label">Last Name <span class="require">*</span></label>
                        <div class="col-lg-8">
                          <input type="text" class="form-control" id="lastname" name="lastname" value="<%=lastname%>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="username" class="col-lg-4 control-label">Username <span class="require">*</span></label>
                        <div class="col-lg-8">
                          <input type="text" class="form-control" id="username" name="username" value="<%=username%>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="email" class="col-lg-4 control-label">Email <span class="require">*</span></label>
                        <div class="col-lg-8">
                          <input type="text" class="form-control" id="email" name="email" value="<%=email%>">
                        </div>
                      </div>
                    </fieldset>
                    <fieldset>
                      <legend>Your password</legend>
                      <div class="form-group">
                        <label for="password" class="col-lg-4 control-label">Password <span class="require">*</span></label>
                        <div class="col-lg-8">
                          <input type="password" class="form-control" id="password" name="password">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="confirm-password" class="col-lg-4 control-label">Confirm password <span class="require">*</span></label>
                        <div class="col-lg-8">
                          <input type="password" class="form-control" id="confirm-password">
                        </div>
                      </div>
                    </fieldset>
                    <div class="row" id="Warning-message">
                      <%=message%>
                    </div>
                    <div class="row">
                      <div class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">                        
                        <button type="submit" class="btn btn-primary">Create an account</button>
                        <button type="button" class="btn btn-default">Cancel</button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>

    <!-- Load javascripts at bottom, this will reduce page load time -->
    <!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
    <!--[if lt IE 9]>
    <script src="assets/global/plugins/respond.min.js"></script>
    <![endif]--> 
    <script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>      
    <script src="assets/frontend/layout/scripts/back-to-top.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->

    <!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
    <script src="assets/global/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
    <script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>

    <script src="assets/frontend/layout/scripts/layout.js" type="text/javascript"></script>
    <script src="assets/frontend/pages/scripts/format-control.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(document).ready(function() {
            Layout.init();
            Layout.initUniform();
        });
    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>