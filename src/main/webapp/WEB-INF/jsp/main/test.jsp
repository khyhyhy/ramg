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
   <link href="../../../css/ramg.css" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <style>
    #wrap {
     border-radius: 5px;
     position: absolute;
     left: 0;
     bottom: 40px;
     width: 288px;
     height: 132px;
     margin-left: -144px;
     text-align: left;
     overflow: hidden;
     font-size: 12px;
     line-height: 1.5;
     background: #888;
    }

    #title {
     padding: 5px 0 0 10px;
     height: 30px;
     background: #eee;
     border-bottom: 1px solid #ddd;
     font-size: 18px;
     font-weight: bold;
    }

    #close {
     position: absolute;
     top: 10px;
     right: 10px;
     color: #000;
     width: 17px;
     height: 17px;
     background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
    }

    #close:hover {
     cursor: pointer;
    }

    #body {
     position: relative;
     overflow: hidden;
    }

    #desc {
     position: relative;
     margin: 13px 0 0 90px;
     height: 75px;
    }

    #ellipsis {
     overflow: hidden;
     text-overflow: ellipsis;
     white-space: nowrap;
     color: azure;
    }

    #jibun {
     font-size: 11px;
     color: #888;
     margin-top: -2px;
    }

    #img {
     border: 0px;
     position: absolute;
     top: 6px;
     left: 5px;
     width: 73px;
     height: 71px;
     border: 0px solid #ddd;
     color: #888;
     overflow: hidden;
    }

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

    .plus {
     position: absolute;
     top: 0px;
     right: 0px;
     width: 31px;
     height: 31px;
     background-color: #eaeaea;
     cursor: pointer;
     z-index: 1;
    }

    .plus:before {
     position: absolute;
     top: 50%;
     left: 50%;
     width: 16px;
     height: 2px;
     margin: -1px 0 0 -8px;
     background: #fff;
     content: '';
    }

    .plus:after {
     position: absolute;
     top: 50%;
     left: 50%;
     width: 2px;
     height: 16px;
     margin: -8px 0 0 -1px;
     background: #fff;
     content: '';
    }

    .ellipsis {
     overflow: hidden;
     text-overflow: ellipsis;
     display: -webkit-box;
     -webkit-line-clamp: 3;
     -webkit-box-orient: vertical;
    }

    @media (max-width: 768px) {
     .box {
      width: 100%;
      margin-bottom: 20px;
     }
    }
   </style>
  </head>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
   integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  <body>
   <!--////////// Header Start ////////////-->
   <jsp:include page="mainH.jsp"></jsp:include>
   <!--////////// Header end ////////////-->
   <!--////////// Main start //////////////-->


   <div class="container">
    <div class="row justify-content-center">
     <div class="col-md-12">
      <div class="my-5">
       <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
        <div class="carousel-indicators">
         <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
          aria-current="true" aria-label="Slide 1"></button>
         <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
          aria-label="Slide 2"></button>
         <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
          aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
           <a href="#" onclick="conf()"><img style="object-fit: contain; width: 500px; height: 500px;" src="../images/card3.png" class="d-block w-100"
            alt="..."></a>
          </div>
         <div class="carousel-item">
          <a href="/taksong/"><img style="object-fit: contain; width: 500px; height: 500px;" src="../images/card1.png" class="d-block w-100"
           alt="..."></a>
         </div>
         <div class="carousel-item">
          <a href="/edongsik/"><img style="object-fit: contain; width: 500px; height: 500px;" src="../images/card2.png" class="d-block w-100"
           alt="..."></a>
         </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
         data-bs-slide="prev">
         <span class="carousel-control-prev-icon" aria-hidden="true"></span>
         <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
         data-bs-slide="next">
         <span class="carousel-control-next-icon" aria-hidden="true"></span>
         <span class="visually-hidden">Next</span>
        </button>
       </div>

      </div>
      <div class="d-flex my-5 justify-content-center">
       <div class="col-md-5 p-5 px-3 rounded-3 ms-3 me-5" style="border:5px solid #acd2dd; color: #464646;">
        <table class="table">
         <colgroup>
          <col width="*">
          <col width="210px">
         </colgroup>
         <thead>
          <tr>
           <th colspan="2" style="color: #4d4d4d; font-size: x-large;">공지사항</th>
          </tr>
         </thead>
         <tbody>
          <c:forEach var="bvo" items="${b_ar}" varStatus="status">
           <tr>
            <td>
             <a style="color:#4d4d4d!important;" href="/support/notice_view?b_idx=${bvo.b_idx}&cPage=1">
              ${bvo.b_title}</a>
            </td>
            <td style="text-align: right; color: #4d4d4d;">${bvo.bbslog.bl_date}</td>
           </tr>
          </c:forEach>
         </tbody>
        </table>
        <a href="/support/notice" style="float: right; font-size: large;">공지 더보기<i class="fa fa-arrow-circle-right ms-2"
          aria-hidden="true"></i></a>
       </div>
       <div class="col-md-5 p-5 px-3 rounded-3" style="border:5px solid #acd2dd; color: #464646;">
        <table class="table">
         <thead>
          <tr>
           <th colspan="3" style="color: #4d4d4d; font-size: x-large;">전기차 충전요금</h2>
            </td>
          </tr>
         </thead>
         <tr>
          <th>구분</th>
          <th>완속</th>
          <th>급속</th>
         </tr>
         <tr>
          <th>연비</th>
          <td>6.3km/kWh</td>
          <td>6.3km/kWh</td>
         </tr>
         <tr>
          <th>연료비</th>
          <td>200원/kWh</td>
          <td>292.9원/kWh</td>
         </tr>
         <tr>
          <th>100km당 연료비</th>
          <td>3,175원</td>
          <td>4,650원</td>
         </tr>
         <tr>
          <th>연간 연료비</th>
          <td>44만원</td>
          <td>63.8만원</td>
         </tr>
        </table>
       </div>
       <!-- <div class="col-md-3 p-5 rounded-3 ms-3 me-5" style="border:5px solid #0DCAF0; color: #464646;">
                <h2 style="font-size: 24px; font-weight: bold;">람쥐썬더 충전소 서비스 소개</h2>
                <form id="introduceForm">
                  <button style="float: right;" class="btn btn-outline-info" type="button" onclick="redirectToIntroduce()">더보기</button>
                </form>
              </div> -->

      </div>
     </div><!--10-->
    </div>
   </div>





   <!--////////// Main end //////////////-->
   <!--////////// Foter start //////////////-->
   <jsp:include page="mainF.jsp"></jsp:include>
   <!--////////// Foter end //////////////-->

  </body>
  <script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eedecff808e53f9bd6b2000c4b6da49a&libraries=services"></script>
   <script>
    function conf() {
     if (confirm("위치 기반 서비스를 이용하여 현재위치를 조회하시겠습니까?")) {
      johoe();
     } else {
      alert("현재위치를 조회해주세요.");
     }
    }
    function johoe() {

     var geocoder = new kakao.maps.services.Geocoder();
     // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
     if (navigator.geolocation) {

      // GeoLocation을 이용해서 접속 위치를 얻어옵니다
      navigator.geolocation.getCurrentPosition(function (position) {
       //위도경도를 불러온다.
       var lati = position.coords.latitude, // 위도
        lon = position.coords.longitude; // 경도 -->
       getAddr(lati, lon);
       //주소를 불러오는 함수
       function getAddr(lati, lon) {
        let geocoder2 = new kakao.maps.services.Geocoder();

        let coord = new kakao.maps.LatLng(lati, lon);

        let callback = function (result, status) {

         if (status === kakao.maps.services.Status.OK) {

          //console.log(result);
          var city = result[0].address.address_name;
          //console.log(result[0].road_address.address_name);
          //console.log(city+"/1번");
          geocoder.addressSearch(result[0].address.address_name, function (result, status) {

           //console.log(city+"/2번");
           //정상적으로 검색이 완료됐다면.....
           if (status === kakao.maps.services.Status.OK) {
            // 강제 전송 코드
            var form = document.createElement('form');
            form.setAttribute('method', 'post');
            form.setAttribute('action', '/fmap/');
            form.style.display = 'none';

            var cityInput3 = document.createElement('input');
            cityInput3.setAttribute('type', 'hidden');
            cityInput3.setAttribute('name', 'city');
            cityInput3.setAttribute('value', city);

            form.appendChild(cityInput3);

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

    }

   </script>

  </html>