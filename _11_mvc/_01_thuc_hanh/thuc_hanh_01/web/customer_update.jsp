<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/12/2021
  Time: 11:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>customer update</title>
    <style>
        table, th, td {
            border-collapse: collapse;
            border: 1px solid black;
        }
        th, td {
            padding: 5px;
            margin: 5px;
        }
    </style>
</head>
<body>
<h1>Customer Management</h1>
    <table>
        <tr>
            <th>
                No
            </th>
            <th>
                Id
            </th>
            <th>
                Name
            </th>
            <th>
                Email
            </th>
            <th>
                Address
            </th>
            <th>

            </th>
        </tr>
        <c:forEach var="customer" items="${customerList}" varStatus="counter">
        <tr>
            <td>${counter.count}</td>
            <td>${customer.id}</td>
            <td>${customer.name}</td>
            <td>${customer.email}</td>
            <td>${customer.address}</td>
            <td><a href="/update?id=${customer.id}">Update</a></td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>
