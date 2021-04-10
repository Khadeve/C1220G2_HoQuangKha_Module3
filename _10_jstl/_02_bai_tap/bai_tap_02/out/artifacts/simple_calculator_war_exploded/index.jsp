<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/9/2021
  Time: 5:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
    <form action="/calculate" method="post">
      <h2>Simple Calculator</h2>
      <fieldset style="width: 25%">
        <legend>Calculator</legend>
        <label for="firstOperand">First Operand</label>
        <input type="number" id="firstOperand" name="firstOperand">
        <br><br>
        <label for="operator">Operator:</label>
        <select name="operator" id="operator">
          <option value="plus">plus</option>
          <option value="subtract">subtract</option>
          <option value="multiply">multiply</option>
          <option value="divide">divide</option>
        </select>
        <br><br>
        <label for="firstOperand">First Operand</label>
        <input type="number" id="secondOperand" name="secondOperand">
        <br><br>

        <input type="submit" value="Calculate">
      </fieldset>
    </form>
  </body>
</html>
