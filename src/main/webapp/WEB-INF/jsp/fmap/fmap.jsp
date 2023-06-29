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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

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
    </style>
</head>
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
                    </ul>
                  </div>
                  <div class="col-10">
                    <div class="">
                        <div id="map" style="width: 1296px; height:800px;"></div>
                    </div>
                  </div>
                </div>
              </div>
            
        </main>
        <!--////////// Main end //////////////-->

        <!--////////// Foter start //////////////-->
        <jsp:include page="../main/mainF.jsp"></jsp:include>
        <!--////////// Foter end //////////////-->
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eedecff808e53f9bd6b2000c4b6da49a&libraries=services"></script>
        <script>
            $(function(){
                alert("dmdjdjdjdjdj")
                
            });
            var markers =[];
            var overlays = [];
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
                    //위도경도를 불러온다.
                    var lati = position.coords.latitude, // 위도
                        lon = position.coords.longitude; // 경도
                    console.log(lati);
                    console.log(lon);

                    var locPosition = new kakao.maps.LatLng(lati, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                    message = '<div style="padding:5px;">여기요~~~~?!</div>'; // 인포윈도우에 표시될 내용입니다

                    displayMarker(locPosition, message);//마커,인포 표시함수사용
                    //주소를 불러오는 함수 호출
                    getAddr(lati, lon);
                    //주소를 불러오는 함수
                    
                    function getAddr(lati,lon){
                        let geocoder2 = new kakao.maps.services.Geocoder();

                        let coord = new kakao.maps.LatLng(lati, lon);

                        let callback = function(result, status) {

                            if (status === kakao.maps.services.Status.OK) {

                                console.log(result[0].address.address_name);

                                geocoder.addressSearch(result[0].address.address_name, function(result, status) {
                                      
                                    //정상적으로 검색이 완료됐다면.....
                                    if (status === kakao.maps.services.Status.OK) {
                                        var ind = 0;
                                        var mnd = 0;
                                        <c:forEach items="${ar}" var="vo">
                                            var imageSize = new kakao.maps.Size(24, 35);

                                            <c:if test = "${vo.cpStat eq '1'}">
                                                var markerImage = new kakao.maps.MarkerImage(imageSrc_ok, imageSize);
                                            </c:if>
                                            <c:if test = "${vo.cpStat eq '2'}">
                                                var markerImage = new kakao.maps.MarkerImage(imageSrc_redicon, imageSize); 
                                            </c:if>
                                            <c:if test = "${vo.cpStat eq '3'}">
                                                var markerImage = new kakao.maps.MarkerImage(imageSrc_chargeicon, imageSize); 
                                            </c:if>
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
                                            '                <div id="ellipsis">${vo.addr}</div>' + 
                                            '                <div id="jibun">땅따닥뷁</div>' + 
                                            '            </div>' + 
                                            '        </div>' +    
                                            '    </div>' +    
                                            '</div>';
                                            
                                            // 마커 위에 커스텀오버레이를 표시합니다
                                            // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
                                            var marker = new kakao.maps.Marker({
                                                position: pos,
                                                image: markerImage,
                                                title:overlayid
                                            });
                                        
                                            

                                            //marker.setMap(map);
                                            markers.push(marker);
                                            console.log(markers);

                                            var overlay = new kakao.maps.CustomOverlay({
                                                content: content,
                                                position: marker.getPosition(),
                                                map: map
                                            });
                                            
                                            

                                            </c:forEach>

                                            for(i=0; i<markers.length; i++){
                                                console.log(i, markers[i]);
                                                kakao.maps.event.addListener(markers[i], 'click', function(){
                                                    
                                                    console.log(this);
                                                    $('.'+this.Gb).css('display', 'block');
                                                    
                                                })
                                                markers[i].setMap(map); 
                                                
                                            }

                                            
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
            
            
            
            // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
            function removeOverlay(overlayid) {
                $('.'+overlayid).css('display', 'none');
            }

            
            
        </script>
</body>
</html>
