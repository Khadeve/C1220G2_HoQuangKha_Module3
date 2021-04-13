<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/12/2021
  Time: 9:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>customer detail</title>
</head>
<body>
<h2>Customer detail</h2>
<table>
    <tr>
        <td>
            <label for="customerId">Id: </label>
        </td>
        <td>
            <input type="text" name="customerId" id="customerId" value="${detailCustomer.id}" readonly/>
        </td>
    </tr>
    <tr>
        <td>
            <label for="customerName">Name: </label>
        </td>
        <td>
            <input type="text" name="customerName" id="customerName" value="${detailCustomer.name}" readonly/>
        </td>
    </tr>
    <tr>
        <td>
            <label for="customerEmail">Email: </label>
        </td>
        <td>
            <input type="email" name="customerEmail" id="customerEmail" value="${detailCustomer.email}" readonly>
        </td>
    </tr>
    <tr>
        <td>
            <label for="customerAddress">Address: </label>
        </td>
        <td>
            <input type="text" name="customerAddress" id="customerAddress" value="${detailCustomer.address}" readonly>
        </td>
    </tr>
</table>
<br>
<a href="index.jsp">Back to main menu</a>
</body>
</html>
