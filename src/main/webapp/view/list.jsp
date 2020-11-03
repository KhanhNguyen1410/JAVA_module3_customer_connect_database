<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/2/2020
  Time: 10:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Customer</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>
<body>
<h1>Customer</h1>
<p>
    <a href="/customers?action=create" class="btn btn-success">Create new customer</a>
</p>
<table border="1">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Address</th>
        <th>Image</th>
        <th>edit</th>
        <th>delete</th>
    </tr>
    <c:forEach items='${requestScope["customers"]}' var="customer">
            <tr>
                <td>${customer.getId()}</td>
                <td>${customer.getName()}</td>
                <td>${customer.getAddress()}</td>
                <td><img src="view/${customer.getImage()}" alt="${customer.getImage()}"></td>
                <td class="link"><a href="/customers?action=edit&id=${customer.getId()}">edit</a></td>
                <td class="link"><a href="/customers?action=delete&id=${customer.getId()}">delete</a></td>
            </tr>
    </c:forEach>
</table>
</body>
</html>
