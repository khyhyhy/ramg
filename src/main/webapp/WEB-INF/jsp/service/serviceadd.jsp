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
     <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#taksongadd"
      onclick="map1init()">
      탁송 서비스 등록
     </button>
     <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#edongsikadd"
      onclick="map2init()">
      이동식 서비스 등록
     </button>
     <br />
     <br />
     <br />
     <div>
      <h2>등록된 서비스 현황</h2>
     </div>
     <br />
     <br />
     <div class="table-responsive">
      <table class="table table-hover">
       <thead>
        <tr>
         <th scope="col">
          서비스 유형
         </th>
         <th scope="col">
          서비스 구역
         </th>
         <th scope="col">
          서비스 차량
         </th>
         <th scope="col">
          서비스 범위
         </th>
         <th scope="col">
          서비스 가격
         </th>
         <th scope="col">
          서비스 현황
         </th>
         <th></th>
        </tr>
       </thead>
       <tbody>
        <c:forEach items="${swar}" var="vo" varStatus="status">
         <tr>
          <td scope="col">
           <c:choose>
            <c:when test="${vo.svo.s_type eq 0}"> 탁송 충전 서비스 </c:when>
            <c:when test="${vo.svo.s_type eq 1}"> 이동식 충전 서비스 </c:when>
           </c:choose>
          </td>
          <td scope="col">
           ${vo.svo.s_state}&nbsp;${vo.svo.s_city}&nbsp;
          </td>
          <td scope="col">
           ${vo.cvo.c_name}
          </td>
          <td scope="col">
           ${vo.svo.s_radius} M
          </td>
          <td scope="col">
           ${vo.svo.s_val1} 원
          </td>
          <td scope="col">
           <c:choose>
            <c:when test="${vo.svo.s_status eq 0}">영업중</c:when>
            <c:when test="${vo.svo.s_status eq 1}">영업중단</c:when>
            <c:when test="${vo.svo.s_status eq 2}"><button type="button" class="btn btn-primary"
              onclick='location.href="suupdate?su_idx=${vo.svo.suvo.su_idx}"'>주문진행중</button></c:when>
           </c:choose>
          </td>
          <td>
           <button type="button" class="btn btn-primary" onclick='location.href="infoupdate?sw_idx=${vo.sw_idx}"'>
            상세보기
           </button>
          </td>
         </tr>
        </c:forEach>
       </tbody>
      </table>
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
              <div id="map1" style="width:100%;height:350px;"></div>
             </div>
            </div>
           </div>
          </div>
          <!-- 지도영역 -->
          <!-- 정보영역 -->
          <br />
          <form method="post" action="/mypage/serviceadd/insert" novalidate>
           <input type="hidden" value="${sessionScope.mvo.m_idx}" name="m_idx">
           <div class="input-group input-group-sm mb-3">
            <input class="form-control" type="text" id="t_state" name="s_state" readonly>
            <input class="form-control" type="text" id="t_city" name="s_city" readonly>
            <input type="hidden" id="t_lat" name="lat">
            <input type="hidden" id="t_lng" name="lng">
           </div>
           <br />
           <div class="input-group mb-3">
            <span class="input-group-text" id="t_radius">서비스 가능 범위</span>
            <input type="text" id="t_radius2" name="s_radius" class="form-control" placeholder="m단위 ex)1000m">
           </div>
           <div class="input-group mb-3">
            <span class="input-group-text" id="t_price">서비스 비용 설정</span>
            <select class="form-select form-select-sm" id="t_price" name="s_val1">
             <option value="7000">7.000원</option>
             <option value="6000">6.000원</option>
             <option value="5000">5.000원</option>
             <option value="4000">4.000원</option>
             <option value="3000">3.000원</option>
             <option value="2000">2.000원</option>
            </select>
           </div>

           <!-- 정보영역끝 -->
         </div>
         <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary" onclick="javascript:taksubmit(this.form)">등록</button>
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
         <!-- 정보영역 -->
         <form method="post" action="/mypage/serviceadd/insert" novalidate>
          <input type="hidden" value="${sessionScope.mvo.m_idx}" name="m_idx">
          <div class="input-group input-group-sm mb-3">
           <div class="input-group mb-3">
            <span class="input-group-text">서비스 차량</span>
            <select class="form-select form-select-sm" id="e_car" name="c_idx" onchange="exe()">
             <c:if test="${cwar eq null}">
              <option>등록된 차량이 없습니다</option>
             </c:if>
             <c:if test="${cwar ne null}">
              <option selected disabled>차량을 선택해주세요</option>
              <c:forEach items="${cwar}" var="vo">
               <option value=" ${vo.cvo.c_idx}" data-addr="${vo.cvo.c_state} ${vo.cvo.c_city} ${vo.cvo.c_addr1}">
                ${vo.cvo.c_name}</option>
              </c:forEach>
             </c:if>
            </select>
           </div>
           <!-- 지도 -->
           <div>
            <button id="map2col" style="display: none;" class="btn btn-primary" type="button" data-bs-toggle="collapse"
             data-bs-target="#mapcol" onclick="map2reload()">
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
            <input type="text" id="e_radius2" name="s_radius" class="form-control" placeholder="m단위 ex)1000m">
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
          <!-- 정보영역끝 -->
        </div>
        <div class="modal-footer">
         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
         <button type="button" class="btn btn-primary" onclick="edongsubmit(form)">등록</button>
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







   <script src="https://code.jquery.com/jquery-3.6.4.min.js"
    integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
   <script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8f974dd2f43fefe94e70a9ce228e40e&libraries=services"></script>
   <script>
    let map1;
    let geocoder;
    let geocoder2;

    function taksubmit(form) {
     let ts = $("#t_state").val().trim();
     let tc = $("#t_city").val().trim();
     if (ts.length < 1 || tc.length < 1) {
      alert("위치를 선택해주세요.");
      return;
     }
     let tr = $("#t_radius2").val().trim();
     if (tr.length < 1) {
      alert("서비스 범위를 지정해주세요.");
      document.getElementById("t_radius2").focus();
      return;
     }
     form.submit();
    }

    function edongsubmit(form) {
     let ea = $("#e_addr").val().trim();
     if (ea.length < 1) {
      alert("차량을 선택해주세요.");
      return;
     }
     let er = $("#e_radius2").val().trim();
     if (er.length < 1) {
      alert("서비스 범위를 지정해주세요.");
      document.getElementById("e_radius2").focus();
      return;
     }
     form.submit();
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
       center: new kakao.maps.LatLng(37.48489405082669, 126.90278513630275), // 지도의 중심좌표
       level: 3 // 지도의 확대 레벨
      };

     map1 = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
     geocoder = new kakao.maps.services.Geocoder();
     var markerPosition = new kakao.maps.LatLng(37.48489405082669, 126.90278513630275);

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
       center: new kakao.maps.LatLng(37.48489405082669, 126.90278513630275), // 지도의 중심좌표
       level: 3 // 지도의 확대 레벨
      };

     map2 = new kakao.maps.Map(mapContainer2, mapOption2); // 지도를 생성합니다
     geocoder2 = new kakao.maps.services.Geocoder();
     var markerPosition2 = new kakao.maps.LatLng(37.48489405082669, 126.90278513630275);
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