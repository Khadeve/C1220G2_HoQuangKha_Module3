<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/19/2021
  Time: 9:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>notification modal</title>
</head>
<body>
<button id="btn-modal" hidden></button>
<div id="mymodal" class="modal">
    <div class="modal-content">
        <span class="close-modal">&times;</span>
        <p>${param.notification}</p>
    </div>
</div>
</body>
</html>
