<%-- 
    Document   : productForm
    Created on : 6 Jun 2025, 07:44:55
    Author     : Admin
--%>

<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.UserDTO"%>
<%@page import="utils.AuthUtils"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Form</title>
    </head>
    <body>

        <%
            if (AuthUtils.isAdmin(request)) {
        %>
        <h1>Product Form</h1>  <br/>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="addProduct" />
            <div>
                <label for="id">ID*</label>
                <input type="text" name="id" id="id" required="required"/>
            </div>
            <div>
                <label for="name">Name*</label>
                <input type="text" name="name" id="name" required="required"/>
            </div>
             <div>
                <label for="image">Image</label>
                <input type="text" name="image" id="image"/>
            </div>
            <div>
                <label for="description">Description</label> 
                <textarea type="text" name="description" id="description">
                </textarea>
            </div>
            <div>
                <label for="price">Price*</label> 
                <input type="number" name="price" id="price" min="0" step="0.01" required="required"/>
            </div>
            <div>
                <label for="size">Size</label> 
                <input type="text" name="size" id="size"/>
            </div>
            <div>
                <label for="status">Status (Active Product)</label> 
                <input type="checkbox" name="status" id="status" value="true"/>
            </div>
            <div>
                <input type="submit" value="Add Product"/>
                <input type="reset" value="Reset"/>
            </div>
        </form>
        <%
            } else {
         %> 
         <%=AuthUtils.getAccessDeniedMessage("product-form action")%>        
        <%    
            }
        %>
    </body>
</html>
