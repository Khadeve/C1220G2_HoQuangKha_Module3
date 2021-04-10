<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/9/2021
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>currency converter</title>
</head>
<body>
    <%
        double rate = Double.parseDouble(request.getParameter("rate"));
        double usd = Double.parseDouble(request.getParameter("usd"));

        double vnd = rate * usd;
    %>
    <h1>Rate: <%=rate%></h1>
    <h1>Usd: <%=usd%></h1>
    <h1>Vnd: <%=vnd%></h1>
</body>
</html>
