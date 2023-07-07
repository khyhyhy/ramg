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
        .box {
            width: 120px;
            height: 80px;
            padding: 10px;
            display: inline-block;
            flex-direction: column;
            align-items: center;
            text-align: center;
            background-color: #81F7F3;
        }
        .fff{
            font-family: 'GoryeongStrawberry';
            color: #333333;
            
        }
    </style>
</head>
<body>

    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eedecff808e53f9bd6b2000c4b6da49a&libraries=services"></script>
    <script>
        var geocoder = new kakao.maps.services.Geocoder();
        // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
        if (navigator.geolocation) {
    
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {
            //위도경도를 불러온다.
            var lati = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도 -->
            getAddr(lati, lon);
                //주소를 불러오는 함수
            function getAddr(lati,lon){
                let geocoder2 = new kakao.maps.services.Geocoder();
                
                let coord = new kakao.maps.LatLng(lati, lon);

                let callback = function(result, status) {

                    if (status === kakao.maps.services.Status.OK) {

                        console.log(result);
                        var city = result[0].address.address_name;
                        //console.log(result[0].road_address.address_name);
                        //console.log(city+"/1번");
                        geocoder.addressSearch(result[0].address.address_name, function(result, status) {
                                
                            //console.log(city+"/2번");
                            //정상적으로 검색이 완료됐다면.....
                            if (status === kakao.maps.services.Status.OK) {
                                // 강제 전송 코드
                                var form = document.createElement('form');
                                form.setAttribute('method', 'post');
                                form.setAttribute('action', '/fmap/');
                                form.style.display = 'none';

                                var cityInput = document.createElement('input');
                                cityInput.setAttribute('type', 'hidden');
                                cityInput.setAttribute('name', 'city');
                                cityInput.setAttribute('value', city);

                                form.appendChild(cityInput);
                                document.body.appendChild(form);
                                form.submit();
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
    </script>
</body>
</html>
