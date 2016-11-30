<%-- 
    Document   : resume
    Created on : 29-nov-2016, 21:24:01
    Author     : Hugo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TheWallet</title>
        <link rel="stylesheet" href="css/uikit.css" />
        <script src="js/jquery.js"></script>
        <script src="js/uikit.js"></script>
    </head>
    <nav class="uk-navbar">
        <a href="#" class="uk-navbar-brand">TheWallet</a>
        <div class="uk-navbar-flip">
            <ul class="uk-navbar-nav">
                <li class="uk-navbar-content">Bienvenido, username</li>
            </ul>
        </div>
    </nav>
    <body>
        <ul class="uk-tab" data-uk-tab>
            <li><a href="newTransaction.jsp">Nueva Transacción</a></li>
            <li  class="uk-active"><a href="resume.jsp">Resumen</a></li>
            <li class="uk-disabled"><a href="">Pagar Servicios</a></li>
        </ul>
    </body>
</html>
