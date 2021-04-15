<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/13/2021
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user list display</title>
    <style>
        #main, #main th, #main td {
            border-collapse: collapse;
            border: 1px solid black;
        }

        th, td {
            padding: 10px;
            margin: 10px;
        }

        #search {
            margin-top: 5px;
        }

        #search > button, #search > input {
            float: left;
        }
    </style>
</head>
<body>
<h2>User Management</h2>
<button type="button">
    <a href="/manage?userAction=add">Add new user</a>
</button>

<button type="button">
    <a href="/manage?userAction=addBaseInfoTransaction">Add new user transaction</a>
</button>

<br>
<table style="border: none">
    <tr>
        <td>
            <form id="search" action="/manage" method="post">
                <input type="hidden" name="userAction" value="search">
                <button type="submit">Search</button>
                <label>
                    <input type="text" placeholder="search by country..." name="country">
                </label>
            </form>
        </td>
        <td style="padding-top:15px; padding-left: 210px">
            <form action="/manage" method="post">
                <button type="submit" name="userAction" value="sort">
                    Sort by name
                </button>
            </form>
        </td>
    </tr>
</table>

<br>
<table id="main">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th colspan="4"></th>
    </tr>
    <c:forEach var="user" items="${userList}">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td><a href="/manage?userAction=update&id=${user.id}">Update</a></td>
            <td><a href="/manage?userAction=delete&id=${user.id}">Delete</a></td>
            <td><a href="/manage?userAction=addPermission&id=${user.id}">Add Permission</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
