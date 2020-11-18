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
    
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="index.html">Home</a>
                            <span>Shopping cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <%for (Cart.Item i: cart.getItems()) {%>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="<%=i.product.getImage()%>" alt="" width="100">
                                        <h5><%=i.product.getName()%></h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        <%=i.product.getPrice()%> VND
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <a href="update-cart?act=decrease&id=<%=i.product.getId()%>"><span class="dec qtybtn">-</span></a>
                                                <input type="text" value="<%=i.count%>">
                                                <a href="update-cart?act=add&id=<%=i.product.getId()%>"><span class="inc qtybtn">+</span></a>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        <%=i.product.getPrice() * i.count%> VND
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <a href="update-cart?act=remove&id=<%=i.product.getId()%>"><span class="icon_close"></span></a>
                                    </td>
                                </tr>
                            <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="shop.html" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                        <a href="update-cart?act=update" class="primary-btn cart-btn cart-btn-right">
                            UPDATE CART</a>
                    </div>
                </div>
                <div class="col-lg-6">
                </div>
                <div class="col-lg-6">
                <%if (cart.totalTotal() > 0) {%>
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Shipment <span><%=cart.shipCost()%> VND</span></li>
                            <li>VAT <span><%=cart.vat()%> VND</span></li>
                            <li>Total <span><%=cart.totalTotal()%> VND</span></li>
                        </ul>
                    
                        <a href="checkout.html" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                <%}%>
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