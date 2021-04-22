<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/20/2021
  Time: 8:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>delete confirmation modal</title>
</head>
<body>
<button id="openbtn" hidden>Open Modal</button>

<div id="mymodal" class="modal">
    <span class="close" title="Close Modal">×</span>
    <form id="myform" class="modal-content" action="/customer" method="post">
        <input type="hidden" name="userAction" value="delete">
        <input type="hidden" name="deletedId" value="${id}">
        <div class="container">
            <h1>Delete Account</h1>
            <p>Are you sure you want to delete <strong>${param.deletedName}</strong>?</p>

            <div class="clearfix">
                <button type="button" class="cancelbtn">Cancel</button>
                <button type="button" class="deletebtn">Delete</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
