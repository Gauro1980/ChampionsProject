<%-- 
    Document   : cargueDatos
    Created on : 11/10/2021, 09:47:16 AM
    Author     : amaur
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page pageEncoding="UTF-8" %>
<%
    //int rol = (int)session.getAttribute("rol");

    if (((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) || ((int) (session.getAttribute("rol")) != 1)) {
        response.sendRedirect("./login.jsp");
    } else {
        List<Object> obejtoBdFases=new ArrayList();
        List<Object> obejtoBdCatergorias=new ArrayList();
        List<Object> obejtoBdEquipos=new ArrayList();
        List<Object> obejtoBdEquiposGrupo=new ArrayList();
        List<Object> obejtoBdGrupos=new ArrayList();
       
 
        Statement st = (Statement) session.getAttribute("st");
        ResultSet rs;
        
        rs = st.executeQuery("select * from FASES where ACTIVO = 1"); 
        while(rs.next()){
            obejtoBdFases.add(rs.getObject("NOMBRE_FASE"));
            session.setAttribute("FASES", (String)rs.getObject("NOMBRE_FASE"));
        }
       
        rs = st.executeQuery("select * from CATEGORIAS"); 
        while(rs.next()){
            obejtoBdCatergorias.add(rs.getObject("NOMBRE_CATEGORIA"));
            session.setAttribute("GENEROS", obejtoBdCatergorias);
        }
        
        rs = st.executeQuery("select * from EQUIPOS where ACTIVO = 1"); 
        while(rs.next()){
            out.print(rs);
            obejtoBdEquipos.add(rs.getObject("NOMBRE_EQUIPO"));
            obejtoBdEquiposGrupo.add(rs.getObject("GRUPO"));
            session.setAttribute("EQUIPOS", obejtoBdEquipos);
            session.setAttribute("EQUIPOS_GRUPO", obejtoBdEquiposGrupo);
        }
        
        rs = st.executeQuery("select * from GRUPOS"); 
        while(rs.next()){
            obejtoBdGrupos.add(rs.getObject("NOMBRE_GRUPO"));
            session.setAttribute("GRUPOS", obejtoBdGrupos);
        }
        response.sendRedirect("../Registrar_Partidos.jsp");

    }
%>

