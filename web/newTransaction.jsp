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
    </head>
    <body background="resources/trama.jpg">
    </body>
</html>
