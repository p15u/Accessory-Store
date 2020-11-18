<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Category> cates = controller.DB.getAllCategories();
%>

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
    
    <section class="hero">
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
                            <!--li><a href="#">Fried cake</a></li>
                            <li><a href="#">Made of bean</a></li>
                            <li><a href="#">Made of coconut</a></li>
                            <li><a href="#">Made of flour</a></li>
                            <li><a href="#">Made of rice</a></li>
                            <li><a href="#">Other</a></li-->
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
                    <div class="hero__item set-bg" data-setbg="img/banner.png">
                        <div class="hero__text">
                            <span>HANDMADE CAKE</span>
                            <h2>Vietnamese<br>traditional</h2>
                            <h4>100% balance &amp; healthy</h4><br/>
                            <p>Free Pickup and Delivery Available</p>
                            <a href="shop.html" class="primary-btn">SHOP NOW</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
                            
    <%
        List<Product> latests = controller.DB.getProducts(10);
    %>
    
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="categories__slider owl-carousel">
                <%for (Product p: latests) {%>
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="<%=p.getImage()%>">
                            <h5><a href="product.html?id=<%=p.getId()%>"><%=p.getName()%></a></h5>
                        </div>
                    </div>
                <%}%>
                </div>
            </div>
        </div>
    </section>
           
    <style>
        section.categories {
            margin-bottom: 50px;
        }
    </style>
                
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
