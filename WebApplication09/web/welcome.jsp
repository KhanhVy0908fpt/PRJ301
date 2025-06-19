<%-- 
    Document   : welcome
    Created on : 23 May 2025, 07:41:06
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="model.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.UserDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Object objUser = session.getAttribute("user");
            UserDTO user = (objUser != null) ? (UserDTO) objUser : null;
            if (user == null) {
                response.sendRedirect("MainController");
            } else {
            String keyword = (String)request.getAttribute("keyword");
        %>
        <h1>Welcome <%=user.getFullName()%> !</h1>
        <a href="MainController?action=logout">Logout</a>
        <br/>
        Search by name:
        <form action="MainController" method="POST">
            <input type="hidden" name="action" value="searchProduct" />
            <input type="text" name="strKeyword" value="<%=keyword!=null?keyword:""%>" />
            <input type="submit" value="Search" />
        </form>
        <%---
        lay object duoc gui tu servlet(list)
        --%>
        <%
            List<ProductDTO> list = (List<ProductDTO>) request.getAttribute("list");
            if (list != null && list.isEmpty()) {
        %>
        No products have names that match the keyword!
        <%
        } else if (list != null && !list.isEmpty()) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Size</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (ProductDTO p : list) {
                %>
                <tr>
                    <td><%=p.getId()%></td>
                    <td><%=p.getName()%></td>
                    <td><%=p.getDescription()%></td>
                    <td><%=p.getPrice()%></td>
                    <td><%=p.getSize()%></td>
                    <td><%=p.isStatus()%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <%
            }
        %>
        <%
            }
        %>

    </body>
</html>
