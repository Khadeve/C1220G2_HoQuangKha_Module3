<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/13/2021
  Time: 4:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user deletion confirm</title>
</head>
<body>
<h2>Are you sure?</h2>
<form action="/manage" method="post">
    <input type="hidden" name="id" value="${id}">
    <input type="hidden" name="userAction" value="delete">
    <input type="submit" name="confirmDeletion" value="yes">
    <input type="submit" name="confirmDeletion" value="no">
</form>
</body>
</html>
