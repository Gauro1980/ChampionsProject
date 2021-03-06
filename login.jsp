<%-- 
    Document   : login
    Created on : 8/10/2021, 11:14:47 AM
    Author     : amaur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Logueo</title>
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
                <div class="login">
                    <h1>Login</h1>
                </div>
            </header>
            <main>

                <form method="post" action="./crud/login.jsp">
                    <legend class="descripcion">
                        Ingrese Usuario y Contraseña:
                    </legend>
                    <div class="campos">
                        <div class="datos">
                            <label for="usuario">Usuario:</label>
                            <br>
                            <input type="text" name="usuario" id="usuario"
                                size="30"
                                placeholder="Ingrese su usuario" required>
                            <span class="validar"></span>
                        </div>
                        <div class="datos">
                            <label for="clave">Contraseña:</label>
                            <br>
                            <input type="password" name="clave" id="clave"
                                size="30"
                                placeholder="Ingrese su contraseña" required>
                            <span class="validar"></span>
                        </div>

                        <div class="aceptar" id="caja-recordar"style="visibility: hidden">
                            <label for="caja">
                                Recordar Contraseña <input type="checkbox"
                                    id="caja" name="caja">
                            </label>
                        </div>
                    </div>
                    <%
                if(request.getParameter("error") != null){
                    String error = request.getParameter("error");
                    out.print("<h1><font color='red'>"+error+"</font> </h1>");
                }
                %>
                    <div class="boton">
                        <button type="button" class="boton-envio" onclick="location.href='./index.html'">Cancelar</button>
                        <button type="submit" class="boton-envio">Ingresar</button>
                                        
                    </div>
                    
                </form>

                <div class="recuperar">

                    <a href="#">Recuperación de Contraseña</a>
                </div>
                <div class="ir-registro">
                    <p>Si no estas registrado puedes hacerlo en el siguiente
                        link:
                    </p>
                    <div class="recuperar">
                        <a href="registro.html">Registro de
                            usuario</a>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>
