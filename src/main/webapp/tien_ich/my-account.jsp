<%@ page import="model.User" %>
<%@ page import="cart.CartProduct" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored = "false" %>
<%
    CartProduct cartProduct = (CartProduct) session.getAttribute("cart");
    if(cartProduct == null) cartProduct = new CartProduct();
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
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="../images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="../css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="../css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/custom.css">
    <link rel="stylesheet" href="../asset/bootstrap-icons-1.11.1/bootstrap-icons.css">

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<!-- Start Main Top -->
<div class="main-top">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="our-link">
                    <ul>
                        <li><a href="../tien_ich/my-account.jsp"><i class="fa fa-user s_color"></i> Tài khoản của tôi</a></li>
                        <li><a href="../contact-us.jsp"><i class="fas fa-headset"></i> Liên hệ </a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="login-register">
                    <ul>
                        <% if (user != null) { %>
                        <% if (!user.getIsAdmin().equals("0")&&!user.getIsAdmin().equals("3")) { %>
                        <li><a href="../tien_ich/my-account.jsp">Xin chào <%=user.getName()%></a></li>
                        <li><a href="${pageContext.request.contextPath}/logout">Đăng Xuất</a></li>
                        <%}else{%>
                        <li><p>Xin chào <%= user.getName() %></p></li>
                        <li><a href="../admin/admin.jsp">Trang Quản Lí</a></li>
                        <li><a href="${pageContext.request.contextPath}/logout">Đăng Xuất</a></li>
                        <%}%>
                        <% } else { %>
                        <li><a href="../account/registration.jsp">Đăng Kí</a></li>
                        <li><a href="../account/login.jsp">Đăng Nhập</a></li>
                        <% } %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Main Top -->

<!-- Start Main Top -->
<header class="main-header">
    <% if (user == null) { %>
    <script>
        alert("Bạn cần đăng nhập để sử dụng chức năng này.");
        window.location.href = "../index.jsp";
    </script>
    <%}%>
    <!-- Start Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
        <div class="container">
            <!-- Start Header Navigation -->
            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="../index.jsp"><img src="../images/logo1.png" class="logo" style="width: 200px;height: 108px" alt=""></a>
            </div>
            <!-- End Header Navigation -->

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                    <li class="nav-item"><a class="nav-link" href="../index.jsp">Trang Chủ</a></li>
                    <li class="nav-item"><a class="nav-link" href="../about.jsp">Giới Thiệu</a></li>
                    <li class="dropdown active">
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Tiện ích <i class="bi bi-list "></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="cart.jsp">Giỏ Hàng</a></li>
                            <li><a href="List-address.jsp">Địa chỉ</a></li>
                            <li><a href="checkout.jsp">Thanh toán</a></li>
                            <li><a href="my-account.jsp">Tài Khoản</a></li>
                            <li><a href="wishlist.jsp">Yêu thích</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="../gallery.jsp">Cửa Hàng</a></li>
                    <li class="nav-item"><a class="nav-link" href="../contact-us.jsp">Liên hệ </a></li>
                </ul>
                <li class="nav-item">
                    <form method="post" action="../searchProduct">
                        <div class="input-group rounded">
                            <input type="search" class="form-control rounded" placeholder="Tìm kiếm sản phẩm" aria-label="Search" aria-describedby="search-addon" id="keyword" name="keyword">
                            <input type="submit" value="Tìm kiếm" class="btn btn-outline-success" name="search_data_product">
                        </div>
                    </form>

                </li>
            </div>
            <!-- /.navbar-collapse -->

            <!-- Start Atribute Navigation -->
            <div class="attr-nav">
                <ul>
                    <li class="side-menu"><a href="cart.jsp">
                        <i class="fa fa-shopping-bag"></i>
                        <span class="badge"><%=cartProduct.getTotal()%></span>
                        <p>Giỏ hàng</p>
                    </a></li>
                </ul>
            </div>
            <!-- End Atribute Navigation -->
        </div>
        <!-- Start Side Menu -->
        <div class="side">
            <a href="#" class="close-side"><i class="fa fa-times"></i></a>
            <li class="cart-box">
                <ul class="cart-list">
                    <li>
                        <a href="#" class="photo"><img src="../images/img-pro-01.jpg" class="cart-thumb" alt="" /></a>
                        <h6><a href="#">Delica omtantur </a></h6>
                        <p>1x - <span class="price">$80.00</span></p>
                    </li>
                    <li>
                        <a href="#" class="photo"><img src="../images/img-pro-02.jpg" class="cart-thumb" alt="" /></a>
                        <h6><a href="#">Omnes ocurreret</a></h6>
                        <p>1x - <span class="price">$60.00</span></p>
                    </li>
                    <li>
                        <a href="#" class="photo"><img src="../images/img-pro-03.jpg" class="cart-thumb" alt="" /></a>
                        <h6><a href="#">Agam facilisis</a></h6>
                        <p>1x - <span class="price">$40.00</span></p>
                    </li>
                    <li class="total">
                        <a href="#" class="btn btn-default hvr-hover btn-cart">VIEW CART</a>
                        <span class="float-right"><strong>Total</strong>: $180.00</span>
                    </li>
                </ul>
            </li>
        </div>
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
                <h2>Tài Khoản</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Tiện Ích</a></li>
                    <li class="breadcrumb-item active">Tài Khoản</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Start My Account  -->
<div class="my-account-box-main">
    <div class="login-register">
        <ul>
            <% if (user == null) { %>
            <script>
                alert("Bạn cần đăng nhập để sử dụng chức năng này.");
                window.location.href = "../index.jsp";
            </script>
            <% } %>
        </ul>
    </div>
    <div class="container">
        <div class="my-account-page">
            <%if(!user.getIsAdmin().equals("2")) {%>
            <div class="row">
                <div class="col-lg-4 col-md-12">
                    <div class="account-box">
                        <div class="service-box">
                            <div class="service-icon">
                                <a href="list-order.jsp"> <i class="bi bi-person-fill fa-10x "></i> </a>
                            </div>
                            <div class="service-desc">
                                <h4>Danh sách đơn hàng</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="account-box">
                        <div class="service-box">
                            <div class="service-icon">
                                <a data-toggle="collapse" href="#profile"> <i class="bi bi-person-fill fa-10x "></i> </a>
                            </div>
                            <div class="service-desc">
                                <h4>Thay đổi thông tin</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="account-box">
                        <div class="service-box">
                            <div class="service-icon">
                                <a data-toggle="collapse" href="#change_password" ><i class="fa fa-lock"></i> </a>
                            </div>
                            <div class="service-desc">
                                <h4>Thay đổi mật khẩu</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="collapse col align-self-center" id="profile">
                    <div class="container rounded bg-white mt-5">
                        <div class="row">
                            <div class="col-md-4 border-right">
                                <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" src="https://secure.gravatar.com/avatar/02dce7358deff589577dfc8a60342636?s=256&d=mm&r=g" width="90"><span class="font-weight-bold"><%= user.getName()%></span><span class="text-black-50"><%= user.getEmail()%></span></div>
                            </div>
                            <div class="col-md-8">
                                <div class="p-3 py-5">
                                    <form action="../updateAccount" method="post">

                                        <c:if test="${not empty successUpdateAccount}">
                                            <p class="text-center text-success">${successUpdateAccount}</p>
                                            <c:remove var="successRegister" scope="session"/>
                                        </c:if>
                                        <c:if test="${not empty failedUpdateAccount}">
                                            <p class="text-center text-danger">${failedUpdateAccount}</p>
                                            <c:remove var="failedRegister" scope="session"/>
                                        </c:if>

                                        <div class="row mt-3">

                                            <div class="col-md-6"><input name="name" id="name" type="text" class="form-control" placeholder="Tên" value="<%=user.getName()%>"></div>

                                        </div>
                                        <div class="row mt-3">

                                            <div class="col-md-6"><input name="email" id="email" type="text" class="form-control" placeholder="email" value="<%=user.getEmail()%>"></div>

                                        </div>
                                        <div class="row mt-3">
                                            <input name="id" type="hidden" id="id" value="<%=user.getId()%>">
                                            <div class="col-md-6"><input name="contact" id="contact" type="text" class="form-control" placeholder="Số điện thoại" value="<%=user.getContact()%>"></div>

                                        </div>
                                        <div class="mt-5 text-right"><input class="btn btn-primary profile-button" type="submit" value="Lưu Thông Tin"></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="collapse col align-self-center" id="change_password">
                    <div class="container rounded bg-white mt-5">
                        <div class="row">
                            <div class="col-md-4 border-right">
                                <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" src="https://secure.gravatar.com/avatar/02dce7358deff589577dfc8a60342636?s=256&d=mm&r=g" width="90"><span class="font-weight-bold"><%= user.getName()%></span><span class="text-black-50"><%= user.getEmail()%></span></div>
                            </div>
                            <div class="col-md-8">
                                <div class="p-3 py-5">

                                    <form action="../updatePassword" method="post">
                                        <c:if test="${not empty successUpdatePassword}">
                                            <p class="text-center text-success">${successUpdatePassword}</p>
                                            <c:remove var="successRegister" scope="session"/>
                                        </c:if>
                                        <c:if test="${not empty failedUpdatePassword}">
                                            <p class="text-center text-danger">${failedUpdatePassword}</p>
                                            <c:remove var="failedRegister" scope="session"/>
                                        </c:if>

                                        <div class="row mt-2">
                                        <div class="col-md-6"><input name="password" id="password" type="password" class="form-control" placeholder="Nhập Mật Khẩu Cũ" value=""></div>

                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-6"><input name="newpassword" id="newpassword" type="password" class="form-control" placeholder="Nhập Mật Khẩu Mới" value=""></div>

                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-6"><input name="confirmpassword" id="confirmpassword" type="password" class="form-control" placeholder="Xác Nhận Mật Khẩu Mới" value=""></div>

                                    </div>
                                        <input name="id" type="hidden" id="id1" value="<%=user.getId()%>">
                                        <div class="mt-5 text-right"><button class="btn btn-primary profile-button" type="submit">Lưu thông tin</button></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%}else{%>
            <div class="text-center">
                <div class="account-box">
                    <div class="service-box">
                        <div class="service-icon">
                            <a href="list-order.jsp"> <i class="bi bi-person-fill fa-10x "></i> </a>
                        </div>
                        <div class="service-desc">
                            <h4>Danh sách đơn hàng</h4>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</div>
<!-- End My Account -->

<!-- Start Instagram Feed  -->
<div class="instagram-box">
    <div class="main-instagram owl-carousel owl-theme">
        <div class="item">
            <div class="ins-inner-box">
                <img src="../images/instagram-img-01.jpg" alt="" />
                <div class="hov-in">
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="ins-inner-box">
                <img src="../images/instagram-img-02.jpg" alt="" />
                <div class="hov-in">
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="ins-inner-box">
                <img src="../images/instagram-img-03.jpg" alt="" />
                <div class="hov-in">
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="ins-inner-box">
                <img src="../images/instagram-img-04.jpg" alt="" />
                <div class="hov-in">
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="ins-inner-box">
                <img src="../images/instagram-img-05.jpg" alt="" />
                <div class="hov-in">
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="ins-inner-box">
                <img src="../images/instagram-img-06.jpg" alt="" />
                <div class="hov-in">
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="ins-inner-box">
                <img src="../images/instagram-img-07.jpg" alt="" />
                <div class="hov-in">
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="ins-inner-box">
                <img src="../images/instagram-img-08.jpg" alt="" />
                <div class="hov-in">
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="ins-inner-box">
                <img src="../images/instagram-img-09.jpg" alt="" />
                <div class="hov-in">
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
        <div class="item">
            <div class="ins-inner-box">
                <img src="../images/instagram-img-05.jpg" alt="" />
                <div class="hov-in">
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Instagram Feed  -->


<!-- Start Footer  -->
<footer>
    <div id="container_footer"></div>
    <jsp:include page="../include/footer.jsp"/>
</footer>
<!-- End Footer  -->
<!-- End copyright  -->

<a href="#" id="back-to-top" title="Back to top" style="display: none;"><i class="bi-arrow-up-short"></i></a>

<!-- ALL JS FILES -->
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<!-- ALL PLUGINS -->
<script src="../js/jquery.superslides.min.js"></script>
<script src="../js/bootstrap-select.js"></script>
<script src="../js/inewsticker.js"></script>
<script src="js/bootsnav.js."></script>
<script src="../js/images-loded.min.js"></script>
<script src="../js/isotope.min.js"></script>
<script src="../js/owl.carousel.min.js"></script>
<script src="../js/baguetteBox.min.js"></script>
<script src="../js/form-validator.min.js"></script>
<script src="../js/contact-form-script.js"></script>
<script src="../js/custom.js"></script>
</body>

</html>