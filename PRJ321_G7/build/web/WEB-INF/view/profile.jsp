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
        if (account == null) {
            response.sendRedirect("login.html");
            return;
        }
        
        Person info = account.getInfo();
    %>
    
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Profile</h2>
                        <div class="breadcrumb__option">
                            <a href="index.html">Home</a>
                            <span>Profile</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <div class="spad container">
        <div class="row">
            <div class="col-lg-4">
                <h4>Avatar</h4><hr>
                <center>
                    <p><img src="<%=info.getAvatar()%>" width="200"></p>
                    <h4>@<%=account.getUsername()%></h4>
                </center>
                <div class="m-5">
                    <form action="update-info" method="POST">
                        <div class="checkout__input">
                            <input name="avatar" type="text" placeholder="http://link-to-avatar-image..." required>
                        </div>
                        <input hidden name="change-avatar">
                        <button class="w-100 site-btn">CHANGE</button>
                    </form>
                </div>
            </div>
            <div class="col-lg-8">
                <h4>Information</h4><hr>
                <form action="update-info" method="POST">
                    <div class="row">
                        <div class="col-lg-6 checkout__input">
                            <p>Fullname</p>
                            <input name="fullname" type="text" value="<%=info.getFullname()%>">
                        </div>
                        <div class="col-lg-6 checkout__input">
                            <p>Card ID</p>
                            <input name="idcard" type="text" value="<%=info.getIdCard()%>">
                        </div>
                        <div class="col-lg-6 checkout__input">
                            <p>Email</p>
                            <input name="email" type="text" value="<%=info.getEmail()%>">
                        </div>
                        <div class="col-lg-6 checkout__input">
                            <p>Phone number</p>
                            <input name="phone" type="text" value="<%=info.getPhone()%>">
                        </div>
                        <div class="col-lg-12 checkout__input">
                            <p>Address</p>
                            <input name="address" type="text" value="<%=info.getAddress()%>">
                        </div>
                        <div class="col-lg-6 checkout__input">
                            <p>Birthday</p>
                            <input name="birthday" type="date" value="<%=info.getBirthday()%>" required>
                        </div>
                        <div class="col-lg-6 checkout__input">
                        <%String gender = info.getGender();%>
                            <p>Gender</p>
                            <select name="gender" class="w-100 h-50">
                                <option <%=gender.equalsIgnoreCase("male") ? "selected" : ""%>>Male</option>
                                <option <%=gender.equalsIgnoreCase("female") ? "selected" : ""%>>Female</option>
                                <option <%=gender.equalsIgnoreCase("other") ? "selected" : ""%>>Other</option>
                            </select>
                        </div>
                    </div>
                    <input hidden name="update">
                    <button class="w-100 site-btn">UPDATE</button>
                </form>
                <br><br>
                <h4>Change password</h4><hr>
                <form action="update-info" method="POST">
                    <div class="row">
                        <div class="col-lg-4 checkout__input">
                            <p>Current</p>
                            <input name="current" type="password" required>
                        </div>
                        <div class="col-lg-4 checkout__input">
                            <p>New password</p>
                            <input type="password" required>
                        </div>
                        <div class="col-lg-4 checkout__input">
                            <p>Confirm</p>
                            <input name="password" type="password" required>
                        </div>
                    </div>
                    <input hidden name="change-pass">
                    <button class="w-100 site-btn">CHANGE</button>
                </form>
            </div>
        </div>
    </div>

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