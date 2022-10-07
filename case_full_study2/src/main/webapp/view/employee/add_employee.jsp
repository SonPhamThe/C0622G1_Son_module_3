<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 05/10/2022
  Time: 00:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>The FURAMA Resort</title>
    <link rel="stylesheet" href="../../bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css"/>
    <link rel="stylesheet" href="../bootstrap-5.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js">
</head>
<body>
<div style="text-align: center;">
    <h1>Form ADD Employee</h1>
</div>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <tr>
                <th>Name Employee:</th>
                <td>
                    <input type="text" name="name" id="name" size="45" value='${employee.name}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageNameError!=null}">
                            ${messageNameError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <%--int id, String name, String date_of_birth, String id_card, Double salary, String phone_number, String email,
            String address, int education_degree_id, int position_id, int division_id, String username--%>
            <tr>
                <th>Day of Birth Employee:</th>
                <td>
                    <input type="text" name="date_of_birth" id="date_of_birth" size="45"
                           value='${employee.date_of_birth}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageEmailError!=null}">
                            ${messageEmailError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>ID Card Employee:</th>
                <td>
                    <input type="text" name="id_card" id="id_card" size="45" value='${employee.id_card}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageCountryError!=null}">
                            ${messageCountryError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Salary :</th>
                <td>
                    <input type="text" name="salary" id="salary" size="45" value='${employee.salary}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageCountryError!=null}">
                            ${messageCountryError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Phone Number:</th>
                <td>
                    <input type="text" name="phone_number" id="phone_number" size="45"
                           value='${employee.phone_number}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageCountryError!=null}">
                            ${messageCountryError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Email Employee:</th>
                <td>
                    <input type="text" name="email" id="email" size="45"
                           value='${employee.email}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageCountryError!=null}">
                            ${messageCountryError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Address Employee:</th>
                <td>
                    <input type="text" name="address" id="address" size="45"
                           value='${employee.address}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageCountryError!=null}">
                            ${messageCountryError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Education Degree ID:</th>
                <td>
                    <input type="text" name="education_degree_id" id="education_degree_id" size="45"
                           value='${employee.education_degree_id}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageCountryError!=null}">
                            ${messageCountryError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Position ID:</th>
                <td>
                    <input type="text" name="position_id" id="position_id" size="45"
                           value='${employee.position_id}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageCountryError!=null}">
                            ${messageCountryError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Division ID:</th>
                <td>
                    <input type="text" name="division_id" id="division_id" size="45"
                           value='${employee.division_id}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageCountryError!=null}">
                            ${messageCountryError}
                        </c:if>
                    </p>
                </td>
            </tr>
            <tr>
                <th>Username:</th>
                <td>
                    <input type="text" name="username" id="username" size="45"
                           value='${employee.username}'/>
                    <p style="text-align: left;color: red">
                        <c:if test="${messageCountryError!=null}">
                            ${messageCountryError}
                        </c:if>
                    </p>
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
<c:if test="${mess!=null}">
    <div aria-live="polite" aria-atomic="true" class="position-relative">
        <div class="toast fade show" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <svg class="bd-placeholder-img rounded me-2" width="20" height="20"
                     xmlns="http://www.w3.org/2000/svg"
                     aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                    <rect width="100%" height="100%" fill="#007aff"></rect>
                </svg>
                <strong class="me-auto"><span style="vertical-align: inherit;"><span
                        style="vertical-align: inherit;">Create Product</span></span></strong>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Đóng"></button>
            </div>
            <div class="toast-body"><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">
               <strong> ${mess}</strong> </span></span></div>
        </div>
    </div>
</c:if>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
</body>
</html>