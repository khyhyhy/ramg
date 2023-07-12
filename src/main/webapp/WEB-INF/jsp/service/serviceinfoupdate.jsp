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
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
    crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
   <style>

   </style>
  </head>

  <body onload="onbody()">
   <!--////////// Header Start ////////////-->
   <jsp:include page="../main/mainH.jsp"></jsp:include>
   <!--////////// Header end ////////////-->

   <!--////////// Main start //////////////-->
   <div class="container">
    <main>
     <p>"${mvo.m_idx}"</p>
     <!-- <c:if test="${sessionScope.evo == null}"></c:if> -->
     <!-- Button trigger modal -->
     <c:if test="${swvo.svo.s_type eq 0}">
      <!-- 지도영역 -->
      <div>
       <div class="accordion accordion-flush" id="accordionFlushExample">
        <div class="accordion-item">
         <h2 class="accordion-header" id="flush-headingOne">
          <button id="onbody" class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
           data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne"
           onclick="map1init()">
           현재위치 검색
          </button>
         </h2>
         <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne"
          data-bs-parent="#accordionFlushExample">
          <div class="accordion-body">
           <div class="input-group input-group-sm mb-3">
            <input class="form-control" type="text" id="t_addr" name="t_addr" placeholder="ex)  세종대로 110 " readonly />
            <button class="btn btn-outline-secondary" type="button" onclick="tsearch()">주소 검색</button>
            <div id="map1" style="width:100%;height:350px;"></div>
           </div>
          </div>
         </div>
        </div>
       </div>
       <!-- 지도영역 -->
       <!-- 정보영역 -->
       <br />
       <form method="post" action="/mypage/serviceadd/update" novalidate>
        <input type="hidden" value="${sessionScope.mvo.m_idx}" name="m_idx">
        <div class="input-group input-group-sm mb-3">
         <input class="form-control" type="text" id="t_state" name="s_state" readonly value="${swvo.svo.s_state}">
         <input class="form-control" type="text" id="t_city" name="s_city" readonly value="${swvo.svo.s_city}">
         <input type="hidden" id="t_lat" name="lat" value="${swvo.svo.s_mapy}">
         <input type="hidden" id="t_lng" name="lng" value="${swvo.svo.s_mapx}">
        </div>
        <br />
        <div class="input-group mb-3">
         <span class="input-group-text" id="t_radius">서비스 가능 범위</span>
         <input type="text" id="t_radius2" name="s_radius" class="form-control" placeholder="m단위 ex)1000m"
          value="${swvo.svo.s_radius}" readonly>
        </div>
        <div class="input-group mb-3">
         <span class="input-group-text" id="t_price">서비스 비용 설정</span>
         <select class="form-select form-select-sm" id="t_price2" name="s_val1" disabled>
          <option selected value="${swvo.svo.s_val1}">
           ${swvo.svo.s_val1}원</option>
          <option value="7000">7.000원</option>
          <option value="6000">6.000원</option>
          <option value="5000">5.000원</option>
          <option value="4000">4.000원</option>
          <option value="3000">3.000원</option>
          <option value="2000">2.000원</option>
         </select>
        </div>
        <input type="hidden" name="sw_idx" value="${swvo.sw_idx}">
        <input type="hidden" name="s_idx" value="${swvo.svo.s_idx}">
        <div>
         <button type="button" id="sujung1" class="btn btn-primary" onclick="sujung()">수정하기</button>
         <button type="submit" id="sujung2" style="display: none;" class="btn btn-primary">수정완료</button>
         <button type="button" id="cancel1" class="btn btn-secondary">뒤로가기</button>
         <button type="button" id="cancel2" style="display: none;" class="btn btn-secondary"
          onclick="sujungcan()">취소</button>
        </div>
        <!-- 정보영역끝 -->
       </form>
      </div>
     </c:if>


     <!-- 탁송차량 영역 -->


     <c:if test="${swvo.svo.s_type eq 1}">
      <div>
       <!-- 정보영역 -->
       <form method="post" action="/mypage/serviceadd/update" novalidate>
        <input type="hidden" value="${sessionScope.mvo.m_idx}" name="m_idx">
        <div class="input-group input-group-sm mb-3">
         <div class="input-group mb-3">
          <span class="input-group-text">서비스 차량</span>
          <select class="form-select form-select-sm" id="e_car" name="c_idx" onselect="exe()" onchange="exe()" disabled>
           <option selected value="${carvo.c_idx}" data-addr="${carvo.c_state} ${carvo.c_city} ${carvo.c_addr1}">
            ${carvo.c_name}</option>
           <c:forEach items="${cwar}" var="vo">
            <option value=" ${vo.cvo.c_idx}" data-addr="${vo.cvo.c_state} ${vo.cvo.c_city} ${vo.cvo.c_addr1}">
             ${vo.cvo.c_name}</option>
           </c:forEach>
          </select>
         </div>
         <!-- 지도 -->
         <div>
          <button id="map2col" style="display: none;" class="btn btn-primary" type="button" data-bs-toggle="collapse"
           data-bs-target="#mapcol" onclick="map2init()">
          </button>
         </div>
         <div class="collapse collapse-horizontal" id="mapcol">
          <div class="card card-body" style="width:450px; ">
           <div id="map2" style="width:100%;height:350px;"></div>
          </div>
         </div>
         <input class="btn btn-outline-secondary" type="text" id="e_addr" name="e_addr" readonly
          onclick="esearch(this)">
         <div class="input-group mb-3">
          <span class="input-group-text" id="e_radius">서비스 가능 범위</span>
          <input type="text" name="s_radius" class="form-control" placeholder="m단위 ex)1000m"
           value="${swvo.svo.s_radius}">
         </div>
         <div class="input-group mb-3">
          <span class="input-group-text">서비스 비용 설정</span>
          <select class="form-select form-select-sm" id="e_price" name="s_val1">
           <option value="10000">10.000원</option>
           <option value="9000">9.000원</option>
           <option value="8000">8.000원</option>
           <option value="7000">7.000원</option>
           <option value="6000">6.000원</option>
           <option value="5000">5.000원</option>
           <option value="4000">4.000원</option>
          </select>
          <input type="hidden" id="e_state" name="s_state">
          <input type="hidden" id="e_city" name="s_city">
          <input type="hidden" id="e_lat" name="lat">
          <input type="hidden" id="e_lng" name="lng">
         </div>
        </div>
        <input type="hidden" name="sw_idx" value="${swvo.sw_idx}">
        <input type="hidden" name="s_idx" value="${swvo.svo.s_idx}">
        <div>
         <button type="button" id="esujung1" class="btn btn-primary" onclick="esujung()">수정하기</button>
         <button type="submit" id="esujung2" style="display: none;" class="btn btn-primary">수정완료</button>
         <button type="button" id="ecancel1" class="btn btn-secondary">뒤로가기</button>
         <button type="button" id="ecancel2" style="display: none;" class="btn btn-secondary"
          onclick="esujungcan()">취소</button>
        </div>
       </form>
      </div>
     </c:if>
    </main>
   </div>
   <!--////////// Main end //////////////-->
   <!--////////// Foter start //////////////-->
   <jsp:include page="../main/mainF.jsp"></jsp:include>
   <!--////////// Foter end //////////////-->


   <script src="https://code.jquery.com/jquery-3.6.4.min.js"
    integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
   <script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8f974dd2f43fefe94e70a9ce228e40e&libraries=services"></script>
   <script>
    let map1;
    let geocoder;
    let geocoder2;

    function esujung() {
     document.getElementById("esujung2").style.display = "inline";
     document.getElementById("esujung1").style.display = "none";
     document.getElementById("ecancel2").style.display = "inline";
     document.getElementById("ecancel1").style.display = "none";
     $("#e_radius").attr('readonly', false);
     $("#e_addr").attr('readonly', false);
     $("#e_price").removeAttr('disabled');
     $("#e_car").removeAttr('disabled');
    }
    function esujungcan() {
     location.reload();
    }




    function sujung() {
     document.getElementById("sujung2").style.display = "inline";
     document.getElementById("sujung1").style.display = "none";
     document.getElementById("cancel2").style.display = "inline";
     document.getElementById("cancel1").style.display = "none";
     $("#t_radius2").attr('readonly', false);
     $("#t_addr").attr('readonly', false);
     $("#t_price2").removeAttr('disabled');
     map1.setDraggable(true);
     map1.setZoomable(true);
    }
    function sujungcan() {
     location.reload();
    }

    function onbody() {
     document.getElementById("onbody").click();
     map1.setDraggable(false);
     map1.setZoomable(false);
    }

    function exe() {
     let addr = $("#e_car").find("option:selected").data('addr');
     console.log("addr:" + addr);
     document.getElementById("e_addr").value = addr;
     document.getElementById("map2col").click();
     document.getElementById("e_addr").click();
    }


    function map1init() {
     var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
      mapOption = {
       center: new kakao.maps.LatLng("${ swvo.svo.s_mapy }", " ${ swvo.svo.s_mapx }"), // 지도의 중심좌표
       level: 3 // 지도의 확대 레벨
      };

     map1 = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     geocoder = new kakao.maps.services.Geocoder();
     var markerPosition = new kakao.maps.LatLng("${ swvo.svo.s_mapy }", "${ swvo.svo.s_mapx }");

     // 마커를 생성합니다
     var marker = new kakao.maps.Marker({
      position: markerPosition

     });



     // 마커가 지도 위에 표시되도록 설정합니다
     marker.setMap(map1)


     // tilesloaded 
     /*
     kakao.maps.event.addListener(map1, 'tilesloaded', function () {
      console.log("map1 타일로드됨~");
      var latlng = map1.getCenter();
      marker.setPosition(latlng)
      document.getElementById("t_lat").value = latlng.getLat();
      document.getElementById("t_lng").value = latlng.getLng();
      var message = '현재 지도 중심 위도는 ' + latlng.getLat() + ' , ';
      message += '경도는 ' + latlng.getLng() + ' 임';

      //var resultDiv = document.getElementById('result');
      //resultDiv.innerHTML = message;

      //map1.setCenter(markerPosition);

      geocoder.coord2RegionCode(latlng.getLng(), latlng.getLat(), callback);

     });*/


     kakao.maps.event.addListener(map1, 'click', function (mouseEvent) {
      console.log("map1 클릭됨~");
      // 클릭한 위도, 경도 정보를 가져옵니다 
      var latlng = mouseEvent.latLng;

      var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
      message += '경도는 ' + latlng.getLng() + ' 입니다';

      //var resultDiv = document.getElementById('result');
      //resultDiv.innerHTML = message;

      markerPosition = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());

      marker


      //map1.setCenter(markerPosition);


     });

     // idle
     kakao.maps.event.addListener(map1, 'idle', function () {

      var latlng = map1.getCenter();
      marker.setPosition(latlng)
      document.getElementById("t_lat").value = latlng.getLat();
      document.getElementById("t_lng").value = latlng.getLng();
      var message = '변경된 지도 중심 위도는 ' + latlng.getLat() + ' , ';
      message += '경도는 ' + latlng.getLng() + ' 임';

      //var resultDiv = document.getElementById('result');
      //resultDiv.innerHTML = message;
      var callback = function (result, status) {
       if (status === kakao.maps.services.Status.OK) {

        console.log(kakao.maps.services.Status.OK)
        console.log(result);
        console.log('전체 지역 명은' + result[0].address_name + '입니다');
        console.log('도 명은 ' + result[0].region_1depth_name + ' 입니다');
        console.log('구 명은 ' + result[0].region_2depth_name + ' 입니다');
        document.getElementById("t_state").value = result[0].region_1depth_name;
        console.log('행정구역 코드 : ' + result[0].code);



        const regex = /(\S+[시군])/;
        const resultt = regex.exec(result[0].address_name);

        const city = result[0].region_2depth_name;
        document.getElementById("t_city").value = city
       }

      };


      geocoder.coord2RegionCode(latlng.getLng(), latlng.getLat(), callback);


      map1reload();

     });
    }


    // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

    function tsearch() {
     console.log("tsearch진입");
     var t_addr = document.getElementById("t_addr").value;

     geocoder.addressSearch(t_addr, function (result, status) {


      console.log("1");
      // 정상적으로 검색이 완료됐으면 
      if (status === kakao.maps.services.Status.OK) {
       console.log("2");
       console.log(result[0].y);
       console.log(result[0].x);


       var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

       // 결과값으로 받은 위치를 마커로 표시합니다
       var marker = new kakao.maps.Marker({
        map1: map1,
        position: coords
       });

       markerPosition = new kakao.maps.LatLng(result[0].y, result[0].x);


       // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
       map1.setCenter(markerPosition);
       map1reload();
      }
     });
    }
    // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ






    function map1reload() {
     console.log("map1 리로드됨~");
     map1.relayout();
    }
    // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


    let map2;


    // -------------맵222222222222222222222
    function map2init() {
     var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div 
      mapOption2 = {
       center: new kakao.maps.LatLng("${ swvo.svo.s_mapy }", "${ swvo.svo.s_mapx }"), // 지도의 중심좌표
       level: 3 // 지도의 확대 레벨
      };

     map2 = new kakao.maps.Map(mapContainer2, mapOption2); // 지도를 생성합니다
     geocoder2 = new kakao.maps.services.Geocoder();
     var markerPosition2 = new kakao.maps.LatLng("${ swvo.svo.s_mapy }", "${ swvo.svo.s_mapx }");
     map2.setDraggable(false);
     map2.setZoomable(false);
     // 마커를 생성합니다
     var marker = new kakao.maps.Marker({
      position: markerPosition2


     });


     // 마커가 지도 위에 표시되도록 설정합니다
     marker.setMap(map2)


     /*kakao.maps.event.addListener(map2, 'click', function () {
      console.log("map2 클릭로드됨~");
      var latlng2 = map2.getCenter();
      marker.setPosition(latlng2)
      document.getElementById("e_lat").value = latlng2.getLat();
      document.getElementById("e_lng").value = latlng2.getLng();
      var message = '현재 지도 중심 위도는 ' + latlng2.getLat() + ' , ';
      message += '경도는 ' + latlng2.getLng() + ' 임';

      //var resultDiv = document.getElementById('result');
      //resultDiv.innerHTML = message;

      //map1.setCenter(markerPosition);
      var callback = function (result, status) {
       if (status === kakao.maps.services.Status.OK) {

        console.log(kakao.maps.services.Status.OK)
        console.log(result);
        console.log('전체 지역 명은' + result[0].address_name + '입니다');
        console.log('도 명은 ' + result[0].region_1depth_name + ' 입니다');
        console.log('구 명은 ' + result[0].region_2depth_name + ' 입니다');
        document.getElementById("e_state").value = result[0].region_1depth_name;
        //console.log('행정구역 코드 : ' + result[0].code);

        document.getElementById("e_addr").value = result[0].address_name;

        const regex2 = /(\S+[시군])/;
        const resultt2 = regex2.exec(result[0].address_name);

        const city2 = result[0].region_2depth_name;
        document.getElementById("e_city").value = city2
       }

      };


      geocoder2.coord2RegionCode(latlng2.getLng(), latlng2.getLat(), callback);

     });*/

     // idle
     kakao.maps.event.addListener(map2, 'idle', function () {

      var latlng2 = map2.getCenter();
      marker.setPosition(latlng2)

      var callback = function (result, status) {
       if (status === kakao.maps.services.Status.OK) {

        console.log(kakao.maps.services.Status.OK)
        console.log(result);
        console.log('전체 지역 명은' + result[0].address_name + '입니다');
        console.log('도 명은 ' + result[0].region_1depth_name + ' 입니다');
        console.log('구 명은 ' + result[0].region_2depth_name + ' 입니다');
        document.getElementById("e_state").value = result[0].region_1depth_name;
        //console.log('행정구역 코드 : ' + result[0].code);



        const regex2 = /(\S+[시군])/;
        const resultt2 = regex2.exec(result[0].address_name);

        const city2 = result[0].region_2depth_name;
        document.getElementById("e_city").value = city2
       }

      };

      geocoder2.coord2RegionCode(latlng2.getLng(), latlng2.getLat(), callback);
      document.getElementById("e_lat").value = latlng2.getLat();
      document.getElementById("e_lng").value = latlng2.getLng();

     });
    }

    // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

    function esearch(e) {
     console.log("esearch진입");
     var e_addr = e.value;
     console.log("esearch:::" + e_addr);


     geocoder2.addressSearch(e_addr, function (result, status) {
      console.log("112312312");
      // 정상적으로 검색이 완료됐으면 
      if (status === kakao.maps.services.Status.OK) {
       console.log(kakao.maps.services.Status.OK)
       console.log(result);
       console.log('전체 지역 명은' + result[0].address_name + '입니다');
       console.log('도 명은 ' + result[0].region_1depth_name + ' 입니다');
       console.log('구 명은 ' + result[0].region_2depth_name + ' 입니다');
       document.getElementById("e_state").value = result[0].region_1depth_name;
       //console.log('행정구역 코드 : ' + result[0].code);

       document.getElementById("e_addr").value = result[0].address_name;

       const regex2 = /(\S+[시군])/;
       const resultt2 = regex2.exec(result[0].address_name);

       const city2 = result[0].region_2depth_name;
       document.getElementById("e_city").value = city2


       var coords2 = new kakao.maps.LatLng(result[0].y, result[0].x);

       // 결과값으로 받은 위치를 마커로 표시합니다
       var marker2 = new kakao.maps.Marker({
        map2: map2,
        position: coords2
       });

       markerPosition2 = new kakao.maps.LatLng(result[0].y, result[0].x);


       // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
       map2.setCenter(markerPosition2);
       map2reload();
      }
     });
    }
    // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    function map2reload() {
     console.log("map2리로드됨")
     map2.relayout();
    }
    // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


   </script>
  </body>


  </html>