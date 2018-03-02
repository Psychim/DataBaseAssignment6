<%@ page import="model.User" %>
<%@ page import="util.CartUtil" %>
<%@ page import="model.Cart" %>
<%@ page import="model.Book" %>
<%@ page import="javafx.util.Pair" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String useritem="";
  String loginitem="<li><a href=\"dbp-login.jsp\">Log in</a></li><li><a href=\"dbp-reg-page.jsp\">Create an account</a></li>";
    if(session.getAttribute("user")==null){
        response.sendRedirect("/logout-warning.html");
        return;
    }
    User user=(User)session.getAttribute("user");
    useritem="<li><a href=\"dbp-user.jsp\">"+user.getLastname()+" "+user.getFirstname()+"</a></li>";
    loginitem="<li><a href=\"/Logout\">Log out</a></li>";
  Cart cart= CartUtil.ConstructCart(request.getCookies());
%>
<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
  <meta charset="utf-8">
  <title>Checkout</title>

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
            <li class="active">Checkout</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>Checkout</h1>
            <!-- BEGIN CHECKOUT PAGE -->
            <div class="panel-group checkout-page accordion scrollable" id="checkout-page">

              <!-- BEGIN CHECKOUT -->
                <div id="checkout" class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">
                            <a data-toggle="collapse" data-parent="#checkout-page" class="accordion-toggle">
                                Step 1: Checkout
                            </a>
                        </h2>
                    </div>
                <div id="checkout-content" class="panel-collapse collapse in">
                  <div class="panel-body row">
                    <div class="col-md-12 clearfix">
                      <div class="table-wrapper-responsive">
                      <table>
                        <tr>
                          <th class="goods-page-image">Image</th>
                    <th class="goods-page-description">Description</th>
                    <th class="goods-page-ISBN">ISBN</th>
                    <th class="goods-page-quantity">Quantity</th>
                    <th class="goods-page-price">Unit price</th>
                    <th class="goods-page-total">Total</th>
                        </tr>
                        <%double total=0;
                          for(int i=0;i<cart.size();i++){
                          Pair<Book,Integer> p=cart.get(i);
                          Book b=p.getKey();
                          total+=b.getPrice()*p.getValue();
                        %>
                        <tr>
                          <td class="checkout-image">
                            <a href="dbp-book-infomation.jsp?bid=<%=b.getBid()%>"><img src="<%=b.getBid()%>" alt="No picture"></a>
                          </td>
                          <td class="checkout-description">
                            <h3><a href="dbp-book-infomation.jsp?bid=<%=b.getBid()%>"><%=b.getTitle()%></a></h3>
                      <p><strong>Author:</strong><%=b.getAuthor()%></p>
                          </td>
                          <td class="checkout-ISBN"><%=b.getIsbn()%></td>
                          <td class="checkout-quantity"><%=p.getValue()%></td>
                          <td class="checkout-price"><strong><span>$</span><%=b.getPrice()%></strong></td>
                          <td class="checkout-total"><strong><span>$</span><%=b.getPrice()*p.getValue()%></strong></td>
                        </tr>
                        <%}%>
                      </table>
                      </div>
                      <div class="checkout-total-block">
                        <ul>
                          <li class="checkout-total-price">
                            <em>Total</em>
                            <strong class="price"><span>$</span><%=total%></strong>
                          </li>
                        </ul>
                      </div>
                      <div class="clearfix"></div><button class="btn btn-primary  pull-right" type="submit" data-toggle="collapse" data-parent="#checkout-page" data-target="#payment-address-content" id="button-checkout">Continue</button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- END CHECKOUT -->

              <!-- BEGIN PAYMENT ADDRESS -->
                <div id="payment-address" class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">
                            <a data-toggle="collapse" data-parent="#checkout-page" class="accordion-toggle">
                                Step 2: Billing &amp; Delivery Details
                            </a>
                        </h2>
                    </div>
                    <div id="payment-address-content" class="panel-collapse collapse">
                        <div class="panel-body row">
                            <div class="col-md-6 col-sm-6">
                                <h3>Your Payment Details</h3>
                                <div class="form-group">
                                    <label for="telephone">Telephone <span class="require">*</span></label>
                                    <input type="text" id="telephone" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="credit card number">Credit Card Number<span class="require">*</span></label>
                                    <input type="text" id="creditcardnumber" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <h3>Your Address</h3>
                                <div class="form-group">
                                    <label for="company">Company</label>
                                    <input type="text" id="company" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="address1">Address<span class="require">*</span></label>
                                    <input type="text" id="address" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="city">City <span class="require">*</span></label>
                                    <input type="text" id="city" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="post-code">Post Code <span class="require">*</span></label>
                                    <input type="text" id="post-code" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="region-state">Region/State/Province <span class="require">*</span></label>
                                    <input type="text" id="region-state" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="country">Country <span class="require">*</span></label>
                                    <input type="text" id="country" class="form-control">
                                </div>
                            </div>
                    <hr>
                      <div class="col-md-12">
                          <button class="btn btn-primary  pull-right" type="submit" data-toggle="collapse" data-parent="#checkout-page" data-target="#confirm-content" id="button-payment-address" onclick="return requirecheck();">Continue</button>
                          <div class="checkbox pull-right" id="require-warning">
                          </div>
                      </div>
                  </div>
                </div>
              </div>
              <!-- END PAYMENT ADDRESS -->

              <!-- BEGIN CONFIRM -->
                <div id="confirm" class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">
                            <a data-toggle="collapse" data-parent="#checkout-page" class="accordion-toggle">
                                Step 3: Confirm Order
                            </a>
                        </h2>
                    </div>
                  <div id="confirm-content" class="panel-collapse collapse">
                      <div class="panel-body row">
                          <div class="col-md-12 clearfix">
                              <form method="post" role="form" id="checkout-form" action="Checkout">
                                  <div class="table-wrapper-responsive">
                   <table>
                        <tr>
                          <th class="goods-page-image">Image</th>
                    <th class="goods-page-description">Description</th>
                    <th class="goods-page-ISBN">ISBN</th>
                    <th class="goods-page-quantity">Quantity</th>
                    <th class="goods-page-price">Unit price</th>
                    <th class="goods-page-total">Total</th>
                        </tr>
                        <%
                          for(int i=0;i<cart.size();i++){
                            Pair<Book,Integer> p=cart.get(i);
                            Book b=p.getKey();
                        %>
                        <tr>
                          <td class="checkout-image">
                            <a href="dbp-book-infomation.jsp?bid=<%=b.getBid()%>"><img src="<%=b.getImage()%>" alt="No picture"></a>
                          </td>
                          <td class="checkout-description">
                            <h3><a href="dbp-book-infomation.jsp?bid=<%=b.getBid()%>"><%=b.getTitle()%></a></h3>
                      <p><strong>Author:</strong><%=b.getAuthor()%></p>
                          </td>
                          <td class="checkout-ISBN"><%=b.getIsbn()%></td>
                          <td class="checkout-quantity"><%=p.getValue()%></td>
                          <td class="checkout-price"><strong><span>$</span><%=b.getPrice()%></strong></td>
                          <td class="checkout-total"><strong><span>$</span><%=b.getPrice()*p.getValue()%></strong></td>
                        </tr>
                        <%}%>
                      </table>
                      </div>
                      <div class="checkout-total-block">
                        <ul>
                          <li class="checkout-total-price">
                            <em>Total</em>
                            <strong class="price"><span>$</span><%=total%></strong>
                          </li>
                        </ul>
                      </div>
                        <input type="hidden" id="telephone-form" class="form-control" name="telephone">
                        <input type="hidden" id="creditcardnumber-form" class="form-control" name="creditcardnumber">
                        <input type="hidden" id="company-form" class="form-control" name="company">
                        <input type="hidden" id="address-form" class="form-control" name="address">
                        <input type="hidden" id="city-form" class="form-control" name="city">
                        <input type="hidden" id="post-code-form" class="form-control" name="post-code">
                        <input type="hidden" id="country-form" class="form-control" name="country">
                        <input type="hidden" id="region-state-form" class="form-control" name="region-state">
                        <div class="clearfix"></div>
                        <h4 id="address1">Address:</h4>
                        <h4 id="creditcardnumber1">Credit card number:</h4>
                        <div class="clearfix"></div>
                        <button class="btn btn-primary pull-right" type="submit" id="button-confirm">Confirm Order</button>
                        <button type="button" class="btn btn-default pull-right margin-right-20" data-toggle="collapse" data-parent="#checkout-page" data-target="#checkout-content">Cancel</button>
                        </form>
                    </div>
                  </div>
                </div>
              </div>
              <!-- END CONFIRM -->
            </div>
            <!-- END CHECKOUT PAGE -->
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>
     <script type="text/javascript">
         function requirecheck()
         {
             if (document.getElementById("telephone").value==''||document.getElementById("creditcardnumber").value==''||document.getElementById("address").value==''||document.getElementById("city").value==''
                 ||document.getElementById("post-code").value==''||document.getElementById("country").value==''||document.getElementById("region-state").value==''){
                 document.getElementById("require-warning").innerHTML="<label class='icon-state-danger'>You have to input all the required infomation &nbsp;&nbsp;&nbsp; </label>"
                 document.getElementById("button-payment-address").removeAttribute("data-target");
                 return false;
             }
             else{
                 document.getElementById("require-warning").innerHTML=" ";
                 document.getElementById("button-payment-address").setAttribute("data-target","#confirm-content");
                 document.getElementById("address1").innerHTML="Address: "+document.getElementById("address").value;
                 document.getElementById("creditcardnumber1").innerHTML="Credit card number: "+document.getElementById("creditcardnumber").value;
                 document.getElementById("telephone-form").value=document.getElementById("telephone").value;
                 document.getElementById("creditcardnumber-form").value=document.getElementById("creditcardnumber").value;
                 document.getElementById("company-form").value=document.getElementById("company").value;
                 document.getElementById("address-form").value=document.getElementById("address").value;
                 document.getElementById("city-form").value=document.getElementById("city").value;
                 document.getElementById("post-code-form").value=document.getElementById("post-code").value;
                 document.getElementById("country-form").value=document.getElementById("country").value;
                 document.getElementById("region-state-form").value=document.getElementById("region-state").value;
                 return true;
             }
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

    <script src="assets/frontend/layout/scripts/layout.js" type="text/javascript"></script>
    <script src="assets/frontend/pages/scripts/checkout.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(document).ready(function() {
            Layout.init();    
            Layout.initOWL();
            Layout.initImageZoom();
            Layout.initTouchspin();
            Layout.initUniform();
            Checkout.init();
        });
    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>