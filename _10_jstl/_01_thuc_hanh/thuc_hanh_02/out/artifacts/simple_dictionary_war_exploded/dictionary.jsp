<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/9/2021
  Time: 2:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>dictionary</title>
</head>
<body>
    <%
        Map<String, String> dictionary = new HashMap<>();

        dictionary.put("water", "nước");
        dictionary.put("soil", "đất");
        dictionary.put("air", "không khí");
        dictionary.put("sun", "mặt trời");
        dictionary.put("moon", "mặt trăng");

        String englishWord = request.getParameter("englishWord");
        String result = "not found";

        for (Map.Entry<String,String> word : dictionary.entrySet()) {
            if (word.getKey().equals(englishWord)) {
                result = word.getValue();
                break;
            }
        }
    %>

    <h1><%=englishWord%>: <%=result%></h1>
</body>
</html>
