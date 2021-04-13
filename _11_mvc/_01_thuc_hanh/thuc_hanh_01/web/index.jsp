<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/12/2021
  Time: 10:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Main menu</title>
  </head>
  <body>
    <h2>What do you want to do?</h2>
    <form action="/mainMenu" method="post">
      <input type="radio" id="display" name="userAction" value="display">
      <label for="display">Display all customers</label><br>

      <input type="radio" id="add" name="userAction" value="add">
      <label for="add">Add new customer</label><br>

      <input type="radio" id="update" name="userAction" value="update">
      <label for="update">Update customer</label><br>

      <input type="radio" id="delete" name="userAction" value="delete">
      <label for="delete">Delete customer</label><br>

      <input type="radio" id="detail" name="userAction" value="detail">
      <label for="detail">Customer detail</label><br><br>

      <input type="submit" value="Submit">
    </form>
  </body>
</html>
