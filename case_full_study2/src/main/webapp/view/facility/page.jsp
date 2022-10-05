<%--
  Created by IntelliJ IDEA.
  User: mesohuy999
  Date: 03/10/2022
  Time: 01:11
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Page Home</title>
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
                    <img src="./images/map.svg" alt="" class="me-5"/>
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
                <a href="#">Home</a>
                <ul class="sub__list d-flex flex-column bg-light shadow">
                    <li><a href="#">Villa</a></li>
                    <li><a href="#">House</a></li>
                    <li><a href="#">Room</a></li>
                </ul>
            </li>
            <li class="list__item d-flex justify-content-center align-items-center">
                <a href="#">Employee</a>

            </li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="#">Customer</a></li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="/facilities?action=page">Service</a>
            </li>
            <li class="list__item d-flex justify-content-center align-items-center"><a href="#">Contract</a></li>
        </ul>
    </div>
</section>
<section class="main">
    <!-- Carousel -->
    <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="./images/carouse1.jpg" class="d-block" alt="...">
            </div>
            <div class="carousel-item">
                <img src="./images/carouse2.jpg" class="d-block" alt="...">
            </div>
            <div class="carousel-item">
                <img src="./images/carouse3.jpg" class="d-block" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
        <p class="fs-3 main__title">
            KHU NGHỈ DƯỠNG ẨM THỰC
            TỌA LẠC TẠI BÃI BIỂN ĐÀ NẴNG
            MỘT TRONG 6 BÃI BIỂN ĐẸP NHẤT THẾ GIỚI
        </p>
        <div class="booking-form">
        </div>
    </div>
    <!-- About -->
    <div class="main-about d-flex flex-row justify-content-center">
        <div class="wrapper d-flex">
            <div class="main-about__image">
                <img src="./images/about-hotel-img.jpeg" alt="" class="main-about__image img-fluid">
                <div class="img-label">FURAMA RIVERFRONT, SINGAPORE</div>
            </div>
            <div class="main-about__text">
                <h2 class="main-about__title">FURAMA INTERNATIONAL</h2>
                <p class="main-about__desc">Furama hotels offer leisure and business travellers alike a well-appointed
                    backdrop to indulge in restful play and invigorating work. Be pampered by our warm service from the
                    heart as you immerse yourself in unique cultures and insightful experiences on your journey.</p>
                <h3 class="main-about__label">VIEW HOTELS BY</h3>
                <div class="main-about__buttons d-flex">
                    <button class="btn btn-primary px-4 fs-5 text-uppercase rounded-0 flex-fill">Brands</button>
                    <button class="btn btn-outline-primary px-4 fs-5 text-uppercase rounded-0 flex-fill">Destinations
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- Festival -->
    <div class="festival">
        <div class="festival-container">
            <p class="fs-2 text-center text-uppercase fw-bold text-light">NEED PREFERENTIAL TREATMENT?
                JOIN THE CLUB.</p>
            <p class="fs-3 mt-4 text-uppercase text-bold text-light text-center">Enjoy an exclusive suite of benefits,
                deals & privileges as a FURAMAfirst member.
                Perks are valid across any Furama hotels in Singapore, Malaysia, Thailand & Bali. #FreeMembership</p>
            <div class="d-flex w-100 gap-5">
                <button class="btn btn-primary px-4 fs-5 text-uppercase rounded-0 flex-fill">Sign me up</button>
                <button class="btn btn-outline-primary px-4 fs-5 text-uppercase rounded-0 flex-fill">Log in</button>
            </div>
        </div>
    </div>
    <!-- Explore -->
    <div class="explore d-flex justify-content-center">
        <div class="wrapper d-flex flex-column align-items-center">
            <h3 class="fs-1 fw-bold text-dark my-5">
                #EXPLOREFURAMA DESTINATIONS
            </h3>
            <div class="container">
                <div class="row gy-5 gx-5">
                    <div class="col-6 position-relative">
                        <div class="explore__text">
                            <p class="fs-3 text-light text-uppercase fw-bold text-center">Explore</p>
                            <p class="fs-1 text-light text-uppercase fw-bold text-center">Singapore ></p>
                        </div>
                        <img class="img-fluid" src="./images/ex-singapore.jpeg" alt="">
                    </div>
                    <div class="col-6 position-relative">
                        <div class="explore__text">
                            <p class="fs-3 text-light text-uppercase fw-bold text-center">Explore</p>
                            <p class="fs-1 text-light text-uppercase fw-bold text-center">Singapore ></p>
                        </div>
                        <img class="img-fluid" src="./images/ex-kuala.jpeg" alt="">
                    </div>
                    <div class="col-6 position-relative">
                        <div class="explore__text">
                            <p class="fs-3 text-light text-uppercase fw-bold text-center">Explore</p>
                            <p class="fs-1 text-light text-uppercase fw-bold text-center">Singapore ></p>
                        </div>
                        <img class="img-fluid" src="./images/ex-bangkok.jpeg" alt="">
                    </div>
                    <div class="col-6 position-relative">
                        <div class="explore__text">
                            <p class="fs-3 text-light text-uppercase fw-bold text-center">Explore</p>
                            <p class="fs-1 text-light text-uppercase fw-bold text-center">Singapore ></p>
                        </div>
                        <img class="img-fluid" src="./images/ex-pattaya.jpeg" alt="">
                    </div>
                    <div class="col-6 position-relative">
                        <div class="explore__text">
                            <p class="fs-3 text-light text-uppercase fw-bold text-center">Explore</p>
                            <p class="fs-1 text-light text-uppercase fw-bold text-center">Singapore ></p>
                        </div>
                        <img class="img-fluid" src="./images/ex-changmai.jpeg" alt="">
                    </div>
                    <div class="col-6 position-relative">
                        <div class="explore__text">
                            <p class="fs-3 text-light text-uppercase fw-bold text-center">Explore</p>
                            <p class="fs-1 text-light text-uppercase fw-bold text-center">Singapore ></p>
                        </div>
                        <img class="img-fluid" src="./images/ex-hin.jpeg" alt="">
                    </div>
                    <div class="col-6 position-relative">
                        <div class="explore__text">
                            <p class="fs-3 text-light text-uppercase fw-bold text-center">Explore</p>
                            <p class="fs-1 text-light text-uppercase fw-bold text-center">Singapore ></p>
                        </div>
                        <img class="img-fluid" src="./images/ex-bali.jpeg" alt="">
                    </div>
                    <div class="col-6 position-relative">
                        <div class="explore__text">
                            <p class="fs-3 text-light text-uppercase fw-bold text-center">Explore</p>
                            <p class="fs-1 text-light text-uppercase fw-bold text-center">Singapore ></p>
                        </div>
                        <img class="img-fluid" src="./images/ex-taiwan.jpeg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
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
<script type="text/javascript">
    window.addEventListener("scroll", () => {
        const navbar = document.querySelector("#navbar");
        navbar.classList.toggle("sticky-top", window.scrollY > 124);
    })
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous">
</script>
</body>
</html>
