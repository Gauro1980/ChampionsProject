<%@page contentType="text/html" pageEncoding="UTF-8"%>


<% 
    //int rol = (int)session.getAttribute("rol");
   
   if (((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) || ((int)(session.getAttribute("rol"))!=2)) {
        response.sendRedirect("./login.jsp");
    }
    else{
      
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
        <title>Inicio</title>
    </head>
    <body>
        <header>
            <div class="fondo">

                <div class="barra-titulo">
                    <div class="logo">
                        <a href="./index.html"><img src="img/logo color  en positivo horizontal@2x.png"
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
                                            <li><a href="./login.jsp">Ver Partidos</a></li>
                                            <li><a href="./login.jsp">Crear Partidos</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Equipos <i class="fas fa-chevron-down fa-1.5x"></i></a>
                                        <ul>
                                            <li><a href="./login.jsp">Registrar Equipo</a></li>
                                            <li><a href="./index.html#universidades">GRUPO A</a></li>
                                                
                                            <li><a href="./index.html#universidades">GRUPO B</a></li>
                                                
                                            <li><a href="./index.html#universidades">GRUPO C</a></li>
                                                
                                            <li><a href="./index.html#universidades">GRUPO D</a></li>
                                            
                                            <ul>
                                            
                                                <li><a href="#">UDI</a></li>
                                                <li><a href="#">UTS</a></li>
                                                <li><a href="#">UNAP</a></li>
                                                <li><a href="#">UPB</a></li>
                                            </ul>
                                        </ul>
                                    </li>
                                    <li><a href="#">Otros <i class="fas
                                                fa-chevron-down fa-1x"></i></a>
                                        <ul>
                                            <li><a href="#">Ver Reglamento</a></li>
                                            <li><a href="#noticias">Noticias</a></li>
                                        </ul>
                                    </li>
                                </ul>

                            </nav>
                            <nav class="menu-link">
                                <a href="./login.jsp">Buscar</a>
                                <a href="./registro.html">Salir</a>
                            </nav>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <main>
            <h4 id="bienvenida" style="text-align:right" >Bienvenido <%= session.getAttribute("name") %></h4>
            <hr>
            <section>
                <div class="container section">
                    <div class="row">
                        <div class="col s12">
                            <div class="slider">
                                <ul class="slides">
                                    <li>
                                        <img src="fotos/EvelynCopia.jpg" alt="">
                                        <div class="caption center-align">
                                            <h3>Mision TIC</h3>
                                            <h5 class="ligth"></h5>
                                        </div>
                                    </li>
                                    <li>
                                        <img src="fotos/Pelé2.jpg" alt="">
                                        <div class="caption left-align"
                                            style="text-align:right;">
                                            <h4 style="text-align: right;">El
                                                éxito no es un accidente. <br>
                                                Es trabajo duro, perseverancia,
                                                <br>
                                                aprendizaje, estudio, sacrificio
                                                <br>
                                                y, sobre todo, amor por<br>
                                                lo que estás haciendo <br>
                                                o aprendiendo a hacer.</h4>
                                            <h5 class="ligth">Pelé.</h5>
                                        </div>
                                    </li>
                                    <li>
                                        <img src="fotos/UnabCampus.jpg" alt="">
                                        <div class="caption left-align">
                                            <h3 style="color:white; font-weight:700;">UNAB</h3>
                                            <h3 class="ligth" style="color:white;font-weight:700;">
                                                Universidad Autonoma de Bucaramanga</h3>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <script
                    src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
                <script>
                    document.addEventListener('DOMContentLoaded', function(){
                        var elems=document.querySelectorAll('.slider');
                        var instances=M.Slider.init(elems, {interval:8000});
        
                        var elems=document.querySelectorAll('.materiaboxed');
                        var instances=M.Materialbox.init(elems);
                    });
                </script>
            </section>
            <section id="noticias">
                <hr>

                <h2 class="centrar-texto">Noticias del torneo</h2>

                <div class="sesiones-menu">

                    <div class="icono">
                        <img src="fotos/Jugadoras.jpg" alt="sesion menu">
                        <h3>Torneo segundo semestre 2021 </h3>
                        <p>El torneo del segundo semestre de 2021, será llevado
                            a cabo de forma
                            presencial, con el cumplimiento de las normas
                            locales de
                            distanciamiento social, apoyado por los
                            departamentos de bienestar
                            estudiantil en cada una de las
                            universidades.
                        </p>

                    </div>
                    <div class="icono">
                        <img src="fotos/UNAB FútbolFemenino.jpg"
                            alt="Condiciones torneo">
                        <h3>Condiciones y Reglamento del torneo</h3>
                        <p>Nuestro torneo deportivo Universitario Champion
                            Project, está
                            reglamentado con el cumplimiento de normas
                            deportivas vigentes con el
                            fin de proteger el juego limpio y la integridad de
                            nuestros deportistas universitarios.
                        </p>

                    </div>
                    <div class="icono">
                        <img src="fotos/UPBcanchasbloque19b.jpg"
                            alt="Universidades
                            Participantes">
                        <h3>Universidades participantes</h3>
                        <p>Champions Project es un torneo de fútbol dirigido a
                            la integración
                            de las universidades del oriente colombiano, para
                            fomentar la
                            integración de los estudiantes destacados en esta
                            disciplina deportiva, patrocinado por la Universidad
                            UNAB.
                        </p>

                    </div>
                </div>

            </section>
            <section id="universidades">
                <hr>
                <div class="contenedor logos-universidades">
                    <section class="participantes">
                        
                        
                            
                            <div class="grupo">
                                <h2>GRUPO A</h2>
                            <img src="fotos/logos universidades/ean.png"
                                alt="EAN">
                            <img src="fotos/logos universidades/uniminuto.jpg"
                                alt="UNIMINUTO">
                            <img src="fotos/logos universidades/unad.jpg"
                                alt="UNAD">
                            <img src="fotos/logos universidades/ufps.png"
                                alt="UFPS">
                            </div>
                            
                            <div class="grupo">
                                <h2>GRUPO B</h2>
                                
                            <img src="fotos/logos universidades/ucooperativa.jpg"
                                alt="ucooperativa">
                            <img src="fotos/logos universidades/udi.png"
                                alt="UDI">
                            <img src="fotos/logos universidades/uts.png"
                                alt="UTS">
                            <img src="fotos/logos universidades/unipamplona.png"
                                alt="UNAP">
                            </div>
                            
                            <div class="grupo">
                                <h2>GRUPO C</h2>
                            <img src="fotos/logos universidades/santoto.jpg"
                                alt="SANTOTO">
                            <img src="fotos/logos universidades/simonBolivar.png" alt="USB">
                            <img src="fotos/logos universidades/udes.jpg"
                                alt="UDES">
                            <img src="fotos/logos universidades/uis.png"
                                alt="UIS">
                            </div>
                            
                            <div class="grupo">
                                <h2>GRUPO D</h2>
                            <img src="fotos/logos universidades/esap.png"
                                alt="ESAP">
                            <img src="fotos/logos universidades/mbeltran.jpg"
                                alt="mbeltran">
                            <img src="fotos/logos universidades/pontificia.jpg"
                                alt="pontificia">
                            <img src="fotos/logos universidades/logoUnab.jpg"
                                alt="UNAB">
                            </div>
                        
                    </section>
                </div>

            </section>
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
                            <li><a href="#">NOSOTROS</a></li>
                            <li><a href="./contacto.html">CONTACTENOS</a></li>
                            <li><a href="#noticias">NOTICIAS</a></li>
                            <li><a href="#">RESULTADOS</a></li>
                            <li><a href="#universidades">EQUIPOS</a></li>
                        </ul>
                    </nav>
                    <div class="redes">
                        <img src="./img/Logo twiter.png" alt="">
                        <img src="./img/logo facebook.png" alt="">
                    </div>
                    <div class="terminos">
                        <div class="aliniacion-terminos">
                            <h5>PolÍticas de privacidad</h5>
                            <h5>Aviso Legal</h5>
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