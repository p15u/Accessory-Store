<%@page import="model.Product"%>
<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Vietnamese Traditional Cake</title>

    <%@include file="/WEB-INF/inc/style.jsp"%>
</head>
<body>
    <%@include file="/WEB-INF/inc/header.jsp"%>
    
    <%
        List<Category> cates = controller.DB.getAllCategories();
        List<Product> pros = controller.DB.getProducts(10);
        
        String category = request.getParameter("category");
        if (category != null && category.matches("^[0-9]+$")) {
            int id = Integer.valueOf(category);
            for (int i = 0; i < pros.size();) {
                if (pros.get(i).getCategory().getId() != id) {
                    pros.remove(i);
                } else {
                    i++;
                }
            }
        }
        
        String name = request.getParameter("name");
        if (name != null && !name.isEmpty()) {
            name = name.toLowerCase();
            for (int i = 0; i < pros.size();) {
                if (!pros.get(i).getName().toLowerCase().contains(name)) {
                    pros.remove(i);
                } else {
                    i++;
                }
            }
        }
    %>
    
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All Categories</span>
                        </div>
                        <ul>
                        <%for (Category cate: cates) {%>
                            <li>
                                <a href="shop.html?category=<%=cate.getId()%>">
                                <%=cate.getName()%></a>
                            </li>
                        <%}%>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="shop.html">
                                <input name="name" type="text" placeholder="What do you need?" required>
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+84 386000555</h5>
                                <span>Support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Traditional Cake Shop</h2>
                        <div class="breadcrumb__option">
                            <a href="index.html">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>Categories</h4>
                            <ul>
                            <%for (Category cate: cates) {%>
                                <li>
                                    <a href="shop.html?category=<%=cate.getId()%>">
                                    <%=cate.getName()%></a>
                                </li>
                            <%}%>
                            </ul>
                        </div>
                        <div class="sidebar__item">
                            <h4>Price</h4>
                            <div class="price-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                    data-min="10000" data-max="50000">
                                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                </div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <input type="text" id="minamount">
                                        <input type="text" id="maxamount">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select>
                                        <option value="0">Date</option>
                                        <option value="0">Name  (A to Z)</option>
                                        <option value="0">Price (low to high)</option>
                                        <option value="0">Price (high to low)</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <!--h6><span></span> Products found</h6-->
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    <%for (Product p: pros) {%>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="<%=p.getImage()%>">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="update-cart?act=add&id=<%=p.getId()%>"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="product.html?id=<%=p.getId()%>"><%=p.getName()%></a></h6>
                                    <h5><%=p.getPrice()%> VND</h5>
                                </div>
                            </div>
                        </div>
                    <%}%>
                    </div>
                    <!--div class="product__pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div-->
                </div>
            </div>
        </div>
    </section>
    
    <%@include file="/WEB-INF/inc/footer.jsp"%>
 
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</body> 
</html>