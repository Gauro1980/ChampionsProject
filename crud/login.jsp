<%-- 
    Document   : login
    Created on : 6/10/2021, 05:38:29 PM
    Author     : amaur
--%>

<%@page import="java.sql.*"%>
<%@page pageEncoding="UTF-8" %>
<%
    String userName = request.getParameter("usuario");   
    String password = request.getParameter("clave");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/champions_project", "champion", "zaq12wsx_CH");
    Statement st = con.createStatement();
    
    ResultSet rs;
    rs = st.executeQuery("select * from USUARIOS where username='" + userName + "' and contrasena='" +password + "'");
    out.print(rs);
    if (rs.next()) {
        int rol= (int)rs.getObject("ROL");
        String nombre = (String)rs.getObject("NOMBRE_APELLIDO");
        session.setAttribute("userid", userName);
        session.setAttribute("name", nombre);
        session.setAttribute("rol", rs.getObject("ROL"));
        session.setAttribute("st", st);
        switch (rol){
            case 1 : response.sendRedirect("../main_administrador.jsp");
            break;
            case 2 : response.sendRedirect("../main_usuario.jsp");
            break;
            case 3 : response.sendRedirect("../index.html");
            break;
        }
        
       // response.sendRedirect("success.jsp");
    } else {
        response.sendRedirect("../login.jsp?error=Usuario o clave incorrectos");
    }
%>