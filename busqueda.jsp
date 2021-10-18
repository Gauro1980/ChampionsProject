<%-- 
    Document   : main_administrador
    Created on : 8/10/2021, 12:54:32 PM
    Author     : amaur
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //int rol = (int)session.getAttribute("rol");

    if (((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) || ((int) (session.getAttribute("rol")) < 1)) {
        response.sendRedirect("./login.jsp");
    } else {
        Statement st = (Statement) session.getAttribute("st");
        ResultSet rs;
        List<Integer> id = new ArrayList<>();
        List<String> nombre = new ArrayList<>();
        List<Integer> grupo = new ArrayList<>();
        List<Integer> puntos = new ArrayList<>();
        List<Integer> victorias = new ArrayList<>();
        List<Integer> derrotas = new ArrayList<>();
        List<Integer> empates = new ArrayList<>();
        List<Integer> golesA = new ArrayList<>();
        List<Integer> golesR = new ArrayList<>();
        List<String> escudo = new ArrayList<>();

        rs = st.executeQuery("select * from EQUIPOS");
        while (rs.next()) {
            id.add((Integer) rs.getObject("ID"));
            nombre.add((String) rs.getObject("NOMBRE_EQUIPO"));
            grupo.add((Integer) rs.getObject("GRUPO"));
            puntos.add((Integer) rs.getObject("PUNTOS"));
            victorias.add((Integer) rs.getObject("VICTORIAS"));
            derrotas.add((Integer) rs.getObject("DERROTAS"));
            empates.add((Integer) rs.getObject("EMPATES"));
            golesA.add((Integer) rs.getObject("GOLES_ANOTADOS"));
            golesR.add((Integer) rs.getObject("GOLES_RECIBIDOS"));
            escudo.add((String) rs.getObject("ESCUDO_RUTA"));
        }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css?family=Krub">
        <link href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
              rel="stylesheet"
              integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
              crossorigin="anonymous">

        <!--<link rel="stylesheet" type="text/css" href="css/normalize.css">-->
        <link rel="stylesheet" type="text/css" href="css/IndexStyle.css">
        <link rel="stylesheet" type="text/css" href="css/Stylebusqueda.css">
        <title>Inicio</title>
    </head>
    <body>
        <header>
            <div class="fondo">

                <div class="barra-titulo">
                    <div class="logo">
                        <a href="./main_administrador.jsp"><img src="img/logo color  en positivo horizontal@2x.png"
                                                                alt="" ></a>
                    </div>
                    <div class="letras">
                        <div class="titulo">
                            <h1>Torneo Local de Fútbol Inter Universitario</h1>
                        </div>
                        <nav class="barra-menu">
                            <nav class="menu">
                                <ul>
                                    <li><a href="#">Partidos <i class="fas fa-chevron-down fa-1x"></i></a>
                                        <ul>
                                            <li><a href="./busqueda.jsp">Ver Partidos</a></li>
                                            <li><a href="./crud/cargueDatos.jsp">Crear Partidos</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Equipos <i class="fas fa-chevron-down fa-1.5x"></i></a>
                                        <ul>

                                            <li><a href="./main_administrador.jsp#universidades">GRUPO A</a></li>

                                            <li><a href="./main_administrador.jsp#universidades">GRUPO B</a></li>

                                            <li><a href="./main_administrador.jsp#universidades">GRUPO C</a></li>

                                            <li><a href="./main_administrador.jsp#universidades">GRUPO D</a></li>


                                        </ul>
                                    </li>
                                    <li><a href="#">Otros <i class="fas
                                                             fa-chevron-down fa-1x"></i></a>
                                        <ul>
                                            <li><a href="./Reglamento.html">Ver Reglamento</a></li>
                                            <li><a href="./main_administrador.jsp#noticias">Noticias</a></li>
                                        </ul>
                                    </li>
                                </ul>

                            </nav>
                            <nav class="menu-link">
                                <section class="barra_buscar">
                                    <form action="./crud/consultar.jsp" method="post" id="search">		    
                                        <input type="search" id="consulta" name="consulta" placeholder="Buscar equipo..." >		    	
                                        <button class="fa fa-search" aria-hidden="true"></button>
                                    </form>
                                </section>
                                <a href="./cerrar.jsp">Salir</a>
                            </nav>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <main>
            <h4 id="bienvenida" style="text-align:right" >Bienvenid@ <%= session.getAttribute("name")%></h4>
            <hr>
            <div class="tablas">
                <section class="seccion_equipos">
                    <h4>ESTADISTICAS FASES DE GRUPOS</h4>
                    <table id="GRUPOA">
                        <thead>
                        <h5>GRUPO A</h5>
                        <tr>
                            <td>EQUIPOS</td>
                            <td>PJ</td>
                            <td>PUNTOS</td>
                            <td>VIC.</td>
                            <td>DERR.</td>
                            <td>EMP.</td>
                            <td>G.F.</td>
                            <td>G.C.</td>
                            <td>D.G.</td>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><%=nombre.get(0)%><br><img src="<%= escudo.get(0)%>" height="20px"> </td>
                                <td><%=victorias.get(0) + derrotas.get(0) + empates.get(0)%></td>
                                <td><%=puntos.get(0)%></td>
                                <td><%=victorias.get(0)%></td>
                                <td><%=derrotas.get(0)%></td>
                                <td><%=empates.get(0)%></td>
                                <td><%=golesA.get(0)%></td></td>
                                <td><%=golesR.get(0)%></td>
                                <td><%=golesA.get(0) - golesR.get(0)%></td>
                            </tr>
                            <tr>
                                <td> <%=nombre.get(1)%><br><img src="<%= escudo.get(1)%>" height="20px"> </td>
                                <td><%=victorias.get(1) + derrotas.get(1) + empates.get(1)%></td>
                                <td><%=puntos.get(1)%></td>
                                <td><%=victorias.get(1)%></td>
                                <td><%=derrotas.get(1)%></td>
                                <td><%=empates.get(1)%></td>
                                <td><%=golesA.get(1)%></td></td>
                                <td><%=golesR.get(1)%></td>
                                <td><%=golesA.get(1) - golesR.get(1)%></td>
                            </tr>
                            <tr>
                                <td> <%=nombre.get(2)%><br><img src="<%= escudo.get(2)%>" height="20px"> </td>
                                <td><%=victorias.get(2) + derrotas.get(2) + empates.get(2)%></td>
                                <td><%=puntos.get(2)%></td>
                                <td><%=victorias.get(2)%></td>
                                <td><%=derrotas.get(2)%></td>
                                <td><%=empates.get(2)%></td>
                                <td><%=golesA.get(2)%></td></td>
                                <td><%=golesR.get(2)%></td>
                                <td><%=golesA.get(2) - golesR.get(2)%></td>
                            </tr>
                            <tr>
                                <td> <%=nombre.get(3)%><br><img src="<%= escudo.get(3)%>" height="20px"> </td>
                                <td><%=victorias.get(3) + derrotas.get(3) + empates.get(3)%></td>
                                <td><%=puntos.get(3)%></td>
                                <td><%=victorias.get(3)%></td>
                                <td><%=derrotas.get(3)%></td>
                                <td><%=empates.get(3)%></td>
                                <td><%=golesA.get(3)%></td></td>
                                <td><%=golesR.get(3)%></td>
                                <td><%=golesA.get(3) - golesR.get(3)%></td>
                            </tr>
                        </tbody>
                    </table>


                    <table id="GRUPOB">
                        <thead>
                            <tr>
                                <td>EQUIPOS</td>
                                <td>PJ</td>
                                <td>PUNTOS</td>
                                <td>VIC.</td>
                                <td>DERR.</td>
                                <td>EMP.</td>
                                <td>G.F.</td>
                                <td>G.C.</td>
                                <td>D.G.</td>
                            </tr>
                        </thead>
                        <tbody>

                            <tr>
                                <td> <%=nombre.get(4)%><br><img src="<%= escudo.get(4)%>" height="20px"> </td>
                                <td><%=victorias.get(4) + derrotas.get(4) + empates.get(4)%></td>
                                <td><%=puntos.get(4)%></td>
                                <td><%=victorias.get(4)%></td>
                                <td><%=derrotas.get(4)%></td>
                                <td><%=empates.get(4)%></td>
                                <td><%=golesA.get(4)%></td></td>
                                <td><%=golesR.get(4)%></td>
                                <td><%=golesA.get(4) - golesR.get(4)%></td>
                            </tr>

                            <tr>
                                <td> <%=nombre.get(5)%><br><img src="<%= escudo.get(5)%>" height="20px"> </td>
                                <td><%=victorias.get(5) + derrotas.get(5) + empates.get(5)%></td>
                                <td><%=puntos.get(5)%></td>
                                <td><%=victorias.get(5)%></td>
                                <td><%=derrotas.get(5)%></td>
                                <td><%=empates.get(5)%></td>
                                <td><%=golesA.get(5)%></td></td>
                                <td><%=golesR.get(5)%></td>
                                <td><%=golesA.get(5) - golesR.get(5)%></td>
                            </tr>
                            <tr>
                                <td> <%=nombre.get(6)%><br><img src="<%= escudo.get(6)%>" height="20px"> </td>
                                <td><%=victorias.get(6) + derrotas.get(6) + empates.get(6)%></td>
                                <td><%=puntos.get(6)%></td>
                                <td><%=victorias.get(6)%></td>
                                <td><%=derrotas.get(6)%></td>
                                <td><%=empates.get(6)%></td>
                                <td><%=golesA.get(6)%></td></td>
                                <td><%=golesR.get(6)%></td>
                                <td><%=golesA.get(6) - golesR.get(6)%></td>
                            </tr>
                            <tr>
                                <td> <%=nombre.get(7)%><br><img src="<%= escudo.get(7)%>" height="20px"> </td>
                                <td><%=victorias.get(7) + derrotas.get(7) + empates.get(7)%></td>
                                <td><%=puntos.get(7)%></td>
                                <td><%=victorias.get(7)%></td>
                                <td><%=derrotas.get(7)%></td>
                                <td><%=empates.get(7)%></td>
                                <td><%=golesA.get(7)%></td></td>
                                <td><%=golesR.get(7)%></td>
                                <td><%=golesA.get(7) - golesR.get(7)%></td>
                            </tr>

                        </tbody>
                    </table>


                    <table id="GRUPOC">
                        <thead>
                            <tr>
                                <td>EQUIPOS</td>
                                <td>PJ</td>
                                <td>PUNTOS</td>
                                <td>VIC.</td>
                                <td>DERR.</td>
                                <td>EMP.</td>
                                <td>G.F.</td>
                                <td>G.C.</td>
                                <td>D.G.</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td> <%=nombre.get(8)%><br><img src="<%= escudo.get(8)%>" height="20px"> </td>
                                <td><%=victorias.get(8) + derrotas.get(8) + empates.get(8)%></td>
                                <td><%=puntos.get(8)%></td>
                                <td><%=victorias.get(8)%></td>
                                <td><%=derrotas.get(8)%></td>
                                <td><%=empates.get(8)%></td>
                                <td><%=golesA.get(8)%></td></td>
                                <td><%=golesR.get(8)%></td>
                                <td><%=golesA.get(8) - golesR.get(8)%></td>
                            </tr>
                            <tr>
                                <td> <%=nombre.get(9)%><br><img src="<%= escudo.get(9)%>" height="20px"> </td>
                                <td><%=victorias.get(9) + derrotas.get(9) + empates.get(9)%></td>
                                <td><%=puntos.get(9)%></td>
                                <td><%=victorias.get(9)%></td>
                                <td><%=derrotas.get(9)%></td>
                                <td><%=empates.get(9)%></td>
                                <td><%=golesA.get(9)%></td></td>
                                <td><%=golesR.get(9)%></td>
                                <td><%=golesA.get(9) - golesR.get(9)%></td>
                            </tr>
                            <tr>
                                <td> <%=nombre.get(10)%><br><img src="<%= escudo.get(10)%>" height="20px"> </td>
                                <td><%=victorias.get(10) + derrotas.get(10) + empates.get(10)%></td>
                                <td><%=puntos.get(10)%></td>
                                <td><%=victorias.get(10)%></td>
                                <td><%=derrotas.get(10)%></td>
                                <td><%=empates.get(10)%></td>
                                <td><%=golesA.get(10)%></td></td>
                                <td><%=golesR.get(10)%></td>
                                <td><%=golesA.get(10) - golesR.get(10)%></td>
                            </tr>
                            <tr>
                                <td> <%=nombre.get(11)%><br><img src="<%= escudo.get(11)%>" height="20px"> </td>
                                <td><%=victorias.get(11) + derrotas.get(11) + empates.get(11)%></td>
                                <td><%=puntos.get(11)%></td>
                                <td><%=victorias.get(11)%></td>
                                <td><%=derrotas.get(11)%></td>
                                <td><%=empates.get(11)%></td>
                                <td><%=golesA.get(11)%></td></td>
                                <td><%=golesR.get(11)%></td>
                                <td><%=golesA.get(11) - golesR.get(11)%></td>
                            </tr>

                        </tbody>
                    </table>

                    <table id="GRUPOD">
                        <thead>
                            <tr>
                                <td>EQUIPOS</td>
                                <td>PJ</td>
                                <td>PUNTOS</td>
                                <td>VIC.</td>
                                <td>DERR.</td>
                                <td>EMP.</td>
                                <td>G.F.</td>
                                <td>G.C.</td>
                                <td>D.G.</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td> <%=nombre.get(12)%><br><img src="<%= escudo.get(12)%>" height="20px"> </td>
                                <td><%=victorias.get(12) + derrotas.get(12) + empates.get(12)%></td>
                                <td><%=puntos.get(12)%></td>
                                <td><%=victorias.get(12)%></td>
                                <td><%=derrotas.get(12)%></td>
                                <td><%=empates.get(12)%></td>
                                <td><%=golesA.get(12)%></td></td>
                                <td><%=golesR.get(12)%></td>
                                <td><%=golesA.get(12) - golesR.get(12)%></td>
                            </tr>
                            <tr>
                                <td> <%=nombre.get(13)%><br><img src="<%= escudo.get(13)%>" height="20px"> </td>
                                <td><%=victorias.get(13) + derrotas.get(13) + empates.get(13)%></td>
                                <td><%=puntos.get(13)%></td>
                                <td><%=victorias.get(13)%></td>
                                <td><%=derrotas.get(13)%></td>
                                <td><%=empates.get(13)%></td>
                                <td><%=golesA.get(13)%></td></td>
                                <td><%=golesR.get(13)%></td>
                                <td><%=golesA.get(13) - golesR.get(13)%></td>
                            </tr>
                            <tr>
                                <td> <%=nombre.get(14)%><br><img src="<%= escudo.get(14)%>" height="20px"> </td>
                                <td><%=victorias.get(14) + derrotas.get(14) + empates.get(14)%></td>
                                <td><%=puntos.get(14)%></td>
                                <td><%=victorias.get(14)%></td>
                                <td><%=derrotas.get(14)%></td>
                                <td><%=empates.get(14)%></td>
                                <td><%=golesA.get(14)%></td></td>
                                <td><%=golesR.get(14)%></td>
                                <td><%=golesA.get(14) - golesR.get(14)%></td>
                            </tr>
                            <tr>
                                <td> <%=nombre.get(15)%><br><img src="<%= escudo.get(15)%>" height="20px"> </td>
                                <td><%=victorias.get(15) + derrotas.get(15) + empates.get(15)%></td>
                                <td><%=puntos.get(15)%></td>
                                <td><%=victorias.get(15)%></td>
                                <td><%=derrotas.get(15)%></td>
                                <td><%=empates.get(15)%></td>
                                <td><%=golesA.get(15)%></td></td>
                                <td><%=golesR.get(15)%></td>
                                <td><%=golesA.get(15) - golesR.get(15)%></td>
                            </tr>

                        </tbody>
                    </table>     
                </section>
                <section class="seccion_busqueda">
                    <%
                        if (session.getAttribute("EQUIPOL") == null) {
                            out.print("<h4 align='center' >Realice su búsqueda de equipo...</>");
                        } else {
                            List<Integer> partidoId = (List<Integer>) session.getAttribute("PARTIDOID");
                            List<Integer> faseC = (List<Integer>) session.getAttribute("FASEC");
                            List<String> equipoL = (List<String>) session.getAttribute("EQUIPOL");
                            List<String> escudoL = (List<String>) session.getAttribute("ESCUDOL");
                            List<String> equipoV = (List<String>) session.getAttribute("EQUIPOV");
                            List<String> escudoV = (List<String>) session.getAttribute("ESCUDOV");
                            List<Date> fecha = (List<Date>) session.getAttribute("FECHA");
                            List<Integer> golesL = (List<Integer>) session.getAttribute("GOLESL");
                            List<Integer> golesV = (List<Integer>) session.getAttribute("GOLESV");
                            int longitud = equipoL.size();

                            for (int i = 0; i < longitud; i++) {
                                out.print("<table id='partidos'style='margin: 0 auto;'> ");
                                out.print("<thead>");
                                out.print("<tr>");
                                out.print("<td><h4>EQUIPO LOCAL</h4></td>");
                                out.print("<td><h4>FECHA</h4></td>");
                                out.print("<td><h4>EQUIPO VISITANTE</h4></td>");
                                out.print("</tr>");
                                out.print("</thead>");
                                out.print("<tbody>");
                                out.print("<tr>");
                                if (golesL.get(i) == null) {
                                    out.print("<form method='post' action='./crud/actualizar.jsp'>");
                                    out.print("<td><h5>GOLES</h5><br><input type='number' name='goleslocal' min='0' id='goleslocal' placeholder='-' style='width: 40px;'required> </td>");
                                    out.print("<td><h5>" + fecha.get(i) + "</h5></td>");
                                    out.print("<td><h5>GOLES</h5><br><input type='number' name='golesvisitante' min='0' id='golesvisitante' placeholder='-' style='width: 40px;' required></td>");
                                } else {
                                    out.print("<td><h5>GOLES<br>" + golesL.get(i) + "</h5></td>");
                                    out.print("<td><h5>" + fecha.get(i) + "</h5></td>");
                                    out.print("<td><h5>GOLES<br>" + golesV.get(i) + "</h5></td>");
                                }

                                out.print("</tr>");
                                out.print("<tr>");
                                out.print("<td><h4><input type='text' id=equipoL name=equipoL style='text-align:center; font-size: 2.5rem;' value='" + equipoL.get(i) + "' readonly></h4>"
                                        + "<br>"
                                        + "<img src="
                                        + escudoL.get(i)
                                        + " height='30px'>"
                                        + "</td>");
                                out.print("<td><h2>VS</h2></td>");
                                out.print("<td><h4><input type='text' id=equipoV name=equipoV style='text-align:center; font-size: 2.5rem;' value='" + equipoV.get(i) + "' readonly></h4>"
                                        + "<br>"
                                        + "<img src="
                                        + escudoV.get(i)
                                        + " height='30px'>"
                                        + "</td>");
                                out.print("</tr>");
                                out.print("<tr>");
                                out.print("<td><input type='text' id=idpartido name=idpartido value='" + partidoId.get(i) + "' style='visibility:hidden;'><input type='text' id=idfase name=idfase value='" + faseC.get(i) + "' style='visibility:hidden;'></td>");
                                if (golesL.get(i) == null) {
                                    out.print("<td><button type='submit' style='width:100px; height:25px' class='boton-envio'>ACTUALIZAR</button></td>");
                                } else {
                                    out.print("<td>FINALIZADO</td>");
                                }
                                out.print("<td></td>");
                                out.print("</tr>");
                                out.print("</tbody>");
                                out.print("</table>");
                                out.print("</form>");
                            }
                        }


                    %>
                </section>
            </div>
        </main>
        <footer class="site-footer">
            <div class="division">
                <div class="imagen-copa">
                    <img src="./img/logo color en negativo2x.png" alt="">
                </div>
                <div class="centro-pie">
                    <nav class="nav-pie">
                        <ul>
                            <li><a href="#">INICIO</a></li>
                            <li><a href="Nosotros.html"">NOSOTROS</a></li>
                            <li><a href="enviar_contacto.html">CONTACTENOS</a></li>
                            <li><a href="./main_administrador.jsp#noticias">NOTICIAS</a></li>
                            <li><a href="busqueda.jsp">RESULTADOS</a></li>
                            <li><a href="./main_administrador.jsp#universidades">EQUIPOS</a></li>
                        </ul>
                    </nav>
                    <div class="redes">
                        <a href="https://twitter.com/Championsprojec?s=09" target="_blank" rel="noopener noreferrer"><img src="./img/Logo twiter.png" alt=""></a>
                        <a href="https://www.facebook.com/championsproject21/" target="_blank" rel="noopener noreferrer"><img src="./img/logo facebook.png" alt=""></a>
                        <a href="https://www.instagram.com/championsproject5/" target="_blank" rel="noopener noreferrer"><img src="./img/logo instagram.png" alt=""></a>
                    </div>
                    <div class="terminos">
                        <div class="aliniacion-terminos">
                            <a href="Tratamiento_Datos.html"><h5>PolÍticas de privacidad</h5></a>
                            <a href="Tratamiento_Datos.html"><h5>Aviso Legal</h5></a>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="copyright">
                <h5>Todos los derechos reservados 2021 ©</h5>
            </div>
        </footer>

    </body>
</html>
<% }
%>