<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String useritem="";
  String loginitem="<li><a href=\"dbp-login.jsp\">Log in</a></li><li><a href=\"dbp-reg-page.jsp\">Create an account</a></li>";
  String username="";
  String firstname="";
  String lastname="";
  String email="";
  if(session.getAttribute("user")==null){
    response.sendRedirect("/logout-warning.html");
    return;
  }
  else{
    User user=(User)session.getAttribute("user");
    loginitem="<li><a href=\"/Logout\">Log out</a></li>";
    username=user.getUsername();
    firstname=user.getFirstname();
    lastname=user.getLastname();
    email=user.getEmail();
    useritem=lastname+" "+firstname;
  }
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
  <title>User</title>

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
  <link href="assets/global/css/plugins.css" rel="stylesheet">
  <link href="assets/frontend/layout/css/style.css" rel="stylesheet">
  <link href="assets/frontend/layout/css/style-responsive.css" rel="stylesheet">
  <link href="assets/frontend/layout/css/themes/red.css" rel="stylesheet" id="style-color">
  <link href="assets/frontend/layout/css/custom.css" rel="stylesheet">
  <!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="corporate">
    <!-- BEGIN HEADER -->
    <div class="header">
      <div class="container">
        <!-- BEGIN NAVIGATION -->
        <div class="header-navigation pull-right font-transform-inherit">
          <ul>
            <li><a href="dbp-index.jsp">Home page</a></li>
            <li><a href="dbp-search.jsp">Search</a></li>
            <li><a href="dbp-shopping-cart.jsp">Shopping cart</a></li>
            <li><a href="dbp-help.jsp">Help</a></li>
            <li><now><%=useritem%></now></li>
            <%=loginitem%>
          </ul>
        </div>
        <!-- END NAVIGATION -->
      </div>
    </div>
    <!-- Header END -->

    <div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="dbp-index.jsp">Home</a></li>
            <li class="active">User infomation</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-20">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <div class="content-page">
            <div class="content-page">
      <div class="row">
        <div class="col-md-12 ">
          <!-- BEGIN SAMPLE FORM PORTLET-->
          <div class="portlet box red ">
            <div class="portlet-title">
              <div class="caption">
                <i class="fa fa-gift"></i> User infomation
              </div>
              <div class="tools">
                <a href="#portlet-config" data-toggle="modal" class="config">
                </a>
                <a href="" class="reload">
                </a>
              </div>
            </div>
            <div class="portlet-body form">
              <form class="form-horizontal" method="post" action="UpdateUser" role="form" id="user-form" onsubmit="return formatcontrol('user-form');">
                <div class="form-body">
                  <br>
                  <div class="form-group">
                    <label class="col-md-3 control-label">Username</label>
                    <div class="col-md-6">
                      <label class="col-md-3 control-label"><%=username%></label>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-3 control-label">First name</label>
                    <div class="col-md-9">
                      <input type="text" class="form-control input-inline input-medium" placeholder="First name" name="firstname" value="<%=firstname%>">
                    </div>
                  </div>
                   <div class="form-group">
                    <label class="col-md-3 control-label">Last name</label>
                    <div class="col-md-9">
                      <input type="text" class="form-control input-inline input-medium" placeholder="Last name" name="lastname" value="<%=lastname%>">
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-3 control-label">Email Address</label>
                    <div class="col-md-6">
                      <div class="input-group">
                        <span class="input-group-addon">
                          <i class="fa fa-envelope"></i>
                        </span>
                        <input type="email" class="form-control" placeholder="Email Address" name="email" value="<%=email%>">
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-3 control-label">New Password</label>
                    <div class="col-md-6">
                      <div class="input-group">
                        <span class="input-group-addon">
                          <i class="fa fa-lock"></i>
                        </span>
                        <input type="password" id="password" class="form-control"  name="password" placeholder="password"/>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-md-3 control-label">Confirm New Password</label>
                    <div class="col-md-6">
                      <div class="input-group">
                        <span class="input-group-addon">
                          <i class="fa fa-lock"></i>
                        </span>
                        <input type="password" id="confirm-password" class="form-control" placeholder="password"/>
                      </div>
                    </div>
                  </div>
                  <div class="row" id="Warning-message">
                    <%=message%>
                  </div>
                  <br>
                <div class="form-actions fluid">
                  <div class="col-md-offset-3 col-md-12">
                    <button type="submit" class="btn red">Confirm</button>
                    <button type="button" class="btn default" onclick="window.location.reload()">Cancel</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <!-- END SAMPLE FORM PORTLET-->
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
    <!-- END CORE PLUGINS -->

    <!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
    <script src="assets/global/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
    <script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
    <script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
    <script src="assets/frontend/layout/scripts/layout.js" type="text/javascript"></script>
     <script src="assets/frontend/pages/scripts/format-control.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(document).ready(function() {
            Metronic.init(); // init global framework features
            Layout.init();
            Layout.initUniform();
        });
    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>