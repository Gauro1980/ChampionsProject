<%-- 
    Document   : actualizar
    Created on : 17/10/2021, 07:19:11 AM
    Author     : amaur
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Statement st = (Statement) session.getAttribute("st");
    Integer id = Integer.parseInt(request.getParameter("idpartido"));
    Integer fase = Integer.parseInt(request.getParameter("idfase"));
    String equipoL = (String) request.getParameter("equipoL");
    String equipoV = (String) request.getParameter("equipoV");
    Integer golesL = Integer.parseInt(request.getParameter("goleslocal"));
    Integer golesV = Integer.parseInt(request.getParameter("golesvisitante"));
    
    
    
    Integer nEquipoL = 0;
    Integer nEquipoV = 0;

    ResultSet rs;
    
    st.executeUpdate("UPDATE `champions_project`.`PARTIDOS` SET GOLES_LOCAL=" + golesL + ", GOLES_VISITANTE=" + golesV + " WHERE ID=" + id);

    if (fase == 1) {

        rs = st.executeQuery("SELECT * FROM EQUIPOS WHERE NOMBRE_EQUIPO='" + equipoL + "'");
        if (rs.next()) {
            nEquipoL = (Integer) rs.getObject("ID");
        }
        rs = st.executeQuery("SELECT * FROM EQUIPOS WHERE NOMBRE_EQUIPO='" + equipoV + "'");
        if (rs.next()) {
            nEquipoV = (Integer) rs.getObject("ID");
        }
        if (golesL > golesV) {
            st.executeUpdate("UPDATE `champions_project`.`EQUIPOS` SET PUNTOS=PUNTOS+" + 3 + ", VICTORIAS=VICTORIAS+" + 1 + ", GOLES_ANOTADOS=GOLES_ANOTADOS+" + golesL + ", GOLES_RECIBIDOS=GOLES_RECIBIDOS+" + golesV + " WHERE ID='" + nEquipoL + "'");
            st.executeUpdate("UPDATE `champions_project`.`EQUIPOS` SET DERROTAS=DERROTAS+" + 1 + ", GOLES_ANOTADOS=GOLES_ANOTADOS+" + golesV + ", GOLES_RECIBIDOS=GOLES_RECIBIDOS+" + golesL + " WHERE ID='" + nEquipoV + "'");
        } else {
            if (golesV > golesL) {
                st.executeUpdate("UPDATE `champions_project`.`EQUIPOS` SET PUNTOS=PUNTOS+" + 3 + ", VICTORIAS=VICTORIAS+" + 1 + ", GOLES_ANOTADOS=GOLES_ANOTADOS+" + golesV + ", GOLES_RECIBIDOS=GOLES_RECIBIDOS+" + golesL + " WHERE ID='" + nEquipoV + "'");
                st.executeUpdate("UPDATE `champions_project`.`EQUIPOS` SET DERROTAS=DERROTAS+" + 1 + ", GOLES_ANOTADOS=GOLES_ANOTADOS+" + golesL + ", GOLES_RECIBIDOS=GOLES_RECIBIDOS+" + golesV + " WHERE ID='" + nEquipoL + "'");
            } else {
                st.executeUpdate("UPDATE `champions_project`.`EQUIPOS` SET PUNTOS=PUNTOS+" + 1 + ", EMPATES=EMPATES+" + 1 + ", GOLES_ANOTADOS=GOLES_ANOTADOS+" + golesL + ", GOLES_RECIBIDOS=GOLES_RECIBIDOS+" + golesV + " WHERE ID='" + nEquipoL + "'");
                st.executeUpdate("UPDATE `champions_project`.`EQUIPOS` SET PUNTOS=PUNTOS+" + 1 + ", EMPATES=EMPATES+" + 1 + ", GOLES_ANOTADOS=GOLES_ANOTADOS+" + golesV + ", GOLES_RECIBIDOS=GOLES_RECIBIDOS+" + golesL + " WHERE ID='" + nEquipoV + "'");
            }
        }
    }
   
     session.removeAttribute("PARTIDOID");
     session.removeAttribute("FASEC");
     session.removeAttribute("EQUIPOL");
     session.removeAttribute("ESCUDOL");
     session.removeAttribute("EQUIPOV");
     session.removeAttribute("ESCUDOV");
     session.removeAttribute("FECHA");
     session.removeAttribute("GOLESL");
     session.removeAttribute("GOLESV");
    
    response.sendRedirect("../busqueda.jsp");

    
%>