<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/2/2020
  Time: 2:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<form method="post">
    <fieldset>
        <legend>Are you sure?</legend>
        <table>
            <tr>
                <td>id: </td>
                <td>${requestScope["customer"].getId()}</td>
            </tr>
            <tr>
                <td>Name: </td>
                <td>${requestScope["customer"].getName()}</td>
            </tr>
            <tr>
                <td>Address: </td>
                <td>${requestScope["customer"].getAddress()}</td>
            </tr>
            <tr>
                <td>image: </td>
                <td>${requestScope["customer"].getImage()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete customer"></td>
                <td><a href="/customers">Back to customer list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
