
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
  </head>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
   integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  <body>
   <!--////////// Header Start ////////////-->
   <div class="container-fluid bg-info">
    <header
     class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
     <a href="/main/" class="d-flex align-items-center mb-3 mb-md-0 me-md-20 text-dark text-decoration-none">
      <svg class="bi me-2" width="50" height="35"><img src="../images/thunder.png" /></svg>
      <span class="fs-4 text-white">람쥐썬더 전기차 충전소</span>
     </a>

     <div class="dropdown">
      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li>
          <a href="/main/" class="nav-link px-2 link-secondary text-white">메인페이지</a>
        </li>
        <li>
          <a href="/admin/notice" class="nav-link px-2 link-secondary text-white">공지사항관리</a>
        </li>
        <li>
          <a href="/admin/member" class="nav-link px-2 link-secondary text-white">회원관리</a>
        </li>
        <li>
          <a href="/admin/qna" class="nav-link px-2 link-secondary text-white">문의게시판 관리</a>
        </li>
      </ul>
     </div>

     <c:if test="${sessionScope.mvo eq null}">
      <div class="col-md-3 text-end">
       <button type="button" class="btn btn-outline-primary me-2"><a href="/admin/login">Login</a></button>
      </div>
     </c:if>

     <c:if test="${sessionScope.mvo ne null}">
      <div class="col-md-3 text-end">
       <button type="button" class="btn btn-outline-primary me-2"><a href="/admin/logout">Logout</a></button>
      </div>
     </c:if>

    </header>
   </div>
   <!--////////// Header end ////////////-->



  </body>

  </html>