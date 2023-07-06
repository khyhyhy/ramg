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

  </head>

  <body>
   <!--////////// Header Start ////////////-->
   <jsp:include page="../main/mainH.jsp"></jsp:include>
   <!--////////// Header end ////////////-->

   <!--////////// Main start //////////////-->
   <div class="container">
    <main>
     <p>"${mvo.m_idx}"</p>
     <!-- <c:if test="${sessionScope.evo == null}"></c:if> -->
     <!-- Button trigger modal -->
     <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#taksongadd">
      탁송 서비스 등록
     </button>
     <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#edongsikadd">
      이동식 서비스 등록
     </button>
     <br />
     <br />
     <br />
     <div class="row">
      <div class="col">
       Column
      </div>
      <div class="col">
       Column
      </div>
      <div class="col">
       Column
      </div>
      <div class="col">
       Column
      </div>
      <div class="col">
       Column
      </div>
      <div class="col">
       Column
      </div>
     </div>

     <!-- Modal -->

     <div class="modal fade" id="taksongadd" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
      aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog">
       <div class="modal-content">
        <div class="modal-header">
         <h1 class="modal-title fs-5" id="staticBackdropLabel">탁송 서비스 등록</h1>
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
         <!-- 지도영역 -->
         <div class="accordion accordion-flush" id="accordionFlushExample">
          <div class="accordion-item">
           <h2 class="accordion-header" id="flush-headingOne">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
             data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne"
             onclick="map1reload()">
             현재위치 검색
            </button>
           </h2>
           <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne"
            data-bs-parent="#accordionFlushExample">
            <div class="accordion-body">

             <div class="input-group input-group-sm mb-3">
              <input class="form-control" type="text" id="t_addr" name="t_addr" placeholder="ex)  세종대로 110 " />
              <button class="btn btn-outline-secondary" type="button" onclick="tsearch()">주소 검색</button>
              </form>
              <div id="map1" style="width:100%;height:350px;"></div>
             </div>
            </div>
           </div>
          </div>
          <!-- 지도영역 -->
          <!-- 정보영역 -->
          <form novalidate>
           <div class="input-group input-group-sm mb-3">
            <input class="form-control" type="text" id="t_state" readonly>
            <input class="form-control" type="text" id="t_city" readonly>
            <input type="hidden" id="t_lat" name="lat">
            <input type="hidden" id="t_lng" name="lng">
            <div class="input-group mb-3">
             <span class="input-group-text" id="t_radius">서비스 가능 범위</span>
             <input type="text" class="form-control" placeholder="m단위 ex)1000m">
            </div>
            <div class="input-group mb-3">
             <span class="input-group-text" id="t_price">서비스 비용 설정</span>
             <select class="form-select form-select-sm" id="t_price">
              <option value="7000">7.000원</option>
              <option value="6000">6.000원</option>
              <option value="5000">5.000원</option>
              <option value="4000">4.000원</option>
              <option value="3000">3.000원</option>
              <option value="2000">2.000원</option>
             </select>
            </div>
           </div>
           <!-- 정보영역끝 -->
         </div>
         <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary">등록</button>
         </div>
        </div>
       </div>
      </div>
      </form>
     </div>


     <div class="modal fade" id="edongsikadd" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
      aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog">
       <div class="modal-content">
        <div class="modal-header">
         <h1 class="modal-title fs-5" id="staticBackdropLabel">이동식 충전 서비스 등록</h1>
         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
         <!-- 지도영역 -->
         <!-- 정보영역 -->
         <form novalidate>
          <div class="input-group input-group-sm mb-3">
           <div class="input-group mb-3">
            <span class="input-group-text">이동식 충전 차량 등록</span>
            <select class="form-select form-select-sm" id="e_car">
             <c:if test="${cwar eq null}">
              <option>등록된 차량이 없습니다</option>
             </c:if>
             <!-- <c:if test="${cwar ne null}">
              <c:forEach items="${cwar}" var="vo" varstatus="status">
               <option value="${vo.cvo.c_idx}">${vo.cvo.c_name}</option>
               <input type="hidden" id="">
              </c:forEach> -->
             <!-- </c:if> -->
            </select>
           </div>
           <input class="form-control" type="text" id="e_state" readonly>
           <input class="form-control" type="text" id="e_city" readonly>
           <input type="hidden" id="e_lat" name="lat">
           <input type="hidden" id="e_lng" name="lng">
           <div class="input-group mb-3">
            <span class="input-group-text" id="e_radius">서비스 가능 범위</span>
            <input type="text" class="form-control" placeholder="m단위 ex)1000m">
           </div>
           <div class="input-group mb-3">
            <span class="input-group-text">서비스 비용 설정</span>
            <select class="form-select form-select-sm" id="e_price">
             <option value="10000">10.000원</option>
             <option value="9000">9.000원</option>
             <option value="8000">8.000원</option>
             <option value="7000">7.000원</option>
             <option value="6000">6.000원</option>
             <option value="5000">5.000원</option>
             <option value="4000">4.000원</option>
            </select>
           </div>
          </div>
          <!-- 정보영역끝 -->
        </div>
        <div class="modal-footer">
         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
         <button type="button" class="btn btn-primary">등록</button>
        </div>
       </div>
      </div>
     </div>
     </form>
   </div>

   </main>
   </div>
   <!--////////// Main end //////////////-->
   <!--////////// Foter start //////////////-->
   <jsp:include page="../main/mainF.jsp"></jsp:include>
   <!--////////// Foter end //////////////-->
   <script>

    // 폼 수집용
   </script>








   <script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8f974dd2f43fefe94e70a9ce228e40e&libraries=services"></script>
   <script>

    var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
     mapOption = {
      center: new kakao.maps.LatLng(37.48489405082669, 126.90278513630275), // 지도의 중심좌표
      level: 3 // 지도의 확대 레벨
     };

    var map1 = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();
    var markerPosition = new kakao.maps.LatLng(37.48489405082669, 126.90278513630275);

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
     position: markerPosition


    });


    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map1)

    // tilesloaded
    kakao.maps.event.addListener(map1, 'tilesloaded', function () {

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

     geocoder.coord2RegionCode(latlng.getLng(), latlng.getLat(), callback);

    });


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
       map1.relayout;

      }
     });
    }
    // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

    kakao.maps.event.addListener(map1, 'click', function (mouseEvent) {

     // 클릭한 위도, 경도 정보를 가져옵니다 
     var latlng = mouseEvent.latLng;

     var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
     message += '경도는 ' + latlng.getLng() + ' 입니다';

     //var resultDiv = document.getElementById('result');
     //resultDiv.innerHTML = message;

     markerPosition = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());

     marker


     map1.setCenter(markerPosition);


    });




    function map1reload() {
     map1.relayout();
    }
    // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
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

   </script>
  </body>


  </html>