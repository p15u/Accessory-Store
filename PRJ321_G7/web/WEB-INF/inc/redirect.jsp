<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vietnamese Traditional Cake</title>
        <link rel="stylesheet" type="text/css" href="css/error-style.css">
    </head>
    <body>
        <div class="wrapper">
            <div class="logo">
                <img src="img/big-logo.png"/>
            </div>
            <div class="status">
                <p><%=request.getAttribute("msg")%></p>
                <p>Redirecting...</p>
                <a href="index.html">🔙 TAKE ME HOME</a>
            </div>
        </div>
    </body>
</html>