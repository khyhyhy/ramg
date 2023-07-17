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
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-JyB+g0gmjSY68DpznWWC1u/NQLVzIm1POyQ7JM7jyekvBssmQhBemz73NFcf7RrG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@500&display=swap" rel="stylesheet">
    <link href="../../../css/ramg.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
    #wrap {border-radius: 5px; position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px; line-height: 1.5; background: #888;}
    #title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    #close {position: absolute;top: 10px;right: 10px;color: #000;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    #close:hover {cursor: pointer;}
    #body {position: relative;overflow: hidden;}
    #desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    #ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap; color: azure;}
    #jibun {font-size: 11px;color: #888;margin-top: -2px;}
    #img {border: 0px; position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 0px solid #ddd;color: #888;overflow: hidden;}
.box1 {
    width: 85px;
    height: 80px;
    padding: 10px;
    display: inline-block;
    flex-direction: column;
    align-items: center;
    text-align: center;
    background-color: #81F7F3;
}

.custom-btn {
    width: 40px;
    height: 40px;
    padding: 10px 25px;
    border: 2px solid #000;
    font-family: 'Lato', sans-serif;
    font-size: 15px;
    font-weight: 500;
    background: transparent;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    display: inline-block;
  }
/* 3 */
.btn-3 {
    line-height: 39px;
    padding: 0;
  }
  .btn-3:hover{
    background: transparent;
    color: #000;
  }
  .btn-3 span {
    position: relative;
    display: block;
    width: 100%;
    height: 100%;
  }
  .btn-3:before,
  .btn-3:after {
    position: absolute;
    content: "";
    left: 0;
    top: 0;
    background: #000;
    transition: all 0.3s ease;
  }
  .btn-3:before {
    height: 0%;
    width: 2px;
  }
  .btn-3:after {
    width: 0%;
    height: 2px;
  }
  .btn-3:hover:before {
    height: 100%;
  }
  .btn-3:hover:after {
    width: 100%;
  }
  .btn-3 span:before,
  .btn-3 span:after {
    position: absolute;
    content: "";
    right: 0;
    bottom: 0;
    background: #000;
    transition: all 0.3s ease;
  }
  .btn-3 span:before {
    width: 2px;
    height: 0%;
  }
  .btn-3 span:after {
    width: 0%;
    height: 2px;
  }
  .btn-3 span:hover:before {
    height: 100%;
  }
  .btn-3 span:hover:after {
    width: 100%;
  }
  

  /***************/
   /*사진 삭제 버튼*/
   .box {
    position: absolute;
    top: 18px;
    left : 1264px;
    border-radius: 15px;
    border: none;
    z-index: 3;
   

}
.kmap{
    z-index: 2;     
}
.in{
    z-index: 4;
}

</style>
<body>
        <!--////////// Header Start ////////////-->
        <jsp:include page="../main/mainH.jsp"></jsp:include>
        <!--////////// Header end ////////////-->

        <!--////////// Main start //////////////-->
        <div class="container-fluid text-center">
            <div class="row d-flex">
                <div class="col-md-2" style="background-color: #8b8b8b; height:900px;" >
                    <div class="list-group-item py-5" style="color: #fff; font-size: x-large;">내 주변 가까운 충전소</div>
                    <input type="button" onclick="test1()" value="test1"/>
                    <input type="button" onclick="test2()" value="test2"/>
                    <div class="rounded p-2 mb-2" style="background-color: #eee;">
                        <div class="container max-width mt-3 mb-4">
                            <button class="custom-btn btn-3 fff" ><span>1km</span></button>
                            <button class="custom-btn btn-3 fff" ><span>2km</span></button>
                            <button class="custom-btn btn-3 fff" ><span>3km</span></button>
                            <button class="custom-btn btn-3 fff" ><span>4km</span></button>
                            <button class="custom-btn btn-3 fff" ><span>5km</span></button>
                        </div>
                        <div class="col-2" style="">
                            <ul class="list-group" id="list1" style="width:280px; height: 680px; overflow-y: scroll;">
                                <!-- ajax로 받아온 html문서 적용 -->
                            </ul>
                        </div> 
                    </div>  
                </div>
                <div class ="col-md-10" style="padding-right: 0; padding-left: 0;">
                    <div  style="padding-left: 0; position: relative;">
                        <div style="background-color:transparent; width: 300px; height: 300px; " class="box">
                            <div id="myposition" class="col-6 fff" style="padding-left: 0; width:100%; padding-top: 30px; background-color: #81F7F3;"></div>
                            <div style="background-color: #81F7F3;" class="in">
                                <div class="box1">
                                    <p class="fff"><img src="../../../images/map_marker_green.svg" width="20px"></i>
                                        <br/>충전가능</p>
                                </div>
                                <div class="box1" style="border-left: none;">
                                    <p class="fff"><img src="../../../images/map_marker_red.svg" width="20px"><br/>불가능</p>
                                </div>
                                <div class="box1" style="border-left: none;">
                                    <p class="fff"><img src="../../../images/bolt-solid.svg" width="25px"><br/>충전중</p> 
                                </div>
                            </div>
                        </div>
                        <div id="map" class="kmap" style="width: 100%; height: 900px;"></div>
                    </div>
                </div>
            </div>
        </div>
        <!--////////// Main end //////////////-->

        <!--////////// Foter start //////////////-->
        <jsp:include page="../main/mainF.jsp"></jsp:include>
        <!--////////// Foter end //////////////-->
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eedecff808e53f9bd6b2000c4b6da49a&libraries=services"></script>
        <script>
            
            var markers =[];//마커 배열
            var markers2 =[];//내 주변 마커 배열
            var overlays = [];//커스텀오버레이 배열
            var overlays2 = [];//내 주변 커스텀오버레이 배열
            var container = document.getElementById('map');
            
            var imageSrc_ok = "../images/map_marker_green.svg";//충전가능 상태
            var imageSrc_redicon = "../images/map_marker_red.svg";//고장 및 점검 상태
            var imageSrc_chargeicon = "../images/bolt-solid.svg";//충전중 상태 
            

            var options = {
                center: new kakao.maps.LatLng(37.483782, 126.9003409),
                level: 7
            };
            var radius = 5000;
        
            var map = new kakao.maps.Map(container, options);
            var geocoder = new kakao.maps.services.Geocoder();
            // 원(Circle)의 옵션으로 넣어준 반지름
            
             // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
             if (navigator.geolocation) {
            
                // GeoLocation을 이용해서 접속 위치를 얻어옵니다
                navigator.geolocation.getCurrentPosition(function(position) {
                    //위도경도를 불러온다.
                    var lati = position.coords.latitude, // 위도
                        lon = position.coords.longitude; // 경도 -->
                    //var lati = 35.1801639, // 위도
                    //    lon = 129.074660; // 경도 -->
                    //console.log(lati);
                    //console.log(lon);

                    var locPosition = new kakao.maps.LatLng(lati, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                    message = '<div style="padding:5px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다
                    
                    displayMarker(locPosition, message);//마커,인포 표시함수사용
                    //주소를 불러오는 함수 호출
                    getAddr(lati, lon);
                    //주소를 불러오는 함수
                    function getAddr(lati,lon){
                        let geocoder2 = new kakao.maps.services.Geocoder();

                        let coord = new kakao.maps.LatLng(lati, lon);

                        let callback = function(result, status) {

                            if (status === kakao.maps.services.Status.OK) {
                                //console.log(result[0].address.address_name);
                                var city = result[0].address.address_name;

                                //var city = "부산광역시 연제구 중앙대로 1001";
                                //console.log(city+"/////////////////////////////");

                                geocoder.addressSearch(result[0].address.address_name, function(result, status) {
                                      
                                    //정상적으로 검색이 완료됐다면.....
                                    if (status === kakao.maps.services.Status.OK) {
                                        var ind = 0;
                                        var mnd = 0;
                                        var type;
                                        <c:forEach items="${ar}" var="vo">
                                            <c:if test = "${vo.cpTp eq '1'}">
                                                type = 'B타입(5핀)';
                                            </c:if>
                                            <c:if test = "${vo.cpTp eq '2'}">
                                                type = 'C타입(5핀)';
                                            </c:if>
                                            <c:if test = "${vo.cpTp eq '3'}">
                                                type = 'BC타입(5핀)';
                                            </c:if>
                                            <c:if test = "${vo.cpTp eq '4'}">
                                                type = 'BC타입(7핀)';
                                            </c:if>
                                            <c:if test = "${vo.cpTp eq '5'}">
                                                type = 'DC차데모';
                                            </c:if>
                                            <c:if test = "${vo.cpTp eq '6'}">
                                                type = 'AC3상';
                                            </c:if>
                                            <c:if test = "${vo.cpTp eq '7'}">
                                                type = 'DC콤보';
                                            </c:if>
                                            <c:if test = "${vo.cpTp eq '8'}">
                                                type = ' DC차데모+DC콤보';
                                            </c:if>
                                            <c:if test = "${vo.cpTp eq '10'}">
                                                type = 'DC차데모+AC3상+DC콤보';
                                            </c:if>
                                            var imageSize = new kakao.maps.Size(24, 35);

                                            var pos = new kakao.maps.LatLng('${vo.lat}', '${vo.longi}');
                                            var overlayid = "idnum"+ ind++;
                                            var content = document.createElement('div');
                                            content.className = overlayid;
                                            content.style = 'display : none;';
                                            content.innerHTML = '<div id="wrap">' + 
                                            '       <div id="info">' + 
                                                '        <div id="title">' + 
                                            '            ${vo.csNm}' + 
                                            '            <span id="close" onClick="removeOverlay(\''+overlayid+'\')" title="닫기"></span>' + 
                                            '        </div>' + 
                                            '        <div id="body">' + 
                                                '            <div id="img">' +
                                            '                <img src="../images/chargestation.png" width="73" height="70"/>' +
                                            '           </div>' +  
                                            '            <div id="desc">' + 
                                            '                <div id="ellipsis">${vo.addr}<br/>'+type+'</div>' +   
                                            '            </div>' + 
                                            '        </div>' +    
                                            '    </div>' +    
                                            '</div>';
                                            
                                            // 마커 위에 커스텀오버레이를 표시합니다
                                            // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
                                            <c:if test = "${vo.cpStat eq '1'}">
                                                var markerImage = new kakao.maps.MarkerImage(imageSrc_ok, imageSize);
                                            </c:if>
                                             <c:if test = "${vo.cpStat eq '2'}">
                                                    var markerImage = new kakao.maps.MarkerImage(imageSrc_chargeicon, imageSize); 
                                            </c:if>
                                            <c:if test = "${vo.cpStat eq '3'}">
                                                    var markerImage = new kakao.maps.MarkerImage(imageSrc_redicon, imageSize); 
                                            </c:if>
                                            var marker = new kakao.maps.Marker({
                                                position: pos,
                                                image: markerImage,
                                                title:overlayid
                                            });
                                            
                                            //marker.setMap(map);
                                            markers.push(marker);
                                            
                                            var overlay = new kakao.maps.CustomOverlay({
                                                content: content,
                                                position: marker.getPosition(),
                                                map: map
                                            });

                                            overlays.push(overlay);
                                            </c:forEach>

                                            //화면에 자신의 위치 표시
                                            let str2 ="";
                                            str2 += city;
                                            $("#myposition").html(str2);
                                            
                                            
                                            function displayList() {
                                                var str = "";
                                                var d = 1;
                                                
                                                for (var a = 0; a < overlays2.length; a++) {
                                                    var overlay = overlays2[a];
                                                    var content = overlay.getContent();
                                                    var address = $(content).find("#ellipsis").text();
                                                    var type = $(content).find("#desc > .fff").text();
                                                    
                                                    str += '<li class="list-group-item">';
                                                    str += '<a style="text-decoration: none;" class="tag-link" href="#" data-index="' + a + '">';
                                                    str += d + '. ' + address + '<br/>' + type;
                                                    str += '</a>';
                                                    str += '</li>';
                                                    
                                                    d++;
                                                }
                                                
                                                $("#list1").html(str);
                                            }
                                            
                                            // 목록 초기화 함수
                                            function clearList() {
                                                overlays2 = [];
                                                markers2 = [];
                                                displayList();
                                            }
                                            //경로 초기화 함수
                                            function clearPath() {
                                                polyline.setMap(null);
                                            }

                                            if(radius == 5000){
                                                for (var i = 0; i < markers.length; i++) {
                                                    var c1 = locPosition;
                                                    var c2 = markers[i].getPosition();
                                                    //console.log(c2);
                                                    var poly = new daum.maps.Polyline({
                                                        // map: map, 을 하지 않아도 거리는 구할 수 있다.
                                                        path: [c1, c2]
                                                    });
                                                    var dist = poly.getLength();
                                              
                                                  if (dist <= radius) { // 반경 범위 내에 있는 마커인지 확인 (반경 범위를 미터 단위로 계산하기 위해 1000을 곱함)
                                                    console.log(radius);
                                                    overlays2.push(overlays[i]);
                                                    markers2.push(markers[i]);
                                                    markers[i].setMap(map); // 반경 범위 내에 있는 마커는 지도에 표시
                                                  } else {
                                                    markers[i].setMap(null); // 반경 범위를 벗어나는 마커는 지도에서 숨김
                                                  }
                                                }
                                                //오베레이즈2배열을 소트 함수를 이용해서 오름차순시킴
                                            overlays2.sort(function(a, b) {
                                                var c1 = locPosition;
                                                var c2a = a.getPosition();
                                                var c2b = b.getPosition();
        
                                                var polyA = new daum.maps.Polyline({
                                                    path: [c1, c2a]
                                                });
                                                var polyB = new daum.maps.Polyline({
                                                    path: [c1, c2b]
                                                });
        
                                                var distA = polyA.getLength();
                                                var distB = polyB.getLength();
        
                                                return distA - distB;
        
                                                });
                                                displayList();
                                            }
                                            $('.custom-btn').click(function() {
                                                var buttonText = $(this).text(); // 버튼의 텍스트 가져오기
                                                radius = parseInt(buttonText.replace(/[^0-9]/g, '')); // 버튼 텍스트에서 숫자 부분 추출하여 반경 범위로 설정
                                                clearList(); // 목록 초기화
                                                if(radius == 5){
                                                    map.setCenter(locPosition);
                                                    map.setLevel(7);   
                                                }else if(radius == 4){
                                                    map.setCenter(locPosition);
                                                    map.setLevel(6); 
                                                }else if(radius == 3){
                                                    map.setCenter(locPosition);
                                                    map.setLevel(6); 
                                                }else if(radius == 2){
                                                    map.setCenter(locPosition);
                                                    map.setLevel(6); 
                                                }else if(radius == 1){
                                                    map.setCenter(locPosition);
                                                    map.setLevel(4);
                                                }
                                                for (var i = 0; i < markers.length; i++) {
                                                    var c1 = locPosition;
                                                    var c2 = markers[i].getPosition();
                                                    //console.log(c2);
                                                    var poly = new daum.maps.Polyline({
                                                        // map: map, 을 하지 않아도 거리는 구할 수 있다.
                                                        path: [c1, c2]
                                                    });
                                                    var dist = poly.getLength();
                                              
                                                  if (dist <= radius * 1000) { // 반경 범위 내에 있는 마커인지 확인 (반경 범위를 미터 단위로 계산하기 위해 1000을 곱함)
                                                    console.log(radius* 1000);
                                                    overlays2.push(overlays[i]);
                                                    markers2.push(markers[i]);
                                                    markers[i].setMap(map); // 반경 범위 내에 있는 마커는 지도에 표시
                                                  } else {
                                                    markers[i].setMap(null); // 반경 범위를 벗어나는 마커는 지도에서 숨김
                                                  }
                                                }
                                                //오베레이즈2배열을 소트 함수를 이용해서 오름차순시킴
                                            overlays2.sort(function(a, b) {
                                                var c1 = locPosition;
                                                var c2a = a.getPosition();
                                                var c2b = b.getPosition();
        
                                                var polyA = new daum.maps.Polyline({
                                                    path: [c1, c2a]
                                                });
                                                var polyB = new daum.maps.Polyline({
                                                    path: [c1, c2b]
                                                });
        
                                                var distA = polyA.getLength();
                                                var distB = polyB.getLength();
        
                                                return distA - distB;
        
                                                });
                                                displayList();
                                                clearPath();
                                              });
                                            
                                        
                                        //마커 클릭시 오버레이 커스텀 나타남
                                        for(i=0; i<markers.length; i++){
                                            kakao.maps.event.addListener(markers[i], 'click', function(){
                                                $('.'+this.Gb).css('display', 'block');
                                            })   
                                        }
                                        var polyline, startMarker;
                                        //비동기식 전송으로 경로를 불러옴
                                        $(document).on("click", ".tag-link", function(event) {
                                            // 몇 번째 항목인지 가져옵니다.
                                            console.log("여기요");
                                            if (startMarker) {
                                                startMarker.setMap(null); // 마커 숨기기
                                                startMarker = null; // 변수 초기화
                                            }
                                            if (polyline) {
                                                polyline.setMap(null); // 마커 숨기기
                                                polyline = null; // 변수 초기화
                                            }
                                            var index = $(this).data("index");
                                            var lon2 = overlays2[index].getPosition().La;
                                            var lati2 = overlays2[index].getPosition().Ma;
                                            var lon3 = lon;
                                            var lati3 = lati;
                                            $.ajax({
                                            url: '/here',
                                            type: "POST",
                                            dataType: "json",
                                            data: { lati3: lati3, lon3: lon3, lati2: lati2, lon2: lon2 }
                                            }).done(function(data) {
                                            

                                            // 루트 그리기 위해 json에서 데이터를 꺼냄
                                            var route = data.key[0];
                                            var path = route.sections[0].roads;
                                            var linePath = [];
                                            for (var i = 0; i < path.length; i++) {
                                                var vertexes = path[i].vertexes;
                                                for (var j = 0; j < vertexes.length; j += 2) {
                                                var point = new kakao.maps.LatLng(vertexes[j + 1], vertexes[j]);
                                                linePath.push(point);
                                                }
                                            }
                                            polyline = new kakao.maps.Polyline({
                                                path: linePath,
                                                strokeWeight: 5,
                                                strokeColor: '#0080FF',
                                                strokeOpacity: 1,
                                                strokeStyle: 'solid'
                                            });

                                            polyline.setMap(map); // 경로를 맵에 추가
                                            
                                            // 출발지 마커
                                            startMarker = new kakao.maps.Marker({
                                                map: map,
                                                position: new kakao.maps.LatLng(route.summary.origin.y, route.summary.origin.x)
                                            });

                                            }).fail(function(err) {
                                            console.log(err + " Failed222222222222222222");
                                            });
                                        });
                                    }//IF끝
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
            
            // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
            function removeOverlay(overlayid) {
                $('.'+overlayid).css('display', 'none');
            }

            // 지도 위에 표시되고 있는 마커를 모두 제거합니다
            function removeMarker() {
                for ( var i = 0; i < markers.length; i++ ) {
                    markers[i].setMap(null);
                }   
                markers = [];
            }

        </script>
</body>
</html>
