<%-- 
    Document   : welcome
    Created on : 30 Jun 2025, 23:48:53
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
        <title>JSP Page</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${empty sessionScope.user}">
                <c:redirect url="login.jsp"/>
            </c:when>
            <c:otherwise>
                <h1>Welcome ${sessionScope.user.getName()}!</h1>
                <a href="MainController?action=logout">Logout</a><br/>
                <a href="MainController?action=listExamCategory">Display all exam categories</a><br/>

                <label>Enter category to view exams:</label>
                <form action="MainController" method="POST">
                    <input type="hidden" name="action" value="listExam" />
                    <input type="text" name="strKeyword" value="${not empty requestScope.keyword? requestScope.keyword : ""}" />
                    <input type="submit" value="Filter" />                    
                </form><br/>
                
                <%-- ONLY instructor access --%>
                
                <c:if test="${sessionScope.user.role eq 'Instructor'}">
                    <h2 style="color: green">Instructor section</h2>
                    <a href="MainController?action=showAddExamForm">Create New Exams</a><br/>
                    <a href="MainController?action=listQuestion">Display All Question</a><br/>
                    <a href="MainController?action=ListExamForQuestionAdding">Add new Question for exams</a>

                </c:if>


                <%--Xu ly table cho listAllExamCategories --%>
                <c:choose>
                    <c:when test="${not empty requestScope.listCategory and fn:length(requestScope.listCategory) == 0}">
                        <h2>No exam Category found!</h2>
                    </c:when>
                    <c:when test="${not empty requestScope.listCategory and fn:length(requestScope.listCategory) > 0}">
                        <jsp:include page="categoryTable.jsp">
                            <jsp:param name="listName" value="listCategory"/>
                        </jsp:include>
                    </c:when>
                </c:choose>

                <%-- list Exams by category --%>
                <c:choose>
                    <c:when test="${requestScope.listExam != null and fn:length(listExam) == 0}">
                        <h2>No exam found!</h2>
                    </c:when>
                    <c:when test="${not empty requestScope.listExam and fn:length(listExam) > 0}">
                        <jsp:include page="examTable.jsp">
                            <jsp:param name="listName" value="listExam"/>
                        </jsp:include>

                    </c:when>
                </c:choose>

                <%-- list Questions --%>        
                <c:choose>
                    <c:when test="${requestScope.listQuestion != null and fn:length(listQuestion) == 0}">
                        <h2>No Question found!</h2>
                    </c:when>
                    <c:when test="${not empty requestScope.listQuestion and fn:length(listQuestion) > 0}">
                        <jsp:include page="questionTable.jsp">
                            <jsp:param name="listName" value="listQuestion"/>
                        </jsp:include>

                    </c:when>
                </c:choose>       
            </c:otherwise>
        </c:choose>
    </body>
</html>
