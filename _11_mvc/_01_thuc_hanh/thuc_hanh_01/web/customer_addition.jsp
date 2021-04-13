<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/12/2021
  Time: 11:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>add new customer</title>
</head>
<body>
    <h2>Adding new customer</h2>
    <form action="/add" method="post">
        <table>
            <tr>
                <td>
                    <label for="customerId">Id: </label>
                </td>
                <td>
                    <input type="text" name="customerId" id="customerId"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="customerName">Name: </label>
                </td>
                <td>
                    <input type="text" name="customerName" id="customerName"/>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="customerEmail">Email: </label>
                </td>
                <td>
                    <input type="email" name="customerEmail" id="customerEmail">
                </td>
            </tr>
            <tr>
                <td>
                    <label for="customerAddress">Address: </label>
                </td>
                <td>
                    <input type="text" name="customerAddress" id="customerAddress">
                </td>
            </tr>
        </table>
        <br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
