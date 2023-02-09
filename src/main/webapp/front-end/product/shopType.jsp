<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.musclebeach.product.model.entity.Product" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="com.musclebeach.common.util.ApplicationContextUtil" %>
<%@ page import="com.musclebeach.product.model.entity.ProductType" %>
<%@ page import="com.musclebeach.product.model.service.ProductService" %>
<%@ page import="com.musclebeach.product.model.service.ProductTypeService" %>


<%
    Product proVO = (Product) request.getAttribute("proVO");
    ApplicationContext context = ApplicationContextUtil.getContext();
    ProductService productService = context.getBean(ProductService.class);
    List<Product> list = productService.findAllProduct();
    pageContext.setAttribute("list", list);
    ProductTypeService productTypeService = context.getBean(ProductTypeService.class);
    List<ProductType> list2 = productTypeService.getAll();
    pageContext.setAttribute("list2", list2);


%>

<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Muscle Beach商城</title>


    <!-- all css -->
    <link href="<%=request.getContextPath()%>/front-end/product/resources/shop/css/bootstrap.min.css" rel="stylesheet"
          media="screen">
    <link href="<%=request.getContextPath()%>/front-end/product/resources/shop/css/font-awesome.min.css"
          rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/front-end/product/resources/shop/css/css2.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front-end/product/resources/shop/css/mahardhi-font.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front-end/product/resources/shop/css/animate.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front-end/product/resources/shop/css/owl.carousel.min.css"
          rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front-end/product/resources/shop/css/owl.theme.default.min.css"
          rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front-end/product/resources/shop/css/magnific-popup.css" rel="stylesheet"
          type="text/css">
    <link href="<%=request.getContextPath()%>/front-end/product/resources/shop/css/stylesheet.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front-end/product/resources/shop/css/swiper.min.css" type="text/css"
          rel="stylesheet" media="screen">
    <link href="<%=request.getContextPath()%>/front-end/product/resources/shop/css/opencart.css" type="text/css"
          rel="stylesheet" media="screen">
    <link href="<%=request.getContextPath()%>/front-end/product/resources/shop/css/jquery-ui.min.css" rel="stylesheet"
          type="text/css">
    <script src="<%=request.getContextPath()%>/front-end/product/resources/shop/js/jquery-2.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/product/resources/shop/js/owl.carousel.min.js"></script>

    <!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"> -->
    <%-- <link href="<%=request.getContextPath()%>/front-end/product/resources/lib/flaticon/font/flaticon.css" rel="stylesheet"> --%>
    <%-- <link href="<%=request.getContextPath()%>/front-end/product/resources/css/style.min.css" rel="stylesheet"> --%>

    <style>
        .login {
            display: inline;
            position: relative;
            Left: calc(100% - 150px);
            top: 5px;
        }

        .register {
            display: inline;
            position: relative;
            Left: calc(100% - 150px);
            top: 5px;
            color: white;
        }
    </style>

</head>


<body class="common-home">
<!-- header -->
<%-- 	<%@include file="/front-end/common/header.jsp"%> --%>

<div class="loader"></div>
<!-- 	<nav id="top"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="top-inner"> -->
<!-- 				<div class="top-left"> -->
<!-- 					<div class="welcome-text hidden-xs">歡迎來到MUSCLE BEACH商城</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</nav> -->
<header>
    <div class="container">
        <div class="header-top">
            <!-- start logo -->
            <div id="logo">
                <a href="index-commonhome.html"><img
                        src="<%=request.getContextPath()%>/front-end/product/resources/shop/picture/logo.jpg"
                        title="Store" alt="Store" class="img-responsive"></a>
            </div>
            <div class="header-right header-links">
                <!-- start account -->
                <div id="header_ac" class="dropdown ">
                    <a href="index-accountlogin.html" title="My Account"
                       class="dropdown-toggle" data-toggle="dropdown"> <span></span><i
                            class="icon-user"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right account-link-toggle">
                        <li><a href="index-accountregister.html">會員註冊</a></li>
                        <li><a href="index-accountlogin1.html">會員登入</a></li>
                    </ul>
                </div>
                <!-- start cart -->
                <div class="header_cart">
                    <div id="cart" class="btn-group btn-block">
                        <button type="button" data-toggle="dropdown"
                                data-loading-text="Loading..."
                                class="btn btn-inverse btn-block btn-lg dropdown-toggle">
								<span id="cart-total"><span class="cart-item">0</span><span
                                        class="hidden-md hidden-sm hidden-xs">$0.00</span></span>
                        </button>
                        <ul class="dropdown-menu header-cart-toggle pull-right ">
                            <li>
                                <p class="text-center product-cart-empty">購物車為空!</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header-bottom">
        <div class="container">
            <div class="header-bottom-inner">
                <!-- start menu -->
                <nav id="menu" class="navbar navbar_menu">
                    <div class="navbar-header">
                        <button type="button" class="btn btn-navbar navbar-toggle"
                                id="btnMenuBar">
                            <span class="addcart-icon"></span>
                        </button>
                    </div>
                    <div class="menu-close hidden-lg hidden-md">
                        <span id="category" class="">Menu</span><i class="icon-close"></i>
                    </div>
                    <ul class="nav navbar-nav">
                        <li class="menulist home"><a id="home"
                                                     href="<%=request.getContextPath()%>/front-end/product/shop.jsp">首頁</a>
                        </li>
                        <c:forEach var="prodTypeVO" items="${list2}">
                            <li>
                                <a href="<%=request.getContextPath()%>/front-end/product/shopType.jsp?${prodTypeVO.typeID}"
                                   class="menulist" id="type">${prodTypeVO.typeName}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </nav>


                <div class="header-inner ">
                    <!-- start search -->
                    <div class="btn_search">
                        <div id="mahardhiSearch" class="input-group mahardhi-search">
                            <input type="text" name="search" value=""
                                   placeholder="搜尋商品..."
                                   class="form-control input-lg ui-autocomplete-input">
                            <span class="btn-search input-group-btn">
									<button type="button" class="btn btn-default btn-lg">
										<i class="search-icon icon-search"></i>
									</button>
								</span>
                        </div>

                        <script type="text/javascript">
                            $('#mahardhiSearch .btn-search button')
                                .bind(
                                    'click',
                                    function () {
                                        url = 'index.php?route=product/search';

                                        var search = $(
                                            '#mahardhiSearch input[name=\'search\']')
                                            .prop('value');
                                        if (search) {
                                            url += '&search='
                                                + encodeURIComponent(search);
                                        }
                                        var category_id = $(
                                            '#mahardhiSearch select[name=\'category_id\']')
                                            .prop('value');
                                        if (category_id > 0) {
                                            url += '&category_id='
                                                + encodeURIComponent(category_id);
                                            // url += '&sub_category=true';
                                            // url += '&description=true';
                                        }
                                        location = url;
                                    });

                            $('#mahardhiSearch input[name=\'search\']')
                                .bind(
                                    'keydown',
                                    function (e) {
                                        if (e.keyCode == 13) {
                                            $(
                                                '#mahardhiSearch .btn-search button')
                                                .trigger(
                                                    'click');
                                        }
                                    });
                        </script>

                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<script>
    $(document).ready(function () {
        var headerfixed = 0;
        if (headerfixed == 1) {
            $(window).scroll(function () {
                if ($(window).width() > 991) {
                    if ($(this).scrollTop() > 160) {
                        $('.header-bottom').addClass('header-fixed');
                    } else {
                        $('.header-bottom').removeClass('header-fixed');
                    }
                } else {
                    $('.header-bottom').removeClass('header-fixed');
                }
            });
        } else {
            $('.header-bottom').removeClass('header-fixed');
        }
    });
</script>
<div id="common-home">
    <div class="slideshow">
        <div class="swiper-viewport">
            <div id="slideshow0" class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide text-center Main-banner1">
                        <a href="#"><img
                                src="<%=request.getContextPath()%>/front-end/product/resources/shop/picture/mainbanner1.jpg"
                                alt="Main-banner1" class="img-responsive"></a>
                    </div>
                    <div class="swiper-slide text-center Main-banner2">
                        <a href="#"><img
                                src="<%=request.getContextPath()%>/front-end/product/resources/shop/picture/mainbanner2.jpg"
                                alt="Main-banner2" class="img-responsive"></a>
                    </div>
                </div>
            </div>
            <div class="swiper-pagination slideshow0"></div>
            <div class="swiper-pager">
                <div class="swiper-button-prev">
                    <i class="icon-left-arrow"></i>
                </div>
                <div class="swiper-button-next">
                    <i class="icon-send"></i>
                </div>
            </div>
        </div>
    </div>

    <div class="category-featured box mt-60">
        <div class="container box">
            <div class="row">
                <div class="page-title toggled">
                    <h3>熱銷商品</h3>
                </div>
                <div class="category-box">
                    <div class="category-feature-list">
                        <div id="category-carousel"
                             class="box-category  category-carousel  clearfix" data-items="3">

                            <div class="product-content">
                                <div class="category-layout col-xs-12">
                                    <div class="category-thumb clearfix">
                                        <div class="images-hover image">
                                            <a href="index-productcategory_25.html"> <img
                                                    src="<%=request.getContextPath()%>/front-end/product/resources/shop/picture/product7.jpg"
                                                    alt="巧克力風味蛋白粉" title="巧克力風味蛋白粉"
                                                    class="img-responsive img-circle">
                                            </a>
                                        </div>
                                        <div class="caption">
                                            <div class="cat-title">
                                                <h4>
                                                    <span>巧克力風味蛋白粉</span>
                                                </h4>
                                                <a href="index-productcategory_25.html"
                                                   class="category-view">商品介紹</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="category-layout col-xs-12">
                                    <div class="category-thumb clearfix">
                                        <div class="images-hover image">
                                            <a href="index-productcategory_20.html"> <img
                                                    src="<%=request.getContextPath()%>/front-end/product/resources/shop/picture/product8.jpg"
                                                    alt="奶茶風味蛋白粉" title="奶茶風味蛋白粉"
                                                    class="img-responsive img-circle">
                                            </a>
                                        </div>
                                        <div class="caption">
                                            <div class="cat-title">
                                                <h4>
                                                    <span>奶茶風味蛋白粉</span>
                                                </h4>
                                                <a href="index-productcategory_20.html"
                                                   class="category-view">商品介紹</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="product-content">
                                <div class="category-layout col-xs-12">
                                    <div class="category-thumb clearfix">
                                        <div class="images-hover image">
                                            <a href="index-productcategory_18.html"> <img
                                                    src="<%=request.getContextPath()%>/front-end/product/resources/shop/picture/product1.jpg"
                                                    alt="專業家用瑜伽啞鈴" title="專業家用瑜伽啞鈴"
                                                    class="img-responsive img-circle">
                                            </a>
                                        </div>
                                        <div class="caption">
                                            <div class="cat-title">
                                                <h4>
                                                    <span>專業家用瑜伽啞鈴</span>
                                                </h4>
                                                <a href="index-productcategory_18.html"
                                                   class="category-view">商品介紹</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="category-layout col-xs-12">
                                    <div class="category-thumb clearfix">
                                        <div class="images-hover image">
                                            <a href="index-productcategory_52.html"> <img
                                                    src="<%=request.getContextPath()%>/front-end/product/resources/shop/picture/product2.jpg"
                                                    alt="實心包膠啞鈴" title="實心包膠啞鈴"
                                                    class="img-responsive img-circle">
                                            </a>
                                        </div>
                                        <div class="caption">
                                            <div class="cat-title">
                                                <h4>
                                                    <span>實心包膠啞鈴</span>
                                                </h4>
                                                <a href="index-productcategory_52.html"
                                                   class="category-view">商品介紹</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="product-content">
                                <div class="category-layout col-xs-12">
                                    <div class="category-thumb clearfix">
                                        <div class="images-hover image">
                                            <a href="index-productcategory_43.html"> <img
                                                    src="<%=request.getContextPath()%>/front-end/product/resources/shop/picture/product3.jpg"
                                                    alt="筋肉彈力繩" title="筋肉彈力繩"
                                                    class="img-responsive img-circle">
                                            </a>
                                        </div>
                                        <div class="caption">
                                            <div class="cat-title">
                                                <h4>
                                                    <span>筋肉彈力繩</span>
                                                </h4>
                                                <a href="index-productcategory_43.html"
                                                   class="category-view">商品介紹</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="category-layout col-xs-12">
                                    <div class="category-thumb clearfix">
                                        <div class="images-hover image">
                                            <a href="index-productcategory_24.html"> <img
                                                    src="<%=request.getContextPath()%>/front-end/product/resources/shop/picture/product4.jpg"
                                                    alt="懸吊健身彈力帶" title="懸吊健身彈力帶"
                                                    class="img-responsive img-circle">
                                            </a>
                                        </div>
                                        <div class="caption">
                                            <div class="cat-title">
                                                <h4>
                                                    <span>懸吊健身彈力帶</span>
                                                </h4>
                                                <a href="index-productcategory_24.html"
                                                   class="category-view">商品介紹</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        <!--
        // set slider
        const dirCategory = $('html').attr('dir');

        $('.category-carousel')
            .each(
                function () {
                    if ($(this).closest('#column-left').length == 0
                        && $(this).closest('#column-right').length == 0) {
                        $(this).addClass('owl-carousel owl-theme');
                        const items = $(this).data('items') || 3;
                        const sliderOptions = {
                            loop: false,
                            rewind: false,
                            nav: true,
                            navText: [
                                '<i class="fa fa-angle-left">',
                                '<i class="fa fa-angle-right">'],
                            dots: false,
                            items: items,
                            autoplay: false,
                            autoplayTimeout: 4000,
                            responsiveRefreshRate: 200,
                            responsive: {
                                0: {
                                    items: 1
                                },
                                320: {
                                    items: 2
                                },
                                481: {
                                    items: items
                                }
                            }
                        };
                        if (dirCategory == 'rtl')
                            sliderOptions['rtl'] = true;
                        $(this).owlCarousel(sliderOptions);
                    }
                });
        //-->
    </script>

    <div class="box all-products mt-60">
        <div class="container">
            <div class="row">
                <div class="box-heading">
                    <div class="box-content special">
                        <div class="page-title toggled">
                            <h3>最新商品</h3>
                        </div>
                        <div class="block_box">
                            <div id="special-carousel"
                                 class="box-product  product-carousel  clearfix" data-items="4">

                                <c:forEach var="prodVO" items="${list}">
                                    <c:if test="${prodVO.proStatus == 1}">
                                        <div class="product-content">
                                            <div class="product-layout col-xs-12">
                                                <div class="product-thumb transition clearfix">
                                                    <div class="image">
                                                        <a href="shopDetail.jsp?${prodVO.proID}">
                                                            <img src="<%=request.getContextPath()%>/front-end/product/ShowProdImgFront?proID=${prodVO.proID}"
                                                                 class="col">
                                                        </a>

                                                        <div class="sale-text">
                                                            <span class="section-sale" style="color:red">會員特價</span>
                                                        </div>

                                                        <div class="button-group">
                                                            <button type="button" class="quickview-button"
                                                                    title="Quickview"
                                                                    onclick="quickView.ajaxView('?route=product/quickview&product_id=33');">
                                                                <i class="icon-eye"></i><span>檢視商品</span>
                                                            </button>
                                                            <button type="button" class="wishlist"
                                                                    title="Add To WishList"
                                                                    onclick="wishlist.add('33');">
                                                                <i class="icon-heart"></i><span>加入最愛</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="thumb-description clearfix">
                                                        <div class="caption">
                                                            <div class="price-rating">
                                                                <div class="rating">
																	<span class="fa fa-stack"><i
                                                                            class="fa fa-star fa-stack-2x"></i><i
                                                                            class="fa fa-star-o fa-stack-2x"></i>
																	</span>
                                                                    <span
                                                                            class="fa fa-stack"><i
                                                                            class="fa fa-star fa-stack-2x"></i><i
                                                                            class="fa fa-star-o fa-stack-2x"></i>
																	</span>
                                                                    <span
                                                                            class="fa fa-stack"><i
                                                                            class="fa fa-star fa-stack-2x"></i><i
                                                                            class="fa fa-star-o fa-stack-2x"></i>
																	</span>
                                                                    <span
                                                                            class="fa fa-stack"><i
                                                                            class="fa fa-star fa-stack-2x"></i><i
                                                                            class="fa fa-star-o fa-stack-2x"></i>
																	</span>
                                                                    <span
                                                                            class="fa fa-stack"><i
                                                                            class="fa fa-star fa-stack-2x"></i><i
                                                                            class="fa fa-star-o fa-stack-2x"></i>
																	</span>
                                                                </div>
                                                            </div>
                                                            <h4 class="product-title">
                                                                <a>${prodVO.proName}</a>
                                                            </h4>
                                                            <p class="price">
                                                                <span class="price-new"
                                                                      style="color:red">${prodVO.proPrice*0.9}元</span>
                                                                <span class="price-old">${prodVO.proPrice}元</span>
                                                            </p>
                                                            <button type="button" class="addcart" title="加入購物車"
                                                                    onclick="cart.add('33')">加入購物車
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        <!--
        const direct = $('html').attr('dir');
        const items = 3;
        $(".slideTestimonial").each(
            function () {
                const sliderOptions = {
                    loop: false,
                    nav: true,
                    navText: ['<i class="fa fa-angle-left"></i>',
                        '<i class="fa fa-angle-right"></i>'],
                    dots: false,
                    items: items,
                    autoplay: true,
                    autoplayTimeout: 3000,
                    responsiveRefreshRate: 200,
                    responsive: {
                        0: {
                            items: 1
                        },
                        1201: {
                            items: 1
                        }
                    }
                };

                if (direct == 'rtl')
                    sliderOptions['rtl'] = true;
                $(this).owlCarousel(sliderOptions);
            });
        //-->
    </script>

    <script type="text/javascript">
        $('#tabs a').tabs();

        // set slider
        const direction = $('html').attr('dir');
        $('.product-tab-carousel')
            .each(
                function () {
                    if ($(this).closest('#column-left').length == 0
                        && $(this).closest('#column-right').length == 0) {
                        $(this).addClass('owl-carousel owl-theme');
                        const items = $(this).data('items') || 4;
                        const sliderOptions = {
                            loop: false,
                            nav: true,
                            navText: [
                                '<i class="fa fa-angle-left"></i>',
                                '<i class="fa fa-angle-right"></i>'],
                            dots: false,
                            items: items,
                            responsiveRefreshRate: 200,
                            responsive: {
                                0: {
                                    items: 1
                                },
                                376: {
                                    items: ((items - 2) > 1) ? (items - 2)
                                        : 1
                                },
                                681: {
                                    items: ((items - 1) > 1) ? (items - 1)
                                        : 1
                                },
                                1200: {
                                    items: items
                                }
                            }
                        };
                        if (direction == 'rtl')
                            sliderOptions['rtl'] = true;
                        $(this).owlCarousel(sliderOptions);
                    }
                });
    </script>
</div>
<!-- Footer -->
<%@include file="/front-end/common/footer.jsp" %>

<!-- shop js -->
<script src="<%=request.getContextPath()%>/front-end/product/resources/shop/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/front-end/product/resources/shop/js/jquery.elevateZoom.min.js"></script>
<script src="<%=request.getContextPath()%>/front-end/product/resources/shop/js/jquery.magnific-popup.min.js"></script>
<script src="<%=request.getContextPath()%>/front-end/product/resources/shop/js/quickview.js"
        type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/front-end/product/resources/shop/js/mahardhi_search.js"></script>
<script src="<%=request.getContextPath()%>/front-end/product/resources/shop/js/swiper.jquery.js"></script>
<script src="<%=request.getContextPath()%>/front-end/product/resources/shop/js/tabs.js"></script>
<script src="<%=request.getContextPath()%>/front-end/product/resources/shop/js/jquery.cookie.js"></script>
<script src="<%=request.getContextPath()%>/front-end/product/resources/shop/js/common.js"></script>
<script src="<%=request.getContextPath()%>/front-end/product/resources/shop/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/front-end/product/resources/shop/js/custom.js"></script>

<!-- top scroll -->
<a href="#" class="scrollToTop back-to-top" data-toggle="tooltip"
   title="Top"><i class="fa fa-angle-up"></i></a>

</body>
</html>
