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
        if (account == null || !account.isEmployee()) {
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
                        <h2>Manager</h2>
                        <div class="breadcrumb__option">
                            <a href="index.html">Home</a>
                            <span>Manager</span>
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
                    <div class="shoping__cart__btns">
                        <a href="add-product.html" class="float-right site-btn cart-btn">ADD NEW PRODUCT</a>
                    </div>
                </div>
            </div>
            <br><br>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Your products</th>
                                    <th>Price</th>
                                    <th>Sold</th>
                                    <th>Category</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <%for (Product p: list) {%>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="<%=p.getImage()%>" width="150" alt="">
                                        <h5><a href="product.html?id=<%=p.getId()%>"><%=p.getName()%></a></h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        <%=p.getPrice()%> VND
                                    </td>
                                    <td class="shoping__cart__total">
                                        <%=p.countSold()%>
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity"><%=p.getCategory().getName()%></div>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_pencil-edit"></span>
                                    </td>
                                </tr>
                            <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
                            
    <style>
        .shoping__cart__item a {
            color: #222;
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