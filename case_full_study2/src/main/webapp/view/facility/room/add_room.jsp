<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 05/10/2022
  Time: 01:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>ADD THE ROOM</title>
</head>
<div style="text-align: center;">
    <h1>Form add the room</h1>
</div>
<body>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Add New Room</h2>
            </caption>
            <tr>
                <th>Room Name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Area Room:</th>
                <td>
                    <input type="text" name="area" id="area" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Cost Room:</th>
                <td>
                    <input type="text" name="cost" id="cost" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Max People:</th>
                <td>
                    <input type="text" name="max_people" id="max_people" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Rent type:</th>
                <td>
                    <input type="text" name="rent_type" id="rent_type" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Facility free:</th>
                <td>
                    <input type="text" name="facility_free" id="facility_free" size="45"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
