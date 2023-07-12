<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html>

  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Insert title here</title>
   <link href="../../css/edongsik.css" rel="stylesheet">
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  </head>

  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
   integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  <style>
    
  </style>

<body>
  <!--////////// Header Start ////////////-->
  <jsp:include page="../main/mainH.jsp"></jsp:include>
  <!--////////// Header end ////////////-->

  <!--////////// Main start //////////////-->
  <main>
    <div style="display: flex; justify-content: center; margin-top: 40px;">
      <button type="button" onclick="location.href='/e_nowOrder/'" class="btn btn-outline-info" style="border-width: 2px; margin-right: 50px;">현재상황</button>
      <button type="button" onclick="location.href='/e_orderList/'" class="btn btn-outline-info" style="border-width: 2px;">이용내역</button>
     </div>
    
    <div style="margin-top: 50px;">
      <p style="text-align: center;">이용하신 서비스가 없습니다.</p>
    </div>

      
 
    
    

      
      

  </main>
<!--////////// Main end //////////////-->
<!--////////// Foter start //////////////-->
<jsp:include page="../main/mainF.jsp"></jsp:include>
<!--////////// Foter end //////////////-->

<script>

   function conf() {
     if (confirm("위치 기반 서비스를 이용하여 현재위치를 조회하시겠습니까?")) {
      johoe();
     } else {
      alert("위치 기반 서비스를 거부하셨습니다.");
      alert("현재위치를 직접 지정합니다.");
      document.getElementById("lat1").value = 37.482126867205025;
      document.getElementById("lng1").value = 126.90147154188523;
      document.forms[0].submit();
     }
    }
    function conf2() {
     if (confirm("현재위치를 직접 지정하시겠습니까?")) {

     } else {
      alert("");
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

  function selectC(){
		var selectCar  = document.getElementById("selectCar");
		var value = (selectCar.options[selectCar.selectedIndex].value);
    
    if (value === "") {
      alert("차량을 선택해주세요.");
    } else {
      
      location.href="/carAddr/?c_idx="+value;
    }
	};
  
 </script>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  </body>
  </html>