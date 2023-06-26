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


    <div>
     <h1>index</h1>
    </div>

    <p id="result"></p>
    <button type="button" onclick="conf()">다음 화면</button>
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