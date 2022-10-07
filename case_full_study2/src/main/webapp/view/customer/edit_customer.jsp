<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 05/10/2022
  Time: 00:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>The Furama Resort</title>
</head>
<body>
<center>
    <h2>Edit Customer</h2>
    <form method="post">
        <table border="1px">
            <input type="hidden" name="id" value="${editCustomer.id}">
            <tr>
                <td>
                    <pre>Customer Type ID:</pre>
                </td>
                <td>
                    <select name="customer_type_id">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <pre>Name:</pre>
                </td>
                <td><input type="text" name="name" value="${editCustomer.name}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Birthday:</pre>
                </td>
                <td><input type="date" name="date_of_birth" value="${editCustomer.date_of_birth}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Gender:  </pre>
                </td>
                <td><input type="text" name="salary" value="${editCustomer.gender}"></td>
            </tr>
            <tr>
                <td>
                    <pre>ID Card:  </pre>
                </td>
                <td><input type="text" name="id_card" value="${editCustomer.id_card}"></td>
            </tr>
            </tr>
            <tr>
                <td>
                    <pre>Phone Number:</pre>
                </td>
                <td><input type="text" name="phone_number" value="${editCustomer.phone_number}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Email:</pre>
                </td>
                <td><input type="text" name="email" value="${editCustomer.email}"></td>
            </tr>
            <tr>
                <td>
                    <pre>Address:</pre>
                </td>
                <td><input type="text" name="address" value="${editCustomer.address}"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save"/></td>
            </tr>
        </table>
    </form>
    <a href="/customers?action=listCustomer">
        <button type="button">Back List Customer</button>
    </a>
</center>
</body>
</html>
