<%-- 
    Document   : welcome
    Created on : 23 May 2025, 07:41:06
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          String username = request.getAttribute("username")+" ";  
        %>
        <h1>Welcome <%=username%></h1>
    </body>
</html>
