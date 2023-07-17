<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html>

  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Insert title here</title>
   <style>
    .text-container {
     display: -webkit-box;
     -webkit-line-clamp: 4;
     -webkit-box-orient: vertical;
     overflow: hidden;
    }
   </style>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <link href="../../../css/ramg.css" rel="stylesheet">
   <style>
    @media (max-width: 768px) {
     .font-size-16 {
      font-size: 12px;
     }
    }
   </style>
  </head>

  <body>
   <!--////////// Header Start ////////////-->
   <jsp:include page="mainH.jsp"></jsp:include>
   <!--////////// Header end ////////////-->
   <!--////////// Main start //////////////-->
   <main>
    <div class="container mt-1">
     <h2 class="font-weight-bold text-center mb-4">람쥐썬더 충전소 서비스 소개</h2>
     <div class="text-container">
      <p class="font-size-16" style="text-align: center;">
       람쥐썬더 충전소는 고객의 편의성을 높이기 위해 탁송 서비스와 이동식 서비스를 제공합니다. 이를 통해 고객은 원하는 위치에서 충전할 수 있으며, 이동이 필요한 경우에도 편리하게 충전 서비스를 이용할 수
       있습니다.
      </p>
     </div>
     <div class="container text-center">
      <div class="row row-cols-2">
       <div class="col" style="padding: 0;">
        <img src="../images/car_tak2.png" alt="충전소 이미지" class="img-fluid">
       </div>
       <div class="col" style="background-color: #848CB5;">
        <h3 class="mt-5" style="text-align: left;">탁송 서비스</h3>
        <div class="text-container">
         <p style="text-align: left;">
          이 서비스를 이용하면 고객은 충전이 필요한 위치를 지정할 수 있습니다.
          고객은 충전량을 설정하여 충전을 요청할 수 있습니다.
          람쥐썬더 충전소는 충전이 완료된 후에 충전된 차량을 고객이 원하는 위치로 탁송해줍니다.
          이를 통해 고객은 원하는 위치에서 편리하게 차량을 충전할 수 있습니다.
         </p>
        </div>
        <div class="col-md-3 text-end" style="float: right;">
         <button style="font-family: 'GoryeongStrawberry'; " type="button" class="custom-btn btn-3">
          <a href="/taksong/">서비스 이용하기</a>
         </button>
        </div>
       </div>
       <div class="col" style="background-color: #C6D6F7;">
        <h3 class="mt-5" style="text-align: left;">이동식 서비스</h3>
        <div class="text-container">
         <p style="text-align: left;">
          이 서비스를 이용하면 고객은 원하는 위치에서 기다리면 됩니다.
          고객이 특정 장소에서 기다리면 람쥐썬더 충전소의 기사가 충전차량을 운전하여 이동합니다.
          충전차량이 고객의 위치로 이동하여 충전 서비스를 제공합니다.
          이를 통해 고객은 이동하지 않고도 바로 차량을 충전할 수 있으며, 편의성이 크게 향상됩니다.
         </p>
        </div>
        <div class="col-md-3 text-end" style="float: right;">
         <button style="font-family: 'GoryeongStrawberry'; " type="button" class="custom-btn btn-3">
          <a href="/edongsik/">서비스 이용하기</a>
         </button>
        </div>
       </div>
       <div class="col" style="padding: 0;">
        <img src="../images/car_edon2.png" alt="충전소 이미지" class="img-fluid">
       </div>
      </div>
     </div>
    </div>
   </main>
   <!--////////// Main end //////////////-->
   <!--////////// Foter start //////////////-->
   <jsp:include page="mainF.jsp"></jsp:include>
   <!--////////// Foter end //////////////-->
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
    crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
  </body>

  </html>