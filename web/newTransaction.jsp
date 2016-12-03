<%-- 
    Document   : newTransaction
    Created on : 29-nov-2016, 20:38:06
    Author     : Hugo
--%>

<%@page import="DataAccess.Transactions.TransactionRepository"%>
<%@page import="DataAccess.Transactions.ITransactionRepository"%>
<%@page import="DataAccess.Util.*"%>
<%@page import="Entities.Users"%>
<%@page import="Entities.Categories"%>
<%@page import="java.util.List"%>
<%@page import="Entities.Types"%>
<%@page import="DataAccess.Types.TypeRepository"%>
<%@page import="DataAccess.Types.ITypeRepository"%>
<%@page import="DataAccess.Categories.CategoryRepository"%>
<%@page import="DataAccess.Categories.ICategoryRepository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ICategoryRepository catRepo = new CategoryRepository();%>
<% ITypeRepository typeRepo = new TypeRepository();%>
<% ITransactionRepository transRepo = new TransactionRepository();%>
<% IUtil util = new Util();%>
<% List<Types> types = typeRepo.GetAllTypes();%>
<% List<Categories> categories = catRepo.GetAllCategories();%>
<% Users cUser = (Users)session.getAttribute("CurrentUser");%>
<% double balance = transRepo.GetBalancePerMonth(util.getActualMonth(), cUser.getIdUser());%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
        <title>TheWallet</title>

        <!-- CSS  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <script src="http://code.highcharts.com/highcharts.js"></script>
    </head>
    <body background="resources/trama.jpg">
        <nav class="teal" role="navigation">
          <div class="nav-wrapper container">
            <a id="logo-container" href="newTransaction.jsp" class="brand-logo white-text">TheWallet</a>
            <ul class="right hide-on-med-and-down">
                <li><a  class="white-text" >Bienvenido, <%= cUser.getUsername()%></a></li>
              <li><a  class="white-text" href="index.jsp">Logout</a></li>
            </ul>

            <ul id="nav-mobile" class="side-nav">
              <li><a href="login.jsp">Iniciar Sesión</a></li>
              <li><a href="register.jsp">Registrarse</a></li>
            </ul>
            <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons white-text">menu</i></a>
          </div>
        </nav>
        
        <div class="row col s12">
            <div class="col s4">
                <form class="col s12" action="Add" method="POST">
                <div class="card white darken-1">
                      <div class="card-content black-text">
                        <span class="card-title">Nueva Transacción</span>
                        <div class="row">
                            <div class="input-field col s12">
                                <input name = "txtDescription" id="txtDescription" type="text" required>
                                <label for="txtDescription">Descripción</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input name="txtValue" id="txtValue" type="number" step="any" required>
                                <label for="txtValue">Cantidad</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <select name="slType" id="slType" required>
                                    <option value="" disabled selected>Selecciona un tipo...</option>
                                    <%for (Types temp:types){%>
                                    <option value="<%=temp.getIdType() %>"><%=temp.getDescription()%></option>
                                    <%}%>
                                </select>
                                <label>Tipo</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <select name="slCategory" id="slCategory" required>
                                    <option value="" disabled selected>Selecciona una categoría...</option>
                                    <%for (Categories temp:categories){%>
                                    <option value="<%=temp.getIdCategory()%>"><%=temp.getDescription()%></option>
                                    <%}%>
                                </select>
                                <label>Categoría</label>
                            </div>
                        </div>
                      </div>
                      <div class="card-action">
                        <div class="row center">
                              <i class="center btn-large waves-effect waves-light brown lighten-1 waves-input-wrapper" style=""><input type="submit" id="btnAdd" class="center-align waves-button-input" value="Agregar" style=""></i>
                        </div>
                      </div>
                </div>
              </form>
            </div>
            <div class="col s4">
              <div class="card white darken-1">
                      <div class="card-content black-text">
                        <span class="card-title">Resumen del Mes: <%=util.getActualMonthName()%></span>
                        <h5>Balance</h5>
                        <%if (balance<0){%>
                        <h4><font color="red"><%=balance%></font></h4>
                        <%}%>
                        <%if (transRepo.GetBalancePerMonth(util.getActualMonth(), cUser.getIdUser())>=0){%>
                        <h4><font color="green"><%=balance%></font></h4>
                        <%}%>
                            
                      </div>
                      <div class="card-action">
                       
                      </div>
                </div>
            </div>
            <div class="col s4">
                <div class="card white darken-1">
                      <div class="card-content black-text">
                        <span class="card-title">Gráfica del Movimiento por Mes</span>

                            
                            
                      </div>
                      <div class="card-action">
                       
                      </div>
                </div>
            </div>
        </div>
        
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script>
            $(function() {
                    Materialize.updateTextFields();
                });
        </script>
        <script>
            $(document).ready(function() {
                $('select').material_select();
              });
        </script>
        <script src="js/init.js"></script>
    </body>
</html>
