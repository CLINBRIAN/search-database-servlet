<%-- 
    Document   : SearchJSP
    Created on : Jun 17, 2024, 10:30:19 AM
    Author     : kamau
--%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <table border="2">
            <tr>
                <td>id</td>
                <td>username</td>
                <td>password</td>
            </tr>
            <%
               try{
                 Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "");
                String username = request.getParameter("name");
                PreparedStatement pst = conn.prepareStatement("SELECT * from login WHERE username = '"+username+"'");
                ResultSet rs = pst.executeQuery();
                 
                while(rs.next()){
            %>
            <tr>
                <td><%=rs.getInt("id")%></td>
                <td><%=rs.getString("username")%></td>
                <td><%=rs.getString("password")%></td>
            </tr>

            <%
           }
                
           }catch(Exception e){
                 System.out.println(e.getMessage());
                
           }
            %>
        </table>

    </center>
</body>
</html>
