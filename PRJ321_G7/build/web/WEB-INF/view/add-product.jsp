<%@page import="model.Category"%>
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
        
        List<Category> cates = DB.getAllCategories();
    %>
    
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Add new product</h2>
                        <div class="breadcrumb__option">
                            <a href="index.html">Home</a>
                            <a href="manager.html">Manager</a>
                            <span>Add new</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="shoping-cart spad">
        <div class="container"><form action="add" method="POST">
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-8">
                    <div class="checkout__input">
                        <p>Product name</p>
                        <input name="name" type="text" required>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="checkout__input">
                                <p>Price (VND)</p>
                                <input name="price" type="number" value="10000" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="checkout__input">
                                <p>Category</p>
                                <select class="w-100" name="category">
                                <%for (Category c: cates) {%>
                                    <option value="<%=c.getId()%>"><%=c.getName()%></option>
                                <%}%>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6 checkout__input">
                            <p>Size (cm)</p>
                            <input name="size" type="number" value="10" required>
                        </div>
                        <div class="col-6 checkout__input">
                            <p>Weight (gram)</p>
                            <input name="weight" type="number" value="100" required>
                        </div>
                    </div>
                    <div class="checkout__input">
                        <p>Short description</p>
                        <input name="description" type="text">
                    </div>
                    <div class="checkout__input">
                        <p>Main image</p>
                        <input name="image" type="text" placeholder="https://link-to-image..." required>
                    </div>
                    <br>
                    <div class="checkout__input">
                        <p>More information</p>
                        <div class="row">
                            <div class="col-lg-12">
                                <textarea class="w-100 more-info" name="information" rows="4" required></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6 checkout__input">
                            <p>Sub-image 1</p>
                            <input name="sub-image" type="text" placeholder="https://link-to-image..." required>
                        </div>
                        <div class="col-6 checkout__input">
                            <p>Sub-image 2</p>
                            <input name="sub-image" type="text" placeholder="https://link-to-image..." required>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-6 checkout__input">
                            <p>Sub-image 3</p>
                            <input name="sub-image" type="text" placeholder="https://link-to-image..." required>
                        </div>
                        <div class="col-6 checkout__input">
                            <p>Sub-image 4</p>
                            <input name="sub-image" type="text" placeholder="https://link-to-image..." required>
                        </div>
                    </div>
                    <br><hr>
                    <button type="submit" class="float-right w-25 site-btn">SUBMIT</button>
                </div>
                <div class="col-lg-2"></div>
            </div>
        </form></div>
    </section>

    <style>
        .more-info {
            border-radius: 3px;
            border: solid 1px #EEE;
            padding: 15px 20px;
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