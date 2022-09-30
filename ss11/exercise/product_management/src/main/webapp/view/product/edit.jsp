<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 30/09/2022
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<h1>Edit product</h1>

<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>

<p>
    <a href="/product">Back to product list</a>
</p>

<form action="/product">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="nameProduct" id="name" value="${requestScope["product"].getNameProduct}"></td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><input type="text" name="price" id="price" value="${requestScope["product"].getPrice()}"></td>
            </tr>
            <tr>
                <td>Description Product:</td>
                <td><input type="text" name="descriptionProduct" id="descriptionProduct" value="${requestScope["product"].getDescriptionProduct()}">
                </td>
            </tr>
            <tr>
                <td>Producer:</td>
                <td><input type="text" name="producer" id="producer" value="${requestScope["product"].getProducer()}">
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
