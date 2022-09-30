<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 30/09/2022
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add</title>
</head>
<body>
<h1>Trang thêm mới</h1>

<a href="/product">Quay lại trang chủ</a>

<c:if test="${menu != null}">
    <span>${mess}</span>
</c:if>

<form action="/product?action=add" method="post">
    <pre>ID of the product: <input type="text" name="id"></pre>
    <pre>Name Product: <input type="text" name="nameProduct"></pre>
    <pre>Price: <input type="text" name="price"></pre>
    <pre>Description Product: <input type="text" name="description"></pre>
    <pre>Producer: <input type="text" name="producer"></pre>
    <pre><button>Save</button></pre>
</form>
</body>
</html>
