<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/14/2021
  Time: 9:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user addition transaction</title>
</head>
<body>
<form action="/manage" method="get">
    <input type="hidden" name="userAction" value="addUserTransaction">
    <fieldset>
        <legend>Add new user</legend>
        <table>
            <tr>
                <td><label for="name">Name:</label></td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td><label for="email">Email:</label></td>
                <td><input type="text" name="email" id="email"></td>
            </tr>
            <tr>
                <td><label for="country">Country:</label></td>
                <td><input type="text" name="country" id="country"></td>
            </tr>
        </table>
    </fieldset>
    <br>
    <input type="submit" value="Submit">
    <button type="button"><a href="/manage?userAction=">Back to list</a></button>
</form>
</body>
</html>
