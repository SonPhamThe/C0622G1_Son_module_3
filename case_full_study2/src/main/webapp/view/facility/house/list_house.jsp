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
    <title>List the Villa</title>
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css"/>
</head>
<body>
<center>
    <h1>List the Villa</h1>
    <div>
        <form action="/houses" method="get">
            <input type="hidden" name="action" value="search">
            <input type="text" name="country">
            <input type="submit" value="Search">
        </form>
    </div>
</center>
<div align="center">
    <table id="tableStudent" class="table table-striped table-bordered" style="width:100%" border="1">
        <thead>
        <tr>
            <th style="text-align: center">Name</th>
            <th style="text-align: center">AREA</th>
            <th style="text-align: center">COST</th>
            <th style="text-align: center">MAX PEOPLE</th>
            <th style="text-align: center">RENT TYPE</th>
            <th style="text-align: center">STANDARD ROOM</th>
            <th style="text-align: center">Description Other Convenience</th>
            <th style="text-align: center">Number Of Floors</th>
<%--            <th style="text-align: center">ACTION</th>--%>
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
<%--                <td>--%>
<%--                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"--%>
<%--                            data-bs-target="#exampleModal${house.name}">--%>
<%--                        Xoá--%>
<%--                    </button>--%>

<%--                    <!-- Modal -->--%>
<%--                    <div class="modal fade" id="exampleModal${house.name}" tabindex="-1"--%>
<%--                         aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--                        <div class="modal-dialog">--%>
<%--                            <div class="modal-content">--%>
<%--                                <div class="modal-header">--%>
<%--                                    <h5 class="modal-title" id="exampleModalLabel" style="color: #000">Xoá User</h5>--%>
<%--                                    <button type="button" class="btn-close" data-bs-dismiss="modal"--%>
<%--                                            aria-label="Close"></button>--%>
<%--                                </div>--%>
<%--                                <div class="modal-body" style="color: #000">--%>
<%--                                    Bạn có muốn xoá user có name là <strong class="text-danger">${house.name}</strong>--%>
<%--                                    không ?--%>
<%--                                </div>--%>
<%--                                <div class="modal-footer">--%>
<%--                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close--%>
<%--                                    </button>--%>
<%--                                    <a href="/users?action=delete&id=${house.name}" class="btn btn-secondary">Delete</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </td>--%>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<section class="footer d-flex justify-content-center mt-5">
    <div class="wrapper container">
        <div class="row h-100">
            <div class="col-6 mt-auto mb-5">
                <p class="fs-5 text-uppercase text-dark fw-bold">Our Brands</p>
                <div class="d-flex mt-4">
                    <img class="footer__brand-logo" src="./images/xclusive.png" alt="">
                    <img class="footer__brand-logo" src="./images/fx.png" alt="">
                </div>
            </div>
            <div class="col-6">
                <h3 class="fs-2 text-uppercase text-dark fw-bold mb-4"> Furama</h3>
                <div class="row">
                    <div class="col-3">
                        <div class="d-flex flex-column gap-2">
                            <a href="#" class="text-dark fs-5">Our hotel</a>
                            <a href="#" class="text-dark fs-5">Promotions</a>
                            <a href="#" class="text-dark fs-5">Meetings</a>
                            <a href="#" class="text-dark fs-5">Brand story</a>
                            <a href="#" class="text-dark fs-5">Media center</a>
                            <a href="#" class="text-dark fs-5">Corporate info</a>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="d-flex flex-column gap-2">
                            <a href="#" class="text-dark fs-5">Lifestyle blog</a>
                            <a href="#" class="text-dark fs-5">Careers</a>
                            <a href="#" class="text-dark fs-5">Contact us</a>
                            <a href="#" class="text-dark fs-5">Notices</a>
                            <a href="#" class="text-dark fs-5">EGifts</a>
                            <a href="#" class="text-dark fs-5">Expore south-east asia </a>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="d-flex flex-column gap-2">
                            <a href="#" class="text-dark fs-5">Travel agents</a>
                            <a href="#" class="text-dark fs-5">Sitemap</a>
                            <a href="#" class="text-dark fs-5">Terms & Conditions</a>
                            <a href="#" class="text-dark fs-5">Privacy policy</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
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
