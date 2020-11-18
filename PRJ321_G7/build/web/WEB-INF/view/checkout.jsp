<%@page import="model.Person"%>
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
        if (cart.isEmpty()) {
            response.sendRedirect("shopping-cart.html");
            return;
        }
        
        String fullname = "";
        String address = "";
        String phone = "";
        String email = "";
        
        if (account != null) {
            Person info = account.getInfo();
            fullname = info.getFullname();
            address = info.getAddress();
            phone = info.getPhone();
            email = info.getEmail();
        }
    %>
    
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Checkout</h2>
                        <div class="breadcrumb__option">
                            <a href="index.html">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>Billing Details</h4>
                <form action="do-checkout" method="POST">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Fullname<span>*</span></p>
                                        <input name="fullname" type="text" required value="<%=fullname%>">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Postcode / ZIP</p>
                                        <input name="zip" type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                <input name="address" type="text" required value="<%=address%>">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input name="phone" type="text" required value="<%=phone%>">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email</p>
                                        <input name="email" type="text" value="<%=email%>">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Notes</p>
                                <input name="notes" type="text" placeholder="Note something...">
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                                <div class="checkout__order__products">Products <span>Total</span></div>
                                <ul>
                                <%for (Cart.Item i: cart.getItems()) {%>
                                    <li><%=i.product.getName()%> <span><%=i.count*i.product.getPrice()%> VND</span></li>
                                <%}%>
                                </ul>
                                <div class="checkout__order__subtotal">Subtotal <span><%=cart.vat()+cart.shipCost()%> VND</span></div>
                                <div class="checkout__order__total">Total <span><%=cart.totalTotal()%> VND</span></div>
                                <div class="checkout__input__checkbox">
                                    <label for="cod">
                                        Cash on delivery
                                        <input type="radio" name="method" value="cod" id="cod" checked="">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="credit">
                                        Credit card
                                        <input type="radio" name="method" value="credit" id="credit">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <button type="submit" class="site-btn">PLACE ORDER</button>
                            </div>
                        </div>
                    </div>
                </form>
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