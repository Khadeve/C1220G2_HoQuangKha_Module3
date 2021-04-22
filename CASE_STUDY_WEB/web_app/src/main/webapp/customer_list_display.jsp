<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/17/2021
  Time: 9:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>customer list display</title>

    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <style>
        a {
            color: white;
            text-decoration: none;
        }

        a:hover {
            color: whitesmoke;
            text-decoration: none;
        }
    </style>
    <link rel="stylesheet" href="css/delete_modal.css">
</head>
<body>
<jsp:include page="delete_modal.jsp">
    <jsp:param name="deletedName" value="${deletedName}"/>
</jsp:include>
<input type="hidden" id="deleteConfirmation" name="deleteConfirmation" value="${doOpenDeleteModal}">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/customer?userAction="><img src="img/logo.png" alt="furama logo" width="55" height="60"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Employee
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
            </div>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Customer
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="/customer?userAction=add">Add new customer</a>
                <a class="dropdown-item" href="/customer?userAction=display">Customer list</a>
                <a class="dropdown-item" href="#">Customer with contract</a>
            </div>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Service
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
            </div>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="#">Contact <span class="sr-only">(current)</span></a>
        </li>
    </ul>

    <div class="ml-auto mt-3">
        <form action="/customer" method="post" id="search-form" class="form-inline">
            <input type="hidden" name="userAction" value="search">
            <input name="searchData" value="${searchData}" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>

<h2 style="text-align:center; margin-top: 5px;">Customer List</h2>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <table id="tableCustomer" class="table table-striped table-bordered" style="width:100%;font-size: 15px;">
                <thead>
                <tr>
                    <th>No</th>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Date of birth</th>
                    <th>Gender</th>
                    <th>Id Card</th>
                    <th>Phone Number</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Customer type</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="customer" items="${customerListServlet}" varStatus="counter">
                    <tr>
                        <td><c:out value="${counter.count}"></c:out></td>
                        <td><c:out value="${customer.id}"></c:out></td>
                        <td><c:out value="${customer.name}"></c:out></td>
                        <td><c:out value="${customer.dateOfBirth}"></c:out></td>
                        <td><c:out value="${customer.gender}"></c:out></td>
                        <td><c:out value="${customer.idCard}"></c:out></td>
                        <td><c:out value="${customer.phoneNumber}"></c:out></td>
                        <td><c:out value="${customer.email}"></c:out></td>
                        <td><c:out value="${customer.address}"></c:out></td>
                        <td><c:out value="${customer.customerType}"></c:out></td>
                        <td>
                            <button type="button" class="btn btn-primary btn-sm">
                                <a href="/customer?userAction=update&id=${customer.id}">Update</a>
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-danger btn-sm">
                                <a href="/customer?userAction=delete&id=${customer.id}">Delete</a>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
<script src="javascript/delete_modal.js"></script>
</body>
</html>
