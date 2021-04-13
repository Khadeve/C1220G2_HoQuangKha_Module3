<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/12/2021
  Time: 9:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>customer deletion confirm</title>
</head>
<body>
    <h2>Are you sure?</h2>
    <form action="/delete" method="post">
        <input type="text" name="deletedCustomerId" value="${deletedCustomerId}" style="display: none">
        <input type="submit" name="confirmDeletion" value="yes">
        <input type="submit" name="confirmDeletion" value="no">
    </form>
</body>
</html>
