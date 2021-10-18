<%-- 
    Document   : insertarDatos
    Created on : 11/10/2021, 04:28:10 PM
    Author     : amaur
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page pageEncoding="UTF-8" %>


<%
    Statement st = (Statement) session.getAttribute("st");
    int verificacion;
    int fase = 0;
    int equipoL = 0;
    int equipoV = 0;
    int puntosL = 0;
    int victoriasL = 0;
    int derrotasL = 0;
    int empatesL = 0;
    int golesAL = 0;
    int golesRL = 0;
    int puntosV = 0;
    int victoriasV = 0;
    int derrotasV = 0;
    int empatesV = 0;
    int golesAV = 0;
    int golesRV = 0;
    Integer golesVn;
    Integer golesLn;

    String fecha_string = request.getParameter("fecha");
    fecha_string = fecha_string.replace("-", "/");
    String golesL = request.getParameter("goleslocal");
    String golesV = request.getParameter("golesvisitante");

    ResultSet rs;
    rs = st.executeQuery("SELECT ID FROM FASES WHERE NOMBRE_FASE='" + request.getParameter("ListaFase") + "'");
    while (rs.next()) {
        fase = (int) rs.getObject("ID");
    }

    rs = st.executeQuery("SELECT * FROM EQUIPOS WHERE NOMBRE_EQUIPO='" + request.getParameter("equipolocal") + "'");
    while (rs.next()) {
        equipoL = (int) rs.getObject("ID");
        puntosL = (int) rs.getObject("PUNTOS");
        victoriasL = (int) rs.getObject("VICTORIAS");
        derrotasL = (int) rs.getObject("DERROTAS");
        empatesL = (int) rs.getObject("EMPATES");
        golesAL = (int) rs.getObject("GOLES_ANOTADOS");
        golesRL = (int) rs.getObject("GOLES_RECIBIDOS");

    }

    rs = st.executeQuery("SELECT * FROM EQUIPOS WHERE NOMBRE_EQUIPO='" + request.getParameter("equipovisitante") + "'");
    while (rs.next()) {
        equipoV = (int) rs.getObject("ID");
        puntosV = (int) rs.getObject("PUNTOS");
        victoriasV = (int) rs.getObject("VICTORIAS");
        derrotasV = (int) rs.getObject("DERROTAS");
        empatesV = (int) rs.getObject("EMPATES");
        golesAV = (int) rs.getObject("GOLES_ANOTADOS");
        golesRV = (int) rs.getObject("GOLES_RECIBIDOS");
    }

    if ((golesL == "") || (golesL == "")) {
        golesL = "NULL";
        golesV = "NULL";
    } else {
        golesLn = Integer.valueOf(golesL);
        golesVn = Integer.valueOf(golesV);
        if (fase == 1) {
            if (golesLn > golesVn) {
                verificacion = st.executeUpdate("UPDATE `champions_project`.`EQUIPOS` SET PUNTOS=" + (puntosL + 3) + ", VICTORIAS=" + (victoriasL + 1) + ", DERROTAS=" + derrotasL + ", EMPATES=" + empatesL + ", GOLES_ANOTADOS=" + (golesAL + golesLn) + ", GOLES_RECIBIDOS=" + (golesRL + golesVn) + " WHERE ID='" + equipoL + "'");
                verificacion = st.executeUpdate("UPDATE `champions_project`.`EQUIPOS` SET PUNTOS=" + puntosV + ", VICTORIAS=" + victoriasV + ", DERROTAS=" + (derrotasV + 1) + ", EMPATES=" + empatesV + ", GOLES_ANOTADOS=" + (golesAV + golesVn) + ", GOLES_RECIBIDOS=" + (golesRV + golesLn) + " WHERE ID='" + equipoV + "'");
            } else {
                if (golesLn < golesVn) {
                    verificacion = st.executeUpdate("UPDATE `champions_project`.`EQUIPOS` SET PUNTOS=" + puntosL + ", VICTORIAS=" + victoriasL + ", DERROTAS=" + (derrotasL + 1) + ", EMPATES=" + empatesL + ", GOLES_ANOTADOS=" + (golesAL + golesLn) + ", GOLES_RECIBIDOS=" + (golesRL + golesVn) + " WHERE ID='" + equipoL + "'");
                    verificacion = st.executeUpdate("UPDATE `champions_project`.`EQUIPOS` SET PUNTOS=" + (puntosV + 3) + ", VICTORIAS=" + (victoriasV + 1) + ", DERROTAS=" + derrotasV + ", EMPATES=" + empatesV + ", GOLES_ANOTADOS=" + (golesAV + golesVn) + ", GOLES_RECIBIDOS=" + (golesRV + golesLn) + " WHERE ID='" + equipoV + "'");
                } else {
                    verificacion = st.executeUpdate("UPDATE `champions_project`.`EQUIPOS` SET PUNTOS=" + (puntosL + 1) + ", VICTORIAS=" + victoriasL + ", DERROTAS=" + derrotasL + ", EMPATES=" + (empatesL + 1) + ", GOLES_ANOTADOS=" + (golesAL + golesLn) + ", GOLES_RECIBIDOS=" + (golesRL + golesVn) + " WHERE ID='" + equipoL + "'");
                    verificacion = st.executeUpdate("UPDATE `champions_project`.`EQUIPOS` SET PUNTOS=" + (puntosV + 1) + ", VICTORIAS=" + victoriasV + ", DERROTAS=" + derrotasV + ", EMPATES=" + (empatesV + 1) + ", GOLES_ANOTADOS=" + (golesAV + golesVn) + ", GOLES_RECIBIDOS=" + (golesRV + golesLn) + " WHERE ID='" + equipoV + "'");
                }
            }
        }
    }
    verificacion = st.executeUpdate("INSERT INTO `champions_project`.`PARTIDOS` (`FASE_CAMPEONATO`,`CATEGORIA`, `EQUIPO_LOCAL`, `EQUIPO_VISITANTE`, `FECHA`, `GOLES_LOCAL`, `GOLES_VISITANTE`) VALUES (" + fase + "," + 1 + "," + equipoL + "," + equipoV + ",'" + fecha_string + "'," + golesL + "," + golesV + ")");
    out.print(verificacion);

    if (verificacion == 1) {
        response.sendRedirect("../Registrar_Partidos.jsp?exito=Creación de partido exitosa!!!");

        // response.sendRedirect("success.jsp");
    } else {
        response.sendRedirect("../Registrar_Partidos.jsp?error=Error al crear partido");
    }
%>