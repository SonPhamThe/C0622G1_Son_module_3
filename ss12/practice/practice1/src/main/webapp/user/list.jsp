<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 03/10/2022
  Time: 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<div style="text-align: center;">
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
        <form action="/users?action=search" method="post">
            <input type="text" name="country">
            <input type="submit" value="Search by name">
        </form>
    </h2>
</div>
<div style="align-content: center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <button><a href="/users?action=edit&id=${user.id}">Edit</a></button>
                    <button><a href="/users?action=delete&id=${user.id}">Delete</a></button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
