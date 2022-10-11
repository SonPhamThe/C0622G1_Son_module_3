<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 07/10/2022
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>The House Hold</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <style>
        #logo {
            margin: 30px 0 20px 300px;
            float: left;
        }

        #login-name {
            margin-top: 30px;
            margin-right: 300px;
            float: right;
        }

        .navbar {
            background-color: #126c66;
            padding-left: 320px;
        }

        footer, li .nav-item .footer, a.footer {
            background-color: #046056;
            text-decoration: none;
            font-size: medium;
            color: #bee3d9;
            padding-right: 20px;
            margin-left: 10px;
        }

        footer {
            margin: 30px 0 0 0;
            padding: 50px 0 0 50px;
        }

        p.footer {
            background-color: #046056;
            font-size: medium;
            padding: 0;
            color: #bee3d9;
            margin-left: 50px;
        }

        .main {
            padding-left: 30px;
            padding-right: 30px;
        }

        h1 {
            text-align: center;
        }

        form {
            background-color: #bee3d9;
        }

        /*    button {
                background-color: #046056 !important;
            }*/
        button:hover {
            background-color: #046056 !important;
            color: white !important;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container-fluid px-0">
    <div class="row">
        <div class="col-12">
            <a href="/houses"><img id="logo" src="../images/logo_codegym.png" height="150px"
                                   width="100px"/>Back List House Hold</a>
        </div>
    </div>
    <div class="row">
        <h1>
            Form Edit House Hold
        </h1>
    </div>
    <div class="row">
        <div class="main">
            <div class="d-flex justify-content-center">
                <form class="w-50 border border-2 border-success p-3  rounded" method="post">
                    <div class="form-group">
                        <label>ID:</label>
                        <div class="input-group">
                            <input type="hidden" name="id" value="${editHouseHold.id}">
                            <input type="text" name="id" value="${editHouseHold.id}" disabled>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Name:</label>
                        <div class="input-group">
                            <input type="text" name="name" value="${editHouseHold.name}">
                            <c:if test="${map.get('name')!=null}">
                                <pre><span style="color:red;">${map.get('name')}</span></pre>
                            </c:if>
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label>Start Date:</label>
                        <input type="date" name="startDate" value="${editHouseHold.startDate}">
                        <c:if test="${map.get('startDate')!=null}">
                            <pre><span style="color:red;">${map.get('startDate')}</span></pre>
                        </c:if>
                    </div>

                    <div class="mt-3 form-group">
                        <label>Address:</label>
                        <div class="input-group">
                            <input type="text" name="address" value="${editHouseHold.address}">
                            <c:if test="${map.get('address')!=null}">
                                <pre><span style="color:red;">${map.get('address')}</span></pre>
                            </c:if>
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label>Số lượng thành viên:</label>
                        <div class="input-group">
                            <input type="hidden" name="so_luong_thanh_vien"
                                   value="${editHouseHold.so_luong_thanh_vien}">
                            <input type="text" name="so_luong_thanh_vien" value="${editHouseHold.so_luong_thanh_vien}"
                                   disabled>
                            <c:if test="${map.get('so_luong_thanh_vien')!=null}">
                                <pre><span style="color:red;">${map.get('so_luong_thanh_vien')}</span></pre>
                            </c:if>
                        </div>
                    </div>

                    <%--                    <div class="mt-3 form-group">--%>
                    <%--                        <label>Phone number:</label>--%>
                    <%--                        <div class="input-group">--%>
                    <%--                            <input type="text" name="phoneNumber" value="${editEmployee.phoneNumber}">--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>

                    <%--                    <div class="mt-3 form-group">--%>
                    <%--                        <label>Email:</label>--%>
                    <%--                        <div class="input-group">--%>
                    <%--                            <input type="text" name="email" value="${editEmployee.email}">--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>

                    <%--                    <div class="mt-3 form-group">--%>
                    <%--                        <label>Address:</label>--%>
                    <%--                        <div class="input-group">--%>
                    <%--                            <input type="text" name="address" value="${editEmployee.address}">--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>

                    <%--                    <div class="mt-3 form-group">--%>
                    <%--                        <label>Education degree:</label>--%>
                    <%--                        <div class="input-group">--%>
                    <%--                            <select name="educationDegreeId">--%>
                    <%--                                <option value="1" ${employee.educationDegreeId == 1? "selected":""}>Trung Cấp</option>--%>
                    <%--                                <option value="2" ${employee.educationDegreeId == 2? "selected":""}>Cao Đẳng</option>--%>
                    <%--                                <option value="3" ${employee.educationDegreeId == 3? "selected":""}>Đại Học</option>--%>
                    <%--                                <option value="4" ${employee.educationDegreeId == 4? "selected":""}>Sau Đại Học</option>--%>
                    <%--                            </select>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>

                    <%--                    <div class="mt-3 form-group">--%>
                    <%--                        <label>Position:</label>--%>
                    <%--                        <div class="input-group">--%>
                    <%--                            <select name="positionId">--%>
                    <%--                                <option value="1" ${employee.positionId == 1? "selected":""}>Lễ Tân</option>--%>
                    <%--                                <option value="2" ${employee.positionId == 2? "selected":""}>Phục Vụ</option>--%>
                    <%--                                <option value="3" ${employee.positionId == 3? "selected":""}>Chuyên Viên</option>--%>
                    <%--                                <option value="4" ${employee.positionId == 4? "selected":""}>Giám sát</option>--%>
                    <%--                                <option value="5" ${employee.positionId == 5? "selected":""}>Quản lí</option>--%>
                    <%--                                <option value="6" ${employee.positionId == 6? "selected":""}>Giám Đốc</option>--%>
                    <%--                            </select>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>

                    <%--                    <div class="mt-3 form-group">--%>
                    <%--                        <label>Division:</label>--%>
                    <%--                        <div class="input-group">--%>
                    <%--                            <select name="division_id">--%>
                    <%--                                <option value="1" ${employee.divisionId == 1? "selected":""}>Sale-Marketing</option>--%>
                    <%--                                <option value="2" ${employee.divisionId == 2? "selected":""}>Hành chính</option>--%>
                    <%--                                <option value="3" ${employee.divisionId == 3? "selected":""}>Phục vụ</option>--%>
                    <%--                                <option value="4" ${employee.divisionId == 4? "selected":""}>Quản lý</option>--%>
                    <%--                            </select>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>

                    <%--            <tr>--%>
                    <%--                <td>--%>
                    <%--                    <pre>Username:</pre>--%>
                    <%--                </td>--%>
                    <%--                <td><input type="text" name="username" value="${editEmployee.username}"></td>--%>
                    <%--            </tr>--%>
                    <div class="mt-3 text-center">
                        <button type="submit" class="btn btn-sm border border-light  text-dark">
                            -- Save --
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
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
            <div class="toast-body"><span style="vertical-align: inherit;"><span
                    style="vertical-align: inherit;">
               <strong> ${mess}</strong> </span></span></div>
        </div>
    </div>
</c:if>
</body>
</html>