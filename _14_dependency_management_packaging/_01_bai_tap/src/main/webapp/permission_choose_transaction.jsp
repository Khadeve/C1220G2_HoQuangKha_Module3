<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/14/2021
  Time: 9:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>permissions choose transaction</title>
</head>
<body>
<h2>Choose permissions for the user</h2>
<h4>${message}</h4>
<form action="/manage" method="post">
    <input type="hidden" name="userAction" value="addUserTransaction">
    <input type="hidden" name="newUser" value="${newUser}">

    <input type="checkbox" id="add" name="permission1" value="1">
    <label for="add">Add</label><br>

    <input type="checkbox" id="edit" name="permission2" value="2">
    <label for="edit">Edit</label><br>

    <input type="checkbox" id="delete" name="permission3" value="3">
    <label for="delete">Delete</label><br>

    <input type="checkbox" id="view" name="permission4" value="4">
    <label for="view">View</label>
    <br>
    <input type="submit" value="Submit" />
</form>
<a href="/manage?userAction=">Back to main</a>
</body>
</html>
