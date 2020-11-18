<%@page import="util.Pair"%>
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
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>

    <%@include file="/WEB-INF/inc/style.jsp"%>
</head>
<body>
    <%@include file="/WEB-INF/inc/header.jsp"%>
    
    <%
        if (account == null || !account.isAdmin()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
    %>
    
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Admin Dashboard</h2>
                        <div class="breadcrumb__option">
                            <a href="index.html">Home</a>
                            <span>Dashboard</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="dashboard">
        <div class="container">
            <div class="row statistics">
                <div class="col-lg-2"></div>
                <div class="col-lg-3">
                    <div class="box">
                        <h3 class="sub">SOLD: <%=DB.getTotalSold()%> products</h3>
                    </div>
                </div>
                <div class="col-lg-2"></div>
                <div class="col-lg-3">
                    <div class="box">
                        <h3 class="sub">INCOME: <%=DB.getTotalIncome()%> VND</h3>
                    </div>
                </div>
                <div class="col-lg-2"></div>
            </div>
            <hr>
            <div class="row" statistics>
                <div class="col-lg-1"></div>
                <div class="col">
                    <canvas id="top-customer" width="400" height="300"></canvas>
                    <h3 class="sub">Top 10 customer</h3>
                </div>
                <div class="col-lg-1"></div>
                <div class="col">
                    <canvas id="top-employee" width="400" height="300"></canvas>
                    <h3 class="sub">Top 10 employee</h3>
                </div>
                <div class="col-lg-1"></div>
            </div>
            <hr>
            <div class="row" statistics>
                <div class="col-lg-1"></div>
                <div class="col">
                    <canvas id="top-selling" width="400" height="300"></canvas>
                    <h3 class="sub">Top 10 selling product</h3>
                </div>
                <div class="col-lg-1"></div>
                <div class="col">
                    <!--canvas id="top-employee" width="400" height="300"></canvas>
                    <h3 class="sub">Top 10 employee</h3-->
                </div>
                <div class="col-lg-1"></div>
            </div>
        </div>
    </section>
    
    <style>
        .dashboard {
            margin: 50px 10px;
        }
        .statistics {
            margin: 30px 0;
        }
        h3.sub {
            margin-top: 30px;
            text-align: center;
            font-size: 20px;
        }
        .box {
            vertical-align: middle;
            border: solid 1px #555;
            padding: 5px;
            padding-bottom: 30px;
        }
    </style>
    
<%
    List<Pair<Account, Integer>> topPaid = DB.getTopPaid(10);
    List<Pair<Account, Integer>> topSeller = DB.getTopSeller(10);
    List<Pair<Product, Integer>> topSelling = DB.getTopSellingProduct(10);
%>
    
<script>
    var ctx1 = document.getElementById('top-customer').getContext('2d');
    var ctx2 = document.getElementById('top-employee').getContext('2d');
    var ctx3 = document.getElementById('top-selling').getContext('2d');
    
    Array.prototype.rand = function() {
        var arr = this.slice(0);
        for (var i = 0; i < arr.length; i++) {
            var t = arr[i];
            var p = Math.floor(Math.random()*arr.length);
            arr[i] = arr[p];
            arr[p] = t;
        }
        return arr;
    }
    
    const colors = [
        'rgba(255, 99, 132, 0.5)',
        'rgba(54, 162, 235, 0.5)',
        'rgba(255, 206, 86, 0.5)',
        'rgba(75, 192, 192, 0.5)',
        'rgba(153, 102, 255, 0.5)',
        'rgba(255, 159, 64, 0.5)',
        'rgba(235, 162, 54, 0.5)',
        'rgba(86, 206, 255, 0.5)',
        'rgba(192, 192, 75, 0.5)',
        'rgba(255, 102, 153, 0.5)',
        'rgba(64, 159, 255, 0.5)'
    ];

    new Chart(ctx1, {
        type: 'bar',
        data: {
            labels: [
            <%for (Pair<Account, Integer> p: topPaid) {%>
                '<%=p.getA().getInfo().getFullname()%>',
            <%}%>
            ],
            datasets: [{
                label: 'Paid (VND)',
                data: [
                    <%for (Pair<Account, Integer> p: topPaid) {%>
                        '<%=p.getB()%>',
                    <%}%>
                ],
                backgroundColor: colors.rand(),
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

    new Chart(ctx2, {
        type: 'bar',
        data: {
            labels: [
            <%for (Pair<Account, Integer> p: topSeller) {%>
                '<%=p.getA().getInfo().getFullname()%>',
            <%}%>
            ],
            datasets: [{
                label: 'Product sold',
                data: [
                    <%for (Pair<Account, Integer> p: topSeller) {%>
                        '<%=p.getB()%>',
                    <%}%>
                ],
                backgroundColor: colors.rand(),
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
    
    new Chart(ctx3, {
        type: 'bar',
        data: {
            labels: [
            <%for (Pair<Product, Integer> p: topSelling) {%>
                '<%=p.getA().getName()%>',
            <%}%>
            ],
            datasets: [{
                label: 'Sold times',
                data: [
                    <%for (Pair<Product, Integer> p: topSelling) {%>
                        '<%=p.getB()%>',
                    <%}%>
                ],
                backgroundColor: colors.rand(),
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
</script>

    
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