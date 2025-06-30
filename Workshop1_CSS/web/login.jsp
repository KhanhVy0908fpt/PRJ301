<%-- 
    Document   : login
    Created on : 24 Jun 2025, 04:31:36
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="card shadow p-4">
                        <h1 class="mb-4 text-center">Login</h1>
                        <form action="MainController" method="POST" autocomplete="off">
                            <input type="hidden" name="action" value="login" />
                            <div class="mb-3">
                                <label class="form-label">Username</label>
                                <input type="text" class="form-control" name="strUsername"/>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input type="password" class="form-control" name="strPassword"/>
                            </div>
                            <div class="d-grid mb-3">
                                <input type="submit" class="btn btn-primary" value="Login" />
                            </div>
                            <c:if test="${not empty requestScope.message}">
                                <span class="text-danger small">${requestScope.message}</span>
                            </c:if>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
