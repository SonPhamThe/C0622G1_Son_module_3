<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 01/10/2022
  Time: 09:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Product</title>
</head>
<body>
<h1>Delete Product</h1>
<form method="post">
    <h3>Are you sure ? </h3>
    <fieldset>
        <legend>Information Product</legend>
        <table>
            <tr>
                <td>Name Product:</td>
                <td>${product.getName()}</td>
            </tr>
            <tr>
                <td>Price:</td>
                <td>${product.getPrice()}</td>
            </tr>
            <tr>
                <td>Description:</td>
                <td>${product.getDescription()}</td>
            </tr>
            <tr>
                <td>Producer:</td>
                <td>${product.getProducer()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete product"></td>
                <td><a href="/products">Back List Product</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
