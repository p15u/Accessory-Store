<%@page import="model.Cart"%>
<%@page import="model.Account"%>
<%
    if (session == null) session = request.getSession();
    
    Account account = (Account)session.getAttribute("account");
    Cart cart = (Cart)session.getAttribute("cart");
    if (cart == null) {
        cart = new Cart();
        session.setAttribute("cart", cart);
    }
    
    String uri = request.getRequestURI();
    if (uri == null) uri = "";
%>

    <div id="preloder">
        <div class="loader"></div>
    </div>

    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i>support@tdncake.vn</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                            </div>
                        <% if (account != null) { %> 
                            <div class="header__top__right__language">
                                <div><%=account.getName()%></div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                <%if (account.isEmployee()) { %>
                                    <li><a href="manager.html">Manager</a></li>
                                <%} else if (account.isAdmin()) {%>
                                    <li><a href="dashboard.html">Dashboard</a></li>
                                <%}%>
                                    <li><a href="profile.html">Profile</a></li>
                                    <li><a href="orders.html">Orders</a></li>
                                    <li><a href="logout">Logout</a></li>
                                </ul>
                            </div>
                        <%} else {%>
                            <div class="header__top__right__auth">
                                <a href="login.html"><i class="fa fa-user"></i> Login</a>
                            </div>
                        <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="<%=(uri.contains("index.html") || uri.endsWith("/")) ? "active" : "" %>"><a href="./index.html">Home</a></li>
                            <li class="<%=uri.contains("shop.html") ? "active" : "" %>"><a href="./shop.html">Shop</a></li>
                            <li class="<%=uri.contains("contact.html") ? "active" : "" %>"><a href="./contact.html">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li>
                                <a href="shopping-cart.html"><i class="fa fa-shopping-bag">
                                </i><span><%=cart.count()%></span></a>
                            </li>
                        </ul>
                        <%if (!cart.isEmpty()) {%>
                        <div class="header__cart__price">
                            Total: <span><%=cart.total()%> VND</span>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>