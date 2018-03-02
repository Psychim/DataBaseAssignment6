<%@ page import="model.User" %>
<%@ page import="model.Book" %>
<%@ page import="util.CartUtil" %>
<%@ page import="model.Cart" %>
<%@ page import="javafx.util.Pair" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String useritem="";
  String loginitem="<li><a href=\"dbp-login.jsp\">Log in</a></li><li><a href=\"dbp-reg-page.jsp\">Create an account</a></li>";
  if(session.getAttribute("user")!=null){
    User user=(User)session.getAttribute("user");
    useritem="<li><a href=\"dbp-user.jsp\">"+user.getLastname()+" "+user.getFirstname()+"</a></li>";
    loginitem="<li><a href=\"/Logout\">Log out</a></li>";
  }
  String action;
  if(session.getAttribute("user")==null){
    action="<a href=\"dbp-login.jsp\"><button class=\"btn btn-primary\" type=\"submit\">Login</button></a>";
  }
  else action="<a href=\"dbp-checkout.jsp\"><button class=\"btn btn-primary\">Checkout <i class=\"fa fa-check\"></i></button></a>";
  Cart cart= CartUtil.ConstructCart(request.getCookies());
%>
<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
  <meta charset="utf-8">
  <title>Shopping cart</title>

  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="cache-control"content="max-age=0">
    <meta http-equiv="cache-control"content="no-cache">
    <meta http-equiv="expires"content="0">
    <meta http-equiv="expires"content="Tue, 01 Jan 1980 1:00:00 GMT">
    <meta http-equiv="pragma"content="no-cache">
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
            <li><now>Shopping cart</now></li>
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
            <li class="active">Shopping cart</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>Shopping cart</h1>
            <div class="goods-page">
              <div class="goods-data clearfix">
                <div class="table-wrapper-responsive">
                <table summary="Shopping cart">
                  <tr>
                    <th class="goods-page-image">Image</th>
                    <th class="goods-page-description">Description</th>
                    <th class="goods-page-ISBN">ISBN</th>
                    <th class="goods-page-quantity">Quantity</th>
                    <th class="goods-page-price">Unit price</th>
                    <th class="goods-page-total" colspan="2">Total</th>
                  </tr>
                  <%
                      double total=0;
                      for(int i=0;i<cart.size();i++){
                      Pair<Book,Integer> p=cart.get(i);
                      Book b=p.getKey();
                      total+=b.getPrice()*p.getValue();
                  %>
                  <tr id="goods<%=b.getBid()%>">
                    <td class="goods-page-image">
                      <a href="dbp-book-infomation.jsp?bid=<%=b.getBid()%>"><img src="<%=b.getImage()%>" alt="No picture"></a>
                    </td>
                    <td class="goods-page-description">
                      <h3><a href="dbp-book-infomation.jsp?bid=<%=b.getBid()%>"><%=b.getTitle()%></a></h3>
                      <p><strong>Author:<%=b.getAuthor()%></strong></p>
                    </td>
                    <td class="goods-page-ISBN">
                        <%=b.getIsbn()%>
                    </td>
                    <td class="goods-page-quantity">
                      <div class="product-quantity">
                          <input id="product-quantity<%=b.getBid()%>" type="text" value="<%=p.getValue()%>" readonly class="form-control input-sm" onchange="changeprice(<%=b.getBid()%>,this)" onload="changeprice(<%=b.getBid()%>,this)"/>
                      </div>
                    </td>
                    <td class="goods-page-price" id="goods-page-price<%=b.getBid()%>">
                      <strong><span>$</span><%=b.getPrice()%></strong>
                    </td>
                    <td class="goods-page-total" id="goods-page-total<%=b.getBid()%>" name="total">
                      <strong><span>$</span><%=b.getPrice()*p.getValue()%></strong>
                    </td>
                    <td class="del-goods-col">
                      <a class="del-goods" href="javascript:void(0);" onclick="deletegood(<%=b.getBid()%>,this)" id="delete<%=b.getBid()%>"/>&nbsp;</a>
                    </td>
                  </tr>
                    <%}%>
                </table>
                </div>

                <div class="shopping-total">
                  <ul>
                    <li class="shopping-total-price">
                      <em>Total</em>
                      <strong class="price" id="total-price"><span>$</span><%=total%></strong>
                    </li>
                  </ul>
                </div>
              </div>
                <a href="dbp-search.jsp"><button class="btn btn-default">Continue shopping <i class="fa fa-shopping-cart"></i></button></a>
              <%=action%>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->

    <script type="text/javascript">
    function changeprice(bid,obj)
    {
      var quantity = obj.value;
      var id = obj.id;
      var pricetext = document.getElementById("goods-page-price"+bid).innerHTML;
      var tempprice = pricetext.split('>');
      var price = tempprice[3].split('<');
      var total = price[0]*quantity;
      total = total.toFixed(2);
      document.getElementById("goods-page-total"+bid).innerHTML = "<strong><span>$</span>"+total+"</strong>";
      var totals = document.getElementsByName("total");
      var totalprice = 0;
      totalprice = parseFloat(totalprice);
      var temptotals;
      for(var i = 0;i<totals.length;i++)
      {
        temptotals = totals[i].innerHTML.split('>');
        temptotals = temptotals[3].split('<');
        temptotals = parseFloat(temptotals[0]);
        totalprice = totalprice+temptotals;
      }
      totalprice = totalprice.toFixed(2);
      document.getElementById("total-price").innerHTML = "<span>$</span>"+totalprice;
      var arrCookie=document.cookie.split("; ");
      for(var i=0;i<arrCookie.length;i++){
          var arr=arrCookie[i].split("=");
          var cname="CART"+bid;
          if(arr[0].toString().equalTo(cname)){
              document.cookie="CART"+bid+"="+quantity;
              break;
          }
      }
    }
    </script>
    <script type="text/javascript">
    function deletegood(bid,obj)
    {
      var id = obj.id;
      document.getElementById("goods"+bid).innerHTML = "";
      var totals = document.getElementsByName("total");
      var totalprice = 0;
      totalprice = parseFloat(totalprice);
      var temptotals;
      for(var i = 0;i<totals.length;i++)
      {
        temptotals = totals[i].innerHTML.split('>');
        temptotals = temptotals[3].split('<');
        temptotals = parseFloat(temptotals[0]);
        totalprice = totalprice+temptotals;
      }
      totalprice = totalprice.toFixed(2);
      document.getElementById("total-price").innerHTML = "<span>$</span>"+totalprice;
      var date=new Date();
      date.setTime(date.getTime()-10000);
      document.cookie="CART"+bid+"=0;expires="+date.toUTCString();
    }
    </script>
    <!-- Load javascripts at bottom, this will reduce page load time -->
    <!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
    <!--[if lt IE 9]>
    <script src="assets/global/plugins/respond.min.js"></script>  
    <![endif]-->  
    <script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>      
    <script src="assets/frontend/layout/scripts/back-to-top.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->

    <!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
    <script src="assets/global/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
    <script src="assets/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.min.js" type="text/javascript"></script><!-- slider for products -->
    <script src='assets/global/plugins/zoom/jquery.zoom.min.js' type="text/javascript"></script><!-- product zoom -->
    <script src="assets/global/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->
    <script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script><!-- for slider-range -->

    <script src="assets/frontend/layout/scripts/layout.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(document).ready(function() {
            Layout.init();    
            Layout.initOWL();
            Layout.initImageZoom();
            Layout.initTouchspin();
            Layout.initUniform();
            Layout.initSliderRange();
        });
    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>