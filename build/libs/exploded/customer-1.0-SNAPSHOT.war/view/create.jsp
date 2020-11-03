<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 11/2/2020
  Time: 11:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create</title>
</head>
<body>
<form method="post">
    <fieldset>
        <legend>Create new customer</legend>
        <table>
            <tr>
                <td>Id</td>
                <td><input type="number" name="id"></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><input type="text" name="address"></td>
            </tr>
            <tr>
                <td>Image:</td>
                <td><input type="text" name="image"></td>
            </tr>
            <tr>
                <td><a href="/customers">back to home</a></td>
                <td><input type="submit" value="create"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
