<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 29/09/2022
  Time: 09:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Display customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        h1 {
            text-align: center;
        }
        img {
        position: center;
        }
    </style>
</head>
<body>
<h1 style="text-align: center">Danh sách khách hàng</h1>
<form action="" method="post">
    <table class="table table-dark table-striped">
        <tr>
            <th>
                Tên
            </th>
            <th>
                Ngày sinh
            </th>
            <th>
                Địa chỉ
            </th>
            <th>
                Ảnh
            </th>
        </tr>
        <c:forEach var="customers" items="${customerList}" varStatus="status">
            <tr>
                <td>${customers.getNameCustomers()}</td>
                <td>${customers.getDayOfBirth()}</td>
                <td>${customers.getAddress()}</td>
                <td><img src="${customers.getImageOfCustomers()}" alt="image"></td>
            </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>
