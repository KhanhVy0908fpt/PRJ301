<%-- 
    Document   : table
    Created on : 25 Jun 2025, 11:51:21
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
    <body class="bg-white">
        <div class="container py-4">
            <%--kiem tra dang nhap --%>
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <c:redirect url="MainController"/>                
                </c:when>
                <c:otherwise>
                    <%-- Table--%>
                    <c:set var="projects" value="${requestScope[param.listName]}"/>
                    <c:choose>
                        <c:when test="${not empty projects and fn:length(projects) > 0}" >
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered align-middle">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th>Description</th>
                                            <th>Status</th>
                                            <th>Estimated launch</th>
                                            <c:if test="${sessionScope.user.role == 'Founder'}">
                                                <th>Action</th>
                                            </c:if>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="project" items="${projects}">
                                            <tr>
                                                <td>${project.projectId}</td>
                                                <td>${project.projectName}</td>
                                                <td>${project.description}</td>
                                                <td>${project.status}
                                                    <c:if test="${not empty message && requestScope.projectName == project.projectName}">
                                                        <p class="text-success small">${message}</p>
                                                    </c:if>
                                                    <c:if test="${not empty error && requestScope.projectName == project.projectName}">
                                                        <p class="text-danger small">${error}</p>
                                                    </c:if>
                                                </td>
                                                <td>${project.estimatedLaunch}</td>
                                                <c:if test="${sessionScope.user.role == 'Founder'}">
                                                    <td>
                                                        <form action="MainController" method="POST" class="d-flex align-items-center gap-2">
                                                            <input type="hidden" name="action" value="updateProjectStatus" />
                                                            <input type="hidden" name="projectName" value="${project.projectName}" />
                                                            <select name="status" id="status" class="form-select form-select-sm w-auto" required>
                                                                <option value="">-- Select Status --</option>
                                                                <option value="Ideation">Ideation</option>
                                                                <option value="Development">Development</option>
                                                                <option value="Launch">Launch</option>
                                                                <option value="Scaling">Scaling</option>
                                                            </select>
                                                            <input type="submit" class="btn btn-sm btn-outline-primary" value="Update" />
                                                        </form>
                                                    </td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>        
                            </div>
                        </c:when>
                    </c:choose>
                    <%-- Table--%>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>
