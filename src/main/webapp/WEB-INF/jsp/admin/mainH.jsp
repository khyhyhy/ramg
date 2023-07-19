<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html>

  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Insert title here</title>
   <link href="../../../css/admin.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  </head>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  <body>
    <nav class="navbar bg-light fixed-top">
      <div class="container-fluid">
        <a class="navbar-brand" href="#"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
          <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasNavbarLabel">
            <c:if test="${sessionScope.amvo != null}">
              <b>${sessionScope.amvo.m_name}</b>님 환영합니다.<br>
              <a href="/admin/logout">로그아웃</a>
            </c:if>
            <c:if test="${sessionScope.amvo == null}">
              <a href="/admin/login">로그인</a>
            </c:if>
          </h5>
          <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
          <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="/admin/home" style="font-size: 30px;">홈</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="/admin/sales" style="font-size: 30px;">매출 관리</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="/admin/member" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 30px;">
                  회원 관리
                </a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="/admin/member" style="font-size: 30px;">전체</a></li>
                  <li><a class="dropdown-item" href="/admin/member?searchType=0&searchValue=&m_class=0" style="font-size: 30px;">일반 회원</a></li>
                  <li><a class="dropdown-item" href="/admin/member?searchType=0&searchValue=&m_class=1" style="font-size: 30px;">사업자 회원</a></li>
                  <li><a class="dropdown-item" href="/admin/member?searchType=0&searchValue=&m_class=2" style="font-size: 30px;">관리자</a></li>
                </ul>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="/admin/notice" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 30px;">
                  공지 관리
                </a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="/admin/notice" style="font-size: 30px;">전체</a></li>
                  <li><a class="dropdown-item" href="/admin/notice?searchType=0&searchValue=&category=0" style="font-size: 30px;">일반 공지</a></li>
                  <li><a class="dropdown-item" href="/admin/notice?searchType=0&searchValue=&category=1" style="font-size: 30px;">사업자 공지</a></li>
                  <li><a class="dropdown-item" href="/admin/notice?searchType=0&searchValue=&category=2" style="font-size: 30px;">FAQ</a></li>
                </ul>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/admin/qna" style="font-size: 30px;">문의 관리</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/admin/review" style="font-size: 30px;">리뷰 관리</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/admin/car" style="font-size: 30px;">서비스 관리</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </nav>
    
  </body>

  </html>