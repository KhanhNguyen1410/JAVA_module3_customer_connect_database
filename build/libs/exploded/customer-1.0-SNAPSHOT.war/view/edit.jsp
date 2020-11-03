<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/2/2020
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Customer</title>
</head>
<body>
<h1>Edit Customer</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<form method="post">
    <fieldset>
        <legend>Edit</legend>
        <table>
            <tr>
                <td>ID</td>
                <td><input type="text" name="id" value="${requestScope["customer"].getId()}"></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" value="${requestScope["customer"].getName()}"></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><input type="text" name="address" value="${requestScope["customer"].getAddress()}"></td>
            </tr>
            <tr>
                <td>Image</td>
                <td><input type="text" name="image" value="${requestScope["customer"].getImage()}"></td>
            </tr>
            <tr>
                <td><a href="/customers">back to home</a></td>
                <td><input type="submit" value="Update"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
