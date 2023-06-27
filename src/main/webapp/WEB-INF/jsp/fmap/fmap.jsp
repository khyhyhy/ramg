<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
        <!--////////// Header Start ////////////-->
        <jsp:include page="../main/mainH.jsp"></jsp:include>
        <!--////////// Header end ////////////-->

        <!--////////// Main start //////////////-->
        <main>
            <div class="container-fluid text-center">
                <div class="row">
                  <div class="col-2">
                    <ul class="list-group">
                        <li class="list-group-item">An item</li>
                        <li class="list-group-item">A second item</li>
                        <li class="list-group-item">A third item</li>
                        <li class="list-group-item">A fourth item</li>
                        <li class="list-group-item">And a fifth one</li>
                      </ul>
                  </div>
                  <div class="col-10">
                    <div class="">
                        <div id="map" style="width: 1296px; height:800px;"></div>
                    </div>
                  </div>
                </div>
              </div>
            <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eedecff808e53f9bd6b2000c4b6da49a&libraries=services"></script>
            <script>
                //우선 class="marker"인 요소들 모두 찾아내야 한다.
                let marker_ar = document.querySelectorAll(".marker");

                marker_ar.forEach(function(e){
                    //여기는 검색된 요소들의 수만큼 수행하는 곳!
                    let w = e.offsetWidth + 20;
                    let ml = w/2;
                    e.parentElement.style.top = "80px";
                    e.parentElement.style.marginLeft = -ml+"px";
                    e.parentElement.style.width = w+"px";
                    e.parentElement.previousElementSibling.style.display = "none";
                    e.parentElement.parentElement.style.border = "0px";
                    e.parentElement.parentElement.style.background = "none";
                    e.parentElement.style.left = "50%";
                });
                var markers =[];
                var infowindows = [];
                var container = document.getElementById('map');
                var imageSrc_ok = "../images/greenicon.png";//충전가능 상태
                var imageSrc_redicon = "../images/redicon.png";//고장 및 점검 상태
                var imageSrc_chargeicon = "../images/chargeicon.png";//충전중 상태
                var options = {
                    center: new kakao.maps.LatLng(37.483782, 126.9003409),
                    level: 5
                }; 
                 // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
                 if (navigator.geolocation) {
                
                    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
                    navigator.geolocation.getCurrentPosition(function(position) {
                        
                        var lati = position.coords.latitude, // 위도
                            lon = position.coords.longitude; // 경도
                        console.log(lati);
                        console.log(lon);

                        var locPosition = new kakao.maps.LatLng(lati, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                        message = '<div style="padding:5px;">여기요~~~~?!</div>'; // 인포윈도우에 표시될 내용입니다

                        displayMarker(locPosition, message);//마커,인포 표시함수사용
                        getAddr(lati, lon);

                        function getAddr(lati,lon){
                            let geocoder2 = new kakao.maps.services.Geocoder();
                            let coord = new kakao.maps.LatLng(lati, lon);
                            let callback = function(result, status) {
                                if (status === kakao.maps.services.Status.OK) {
                                    console.log(result[0].address.address_name);

                                    geocoder.addressSearch(result[0].address.address_name, function(result, status) {
                                        console.log("여기요!!!!!!!!!!!!!1");  
                                        //정상적으로 검색이 완료됐다면.....
                                        if (status === kakao.maps.services.Status.OK) {
                                            console.log("여기요!!!!!!!!!!!!!2"); 
                                            <c:forEach items="${ar}" var="vo">
                                                var imageSize = new kakao.maps.Size(24, 35);
                                                console.log("여기요!!!!!!!!!!!!!2"+${vo.cpStat});
                                                if(${vo.cpStat eq '1'}){
                                                    var markerImage = new kakao.maps.MarkerImage(imageSrc_ok, imageSize);
                                                } else if(${vo.cpStat eq '2'}){
                                                    var markerImage = new kakao.maps.MarkerImage(imageSrc_redicon, imageSize); 
                                                } else if(${vo.cpStat eq '3'}){
                                                    var markerImage = new kakao.maps.MarkerImage(imageSrc_chargeicon, imageSize); 
                                                }
                                                var pos = new kakao.maps.LatLng('${vo.lat}', '${vo.longi}');
                                                console.log("여기요!!!!!!!!!!!!!"+pos); 
                                                var customOverlay = new kakao.maps.CustomOverlay({
                                                    position: pos,
                                                    content: '<div class="marker">${vo.csNm}</div>',
                                                    xAnchor: 0.3,
                                                    yAnchor: 0.91
                                                });
                                                customOverlay.setMap(map);
                                                infowindows.push(customOverlay);

                                                var marker = new kakao.maps.Marker({
                                                    position: pos,
                                                    image: markerImage
                                                });

                                                marker.setMap(map);
                                                markers.push(marker);
                                                
                                            </c:forEach>
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

		        var map = new kakao.maps.Map(container, options);

                var geocoder = new kakao.maps.services.Geocoder();

                function displayMarker(locPosition, message) {

                    // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({  
                        map: map, 
                        position: locPosition
                    }); 

                    var iwContent = message, // 인포윈도우에 표시할 내용
                        iwRemoveable = true;

                    // 인포윈도우를 생성합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        content : iwContent,
                        removable : iwRemoveable
                    });

                    // 인포윈도우를 마커위에 표시합니다 
                    infowindow.open(map, marker);

                    // 지도 중심좌표를 접속위치로 변경합니다
                    map.setCenter(locPosition);   
                } 
            </script>
        </main>
        <!--////////// Main end //////////////-->
        <!--////////// Foter start //////////////-->
        <jsp:include page="../main/mainF.jsp"></jsp:include>
        <!--////////// Foter end //////////////-->
    
</body>
</html>
