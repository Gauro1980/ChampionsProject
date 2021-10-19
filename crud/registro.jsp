<%-- 
    Document   : newjsp
    Created on : 4/10/2021, 09:21:44 PM
    Author     : amaur
--%>

<%@page import="java.sql.*" %>
<%@page pageEncoding="UTF-8"%>
<%

    String nombre_completo = request.getParameter("name");
    String username = request.getParameter("username");
    String correo = request.getParameter("email");
    String contrasena = request.getParameter("clave");
 
    int rol;
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/champions_project", "champion", "zaq12wsx_CH");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from ADMIN where correo='" + correo + "'");
    if (rs.next()) {
        rol = 1;
    } else {
        rol = 1;
    }
    int i=0;
    try {
    i = st.executeUpdate("insert into USUARIOS(NOMBRE_APELLIDO, USERNAME, CORREO, CONTRASENA, ROL) values ('" + nombre_completo + "','"
            + username + "','" + correo + "','" + contrasena + "','" + rol + "')");
    }
    catch(Exception e){
       out.println("<script type=\"text/javascript\">");
       out.println("alert('El usuario ya existe');");
       out.println("location='../registro.html';");
       out.println("</script>"); 
        
    }
    if (i > 0) {
        response.sendRedirect("../login.jsp");
    }
%>
