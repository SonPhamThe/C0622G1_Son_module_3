<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 05/10/2022
  Time: 01:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List the house of FURAMA RESORT</title>
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css"/>
</head>
<body>
<div style="text-align: center;">
    <h1>List the House</h1>
</div>
<div align="center">
    <table id="tableStudent" class="table table-striped table-bordered" style="width:100%">
        <thead>
        <tr>
            <th>Name</th>
            <th>AREA</th>
            <th>COST</th>
            <th>MAX PEOPLE</th>
            <th>RENT TYPE</th>
            <th>STANDARD ROOM</th>
            <th>Description Other Convenience</th>
            <th>Number Of Floors</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="house" items="${listHouse}">
            <tr>
                <td><c:out value="${house.name}"/></td>
                <td><c:out value="${house.area}"/></td>
                <td><c:out value="${house.cost}"/></td>
                <td><c:out value="${house.max_people}"/></td>
                <td><c:out value="${house.rent_type}"/></td>
                <td><c:out value="${house.standard_room}"/></td>
                <td><c:out value="${house.description_other_convenience}"/></td>
                <td><c:out value="${house.number_of_floors}"/></td>
                <td>
                    <a href="">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>
