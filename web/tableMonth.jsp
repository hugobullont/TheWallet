<%-- 
    Document   : tableMonth
    Created on : 10-dic-2016, 20:30:50
    Author     : Hugo
--%>

<%@page import="Entities.Transactions"%>
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
<% List<Transactions> transactions = transRepo.GetTransactionsPerMonth(util.getActualMonth(), cUser.getIdUser());%>
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
    </head>
    <body background="resources/trama.jpg">
        <nav class="teal" role="navigation">
          <div class="nav-wrapper container">
            <a id="logo-container" href="newTransaction.jsp" class="brand-logo white-text">TheWallet</a>
            <ul class="right hide-on-med-and-down">
                <li><a  class="white-text" href="newTransaction.jsp" >Inicio</a></li>
                <li><a  class="white-text" >Bienvenido, <%= cUser.getUsername()%></a></li>
              <li><a  class="white-text" href="index.jsp">Logout</a></li>
            </ul>

            <ul id="nav-mobile" class="side-nav">
              <li><a  class="white-text" >Bienvenido, <%= cUser.getUsername()%></a></li>
              <li><a  class="white-text" href="newTransaction.jsp" >Inicio</a></li>
              <li><a  class="white-text" href="index.jsp">Logout</a></li>
            </ul>
            <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons white-text">menu</i></a>
          </div>
        </nav>
              
              
        <div class="card white darken-1">
            <div class="card-content black-text">
                <span class="card-title">Historial de <%=util.getActualMonthName()%></span>
                <table class="striped bordered">
                    <thead>
                      <tr>
                          <th>Descripción</th>
                          <th>Categoría</th>
                          <th>Tipo</th>
                          <th>Fecha</th>
                          <th>Valor (en soles)</th>
                      </tr>
                    </thead>

                    <tbody>
                      <%for (Transactions temp:transactions){%>
                      <tr>
                        <td><%=temp.getDescription() %></td>
                        <td><%=temp.getCategories().getDescription() %></td>
                        <td><%=temp.getTypes().getDescription() %></td>
                        <td><%=temp.getDate().toString() %></td>
                        <%if (temp.getTypes().getIdType()==2){%>
                        <td><font color="green">S/.<%=temp.getValue() %></font></td>
                        <%}%>
                        <%if (temp.getTypes().getIdType()==1){%>
                        <td><font color="red">S/.<%=temp.getValue() %></font></td>
                        <%}%>
                      </tr>
                      <%}%>
                    </tbody>
                </table>
            </div>
        </div>     
                    
        <div class="card white darken-1">
            <div class="card-content black-text">
                <span class="card-title">Resumen</span>
                <div class="row col s12">
                    <div class="col s4">
                        <h5>Total Entradas</h5>
                        <h4><font color="green">S/.<%=transRepo.GetIncomes(util.getActualMonth(), cUser.getIdUser())%></font></h4>
                    </div>
                    <div class="col s4">
                        <h5>Total Salidas</h5>
                        <h4><font color="red">S/.<%=transRepo.GetExpenses(util.getActualMonth(), cUser.getIdUser())%></font></h4>
                    </div>
                    <div class="col s4">
                        <h5>Balance</h5>
                        <%if (balance<0){%>
                        <h4><font color="red"><%=balance%></font></h4>
                        <%}%>
                        <%if (transRepo.GetBalancePerMonth(util.getActualMonth(), cUser.getIdUser())>=0){%>
                        <h4><font color="green"><%=balance%></font></h4>
                        <%}%>
                    </div> 
                </div>
            </div>
        </div>
    </body>
</html>
