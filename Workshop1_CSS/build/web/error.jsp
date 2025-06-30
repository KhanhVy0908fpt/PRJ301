<%-- 
    Document   : error
    Created on : 25 Jun 2025, 10:14:14
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-md-7">
                    <div class="card shadow p-4 text-center">
                        <h1 class="mb-3 text-danger">Oops! Something went wrong.</h1>
                        <div class="alert alert-danger">An unexpected error occurred. Please try again later.</div>
                        <c:if test="${not empty requestScope.errorMessage}">
                            <div class="alert alert-warning">Error details: ${requestScope.errorMessage}</div>
                        </c:if>
                        <a href="javascript:history.back()" class="btn btn-secondary mt-3">Go back</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
