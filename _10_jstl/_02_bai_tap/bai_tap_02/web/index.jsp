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
          <table>
              <tr>
                  <td>
                      <label for="firstOperand">First Operand</label>
                  </td>
                  <td>
                      <input type="number" id="firstOperand" name="firstOperand">
                  </td>
              </tr>
              <tr>
                  <td>
                      <label for="operator">Operator:</label>
                  </td>
                  <td>
                      <select id="operator" name="operator">
                          <option value="plus">plus</option>
                          <option value="subtract">subtract</option>
                          <option value="multiply">multiply</option>
                          <option value="divide">divide</option>
                      </select>
                  </td>
              </tr>
              <tr>
                  <td>
                      <label for="secondOperand">Second Operand</label>
                  </td>
                  <td>
                      <input type="number" id="secondOperand" name="secondOperand">
                  </td>
              </tr>
              <tr>
                  <td></td>
                  <td>
                      <input type="submit" value="Calculate">
                  </td>
              </tr>
          </table>
      </fieldset>
    </form>
  </body>
</html>
