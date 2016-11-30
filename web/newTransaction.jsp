<%-- 
    Document   : newTransaction
    Created on : 29-nov-2016, 20:38:06
    Author     : Hugo
--%>

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
<% List<Types> types = typeRepo.GetAllTypes();%>
<% List<Categories> categories = catRepo.GetAllCategories();%>
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
            <li class="uk-active"><a href="newTransaction.jsp">Nueva Transacción</a></li>
            <li><a href="resume.jsp">Resumen</a></li>
            <li class="uk-disabled"><a href="">Pagar Servicios</a></li>
        </ul>
        
        
        <div class="uk-grid">
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
          
            <div class="uk-width-1-3">
                <div class="uk-panel">    
                    <form class="uk-form uk-form-horizontal">
                       <fieldset>
                           <legend>Transacción</legend>
                           <div class="uk-form-row">
                               <label class="uk-form-label" for="">Descripción</label>
                               <div class="uk-form-controls">
                                   <input class="uk-form-width-medium" required type="text" placeholder="Descripción">
                               </div>
                           </div>
                           <div class="uk-form-row">
                               <label class="uk-form-label" for="">Monto</label>
                               <div class="uk-form-controls">
                                   <input class="uk-form-width-medium" required type="text" placeholder="Monto">
                               </div>
                           </div>
                           <div class="uk-form-row">
                               <label class="uk-form-label" for="">Categoría</label>
                               <div class="uk-form-controls">
                                   <select class="uk-form-width-medium" name="slCat" id="slCat">
                                        <option selected disabled>Categorías...</option>
                                        <% for(Categories cat:categories){%>
                                        <option value="<%=cat.getIdCategory()%>"><%=cat.getDescription()%></option>
                                        <%}%>
                                   </select>
                               </div>
                           </div>
                            
                           <div class="uk-form-row">
                               <label class="uk-form-label" for="">Tipo</label>
                               <div class="uk-form-controls">
                                   <select class="uk-form-width-medium" name="slType" id="slType">
                                        <option selected disabled>Tipos...</option>
                                        <% for(Types tipo:types){%>
                                        <option value="<%=tipo.getIdType()%>"><%=tipo.getDescription()%></option>
                                        <%}%>
                                   </select>
                               </div>
                           </div>
                           </br>
                           <div class="uk-form-row">
                               <div class="uk-form-controls">
                                   <button type="submit" class="uk-button">Agregar</button>
                               </div>
                           </div>
                       </fieldset>
                   </form>
                </div>
            </div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
            <div class="uk-width-1-3">&nbsp;</div>
        </div>
    </body>
</html>
