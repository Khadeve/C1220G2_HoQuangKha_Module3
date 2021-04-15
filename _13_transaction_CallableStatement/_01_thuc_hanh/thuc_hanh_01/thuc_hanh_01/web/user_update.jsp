<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/13/2021
  Time: 3:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user update</title>
</head>
<body>
<form action="/manage" method="post">
    <input type="hidden" name="userAction" value="update">
    <input type="hidden" name="id" value="${user.id}">
    <fieldset>
        <legend>Update user</legend>
        <table>
            <tr>
                <td><label for="name">Name:</label></td>
                <td><input type="text" name="name" id="name" value="${user.name}"></td>
            </tr>
            <tr>
                <td><label for="email">Email:</label></td>
                <td><input type="text" name="email" id="email" value="${user.email}"></td>
            </tr>
            <tr>
                <td><label for="country">Country:</label></td>
                <td><input type="text" name="country" id="country" value="${user.country}"></td>
            </tr>
        </table>
    </fieldset>
    <br>
    <input type="submit" value="Submit">
    <button type="button"><a href="/manage?userAction=">Back to list</a></button>
</form>
</body>
</html>
