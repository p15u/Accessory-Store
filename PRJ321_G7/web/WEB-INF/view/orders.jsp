<%@page import="model.Order"%>
<%@page import="controller.DB"%>
<%@page import="model.Product"%>
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
        if (account == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        
        List<Product> list = account.getOwnProducts();
    %>
    
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Your Orders</h2>
                        <div class="breadcrumb__option">
                            <a href="index.html">Home</a>
                            <span>Orders</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <%
        List<Order> orders = account.getAllOrders();
    %>
    
    <section class="spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <p><strong>Date</strong></p>
                </div>
                <div class="col-lg-2">
                    <p class="float-right"><strong>Total</strong></p>
                </div>
                <div class="col-lg-2">
                    <p><strong>Address</strong></p>
                </div>
                <div class="col-lg-2">
                    <p><strong>Receiver name</strong></p>
                </div>
                <div class="col-lg-2">
                    <p><strong>Receiver phone</strong></p>
                </div>
                <div class="col-lg-2">
                    <p><strong>Notes</strong></p>
                </div>
            </div>
            <hr>
        <%for (Order o: orders) {%>
            <div class="row">
                <div class="col-lg-2">
                    <p><%=o.getOrderDate()%></p>
                </div>
                <div class="col-lg-2">
                    <p class="float-right"><%=o.getTotalCost()%> VND</p>
                </div>
                <div class="col-lg-2">
                    <p><%=o.getAddress()%></p>
                </div>
                <div class="col-lg-2">
                    <p><%=o.getReceiverName()%></p>
                </div>
                <div class="col-lg-2">
                    <p><%=o.getReceiverPhone()%></p>
                </div>
                <div class="col-lg-2">
                    <p><%=o.getNotes()%></p>
                </div>
            </div>
            <details>
                <summary>View details</summary>
                <hr>
                <div class="row">
                    <div class="col-lg-6"></div>
                    <div class="col-lg-2">
                        <p><strong>Product name</strong></p>
                        <hr>
                    </div>
                    <div class="col-lg-2">
                        <p><strong>Price</strong></p>A
                        <hr>
                    </div>
                    <div class="col-lg-2">
                        <p><strong>Quantity</strong></p>
                        <hr>
                    </div>
                </div>
            <%
                List<Order.Detail> ds = o.getDetails();
                for (Order.Detail d: ds) {
                    Product p = d.getProduct();
            %>
                <div class="row">
                    <div class="col-lg-6"></div>
                    <div class="col-lg-2">
                        <p><a class="text-primary" href="product.html?id=<%=p.getId()%>">
                            <%=p.getName()%></a></p>
                    </div>
                    <div class="col-lg-2">
                        <p class="float-right"><%=d.getPrice()%> VND</p>
                    </div>
                    <div class="col-lg-2">
                        <p class="float-right"><%=d.getQuantity()%></p>
                    </div>
                </div>
            <%}%>
            </details>
            <hr>
        <%}%>
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