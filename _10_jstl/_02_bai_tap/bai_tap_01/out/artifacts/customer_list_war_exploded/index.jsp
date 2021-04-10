<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/9/2021
  Time: 2:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>customer list</title>

    <link rel="stylesheet" href="assert/css/bootstrap.css">
    <script src="assert/jquery-3.6.0.min.js"></script>
    <script src="assert/js/bootstrap.js"></script>

  </head>
  <body>
    <table class="table table-striped">
      <thead>
      <tr>
        <th scope="col">Name</th>
        <th scope="col">Date of Birth</th>
        <th scope="col">Address</th>
        <th scope="col">Image</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="customer" items="${customers}">
        <tr>
          <th scope="row"><c:out value="${customer.name}"/></th>
          <td><c:out value="${customer.dateOfBirth}"/></td>
          <td><c:out value="${customer.address}"/></td>
          <td><img src="<c:out value="${customer.image}"/>" alt="personal image" width="100" height="100"></td>
        </tr>
      </c:forEach>
      </tbody>
    </table>

  </body>
</html>
