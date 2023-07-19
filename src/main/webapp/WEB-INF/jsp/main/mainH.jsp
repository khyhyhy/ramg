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
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   <style>
    #header3 {
     font-size: 20px !important;
     padding: 15px 0px 0px 0px !important;
     position: fixed;
     top: 0;
     left: 0;
     right: 0;
     z-index: 999;
     padding: 10px;
     background-color: rgb(255, 255, 255)
    }

    body {
     padding-top: 75px;
     /* 생략 */
     padding-bottom: 75px;
    }
   </style>
  </head>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
   integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  <body>
   <!--////////// Header Start ////////////-->

   <div class="container-fluid">
    <header id="header3" style="margin: 0.0rem!important;"
     class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between mb-4 border-bottom">
     <a href="/main/" class="d-flex align-items-center mb-3 mb-md-0 me-md-20 text-dark text-decoration-none" style="margin-right: 150px;">
      <svg class="bi me-2" width="50" height="35"><img style="width: 50px;" src="/images/logo3.png" />
       <img src="/images/logo.png" style="width: 200px;"/></svg>
     </a>
     <div class="dropdown">
      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
       <li class="mx-5">
        <a href="#" class="header nav-link px-4 link-secondary" onclick="conf()">충전소 찾기</a>
       </li>
       <c:if test="${sessionScope.mvo.m_class eq 0 || sessionScope.mvo.m_class eq null}">
        <li class="mx-5">
         <a href="#" class="header nav-link px-4 link-secondary" data-bs-toggle="dropdown">충전
          서비스</a>
         <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="/infoma/">서비스 소개</a></li>
          <li><a class="dropdown-item" href="/taksong/">탁송 서비스</a></li>
          <li><a class="dropdown-item" href="/edongsik/">이동식 충전 서비스</a></li>
          <li><a class="dropdown-item" href="/support/review">리뷰</a></li>
         </ul>
        </li>
       </c:if>
       <li class="mx-5">
        <a href="#" class="header nav-link px-4 link-secondary" data-bs-toggle="dropdown">고객센터</a>
        <ul class="dropdown-menu">
         <li><a class="dropdown-item" href="/support/notice">공지사항</a></li>
         <li><a class="dropdown-item" href="/support/faq">자주하는 질문</a></li>
         <li><a class="dropdown-item" href="/support/qna">문의 게시판</a></li>
        </ul>
       </li>
       <c:if test="${sessionScope.mvo != null}">
        <li class="mx-5">
         <a href="#" class="header nav-link px-4 link-secondary" data-bs-toggle="dropdown">마이
          페이지</a>
         <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="/mypage">정보 관리</a></li>
          <li><a class="dropdown-item" href="/car_list">차량 관리</a></li>
          <li><a class="dropdown-item" href="/my_question">나의 문의</a></li>
          <c:if test="${sessionScope.mvo.m_class eq 1}">
           <li><a class="dropdown-item" href="/mypage/serviceadd/">서비스 관리</a></li>
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
       <button id="loginButton" type="button" class="btn btn-light"><a href="/login"
         style="color: rgb(37, 37, 37) !important; text-decoration: none !important;"><i class="fa fa-sign-in me-2" aria-hidden="true"></i>로그인</a></button>
      </div>
     </c:if>
     <c:if test="${sessionScope.mvo ne null}">
      <div class="col-md-3 text-end">
       <p class="me-3 mb-0"><a href="/mypage">${sessionScope.mvo.m_name}</a>님 환영합니다.</p>
       <button id="logoutButton" type="button" class="btn btn-light me-3 pt-0"><a href="/logout"
         style="color: rgb(37, 37, 37) !important; text-decoration: none !important;">로그아웃<i class="fa fa-sign-out ms-2" aria-hidden="true"></i></a></button>
      </div>
     </c:if>
    </header>
   </div>
   <!--////////// Header end ////////////-->
   <script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eedecff808e53f9bd6b2000c4b6da49a&libraries=services"></script>
   <script>
    function conf() {
     if (confirm("위치 기반 서비스를 이용하여 현재위치를 조회하시겠습니까?")) {
      johoe();
     } else {
      alert("현재위치를 조회해주세요.");
     }
    }
    function johoe() {

     var geocoder = new kakao.maps.services.Geocoder();
     // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
     if (navigator.geolocation) {

      // GeoLocation을 이용해서 접속 위치를 얻어옵니다
      navigator.geolocation.getCurrentPosition(function (position) {
       //위도경도를 불러온다.
       var lati = position.coords.latitude, // 위도
        lon = position.coords.longitude; // 경도 -->
       getAddr(lati, lon);
       //주소를 불러오는 함수
       function getAddr(lati, lon) {
        let geocoder2 = new kakao.maps.services.Geocoder();

        let coord = new kakao.maps.LatLng(lati, lon);

        let callback = function (result, status) {

         if (status === kakao.maps.services.Status.OK) {

          //console.log(result);
          var city = result[0].address.address_name;
          //console.log(result[0].road_address.address_name);
          //console.log(city+"/1번");
          geocoder.addressSearch(result[0].address.address_name, function (result, status) {

           //console.log(city+"/2번");
           //정상적으로 검색이 완료됐다면.....
           if (status === kakao.maps.services.Status.OK) {
            // 강제 전송 코드
            var form = document.createElement('form');
            form.setAttribute('method', 'post');
            form.setAttribute('action', '/fmap/');
            form.style.display = 'none';

            var cityInput3 = document.createElement('input');
            cityInput3.setAttribute('type', 'hidden');
            cityInput3.setAttribute('name', 'city');
            cityInput3.setAttribute('value', city);

            form.appendChild(cityInput3);

            document.body.appendChild(form);
            form.submit();
           }
          });

         }
        }
        geocoder2.coord2Address(coord.getLng(), coord.getLat(), callback);
       }
      });
     } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

      var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),

       message = 'geolocation을 사용할수 없어요..'

      displayMarker(locPosition, message);
     }

    }

   </script>
  </body>

  </html>