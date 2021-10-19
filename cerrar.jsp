<%-- 
    Document   : cerrar
    Created on : 17/10/2021, 12:06:56 PM
    Author     : amaur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
session.invalidate();
response.sendRedirect("./index.html");
%>
