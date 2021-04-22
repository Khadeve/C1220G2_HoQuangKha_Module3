<%--
  Created by IntelliJ IDEA.
  User: Kha
  Date: 4/19/2021
  Time: 4:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>customer update form</title>
    <link rel="stylesheet" href="/css/customer_addition_form.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet"/>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="css/notification_modal.css">
</head>
<body>
<jsp:include page="furama_header_css.jsp"/>
<jsp:include page="notification_modal.jsp">
    <jsp:param name="notification" value="Updating customer successfully!"/>
</jsp:include>

<div class="row">
    <div class="col-12" style="padding-top: 20px">
        <h2>Customer Update Form</h2>
    </div>
</div>

<div class="container">
    <form id="customerRegistrationForm" action="/customer" method="post" autocomplete="off">
        <input type="hidden" name="userAction" value="update">
        <label for="id">ID</label>
        <small style="color:red"><c:out value="${idErrorMsg}"/></small><br>
        <div class="input-container">
            <i class="fa fa-id-card-o icon"></i>
            <input class="input-field" type="text" id="id" name="id" value="${id}" placeholder="ID..."><br>
        </div>

        <label for="fullname">Full Name</label>
        <small style="color:red"><c:out value="${nameErrorMsg}"/></small>
        <br>
        <div class="input-container">
            <i class="fa fa-user icon"></i>
            <input class="input-field" type="text" id="fullname" name="fullname" value="${fullname}" placeholder="your name..."><br>
        </div>

        <label for="dateOfBirth">Date Of Birth</label>
        <small style="color:red"><c:out value="${dateOfBirthErrorMsg}"/></small>
        <br>
        <div class="input-container">
            <i class="fa fa-calendar icon"></i>
            <input class="input-field" type="text" name="dateOfBirth" id="dateOfBirth" value="${dateOfBirth}"><br>
        </div>


        <label for="gender">Gender</label>
        <br>
        <div class="input-container">
            <i class="fa fa-transgender icon"></i>
            <select class="input-field" name="gender" id="gender">
                <c:choose>
                    <c:when test="${gender.equals('male')}">
                        <option selected value="male">Male</option>
                        <option value="female">Female</option>
                    </c:when>
                    <c:otherwise>
                        <option selected value="female">Female</option>
                        <option value="male">Male</option>
                    </c:otherwise>
                </c:choose>
            </select><br>
        </div>

        <label for="idCard">ID Card</label>
        <small style="color:red"><c:out value="${idCardErrorMsg}"/></small>
        <div class="input-container">
            <i class="fa fa-id-card-o icon"></i>
            <input class="input-field" type="text" name="idCard" id="idCard" value="${idCard}" placeholder="card number...">
        </div>

        <label for="phoneNumber">Phone Number</label>
        <small style="color:red"><c:out value="${phoneNumberErrorMsg}"/></small>
        <div class="input-container">
            <i class="fa fa-phone icon"></i>
            <input class="input-field" type="text" name="phoneNumber" id="phoneNumber" value="${phoneNumber}" placeholder="phone number...">
        </div>

        <label for="email">Email</label>
        <small style="color:red"><c:out value="${emailErrorMsg}"/></small>
        <div class="input-container">
            <i class="fa fa-envelope-o icon"></i>
            <input class="input-field" type="email" name="email" id="email" value="${email}" placeholder="email...">
        </div>

        <label for="address">Address</label>
        <small style="color:red"><c:out value="${addressErrorMsg}"/></small>
        <div class="input-container">
            <i class="fa fa-address-book icon"></i>
            <input class="input-field" type="text" name="address" id="address" value="${address}" placeholder="address...">
        </div>

        <label for="customerType">Customer Type</label><br>
        <div class="input-container">
            <i class="fa fa-group icon"></i>
            <select class="input-field" name="customerType" id="customerType">
                <c:forEach var="type" items="${customerTypeList}">
                    <c:choose>
                        <c:when test="${updatedCustomerType.equals(type.customerType)}">
                            <option selected value="${type.customerType}">${type.customerType}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${type.customerType}">${type.customerType}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select><br>
        </div>
        <input type="submit" value="Submit">
        <input id="error" type="hidden" value="${error}">
        <a id="showListLink" href="/customer?userAction=display" hidden></a>
    </form>
</div>

<script>
    $(document).ready(function () {
        $('input[id$=dateOfBirth]').datepicker({
            dateFormat: 'dd/mm/yy' // Date Format "dd-mm-yy"
        });
    });

    let btn = document.getElementById("btn-modal");
    let modal = document.getElementById("mymodal");
    let closeButton = document.getElementsByClassName("close-modal")[0];

    btn.addEventListener("click", function () {
        modal.style.display = "block";
    });

    closeButton.addEventListener("click", function () {
        modal.style.display = "none";
        document.getElementById("showListLink").click();
    });

    window.addEventListener("click", function (event) {
        if (event.target === modal) {
            modal.style.display = "none";
            document.getElementById("showListLink").click();
        }
    });

    if (document.getElementById("error").value === "no") {
        btn.click();
    }
</script>
</body>
</html>
