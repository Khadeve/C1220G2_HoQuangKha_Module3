<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/18/2021
  Time: 8:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>furama header</title>
    <link rel="stylesheet" href="/css/furama_main_page.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="row col-12 header">
    <div class="flex-container">
        <div style="flex-grow:1;">
            <a href="/customer"><img src="img/logo.png" alt="furama logo"></a>
        </div>
        <div style="flex-grow:5;">
            <div class="row">
                <div class="col-4"></div>
                <div class="col-3 contact-info">
                    <p>
                        <i class="fa fa-location-arrow">
                            103 - 105 Vo Nguyen Giap Street, Khue My Ward,
                            Ngu Hanh Son District, Danang City, Vietnam
                        </i>
                    </p>
                    <!-- <p><small>7,0 km from Danang Airport</small></p> -->
                </div>
                <div class="col-3 contact-info">
                    <p><i class="fa fa-phone"> 84-236-3847 333/888</i></p>
                    <p><i class="fa fa-inbox"> reservation@furamavietnam.com</i></p>
                </div>
            </div>
        </div>
        <div style="flex-grow:4;">Ho Quang Kha</div>
    </div>
</div>

<div class="row col-12 topnav flex-container">
    <div><a href="#">Home</a></div>
    <div class="dropdown">
        <button class="dropbtn">
            Employee
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <a href="#">Link 1</a>
            <a href="#">Link 2</a>
            <a href="#">Link 3</a>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbtn">
            Customer
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <a href="/customer?userAction=add">Add new customer</a>
            <a href="/customer?userAction=display">Customer list</a>
            <a href="#">Customers with contract</a>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbtn">
            Service
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <a href="#">Add new service</a>
            <a href="#">Link 2</a>
            <a href="#">Link 3</a>
        </div>
    </div>
    <div><a href="#">Contact</a></div>
    <div>
        <form class="search-form" action="#">
            <input type="text" name="search-field" id="search-field" placeholder="search...">
            <button type="submit"><i class="fa fa-search" style="padding: 1px"></i></button>
        </form>
    </div>
</div>
</body>
</html>
