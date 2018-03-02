<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String useritem="";
    String loginitem="<li><a href=\"dbp-login.jsp\">Log in</a></li><li><a href=\"dbp-reg-page.jsp\">Create an account</a></li>";
    if(session.getAttribute("user")!=null){
        User user=(User)session.getAttribute("user");
        useritem="<li><a href=\"dbp-user.jsp\">"+user.getLastname()+" "+user.getFirstname()+"</a></li>";
        loginitem="<li><a href=\"/Logout\">Log out</a></li>";
    }
%>
<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
  <meta charset="utf-8">
  <title>Frequently Asked Questions</title>

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
  <link href="assets/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.css" rel="stylesheet">
  <!-- Page level plugin styles END -->

  <!-- Theme styles START -->
  <link href="assets/global/css/components.css" rel="stylesheet">
  <link href="assets/frontend/layout/css/style.css" rel="stylesheet">
  <link href="assets/frontend/pages/css/style-shop.css" rel="stylesheet" type="text/css">
  <link href="assets/frontend/layout/css/style-responsive.css" rel="stylesheet">
  <link href="assets/frontend/layout/css/themes/red.css" rel="stylesheet" id="style-color">
  <link href="assets/frontend/layout/css/custom.css" rel="stylesheet">
  <!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="ecommerce">
   <div class="header">
           <div class="container">
<!-- BEGIN NAVIGATION -->
        <div class="header-navigation pull-right font-transform-inherit">
          <ul>
            <li><a href="dbp-index.jsp">Home page</a></li>
            <li><a href="dbp-search.jsp">Search</a></li>
            <li><a href="dbp-shopping-cart.jsp">Shopping cart</a></li>
            <li><now>Help</now></li>
             <%=useritem%>
             <%=loginitem%>
          </ul>
        </div>
        <!-- END NAVIGATION -->
   </div>
   </div>
    <div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="dbp-index.jsp">Home</a></li>
            <li class="active">Frequently Asked Questions</li>
            <br>
            <br>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-3">
            <ul class="list-group margin-bottom-25 sidebar-menu">
              <li class="list-group-item clearfix"><a href="dbp-help.jsp"><i class="fa fa-angle-right"></i> Help/Infomation</a></li>
              <li class="list-group-item clearfix"><a href="javascript:;"><i class="fa fa-angle-right"></i> F.A.Q</a></li>
              <li class="list-group-item clearfix"><a href="dbp-system-rules.jsp"><i class="fa fa-angle-right"></i> System Rules</a></li>
              <li class="list-group-item clearfix"><a href="dbp-contact.jsp"><i class="fa fa-angle-right"></i> Contact</a></li>
            </ul>
          </div>
          <!-- END SIDEBAR -->

          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-9">
            <h1>Frequently Asked Questions</h1>
            <div class="faq-page">
                            <div class="panel panel-default">
                               <div class="panel-heading">
                                  <h4 class="panel-title">
                                     <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_1">
                                     1. Question ?
                                     </a>
                                  </h4>
                               </div>
                               <div id="accordion1_1" class="panel-collapse collapse  in">
                                  <div class="panel-body">
                                     Answer.
                                  </div>
                               </div>
                            </div>
                            <div class="panel panel-default">
                               <div class="panel-heading">
                                  <h4 class="panel-title">
                                     <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_2">
                                     2. Question ?
                                     </a>
                                  </h4>
                               </div>
                               <div id="accordion1_2" class="panel-collapse collapse">
                                  <div class="panel-body">
                                     Answer.
                                  </div>
                               </div>
                            </div>
                            <div class="panel panel-default">
                               <div class="panel-heading">
                                  <h4 class="panel-title">
                                     <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_3">
                                     3. Question ?
                                     </a>
                                  </h4>
                               </div>
                               <div id="accordion1_3" class="panel-collapse collapse">
                                  <div class="panel-body">
                                      Answer.
                                  </div>
                               </div>
                            </div>
                            <div class="panel panel-default">
                               <div class="panel-heading">
                                  <h4 class="panel-title">
                                     <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#accordion1_4">
                                     4. Question ?
                                     </a>
                                  </h4>
                               </div>
                               <div id="accordion1_4" class="panel-collapse collapse">
                                  <div class="panel-body">
                                     Answer.
                                  </div>
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
    <!-- BEGIN CORE PLUGINS(REQUIRED FOR ALL PAGES) -->
    <!--[if lt IE 9]>
    <script src="assets/global/plugins/respond.min.js"></script>  
    <![endif]-->  
    <script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->

    <!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
    <script src="assets/global/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
    <script src="assets/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.min.js" type="text/javascript"></script><!-- slider for products -->

    <script src="assets/frontend/layout/scripts/layout.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(document).ready(function() {
            Layout.init();    
            Layout.initOWL();
        });
    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>