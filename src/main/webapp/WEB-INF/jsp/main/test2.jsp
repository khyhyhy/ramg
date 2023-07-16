<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="../../../css/ramg.css" rel="stylesheet">
    <style>
        @font-face {
            font-family: 'GoryeongStrawberry';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/GoryeongStrawberry.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        .header{
            font-size:30px !important; 
            margin: 20px !important;
        }

        /* 헤더 스타일 수정 */
        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 100;
        }

        /* 푸터 스타일 수정 */
        footer {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            z-index: 100;
        }

        /* 페이지의 내용에 여백 추가 */
        body {
            padding-top: 100px; /* 헤더의 높이에 맞게 조정해주세요 */
            padding-bottom: 50px; /* 푸터의 높이에 맞게 조정해주세요 */
        }
    </style>
</head>
<script
    src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
<body>
    <!--////////// Header Start ////////////-->
    <div class="container-fluid bg-info">
        <header style="margin-bottom: 0.0rem!important;"
            class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
            <a href="/main/" class="d-flex align-items-center mb-3 mb-md-0 me-md-20 text-dark text-decoration-none">
                <svg class="bi me-2" width="50" height="35"><img src="/images/ramgi_logo.png" /></svg>
                <span class="fs-4 text-white" style="font-size: xx-large !important; font-family: 'GoryeongStrawberry'; ">람쥐썬더 전기차 충전소</span>
            </a>
            <div class="dropdown">
                <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                    <li>
                        <a href="/fmap2/"
                            class="header nav-link px-2 link-secondary text-white">충전소 찾기</a>
                    </li>
                    <c:if test="${sessionScope.mvo.m_class eq 0 || sessionScope.mvo.m_class eq null}">
                        <li>
                            <a href="#" 
                                class="header nav-link px-2 link-secondary text-white" data-bs-toggle="dropdown">충전
                                서비스</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/infoma/">서비스 소개</a></li>
                                <li><a class="dropdown-item" href="/taksong/">탁송 서비스</a></li>
                                <li><a class="dropdown-item" href="/edongsik/">이동식 충전 서비스</a></li>
                                <li><a class="dropdown-item" href="/support/review">리뷰</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <li>
                        <a href="#"
                            class="header nav-link px-2 link-secondary text-white" data-bs-toggle="dropdown">고객센터</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/support/notice">공지사항</a></li>
                            <li><a class="dropdown-item" href="/support/faq">자주하는 질문</a></li>
                            <li><a class="dropdown-item" href="/support/qna">문의 게시판</a></li>
                        </ul>
                    </li>
                    <c:if test="${sessionScope.mvo != null}">
                    <li>
                        <a href="#"
                            class="header nav-link px-2 link-secondary text-white" data-bs-toggle="dropdown">마이
                            페이지</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/mypage">정보 관리</a></li>
                            <li><a class="dropdown-item" href="/car_list">차량 관리</a></li>
                            <li><a class="dropdown-item" href="/my_question">나의 문의</a></li>
                            <c:if test="${sessionScope.mvo.m_class eq 1}">
                                <li><a class="dropdown-item" href="/mypage/serviceadd/">서비스 등록</a></li>
                                <li><a class="dropdown-item" href="/mypage/service/">고객 서비스 신청 현황</a></li>
                                <li><a class="dropdown-item" href="/my_review">이용자의 리뷰</a></li>
                            </c:if>
                            <c:if test="${sessionScope.mvo.m_class eq 0}">
                                <li><a class="dropdown-item" href="/e_orderList/">서비스 이용내역</a></li>
                            </c:if>
                        </ul>
                    </li>
                    </c:if>
                </ul>
            </div>
            <c:if test="${sessionScope.mvo eq null}">
                <div class="col-md-3 text-end">
                    <button id="loginButton" type="button"
                        class="btn btn-primary bg-gradient"><a href="/login"
                            style="color: white !important; text-decoration: none !important;">Login</a></button>
                </div>
            </c:if>
            <c:if test="${sessionScope.mvo ne null}">
                <div class="col-md-3 text-end">
                    ${sessionScope.mvo.m_name}님 환영합니다.<br>
                    <button id="logoutButton" type="button"
                        class="btn"><a href="/logout"
                            style="color: white !important; text-decoration: none !important;">로그아웃</a></button>
                </div>
            </c:if>

        </header>
    </div>
    <!--////////// Header end ////////////-->

    <!-- 페이지의 내용 -->
    <!-- 여기에 원하는 내용을 추가하시면 됩니다 -->

    <!--////////// Footer start //////////////-->
    <div class="container-fluid text-bg-info">
        <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 border-top">
            <p class="col-md-4 mb-0 text-white" style="font-family: 'GoryeongStrawberry';" >© 2023 RAM쥐Company, 그의 천둥을 조심해!</p>
        
            <a href="/main/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
                <svg class="bi me-2" width="50" height="35"><img src="/images/ramgi_logo.png"/></svg>
            </a>
        </footer>
    </div>
    <!--////////// Footer end //////////////-->

</body>
</html>