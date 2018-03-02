<%@ page import="model.User" %>
<%@ page import="service.BookService" %>
<%@ page import="model.BookList" %>
<%@page pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! int pageSize=10;%>
<%
  request.setCharacterEncoding("utf-8");
  String useritem="";
  String loginitem="<li><a href=\"dbp-login.jsp\">Log in</a></li><li><a href=\"dbp-reg-page.jsp\">Create an account</a></li>";
  if(session.getAttribute("user")!=null){
    User user=(User)session.getAttribute("user");
    useritem="<li><a href=\"dbp-user.jsp\">"+user.getLastname()+" "+user.getFirstname()+"</a></li>";
    loginitem="<li><a href=\"/Logout\">Log out</a></li>";
  }
  String isbn=request.getParameter("isbn");
  if(isbn==null)
      isbn="";
  String title=request.getParameter("title");
  if(title==null)
      title="";
  title=new String(title.getBytes("ISO-8859-1"),"utf-8");
  System.out.println(title);

  String author=request.getParameter("author");
  if(author==null)
      author="";
  author=new String(author.getBytes("ISO-8859-1"),"utf-8");
  System.out.println(author);
  int num= BookService.ItemNumber(isbn,title,author);
  int pindex=1;
  try{
      pindex=Integer.parseInt(request.getParameter("page"));
  }catch(Exception e){
      pindex=1;
  }
  BookList bl= BookService.Search(isbn,title,author,pageSize*(pindex-1),pageSize);
%>
<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
  <meta charset="utf-8">
  <title>Search</title>

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
  <link href="assets/frontend/pages/css/style-shop.css" rel="stylesheet" type="text/css">
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
            <li><now>Search</now></li>
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
            <li class="active">Search</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-20">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>Search</h1>
            <div class="content-page">
            <div class="content-page">
      <div class="row">
        <div class="col-md-12 ">
          <!-- BEGIN SAMPLE FORM PORTLET-->
          <div class="portlet box red">
            <div class="portlet-title">
              <div class="caption">
                <i class="fa fa-gift"></i> Find your favorite
              </div>
            </div>
            <div class="portlet-body form">
              <form role="form" method="get" action="dbp-search.jsp">
                <div class="form-body">
                  <div class="form-group">
                    <label>Author</label>
                    <div class="input">
                      <input type="text" class="form-control" name="author" id="text1" value="<%=author%>">
                    </div>
                  </div>
                   <div class="form-group">
                    <label>Title</label>
                    <div class="input">
                      <input type="text" class="form-control" name="title" id="text2" value="<%=title%>">
                    </div>
                  </div>
                  <div class="form-group">
                    <label>ISBN</label>
                    <div class="input">
                      <input type="text" class="form-control" name="isbn" id="text3" value="<%=isbn%>">
                    </div>
                  </div>
                </div>
                <div class="form-actions">
                  <button type="submit" class="btn red">Search</button>
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
              <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-7">
            <h1>Search Results</h1>
            <div class="goods-page">
              <div class="goods-data clearfix">
                <div class="table-wrapper-responsive">
                <table summary="Shopping cart">
                  <tr>
                    <th class="goods-page-image">Image</th>
                    <th class="goods-page-description">Description</th>
                    <th class="goods-page-ISBN">ISBN</th>
                    <th class="goods-page-price" colspan="2">Unit price</th>
                  </tr>
                   <% for(int i=0;i<bl.size();i++){%>
                  <tr>
                    <td class="goods-page-image">
                      <a href="dbp-book-infomation.jsp?bid=<%=bl.get(i).getBid()%>"><img src="<%=bl.get(i).getImage()%>" alt="No picture"></a>
                    </td>
                    <td class="goods-page-description">
                      <h3><a href="dbp-book-infomation.jsp?bid=<%=bl.get(i).getBid()%>"><%=bl.get(i).getTitle()%></a></h3>
                      <p><strong>Author:<%=bl.get(i).getAuthor()%></strong></p>
                      <%--<em>Availability:</em> --%>
                    </td>
                    <td class="goods-page-ISBN">
                        <%=bl.get(i).getIsbn()%>
                    </td>
                    <td class="goods-page-price">
                      <strong><span>$</span><%=bl.get(i).getPrice()%></strong>
                    </td>
                    <%}%>
                </table>
                </div>
              </div>
            </div>
             <!-- BEGIN PAGINATOR -->
            <div class="row">
              <div class="col-md-4 col-sm-4 items-info">Items <%=Math.min(num,pageSize*(pindex-1)+1)%> to <%=Math.min(pageSize*pindex,num)%> of <%=num%> total</div>
              <div class="col-md-8 col-sm-8">
                <ul class="pagination pull-right">
                    <% if(pindex!=1){%>
                  <li><a href="dbp-search.jsp?isbn=<%=isbn%>&title=<%=title%>&author=<%=author%>&page=<%=pindex-1%>">&laquo;</a></li>
                    <%}%>
                    <%int sindex=Math.max(1,pindex-2);
                    for(int i=0;i<5&&sindex+i<=(num+pageSize-1)/pageSize;i++){
                        if(pindex==sindex+i){%>
                  <li><span><%=sindex+i%></span></li>
                    <%}
                    else{%>
                  <li><a href="dbp-search.jsp?isbn=<%=isbn%>&title=<%=title%>&author=<%=author%>&page=<%=sindex+i%>"><%=sindex+i%></a></li>
                    <%}
                    }
                    if(pindex<(num+pageSize-1)/pageSize){%>
                  <li><a href="dbp-search.jsp?isbn=<%=isbn%>&title=<%=title%>&author=<%=author%>&page=<%=pindex+1%>">&raquo;</a></li>
                    <%}%>
                </ul>
              </div>
            </div>
            <!-- END PAGINATOR -->
          </div>
          <!-- END CONTENT -->
        </div>
    </div>


    <!-- Load javascripts at bottom, this will reduce page load time -->
    <script type="text/javascript">
        var checkbox = document.querySelectorAll('input[name="inlineCheckbox"]');
        var text = document.querySelectorAll('input[name="text"]');
        function ok(check){
        for(var i=0;i<3;i++){
               if (checkbox[i].checked==true){
                 text[i].disabled=false; 
               }
               else
               {
                 text[i].disabled=true;
               }
             }
        }
    </script>
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
    <script src="assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
    <script src="assets/global/scripts/metronic.js" type="text/javascript"></script>
    <script src="assets/frontend/layout/scripts/layout.js" type="text/javascript"></script>
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