<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/8/2021
  Time: 4:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>user form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
  </head>
  <body>
  <div class="container border w-50 mt-3">
    <form action="/calculate" method="post">
      <div class="row mb-3 mt-3">
        <label for="listPrice" class="col-sm-2 col-form-label">List price</label>
        <div class="col-sm-10">
          <input type="number" class="form-control" id="listPrice" name="listPrice">
        </div>
      </div>
      <div class="row mb-3">
        <label for="discountPercent" class="col-sm-2 col-form-label">Discount</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="discountPercent" name="discountPercent" placeholder="%">
        </div>
      </div>
      <div class="mb-3">
        <label for="product-description" class="form-label">Product Description</label>
        <textarea class="form-control" id="product-description" name="productDescription" rows="3"></textarea>
      </div>
      <button type="submit" class="btn btn-primary mb-3">Calculate discount</button>
    </form>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
  </body>
</html>
