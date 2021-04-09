<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/8/2021
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

  </head>
  <body>
    <h2>Currency Converter</h2>
    <div class="container border w-3">
      <form action="/converter" method="post">
        <div class="mb-3">
          <label for="rate" class="form-label">Rate</label>
          <input type="text" class="form-control" id="rate" name="rate" placeholder="enter the rate...">
        </div>
        <div class="mb-3">
          <label for="amount" class="form-label">USD</label>
          <input type="text" class="form-control" id="amount" name="amount" placeholder="enter amount here...">
        </div>
        <button type="submit" class="btn btn-primary">Convert</button>
      </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
  </body>
</html>
