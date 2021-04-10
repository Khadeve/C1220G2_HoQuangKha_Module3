<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/9/2021
  Time: 10:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>currency converter</title>
  </head>
  <body>
    <h2>Currency Converter</h2>
    <form action="currency_converter.jsp" method="post">
      <label for="rate">Rate</label><br>
      <input type="number" id="rate" name="rate" placeholder="RATE" value= "22000" /><br>
      <label for="usd">USD</label><br>
      <input type="number" id="usd" name="usd" placeholder="USD" value= "0"><br><br>
      <input type="submit" value="Convert"><br>
    </form>
  </body>
</html>
