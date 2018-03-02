<%@ page import="model.User" %>
<%@ page import="model.Book" %>
<%@ page import="service.BookService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String useritem="";
    String loginitem="<li><a href=\"dbp-login.jsp\">Log in</a></li><li><a href=\"dbp-reg-page.jsp\">Create an account</a></li>";
    if(session.getAttribute("user")!=null){
        User user=(User)session.getAttribute("user");
        useritem="<li><a href=\"dbp-user.jsp\">"+user.getLastname()+" "+user.getFirstname()+"</a></li>";
        loginitem="<li><a href=\"/Logout\">Log out</a></li>";
    }
    int bid=Integer.parseInt(request.getParameter("bid"));
    Book b= BookService.SelectBook(bid);
%>
<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
  <meta charset="utf-8">
  <title>Book Infomation</title>

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
  <link href="assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
  <link href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css"><!-- for slider-range -->
  <link href="assets/global/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
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
            <li><a href="dbp-help.jsp">Help</a></li>
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
            <li class="active">Book Infomation</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-7">
            <div class="product-page">
              <div class="row">
                <div class="col-md-6 col-sm-6">
                  <div class="product-main-image">
                    <img src="<%=b.getImage()%>" alt="No picture" class="img-responsive" data-BigImgsrc="<%=b.getImage()%>">
                  </div>
                </div>
                <div class="col-md-6 col-sm-6">
                  <h1><%=b.getTitle()%></h1>
                   <div class="product-page-options">
                    <div class="pull-left">
                      <label class="control-label">Author:</label>
                      <label class="control-label"><%=b.getAuthor()%></label>
                    </div>
                    <div class="pull-left">
                      <label class="control-label">ISBN:</label>
                      <label class="control-label"><%=b.getIsbn()%></label>
                    </div>
                  </div>
                  <div class="description">
                    <p><%out.print(b.getBrief()==null?"":b.getBrief());%></p>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                  </div>
                     <div class="price-availability-block clearfix">
                    <div class="price">
                      <strong><span>$</span><%=b.getPrice()%></strong>
                    </div>
                    <div class="availability">
                      Availability: <strong>
                      <%if(b.getStock()<0){
                          out.print("Usually in 4 weeks.");
                      }
                      else if(b.getStock()<=4){
                          out.print("Usually in 1 weeks.");
                      }
                      else if(b.getStock()<=19){
                          out.print("Usually in 2~3 days.");
                      }else{
                          out.print("Usually in 1~2 days.");
                      }
                    %></strong>
                    </div>
                  </div>
                  <input type="hidden" name="bid" value="<%=b.getBid()%>">
                  <div class="product-page-cart">
                    <div class="product-quantity">
                        <input id="product-quantity" type="text" value="1" name="quantity" readonly class="form-control input-sm">
                    </div>
                    <button class="btn btn-primary" type="submit" onclick="addBook(<%=b.getBid()%>)">Add to cart</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
    <script type="text/javascript">
        function addBook(bid){
            var quantity=document.getElementById("product-quantity").value;
            document.cookie="CART"+bid+"="+quantity;
            alert("Successfully add to cart");
            window.location.href="dbp-shopping-cart.jsp";
        }
    </script>
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
    <script src='assets/global/plugins/zoom/jquery.zoom.min.js' type="text/javascript"></script><!-- product zoom -->
    <script src="assets/global/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->
    <script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>

    <script src="assets/frontend/layout/scripts/layout.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(document).ready(function() {
            Layout.init();    
            Layout.initOWL();
            Layout.initImageZoom();
            Layout.initTouchspin();
            Layout.initUniform();
        });
    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>