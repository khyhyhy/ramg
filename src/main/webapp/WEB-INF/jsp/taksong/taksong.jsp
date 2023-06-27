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
     <h1>현재위치끼얏호우</h1>
    </div>
    <div id="map" style="width:100%;height:350px;"></div>

    <p id="result"></p>
    <form action="/taksong/select/">
     <button type="submit">다음 화면</button>
     <input type="hidden" id="lat1" name="nowlat" />
     <input type="hidden" id="lng1" name="nowlng" />
     <input type="hidden" id="state" name="nowstate" />
     <input type="hidden" id="city" name="nowcity" />
    </form>
   </main>
   <!--////////// Main end //////////////-->
   <!--////////// Foter start //////////////-->
   <jsp:include page="../main/mainF.jsp"></jsp:include>
   <!--////////// Foter end //////////////-->


   <script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8f974dd2f43fefe94e70a9ce228e40e&libraries=services"></script>
   <script>

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
     mapOption = {
      center: new kakao.maps.LatLng("${lat}", "${lng}"), // 지도의 중심좌표
      level: 3 // 지도의 확대 레벨
     };


    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();
    var markerPosition = new kakao.maps.LatLng("${lat}", "${lng}");

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
     position: markerPosition
    });

    marker.setMap(map);

    // 드래그 이전 현재위치로 state등 반환
    kakao.maps.event.addListener(map, 'tilesloaded', function () {

     var latlng = map.getCenter();
     marker.setPosition(latlng)
     document.getElementById("lat1").value = latlng.getLat();
     document.getElementById("lng1").value = latlng.getLng();
     var message = '현재 지도 중심 위도는 ' + latlng.getLat() + ' , ';
     message += '경도는 ' + latlng.getLng() + ' 임';

     var resultDiv = document.getElementById('result');
     resultDiv.innerHTML = message;

     var callback = function (result, status) {
      if (status === kakao.maps.services.Status.OK) {

       console.log(kakao.maps.services.Status.OK)
       console.log(result);
       console.log('전체 지역 명은' + result[0].address_name + '입니다');
       console.log('도 명은 ' + result[0].region_1depth_name + ' 입니다');
       console.log('구 명은 ' + result[0].region_2depth_name + ' 입니다');
       document.getElementById("state").value = result[0].region_1depth_name;
       console.log('행정구역 코드 : ' + result[0].code);



       const regex = /(\S+[시군])/;
       const resultt = regex.exec(result[0].address_name);

       const city = result[0].region_2depth_name;
       document.getElementById("city").value = city
      }

     };
     geocoder.coord2RegionCode(latlng.getLng(), latlng.getLat(), callback);

    });
    // 마우스 드래그로 지도 이동이 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
    kakao.maps.event.addListener(map, 'dragend', function () {

     // 지도 중심좌표를 얻어옵니다 
     var latlng = map.getCenter();
     marker.setPosition(latlng)
     document.getElementById("lat1").value = latlng.getLat();
     document.getElementById("lng1").value = latlng.getLng();
     var message = '변경된 지도 중심 위도는 ' + latlng.getLat() + ' , ';
     message += '경도는 ' + latlng.getLng() + ' 임';

     var resultDiv = document.getElementById('result');
     resultDiv.innerHTML = message;

     var callback = function (result, status) {
      if (status === kakao.maps.services.Status.OK) {

       console.log(kakao.maps.services.Status.OK)
       console.log(result);
       console.log('전체 지역 명은' + result[0].address_name + '입니다');
       console.log('도 명은 ' + result[0].region_1depth_name + ' 입니다');
       console.log('구 명은 ' + result[0].region_2depth_name + ' 입니다');
       document.getElementById("state").value = result[0].region_1depth_name;
       console.log('행정구역 코드 : ' + result[0].code);



       const regex = /(\S+[시군])/;
       const resultt = regex.exec(result[0].address_name);

       const city = result[0].region_2depth_name;
       document.getElementById("city").value = city
      }

     };
     geocoder.coord2RegionCode(latlng.getLng(), latlng.getLat(), callback);

    });

   </script>

  </body>

  </html>