<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 05/10/2022
  Time: 01:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List the room of FURAMA RESORT</title>
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css"/>
</head>
<body>
<div style="text-align: center;">
    <h1>List the Room</h1>
</div>
<div align="center">
    <table id="tableStudent" class="table table-striped table-bordered" style="width:100%">
        <thead>
<%--        String name, double area, double cost, int max_people, Date rent_type, String facility_free--%>
        <tr>
            <th>Name</th>
            <th>AREA</th>
            <th>COST</th>
            <th>MAX PEOPLE</th>
            <th>RENT TYPE</th>
            <th>FACILITY FREE</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="room" items="${listRoom}">
            <tr>
                <td><c:out value="${room.name}"/></td>
                <td><c:out value="${room.area}"/></td>
                <td><c:out value="${room.cost}"/></td>
                <td><c:out value="${room.max_people}"/></td>
                <td><c:out value="${room.rent_type}"/></td>
                <td><c:out value="${room.facility_free}"/></td>
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
