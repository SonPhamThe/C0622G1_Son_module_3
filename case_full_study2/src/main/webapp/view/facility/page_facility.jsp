<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 03/10/2022
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Page Facility</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Furama - Home</title>
    <link rel="stylesheet" href="../../file_css/reset.css">
    <link rel="stylesheet" href="../../file_css/index.css">
</head>
<body class="d-flex flex-column">
<section class="header d-flex justify-content-center">
    <div class="wrapper d-flex justify-content-between align-items-center">
        <img class="header__logo" src="./images/logo.png"/>
        <div class="header__contact d-flex">
            <div class="address flex-fill">
                <div class="d-flex">
                    <img src="" alt="" class="me-5"/>
                    <div class="d-flex flex-column">
                        <p class="mb-3">103 – 105 Đường Võ Nguyên Giáp, Phường Khuê Mỹ, Quận Ngũ hành Sơn, Tp. Đà Nẵng,
                            Việt Nam</p>
                        <p class="fs-4"><span class="fs-4">7.0 km</span> từ Sân bay Quốc tế Đà Nẵng</p>
                    </div>
                </div>
            </div>
            <div class="phone-email flex-fill">
                <div class="d-flex align-items-center mb-3">
                    <img src="./images/telephone.svg" class="me-4" alt="">
                    <span class="fs-4 text-dark">84-236-3847 333/888</span>
                </div>
                <div class="d-flex align-items-center">
                    <img src="./images/envelope.svg" class="me-4" alt="">
                    <span class="fs-4 text-dark">reservation@furamavietnam.com</span>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="navbar d-flex justify-content-center" id="navbar">
    <div class="wrapper h-100 d-flex ">
        <ul class="list d-flex text-bg-light">
            <li class="list__item d-flex justify-content-center align-items-center">
                <a href="#">List the facility</a>
                <ul class="sub__list d-flex flex-column bg-light shadow">
                    <li><a href="#">Villa</a></li>
                    <li><a href="#">House</a></li>
                    <li><a href="#">Room</a></li>
                </ul>
            </li>
            <li class="list__item d-flex justify-content-center align-items-center">
                <a href="#">Add new facility</a>

            </li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="#">Edit the facilityr</a></li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="#">Delete the facility</a></li>
        </ul>
    </div>
</section>
</body>
</html>
