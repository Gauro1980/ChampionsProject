<%-- 
    Document   : Registar_Partidos
    Created on : 11/10/2021, 10:40:11 AM
    Author     : amaur
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@ page import="java.sql.*"%>


<%
    if (((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) || ((int) (session.getAttribute("rol")) != 1)) {
        response.sendRedirect("./login.jsp");
    }%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro de Partidos</title>
        <link href="https://fonts.googleapis.com/css?family=Krub"
              rel="stylesheet">
        <link href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
              rel="stylesheet"
              integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
              crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Krub:400,700"
              rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>


    <body>


        <div class="balon">
            <header class="cabecera">
                <div class="logo">
                    <img src="img/logocolorennegativohorizontal.png" alt="Logo">
                </div>
                <div class="registro">
                    <h1>Registro de</h1>
                    <h1>Partidos</h1>
                </div>
            </header>
            <main>
                <form method="post" action="./crud/insertarDatos.jsp">
                    <legend>
                        Diligencie los siguientes campos:
                    </legend>
                    <div class="camposdobles ">
                        <div class="campos margen">
                            <div class="datos">
                                <label for="ListaFase">Fase Campeonato</label>
                                <br>
                                <div class="ComboBox">

                                    <input type="text" name="ListaFase" id="ListaFase" value="<%=session.getAttribute("FASES")%>" readonly>

                                </div>
                            </div>

                            <div class="datos" style="display:none">
                                <label for="ListaGenero">Categoría:</label>
                                <br>
                                <div class="ComboBox">

                                    <select name="ListaGenero" id="ListaGenero" required>
                                        <!--<option>Seleccione una opcion</option>-->

                                        <%
                                            List<String> generos = (List<String>) session.getAttribute("GENEROS");
                                            for (String genero : generos) {
                                                out.print("<option>" + genero + "</option>");
                                            }
                                        %>
                                    </select>

                                </div>
                            </div>
                            <div class="datos">

                                <label for="equipolocal">Equipo Local:</label>
                                <br>
                                <div class="ComboBox">

                                    <select name="equipolocal" id="equipolocal" required>
                                        <!--<option>Seleccione un equipo</option>-->
                                        <%
                                            List<String> equipos = (List<String>) session.getAttribute("EQUIPOS");
                                            List<Integer> equiposGrupos = (List<Integer>) session.getAttribute("EQUIPOS_GRUPO");
                                            String validarorFase=(String)session.getAttribute("FASES");
                                            if (validarorFase != "GRUPOS") {
                                                for (String equipo : equipos) {
                                                    out.print("<option>" + equipo + "</option>");
                                                }

                                            }
                                        %>
                                    </select>

                                </div>
                            </div>
                            <div class="datos">
                                <label for="goleslocal">Goles Local</label>
                                <br>
                                <input type="number" name="goleslocal" id="goleslocal" min="0" placeholder="-" >
                            </div>

                        </div>

                        <div class="campos margen">

                            <div class="datos" named="grupoM" id="grupoM" style="display:none">

                                <label for="ListaGrupos">Grupos</label>
                                <br>
                                <div class="ComboBox" >

                                    <select name="ListaGrupos" id="ListaGrupos" onchange="llenar()">
                                        <option value="">Seleccione Grupo</option>
                                        <%
                                            List<String> grupos = (List<String>) session.getAttribute("GRUPOS");

                                            for (String grupo : grupos) {
                                                out.print("<option>" + grupo + "</option>");

                                            }
                                        %>
                                    </select>

                                </div>
                            </div>
                            <div class="datos">
                                <label for="fecha">Fecha:</label>
                                <br>
                                <input type="date" name="fecha" size="20"
                                       required>
                                <span class="validar"></span>

                            </div>
                            <div class="datos">
                                <label for="equipovisitante">Equipo Visitante:</label>
                                <br>
                                <div class="ComboBox">

                                    <select name="equipovisitante" id="equipovisitante" required>
                                        <!--<option>Seleccione un equipo</option>-->
                                        <%
                                            if (validarorFase != "GRUPOS") {
                                                for (String equipo : equipos) {
                                                    out.print("<option>" + equipo + "</option>");
                                                }

                                            }
                                        %>
                                    </select>

                                </div>
                            </div>
                            <div class="datos">
                                <label for="golesvisitante">Goles Visitante</label>
                                <br>
                                <input type="number" name="golesvisitante" min="0" id="golesvisitante"
                                       placeholder="-" >

                            </div>

                        </div>

                    </div>

                    <%
                        if (request.getParameter("exito") != null) {
                            String exito = request.getParameter("exito");
                            out.print("<h1><font color='blue'>" + exito + "</font> </h1>");
                        }
                    %>
                    <div class="boton">
                        <button type="button" class="boton-envio" onclick="location.href = './main_administrador.jsp'">Cancelar</button>
                        <button type="submit" class="boton-envio">&nbsp;&nbsp;&nbsp;&nbsp;Crear&nbsp;&nbsp;&nbsp;&nbsp;</button>
                    </div>
                </form>

            </main>
        </div>

    </body>

    <script defer>

        let validacion = "<%= session.getAttribute("FASES")%>";
        if (validacion === "GRUPOS") {
            document.getElementById("grupoM").style.setProperty("display", "block");
        }
    </script>
    <script defer>
        function llenar() {
            selectL = document.getElementById("equipolocal");
            selectV = document.getElementById("equipovisitante");
            option1 = document.createElement("option");
            option2 = document.createElement("option");
            option3 = document.createElement("option");
            option4 = document.createElement("option");
            option5 = document.createElement("option");
            option6 = document.createElement("option");
            option7 = document.createElement("option");
            option8 = document.createElement("option");
            var equipoGrupo = [];
            var seleccion = document.getElementById("ListaGrupos").value;

        <%  List<String> grupoA = new ArrayList<>();
            List<String> grupoB = new ArrayList<>();
            List<String> grupoC = new ArrayList<>();
            List<String> grupoD = new ArrayList<>();
            for (int i = 0; i < equiposGrupos.size(); i++) {
                out.print(equiposGrupos.get(i));
                if (equiposGrupos.get(i) == 1) {
                    grupoA.add(equipos.get(i));
                } else {
                    if (equiposGrupos.get(i) == 2) {
                        grupoB.add(equipos.get(i));
                    } else {
                        if (equiposGrupos.get(i) == 3) {
                            grupoC.add(equipos.get(i));
                        } else {
                            if (equiposGrupos.get(i) == 4) {
                                grupoD.add(equipos.get(i));
                            }
                        }
                    }
                }
            }
        %>

            if (seleccion == "GRUPO A") {
                equipoGrupo.push('<%=grupoA.get(0)%>');
                equipoGrupo.push('<%=grupoA.get(1)%>');
                equipoGrupo.push('<%=grupoA.get(2)%>');
                equipoGrupo.push('<%=grupoA.get(3)%>');
            }

            if (seleccion == "GRUPO B") {
                equipoGrupo.push('<%=grupoB.get(0)%>');
                equipoGrupo.push('<%=grupoB.get(1)%>');
                equipoGrupo.push('<%=grupoB.get(2)%>');
                equipoGrupo.push('<%=grupoB.get(3)%>');
            }
            if (seleccion == "GRUPO C") {
                equipoGrupo.push('<%=grupoC.get(0)%>');
                equipoGrupo.push('<%=grupoC.get(1)%>');
                equipoGrupo.push('<%=grupoC.get(2)%>');
                equipoGrupo.push('<%=grupoC.get(3)%>');

            }
            if (seleccion == "GRUPO D") {
                equipoGrupo.push('<%=grupoD.get(0)%>');
                equipoGrupo.push('<%=grupoD.get(1)%>');
                equipoGrupo.push('<%=grupoD.get(2)%>');
                equipoGrupo.push('<%=grupoD.get(3)%>');
            }

            while (selectL.firstChild) {
                selectL.removeChild(selectL.firstChild);
                selectV.removeChild(selectV.firstChild);
            }

            option1.value = equipoGrupo[0];
            option1.text = equipoGrupo[0];
            option2.value = equipoGrupo[1];
            option2.text = equipoGrupo[1];
            option3.value = equipoGrupo[2];
            option3.text = equipoGrupo[2];
            option4.value = equipoGrupo[3];
            option4.text = equipoGrupo[3];
            
            option5.value = equipoGrupo[0];
            option5.text = equipoGrupo[0];
            option6.value = equipoGrupo[1];
            option6.text = equipoGrupo[1];
            option7.value = equipoGrupo[2];
            option7.text = equipoGrupo[2];
            option8.value = equipoGrupo[3];
            option8.text = equipoGrupo[3];
            
            selectL.appendChild(option1);
            selectV.appendChild(option5);
            selectL.appendChild(option2);
            selectV.appendChild(option6);
            selectL.appendChild(option3);
            selectV.appendChild(option7);
            selectL.appendChild(option4);
            selectV.appendChild(option8);

        }
    </script>
</html>
