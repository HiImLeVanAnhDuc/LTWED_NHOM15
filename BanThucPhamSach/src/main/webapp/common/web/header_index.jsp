<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- Page Preloder -->
    <!-- <div id="preloder">
        <div class="loader"></div>
    </div> -->

    <!-- Humberger Begin -->
    <!-- <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./shop-grid.html">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div> -->
    <!-- Humberger End -->



    <!-- Header Section Begin -->
    <header class="header">
        <!-- Trang th??ng tin  tr??n c??ng -->
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> ducbaoquy@st.hcmute.edu.vn</li>
                                <li>Rau xanh n??ng t???m s??? chia</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">

                            <!-- Th??ng tin li??n h??? -->
                            <div class="header__top__right__social">
                                <a href="https://www.facebook.com/profile.php?id=100010026462752"><i class="fa fa-facebook"></i></a>
                                <!-- <a href="#"><i class="fa fa-twitter"></i></a> -->
                                <a href="https://www.instagram.com/hi.iam.lvad/"><i class="fa fa-linkedin"></i></a>
                                <!-- <a href="#"><i class="fa fa-pinterest-p"></i></a> -->
                            </div>

                            <!-- Ch???n ng??n ng??? -->
                            <div class="header__top__right__language">
                                <img src="img/co_VN.png" alt="" class="img_co_VN">
                                <div>Vi???t Nam</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="#">China</a></li>
                                    <li><a href="#">English</a></li>
                                </ul>
                            </div>
                            <!-- Ch??? ????? ????ng nh???p  -->
                            <c:choose>
                            	<c:when test="${sessionScope.account == null }">
		                            <div class="header__top__right__auth  ">
		                                <a href="dang-nhap"><i class="fa fa-user"></i>????ng nh???p</a>
		                            </div>
		                            <div class="header__top__right__auth  can_chinh_DK">
		                                <a href="dang-nhap"><i class="fa fa-user"></i>????ng k??</a>
		                            </div>
	                            </c:when>
	                            <c:otherwise>
	                            	<div class="header__top__right__auth  ">
		                                <a href="dang-nhap"><i class="fa fa-user"></i>${sessionScope.account.ten}</a>
		                            </div>
		                            <div class="header__top__right__auth  can_chinh_DK">
		                                <a href="login.jsp"><i class="fa fa-user"></i>????ng xu???t</a>
		                            </div>
	                            </c:otherwise>
							</c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <!-- logo  -->
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="trang-chu" class="img_logoshop"><img src="img/DBQ Shop.png" alt="" ></a>
                    </div>
                </div>
                <!-- L???a ch???n chuy???n trang -->
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li ><a href="trang-chu">Trang Ch???</a></li>
                            <li><a href="cua-hang?phanLoai=all">C???a h??ng</a></li>
                            <!-- <li><a href="#">a</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.jsp">Shop Details</a></li>
                                </ul>
                            </li> -->
                            <li><a href="tin-tuc">Tin T???c</a></li>
                            <li><a href="lien-he">Li??n h???</a></li>
                        </ul>
                    </nav>
                </div>
                <!-- T??i h??ng -->
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                        <c:set var="count" value="${0}"/>
                        <c:forEach items="${sessionScope.cart}" var="map">
                        	<c:set var="count" value="${count + map.value.getSoLuong()}"/>
                        </c:forEach>
                            <!-- <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li> -->
                            <li><a href="thanh-toan"><i class="fa fa-shopping-bag"></i><span>${count}</span></a></li>
                            <li><b>T??i h??ng</b></li>
                        </ul>
                        <!-- <div class="header__cart__price">item: <span>$150.00</span></div> -->
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <!-- L???a ch???n m???t h??ng -->
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>Danh s??ch h??ng</span>
                        </div>
                        <ul>
                            <c:forEach items="${allLoaiSanPham}" var="sp">
	                                <li><a href="cua-hang?phanLoai=${sp.getMaLoai()}">${sp.getTenLoai()}</a></li>
	                        </c:forEach>
                        </ul>
                    </div>
                </div>

                <div class="col-lg-9">
                    <div class="hero__search">
                        <!-- t??m ki???m d???a n??o t??n s???n ph???m -->
                        <div class="hero__search__form">
                            <form action="tim-kiem">
                                <!-- <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div> -->
                                <input type="text" name="thongTinSP" value="${value_thongTinSP}" placeholder="B???n c???n g???">
                                <button type="submit" class="site-btn">T??M KI???M</button>
                            </form>
                        </div>
                        <!-- Th??ng tin li??n l???c -->
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <span>M???i th???c m???c li??n h???</span>
                                <h5>+84 18.04.2002</h5>
                                
                            </div>
                        </div>
                    </div>
                    <div class="hero__item set-bg" data-setbg="img/hero/banner.jpg">
                        <div class="hero__text">
                            <span>????? ??n t????i ngon</span>
                            <h2>Th???c ph???m<br />100% Organic</h2>
                            <p>Nh???n giao h??ng mi???n ph??</p>
                            <a href="trang-chu" class="primary-btn">SHOP</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->