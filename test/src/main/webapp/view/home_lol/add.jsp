<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 07/10/2022
  Time: 22:59
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
            margin: 0 20px 0 20px;
            padding: 0;
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

        button:hover {
            background-color: #046056 !important;
            color: white !important;
            font-weight: bold;
        }

        h4 {
            margin-left: 26%;
            color: red;
            margin-bottom: 20px;
        }
    </style>
</head>

<body class="container">
<div class="container-fluid px-0">
    <div class="row">
        <div class="col-12">

            <a href="/employees?action="><img id="logo" src="../images/logo.png" height="150px" width="100px"/></a>
            <h2 id="login-name">ToBi Gaming</h2>

        </div>
    </div>
    <div class="row">
        <h1>
            Form ADD HOME
        </h1>
    </div>
    <div class="row">
        <div class="main">
            <div class="d-flex justify-content-center">
                <form class="w-50 border border-2 border-success p-3  rounded" method="post">
                    <div class="form-group">
                        <label>Name Person:</label>
                        <div class="input-group"><input type="text" name="namePerson" id="namePerson" size="45"
                                                        value='${home.namePerson}'/></div>

                    </div>

                    <div class="mt-3 form-group">
                        <label>Number Phone:</label>
                        <input type="date" name="numberPhone" id="numberPhone" size="45"
                               value='${home.numberPhone}'/>
                    </div>
<%--                    //        int id, String numberPhone, String startDate, String namePaypal, String namePerson, String note--%>

                    <div class="mt-3 form-group">
                        <label>Start Date:</label>
                        <div class="input-group">
                            <input type="text" name="startDate" id="startDate" size="45" value='${home.startDate}'/>
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label>Name Paypal:</label>
                        <div class="input-group">
                            <input type="text" name="namePaypal" id="namePaypal" size="45" value='${home.namePaypal}'/>
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label>Note:</label>
                        <div class="input-group">
                            <input type="text" name="note" id="note" size="45"
                                   value='${home.note}'/>
                        </div>
                    </div>

                    <div class="mt-3 text-center">
                        <button type="submit" class="btn  btn-sm border border-light  text-dark">
                            -- Save --
                        </button>
                    </div>
                </form>
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