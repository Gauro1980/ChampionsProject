<%-- 
    Document   : consultar
    Created on : 16/10/2021, 09:25:49 AM
    Author     : amaur
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page pageEncoding="UTF-8" %>
<%
    Statement st = (Statement) session.getAttribute("st");
    String buscarEquipo = (String) request.getParameter("consulta");
    ResultSet rs;
    ResultSet bp;
    List<Integer> lBuscar = new ArrayList<>();
    List<Object> faseC = new ArrayList<>();
    List<Object> partidoId = new ArrayList<>();
    List<Object> equiposL = new ArrayList<>();
    List<Object> equiposV = new ArrayList<>();
    List<Object> nombreEquiposL = new ArrayList<>();
    List<Object> nombreEquiposV = new ArrayList<>();
    List<Object> fechas = new ArrayList<>();
    List<Object> golesL = new ArrayList<>();
    List<Object> golesV = new ArrayList<>();
    List<Object> escudoL = new ArrayList<>();
    List<Object> escudoV = new ArrayList<>();
    rs = st.executeQuery("select * from EQUIPOS where  NOMBRE_EQUIPO LIKE '%" + buscarEquipo + "%'");

    while (rs.next()) {
        lBuscar.add((Integer) rs.getObject("ID"));
        
    }
    for (Integer buscar : lBuscar) {
        out.println(buscar);
        bp = st.executeQuery("select * from PARTIDOS where EQUIPO_LOCAL=" + buscar + " or EQUIPO_VISITANTE=" + buscar +" ORDER BY FECHA DESC");
        while (bp.next()) {
            partidoId.add(bp.getObject("ID"));
            faseC.add(bp.getObject("FASE_CAMPEONATO"));
            equiposL.add(bp.getObject("EQUIPO_LOCAL"));
            equiposV.add(bp.getObject("EQUIPO_VISITANTE"));
            fechas.add(bp.getObject("FECHA"));
            golesL.add(bp.getObject("GOLES_LOCAL"));
            golesV.add(bp.getObject("GOLES_VISITANTE"));
        }
    }
    for(int i=0 ; i<equiposL.size();i++){
        rs = st.executeQuery("select * from EQUIPOS where  ID = " + equiposL.get(i) +"");
        if (rs.next()){
            nombreEquiposL.add(rs.getObject("NOMBRE_EQUIPO"));
            escudoL.add(rs.getObject("ESCUDO_RUTA"));
        }
    }
    for(int i=0 ; i<equiposV.size();i++){
        rs = st.executeQuery("select * from EQUIPOS where  ID = " + equiposV.get(i) +"");
        if (rs.next()){
            nombreEquiposV.add(rs.getObject("NOMBRE_EQUIPO"));
            escudoV.add(rs.getObject("ESCUDO_RUTA"));
        }
    }
    
     session.setAttribute("PARTIDOID", partidoId);
     session.setAttribute("FASEC", faseC);
     session.setAttribute("EQUIPOL", nombreEquiposL);
     session.setAttribute("ESCUDOL", escudoL);
     session.setAttribute("EQUIPOV", nombreEquiposV);
     session.setAttribute("ESCUDOV", escudoV);
     session.setAttribute("FECHA", fechas);
     session.setAttribute("GOLESL", golesL);
     session.setAttribute("GOLESV", golesV);
     
     for(int i=0 ; i<equiposV.size();i++){
     out.println(nombreEquiposL.get(i)+"-"+nombreEquiposV.get(i)+"-"+fechas.get(i)+"-"+golesL.get(i)+"-"+golesV.get(i));
     out.println(nombreEquiposL.get(i));
     }
     response.sendRedirect("../busqueda.jsp");

%>
