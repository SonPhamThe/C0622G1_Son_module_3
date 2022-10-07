<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 06/10/2022
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List the Employee</title>
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css"/>
</head>
<body>
<div style="text-align: center;">
    <h1>List the Employee</h1>
    <div>
        <form class="d-flex m-0 p-0 align-items-center justify-content-end" style="flex: 1" action="/employees?action=findEmployee" method="post">
            <input type="search" placeholder="Tìm theo tên" aria-label="Search" name="name">
            <span class="mx-3">Giá</span>
            <input type="number" aria-label="Search" name="cost" value="100000000">
            <select name="serviceType" class="mx-3">
                <option value="0">Tất cả dịch vụ</option>
                <option value="1">Villa</option>
                <option value="2">House</option>
                <option value="3">Room</option>
            </select>
            <input type="submit" value="Tìm kiếm" class="btn btn-outline-success">
        </form>
    </div>
</div>
<div align="center">
    <table id="tableEmployee" class="table table-striped table-bordered" style="width:100%" border="1">
        <thead>
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>DATE OF BIRTH</th>
            <th>ID CARD</th>
            <th>SALARY</th>
            <th>PHONE NUMBER</th>
            <th>EMAIL</th>
            <th>ADDRESS</th>
            <th>EDUCATION DEGREE ID</th>
            <th>POSITION ID</th>
            <th>DIVISION ID</th>
            <th>USERNAME</th>
            <th>Action</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody class="tbody">
        <c:forEach var="employee" items="${listEmployee}">
            <tr>
                <td style="text-align: center"><c:out value="${employee.id}"/></td>
                <td style="text-align: center"><c:out value="${employee.name}"/></td>
                <td style="text-align: center"><c:out value="${employee.date_of_birth}"/></td>
                <td style="text-align: center"><c:out value="${employee.id_card}"/></td>
                <td style="text-align: center"><c:out value="${employee.salary}"/></td>
                <td style="text-align: center"><c:out value="${employee.phone_number}"/></td>
                <td style="text-align: center"><c:out value="${employee.email}"/></td>
                <td style="text-align: center"><c:out value="${employee.address}"/></td>
                <td style="text-align: center"><c:out value="${employee.education_degree_id}"/></td>
                <td style="text-align: center"><c:out value="${employee.position_id}"/></td>
                <td style="text-align: center"><c:out value="${employee.division_id}"/></td>
                <td style="text-align: center"><c:out value="${employee.username}"/></td>
                <td>
                        <%--                    <!-- Button trigger modal EDIT -->--%>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#exampleModal1${employee.id}">
                        Chỉnh Sửa
                    </button>

                        <%--                    <!-- Modal -->--%>
                    <div class="modal fade" id="exampleModal1${employee.id}" tabindex="-1"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel1" style="color: #000">Thay đổi thông
                                        tin</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body" style="color: #000">
                                    Bạn có muốn thay đổi thông tin <strong class="text-danger">${employee.name}</strong>
                                    không ?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                    </button>
                                    <a href="/employees?action=editEmployee&id=${employee.id}" class="btn btn-secondary">Thay Đổi</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>

                <td>
                    <!-- Button trigger modal DELETE -->
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#sp${employee.id}">
                        Delete
                    </button>
                    <!-- Modal -->
                    <div class="modal fade " id="sp${employee.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog ">
                            <div class="modal-content bg-dark">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                     <strong class="text-danger">ARE YOU SURE DELETE ${employee.name} ?</strong>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <a href="/employees?action=deleteEmployee&id=${employee.id}" class="btn btn-danger">Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableEmployee').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>
