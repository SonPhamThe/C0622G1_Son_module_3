<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 30/09/2022
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
</head>
<body>
<h1>Trang danh sách sản phẩm</h1>

<c:if test="${mess != null}">
    <span>${mess}</span>
</c:if>

<a href="/product?action=add">Thêm mới</a>

<table class="table table-dark">
    <tr>
        <td>STT</td>
        <td>ID</td>
        <td>Name Product</td>
        <td>Price</td>
        <td>Description Product</td>
        <td>Producer</td>
    </tr>
    <c:forEach var="product" items="${productService}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.id}</td>
            <td>${product.nameProduct}</td>
            <td>${product.price}</td>
            <td>${product.descriptionProduct}</td>
            <td>${product.producer}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
