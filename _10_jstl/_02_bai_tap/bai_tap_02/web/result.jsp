<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/10/2021
  Time: 2:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>result</title>
</head>
<body>
    <c:choose>
        <c:when test="${operatorServlet eq 'plus'}">
            <c:set var="result" scope="session">
                ${firstOperandServlet + secondOperandServlet}
            </c:set>
        </c:when>
        <c:when test="${operatorServlet eq 'subtract'}">
            <c:set var="result" scope="session">
                ${firstOperandServlet - secondOperandServlet}
            </c:set>
        </c:when>
        <c:when test="${operatorServlet eq 'multiply'}">
            <c:set var="result" scope="session">
                ${firstOperandServlet * secondOperandServlet}
            </c:set>
        </c:when>
        <c:otherwise>
            <c:set var="result" scope="session">
                ${firstOperandServlet / secondOperandServlet}
            </c:set>
        </c:otherwise>
    </c:choose>
    <h1>Result: <c:out value="${result}"/></h1>
</body>
</html>
