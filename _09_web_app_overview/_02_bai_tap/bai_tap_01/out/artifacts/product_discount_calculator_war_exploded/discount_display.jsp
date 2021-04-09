<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/8/2021
  Time: 4:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <h4>List price: <%=request.getAttribute("listPrice")%></h4>
    <h4>Discount percent: <%=request.getAttribute("discountPercent")%></h4>
    <h4>Product description: <%=request.getAttribute("description")%></h4>
    <h4>Discount amount: <%=request.getAttribute("discountAmount")%></h4>
    <h4>Final price: <%=request.getAttribute("finalPrice")%></h4>
</body>
</html>
