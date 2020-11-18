<%@page import="model.Reply"%>
<%@page import="controller.DB"%>
<%@page import="model.ProductPage"%>
<%@page import="model.Product"%>
<%@page import="model.Category"%>
<%@page import="model.Comment"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String id = request.getParameter("id");
    Product pro = null;
    if (id != null && !id.isEmpty() && id.matches("^[0-9]+$")) {
        pro = controller.DB.getProduct(Integer.valueOf(id));
    }
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
    
    <%
        List<Category> cates = DB.getAllCategories();
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
                        <h2><%=pro != null ? pro.getName() : "Product Not Found!"%></h2>
                        <div class="breadcrumb__option">
                            <a href="index.html">Home</a>
                            <a href="shop.html">Shop</a>
                            <span>Product</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
<%if (pro != null) {%>
<%
    Account author = pro.getAuthor();
    ProductPage propage = pro.getProductPage();
    if (propage == null) {
        response.sendError(404);
        return;
    }
    
    List<Comment> cmts = pro.getComments();
%>
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="<%=pro.getImage()%>" alt="">
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
                            <img data-imgbigurl="<%=pro.getImage()%>" src="<%=pro.getImage()%>" alt="">
                        <%
                            List<String> imgs = pro.getSubImages();
                            for (String url: imgs) {
                        %>
                        <img data-imgbigurl="<%=url%>" src="<%=url%>" alt="">
                        <%  }%>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3><%=pro.getName()%></h3>
                        <div class="product__details__price"><%=pro.getPrice()%> VND</div>
                        <p><%=pro.getDescription()%></p>
                        <a href="update-cart?act=add&id=<%=pro.getId()%>" class="primary-btn">ADD TO CART</a>
                        <ul>
                            <li><b>Seller</b><span><a href="shop.html?author=<%=author.getId()%>"><%=author.getName()%></a></span></li>
                            <li><b>Availability</b><span><%=pro.getStatus() ? "Selling" : "Temporarily not sold"%></span></li>
                            <li><b>Size</b><span><%=pro.getSize()%> cm</span></li>
                            <li><b>Weight</b><span><%=pro.getWeight()%> gram</span></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">Information</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">Comments <span>(<%=cmts.size()%>)</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <p><%=propage.getContent()%></p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <%  for (Comment cmt: cmts) {
                                    List<Reply> reps = cmt.getReplies();
                            %>
                                <div class="product__details__tab__desc container">
                                    <div class="row">
                                        <div class="col-lg-1">
                                            <img class="cmt-avt" src="<%=cmt.getAuthor().getInfo().getAvatar()%>">
                                        </div>
                                        <div class="col-lg-11">
                                            <h4><%=cmt.getAuthor().getName()%></h4>
                                            <p><%=cmt.getContent()%></p>
                                        </div>
                                    </div>
                                    <%for (Reply rep: reps) {%>
                                        <div class="row">
                                            <div class="col-lg-1"></div>
                                            <div class="col-lg-9">
                                                <hr>
                                                <div class="row">
                                                    <div class="col-lg-1">
                                                        <img class="cmt-avt" src="<%=rep.getAuthor().getInfo().getAvatar()%>">
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <h4><%=rep.getAuthor().getName()%></h4>
                                                        <p><%=rep.getContent()%></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2"></div>
                                        </div>
                                    <%}%>
                                    <br>
                                <%if (account != null) {%>
                                    <form action="comment" method="POST">
                                        <div class="row">
                                            <div class="col-lg-1"></div>
                                            <div class="col-lg-5 checkout__input">
                                                <input name="rep" hidden>
                                                <input name="id" hidden value="<%=cmt.getId()%>">
                                                <input name="content" type="text" placeholder="What do you think..." required>
                                            </div>
                                            <div class="col-lg-2">
                                                <button type="submit" class="site-btn">Reply</button>
                                            </div>
                                            <div class="col-lg-4"></div>
                                        </div>
                                    </form>
                                <%}%>
                                </div>
                                <hr>
                            <%
                                }
                            %>
                            <%if (pro.canComment(account)) {%>
                                <form class="m-5" action="comment" method="POST">
                                    <div class="row">
                                        <div class="col-lg-8 checkout__input">
                                            <input name="cmt" hidden>
                                            <input name="id" hidden value="<%=pro.getId()%>">
                                            <input name="content" type="text" placeholder="What do you think..." required>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="submit" class="site-btn">Comment</button>
                                        </div>
                                        <div class="col-lg-2"></div>
                                    </div>
                                </form>
                            <%}%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
                            
    <style>
        .cmt-avt {
            max-width: 48px;
            max-height: 48px;
        }
        .product__details__text a:hover {
            color: #222;
        }
        .product__details__text span a::before {
            content: "@";
        }
    </style>
                            
<%}%>
    
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