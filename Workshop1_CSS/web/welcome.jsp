<%-- 
    Document   : welcome
    Created on : 24 Jun 2025, 23:05:44
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <div class="container py-5">
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <c:redirect url="login.jsp"/>
                </c:when>
                <c:otherwise>
                    <div class="card shadow p-4">
                        <h1 class="mb-4 text-center">Welcome ${sessionScope.user.name}!</h1>
                        <div class="mb-3 text-end">
                            <a href="MainController?action=logout" class="btn btn-outline-danger btn-sm">Logout</a>
                        </div>
                        <div class="mb-4">
                            <a href="MainController?action=listProjects" class="btn btn-primary">Display all projects</a>
                        </div>
                        <c:if test="${sessionScope.user.role eq 'Founder'}">
                            <form action="ProjectController" method="POST" class="row g-2 align-items-center mb-3">
                                <input type="hidden" name="action" value="searchProject" />
                                <div class="col-auto">
                                    <label class="col-form-label">Search by name:</label>
                                </div>
                                <div class="col-auto">
                                    <input type="text" class="form-control" name="strKeyword" value="${not empty requestScope.keyword ? requestScope.keyword : ""}" />
                                </div>
                                <div class="col-auto">
                                    <input type="submit" class="btn btn-success" value="Search" />    
                                </div>
                            </form>
                            <a href="MainController?action=addProject" class="btn btn-outline-primary mb-3">Create New Projects</a>
                        </c:if>
                        <c:choose>
                            <c:when test="${requestScope.listSearch != null and fn:length(requestScope.listSearch) == 0}">
                                <div class="alert alert-warning mt-3">No projects found!</div>
                            </c:when>
                            <c:when test="${not empty requestScope.listSearch and fn:length(requestScope.listSearch) > 0}">
                                <h2 class="mt-4">Search Results</h2>
                                <jsp:include page="table.jsp">
                                    <jsp:param name="listName" value="listSearch"/>
                                </jsp:include>
                            </c:when>
                            <c:when test="${empty requestScope.listSearch and not empty requestScope.listAll}">
                                <h2 class="mt-4">All Projects</h2>
                                <jsp:include page="table.jsp">
                                    <jsp:param name="listName" value="listAll"/>
                                </jsp:include>
                            </c:when>
                        </c:choose>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>
