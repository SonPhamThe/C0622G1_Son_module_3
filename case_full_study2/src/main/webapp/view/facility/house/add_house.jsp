<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 05/10/2022
  Time: 01:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>ADD THE HOUSE</title>
</head>
<div style="text-align: center;">
    <h1>Form add the house</h1>
</div>
<body>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Add New House</h2>
            </caption>
            <tr>
                <th>House Name:</th>
                <td>
                    <input type="text" name="name" id="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Area House:</th>
                <td>
                    <input type="text" name="area" id="area" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Cost House:</th>
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
                <th>Standard room:</th>
                <td>
                    <input type="text" name="standard_room" id="standard_room" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Description Other Convenience:</th>
                <td>
                    <input type="text" name="description_other_convenience" id="description_other_convenience"
                           size="45"/>
                </td>
            </tr>
            <tr>
                <th>Number Of Floors:</th>
                <td>
                    <input type="text" name="number_of_floors" id="number_of_floors" size="45"/>
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
