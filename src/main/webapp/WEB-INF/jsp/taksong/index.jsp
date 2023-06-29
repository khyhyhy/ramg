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
   <jsp:include page="../main/mainH.jsp"></jsp:include>
   <!--////////// Header end ////////////-->

   <!--////////// Main start //////////////-->
   <main>
    <p>"${evo.m_idx}"</p>
    <!-- <c:if test="${sessionScope.evo == null}"></c:if> -->

    <div style="display: flex; justify-content: center; margin-top: 50px;">
     <button type="button" onclick="location.href='??'">충전하기</button>
     <button type="button" onclick="location.href='??'" style="margin-left: 50px; margin-right: 50px;">현재상황</button>
     <button type="button" onclick="location.href='map'">이용내역</button>
    </div>

    <div style="display: flex; justify-content: center; align-items: center; min-height: 70vh;">

     <div class="card" style="width: 18rem; ">
      <img src="/images/map_icon.png" class="card-img-top" alt="...">
      <div class="card-body">
       <h5 class="card-title">현재 위치 검색</h5>
       <p class="card-text"></p>
       <button type="button " class="btn btn-primary" onclick="conf()">검색</button>
      </div>
     </div>


     <div class="card" style="width: 18rem; margin-left: 150px;">
      <img src="/images/car_icon.png" class="card-img-top" alt="...">
      <div class="card-body">
       <h5 class="card-title">차량 등록 주소</h5>
       <p class="card-text"></p>
       <a href="#" class="btn btn-primary" onclick="location.href='/carAddr/?m_idx=${evo.m_idx}'">검색</a>
      </div>

     </div>
    </div>
    <form action="/taksong/local" method="get">
     <input type="hidden" id="lat1" name="lat" />
     <input type="hidden" id="lng1" name="lng" />
    </form>
   </main>
   <!--////////// Main end //////////////-->
   <!--////////// Foter start //////////////-->
   <jsp:include page="../main/mainF.jsp"></jsp:include>
   <!--////////// Foter end //////////////-->

   <script>
    function conf() {
     if (confirm("현재위치를 조회하시겠습니까?")) {
      johoe();
     } else {
      alert("위치 기반 서비스를 동의해 주세요");
      conf2();
     }
    }
    function conf2() {
     if (confirm("현재위치를 직접 지정하시겠습니까?")) {
      document.getElementById("lat1").value = 37.482126867205025;
      document.getElementById("lng1").value = 126.90147154188523;
      document.forms[0].submit();
     } else {
      alert("위치 기반 서비스를 동의해 주세요");
     }
    }
    function johoe() {
     navigator.geolocation.getCurrentPosition(function (pos) {
      console.log(pos);
      var latitude = pos.coords.latitude;
      var longitude = pos.coords.longitude;
      document.getElementById("lat1").value = latitude;
      document.getElementById("lng1").value = longitude;
      alert("현재 위치는 : " + latitude + ", " + longitude);
      document.forms[0].submit();
     });
    }
   </script>
  </body>

  </html>