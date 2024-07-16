<%@ page import="dao.ProductDAO" %>
<%@ page import="database.DBConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="model.User" %>
<%@ page import="cart.CartProduct" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored = "false" %>
<%@ page import="java.text.DecimalFormat" %>

<style>
    .btn-filter {
        transition: transform 0.3s ease-in-out;
    }

    .btn-filter:hover {
        transform: translateY(-10px);
    }
</style>
<%
    CartProduct cartProduct = (CartProduct) session.getAttribute("cart");
    if(cartProduct == null) cartProduct = new CartProduct();
    String spageid=request.getParameter("page");
    int pageid = (spageid != null && !spageid.isEmpty()) ? Integer.parseInt(spageid) : 1;
    int totalPerPage =16;
    int activePage = pageid;
    int previousPage = pageid-1;
    int nextPage = pageid+1;
    if(pageid==1){}
    else{
        pageid=pageid-1;
        pageid=pageid* totalPerPage +1;
    }

    ProductDAO dao = new ProductDAO(DBConnect.getConnection());

    List<Product> searchListSuccess = (List<Product>) session.getAttribute("searchListSuccess");
    if(searchListSuccess==null) searchListSuccess= new ArrayList<>();

    List<Product> product = dao.getAllProduct();
    List<Product> products= dao.getRecords(pageid, totalPerPage);
    double totalProducts = product.size();
    int totalPage = (int) Math.ceil(totalProducts /totalPerPage);
    User user = (User) session.getAttribute("success");
%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>NongLamXanh</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">
    <link rel="stylesheet" href="./asset/bootstrap-icons-1.11.1/bootstrap-icons.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div id="container_header"></div>
<div class="main-top">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="our-link">
                    <ul>
                        <li><a href="tien_ich/my-account.jsp"><i class="fa fa-user s_color"></i> Tài khoản của tôi</a></li>
                        <li><a href="contact-us.jsp"><i class="fas fa-headset"></i> Liên hệ </a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="login-register">
                    <ul>
                        <% if (user != null) { %>
                        <% if (!user.getIsAdmin().equals("0")&&!user.getIsAdmin().equals("3")) { %>
                        <li><a href="tien_ich/my-account.jsp">Xin chào <%=user.getName()%></a></li>
                        <li><a href="${pageContext.request.contextPath}/logout">Đăng Xuất</a></li>
                        <%}else{%>
                        <li><p>Xin chào <%= user.getName() %></p></li>
                        <li><a href="admin/admin.jsp">Trang Quản Lí</a></li>
                        <li><a href="${pageContext.request.contextPath}/logout">Đăng Xuất</a></li>
                        <%}%>
                        <% } else { %>
                        <li><a href="account/registration.jsp">Đăng Kí</a></li>
                        <li><a href="account/login.jsp">Đăng Nhập</a></li>
                        <% } %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
    <!-- Start Main Top -->
    <header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                    <a class="navbar-brand " href="index.jsp"><img src="images/logo1.png" class="logo " style="width: 200px;height: 108px" alt="" ></a>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Trang chủ</a></li>
                        <li class="nav-item"><a class="nav-link" href="about.jsp">Giới thiệu</a></li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Tiện ích <i class="bi bi-list "></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="tien_ich/cart.jsp">Giỏ Hàng</a></li>
                                <li><a href="tien_ich/List-address.jsp">Địa chỉ</a></li>
                                <li><a href="tien_ich/checkout.jsp">Thanh Toán</a></li>
                                <li><a href="tien_ich/my-account.jsp">Tài Khoản</a></li>
                                <li><a href="tien_ich/wishlist.jsp">Yêu thích</a></li>
                            </ul>
                        </li>
                        <li class="nav-item active"><a class="nav-link" href="gallery.jsp">Cửa Hàng</a></li>
                        <li class="nav-item"><a class="nav-link" href="contact-us.jsp">Liên Hệ</a></li>
                        <li class="nav-item">
                            <form method="post" action="${pageContext.request.contextPath}/searchProduct">
                                <div class="input-group rounded">
                                    <input type="search" class="form-control rounded" placeholder="Tìm kiếm sản phẩm" aria-label="Search" aria-describedby="search-addon" id="keyword" name="keyword">
                                    <input type="submit" value="Tìm kiếm" class="btn btn-outline-success" name="search_data_product">
                                </div>
                            </form>
                            <c:if test="${not empty searchListSuccess}">
                                <p class="text-center text-success"></p>
                                <c:remove var="searchListSuccess" scope="session"/>
                            </c:if>
                            <c:if test="${not empty searchListFailed}">
                                <p class="text-center text-danger">${searchListFailed}</p>
                                <c:remove var="searchListFailed" scope="session"/>
                            </c:if>
                            <%
                                session.removeAttribute("searchListFailed");
                            %>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->

                <!-- Start Atribute Navigation -->
                <div class="attr-nav">
                    <ul>
                        <li class="side-menu"><a href="tien_ich/cart.jsp">
						<i class="fa fa-shopping-bag"></i>
                            <span class="badge"><%=cartProduct.getTotal()%></span>
							<p>Giỏ Hàng</p>
					</a></li>
                    </ul>
                </div>
                <!-- End Atribute Navigation -->
            </div>
            <!-- Start Side Menu -->

            <!-- End Side Menu -->
        </nav>
        <!-- End Navigation -->
    </header>
    <!-- End Main Top -->

    <!-- Start Top Search -->
    <div class="top-search">
        <div class="container">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input type="text" class="form-control" placeholder="Search">
                <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
            </div>
        </div>
    </div>
    <!-- End Top Search -->

    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">

                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Dịch vụ</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Gallery  -->
    <div class="products-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>SẢN PHẨM</h1>
                    </div>
                </div>
            </div>
<%--            <div class="row">--%>
<%--                <div class="col-lg-12">--%>
<%--                    <div class="special-menu text-center">--%>
<%--                        <div class="button-group filter-button-group">--%>
<%--                            <a href="${pageContext.request.contextPath}/gallery.jsp">--%>
<%--                                <button class="btn btn-filter">Tất cả</button>--%>
<%--                            </a>--%>
<%--                            <a href="${pageContext.request.contextPath}/filterProduct?categoryId=hat">--%>
<%--                                <button class="btn btn-filter">Hạt</button>--%>
<%--                            </a>--%>
<%--                            <a href="${pageContext.request.contextPath}/filterProduct?categoryId=qua">--%>
<%--                                <button class="btn btn-filter">Trái cây</button>--%>
<%--                            </a>--%>
<%--                            <a href="${pageContext.request.contextPath}/filterProduct?categoryId=rau">--%>
<%--                                <button class="btn btn-filter" >Rau</button>--%>
<%--                            </a>--%>
<%--                            <a href="${pageContext.request.contextPath}/filterProduct?categoryId=cu">--%>
<%--                                <button class="btn btn-filter" >Củ</button>--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <div class="row">--%>
<%--                <div class="col-lg-12">--%>
<%--                    <div class="special-menu text-center">--%>
<%--                        <div class="button-group filter-button-group">--%>
<%--                            <!-- Thanh điều chỉnh giá sản phẩm -->--%>
<%--                            <input type="range" id="priceRange" name="priceRange" min="0" max="1000000" step="10000">--%>

<%--                            --%>

<%--                            <input type="checkbox" id="bestSeller" name="bestSeller">--%>
<%--                            <label for="bestSeller">Hàng bán chạy</label>--%>

<%--                            <input type="checkbox" id="promotions" name="promotions">--%>
<%--                            <label for="promotions">Khuyến mãi</label>--%>

<%--                            <input type="checkbox" id="vegetable" name="vegetable">--%>
<%--                            <label for="vegetable">Rau</label>--%>

<%--                            <input type="checkbox" id="root" name="root">--%>
<%--                            <label for="root">Củ</label>--%>

<%--                            <input type="checkbox" id="fruitSeed" name="fruitSeed">--%>
<%--                            <label for="fruitSeed">Quả hạt</label>--%>


<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--            </div>--%>
            <script>
                function filterProducts(categoryId) {
                    $.ajax({
                        type: "GET",
                        url: "filterProduct",
                        data: {categoryId: categoryId},
                        dataType: "json",
                        success: function (response) {

                            var products = response;

                            var productHtml = "";
                            for (var i = 0; i < products.length; i++) {
                                var product = products[i];
                                productHtml += '<div class="col-lg-3 col-md-6 special-grid bulbs">' +
                                    '    <div class="products-single fix">' +
                                    '        <div class="box-img-hover">' +
                                    '            <img src="./DataWeb/' + product.image + '" class="img-fluid" alt="Image">' +
                                    '            <div class="mask-icon">' +
                                    '                <ul>' +
                                    '                    <li><a href="${pageContext.request.contextPath }/product-detail?id=' + product.id + '" data-toggle="tooltip" data-placement="right" title="Chi tiết sản phẩm"><i class="fas fa-eye"></i></a></li>' +
                                    '                    <li><a href="${pageContext.request.contextPath}/add_wishlist?productId=' + product.id + '" data-toggle="tooltip" data-placement="right" title="Thêm vào danh sách yêu thích"><i class="far fa-heart"></i></a></li>' +
                                    '                </ul>' +
                                    '                <a class="cart" href="${pageContext.request.contextPath}/add_cart?id=' + product.id + '">Thêm vào giỏ hàng</a>' +
                                    '            </div>' +
                                    '        </div>' +
                                    '        <div class="why-text">' +
                                    '            <h4>' + product.title + ' - ' + product.unitPrice + product.unit + '</h4>' +
                                    '            <h5>' + product.price + 'đ</h5>' +
                                    '        </div>' +
                                    '    </div>' +
                                    '</div>';
                            }
                            // Thay đổi nội dung của special-list với HTML mới
                            $(".special-list").html(productHtml);
                        }
                    });
                }
            </script>


            <div class="row">
                <div class="col-lg-12">
                    <div class="special-menu text-center">
                        <div class="button-group filter-button-group">
                            <!-- Các nút filter -->
                            <button class="btn btn-filter" onclick="filterProducts('hat')">Hạt</button>
                            <button class="btn btn-filter" onclick="filterProducts('qua')">Trái cây</button>
                            <button class="btn btn-filter" onclick="filterProducts('rau')">Rau</button>
                            <button class="btn btn-filter" onclick="filterProducts('cu')">Củ</button>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row special-list" id="productContainer">
                <!-- Nội dung danh sách sản phẩm sẽ được thay đổi bằng Ajax -->
            </div>

            <script>
                $(document).ready(function() {
                    $('.btn-filter').click(function() {
                        var categoryId = $(this).data('category-id');
                        filterProducts(categoryId);
                    });
                });

                function filterProducts(categoryId) {
                    $.ajax({
                        url: '${pageContext.request.contextPath}/filterProduct',
                        type: 'GET',
                        data: {categoryId: categoryId},
                        success: function(products) {
                            displayProducts(products);
                        },
                        error: function(xhr, status, error) {
                            console.error('Error:', error);
                        }
                    });
                }

                function displayProducts(products) {
                    var productContainer = $('#product-container');
                    productContainer.empty(); // Xóa nội dung hiện tại

                    $.each(products, function(index, product) {

                        var productElement = $('<div>').text(product.name);
                        productContainer.append(productElement);
                    });
                }
            </script>


            <div class="row special-list">
                <%
                    if(!searchListSuccess.isEmpty())  {
                        for (Product p1: searchListSuccess) {
                %>
                <div class="col-lg-3 col-md-6 special-grid bulbs">
                    <div class="products-single fix">
                        <div class="box-img-hover">
                            <img src="./DataWeb/<%=p1.getImage()%>" class="img-fluid" alt="Image">
                            <div class="mask-icon">
                                <ul>
                                    <li><a href="${pageContext.request.contextPath }/product-detail?id=<%= p1.getId() %>" data-toggle="tooltip" data-placement="right" title="Chi tiết sản phẩm"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="${pageContext.request.contextPath}/add_wishlist?productId=<%= p1.getId() %>" data-toggle="tooltip" data-placement="right" title="Thêm vào danh sách yêu thích"><i class="far fa-heart"></i></a></li>
                                </ul>
                                <a class="cart" href="${pageContext.request.contextPath}/add_cart?id=<%= p1.getId() %>">Thêm vào giỏ hàng</a>
                            </div>
                        </div>
                        <div class="why-text">
                            <h4><%=p1.getTitle()+" - "+p1.getUnitPrice()+p1.getUnit()%></h4>
                            <h5><%=p1.getPrice()+ "đ"%> </h5>
                        </div>
                    </div>
                </div>
                <%
                        }
                    session.removeAttribute("searchListSuccess");
                } else {
                        for (Product p: products) {
                %>
                <div class="col-lg-3 col-md-6 special-grid bulbs">
                    <div class="products-single fix">
                        <div class="box-img-hover">
                            <img src="./DataWeb/<%=p.getImage()%>" class="img-fluid" alt="Image">
                            <div class="mask-icon">
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/product-detail?id=<%= p.getId() %>" data-toggle="tooltip" data-placement="right" title="Chi tiết sản phẩm"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="${pageContext.request.contextPath}/add_wishlist?productId=<%= p.getId() %>" data-toggle="tooltip" data-placement="right" title="Thêm vào danh sách yêu thích"><i class="far fa-heart"></i></a></li>
                                </ul>
                                <%if (Integer.parseInt(p.getQuantity()) > 0) { %>
                                <a class="cart" href="${pageContext.request.contextPath}/add_cart?id=<%= p.getId() %>">Thêm  giỏ hàng</a>
                                <%}else{%>
                                <h2 class="text-danger"> Đã Hết Hàng </h2>
                                <%}%>
                            </div>
                        </div>
                        <div class="why-text">
                            <h4><%= p.getTitle() + " - " + p.getUnitPrice() + p.getUnit() %></h4>
                            <%
                                String price = p.getPrice();
                                DecimalFormat formatter = new DecimalFormat("#,###");
                                double originalPrice = Double.parseDouble(price.split("\\.")[0]);
                                String formattedPrice = formatter.format(originalPrice);
                                int discount = p.getDiscount();
                                double discountedPrice = originalPrice - (originalPrice * discount / 100.0);
                                String formattedDiscountedPrice = formatter.format(discountedPrice);
                            %>
                            <div class="flex-row">
                                <% if (discount != 0) { %>
                                <s class="h5"><span><%= formattedPrice %>đ</span></s>
                                <span class="ml-3 bg-danger text-light h6 bg-gradient-danger">-<%= discount %>%</span>
                                <% } %>
                            </div>
                            <h5 class="text-dark">
                                <% if (discount != 0) { %>
                                <%= formattedDiscountedPrice %>đ /<%= p.getUnitPrice() %><%= p.getUnit() %>
                                <% } else { %>
                                <%= formattedPrice %>đ / <%= p.getUnitPrice() %><%= p.getUnit() %>
                                <% } %>
                            </h5>
                        </div>







                    </div>
                </div>

                <%
                    }

                    }
                %>
            </div>
            </div>
        </div>
    </div>
    <!-- End Gallery  -->
<nav aria-label="...">
    <ul class="pagination pb-5 justify-content-center">
        <li class="page-item  <%= (activePage==1)?"disabled":"enable"%>">
            <a class="page-link" href="gallery.jsp?page=<%= previousPage %>" aria-label="Previous">
                <i class="bi-arrow-left"></i>
            </a>
        </li>
        <% for (int i = 1; i <= totalPage; i++) { %>
        <li class="page-item <%= (i == activePage) ? "active" : "" %>">
            <a class="page-link" href="gallery.jsp?page=<%= i %>"><%= i %></a>
        </li>
        <% } %>
        <li class="page-item <%= (activePage==totalPage)?"disabled":"enable"%>">
            <a class="page-link" href="gallery.jsp?page=<%= nextPage %>" aria-label="Next">
                <i class="bi-arrow-right"></i>
            </a>
        </li>
    </ul>

</nav>

    <!-- Start Instagram Feed  -->
    <div class="instagram-box">
        <div class="main-instagram owl-carousel owl-theme">
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-01.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-02.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-03.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-04.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-05.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-06.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-07.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-08.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-09.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="images/instagram-img-05.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Instagram Feed  -->


    <!-- Start Footer  -->
<div class="footer-main">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="footer-top-box">
                    <h3>Thời gian kinh doan</h3>
                    <ul class="list-time">
                        <li>Thứ hai- Thứ sáu: 08.00 đến 17.00</li> <li>Thứ bảy: 10.00 đến 20.00</li> <li>Chủ nhật: <span>Đóng cửa</span></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="footer-top-box">
                    <h3>Bản tin</h3>
                    <form class="newsletter-box">
                        <div class="form-group">
                            <input class="" type="email" name="Email" placeholder="Địa chỉ E-mail*" />
                            <i class="fa fa-envelope"></i>
                        </div>
                        <button class="btn hvr-hover" type="submit">Gửi</button>
                    </form>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="footer-top-box">
                    <h3>Các trang truyền thông</h3>
                    <ul>
                        <li><a href="#"><i class="fab fa-facebook" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-linkedin" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-google-plus" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-rss" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-pinterest-p" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-whatsapp" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="footer-widget">
                    <h4>Freshshop</h4>
                    <p>Ở đây chất lượng được đặt lên hàng đầu </p>
                    <p>Sức khỏe khách hàng là ưu tiên của chúng tôi </p>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="footer-link">
                    <h4>Thông tin</h4>
                    <ul>
                        <li><a href="#">Liên hệ chúng tôi</a></li>
                        <li><a href="#">Dịch vụ chăm sóc khách hàng </a></li>
                        <li><a href="#">Our Sitemap</a></li>
                        <li><a href="#">Điều khoản và điều kiện</a></li>
                        <li><a href="#">Chính sách bảo mật</a></li>
                        <li><a href="#">Thông tin giao hàng</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12">
                <div class="footer-link-contact">
                    <h4>Liên hệ với chúng tôi</h4>
                    <ul>
                        <li>
                            <p><i class="fas fa-map-marker-alt"></i>Địa chỉ: 47 đường số 17 <br>Phường Linh Trung<br> Thành phố Thủ Đức</p>
                        </li>
                        <li>
                            <p><i class="fas fa-phone-square"></i>Liện hệ: <a href="tel:+1-888705770"></a></p>
                        </li>
                        <li>
                            <p><i class="fas fa-envelope"></i>Email: <a href="mailto:contactinfo@gmail.com"></a></p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
    <!-- End Footer  -->

    <a href="#" id="back-to-top" title="Back to top" style="display: none;"><i class="bi-arrow-up-short"></i></a>

    <!-- ALL JS FILES -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/jquery.superslides.min.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <script src="js/inewsticker.js"></script>
    <script src="js/bootsnav.js."></script>
    <script src="js/images-loded.min.js"></script>
    <script src="js/isotope.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/baguetteBox.min.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/custom.js"></script>
</body>

</html>