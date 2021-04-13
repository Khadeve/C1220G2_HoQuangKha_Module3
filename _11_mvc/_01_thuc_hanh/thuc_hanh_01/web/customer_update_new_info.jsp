<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/12/2021
  Time: 7:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>customer update new info</title>
</head>
<body>
    <h2>Update new customer information</h2>
    <form action="/update" method="post">
        <input type="text" name="oldId" value="${updatedCustomer.id}" style="display:none">
        <table>
            <tr>
                <td>
                    <label for="customerId">Id: </label>
                </td>
                <td>
                    <input type="text" name="customerId" id="customerId" value="${updatedCustomer.id}"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="customerName">Name: </label>
                </td>
                <td>
                    <input type="text" name="customerName" id="customerName" value="${updatedCustomer.name}"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="customerEmail">Email: </label>
                </td>
                <td>
                    <input type="email" name="customerEmail" id="customerEmail" value="${updatedCustomer.email}">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="customerAddress">Address: </label>
                </td>
                <td>
                    <input type="text" name="customerAddress" id="customerAddress" value="${updatedCustomer.address}">
                </td>
            </tr>
        </table>
        <br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
