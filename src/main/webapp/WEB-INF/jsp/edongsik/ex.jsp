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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
    crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>

  </head>
  <style>
    .rating {
      width: 240px;
      padding: 10px;
      margin:0 auto;
      position: relative;
      direction: rtl;
      }
      
      .rating input {
      position: absolute;
      width: 35px;
      height: 50px;
      cursor: pointer;
      transform: translateX(52px);
      opacity: 0;
      z-index: 5;
      }
      
      .rating input:nth-of-type(1) {
      right: 63px;
      }
      .rating input:nth-of-type(2) {
      right: 108px;
      }
      .rating input:nth-of-type(3) {
      right: 153.5px;
      }
      .rating input:nth-of-type(4) {
      right: 198px;
      }
      .rating input:nth-of-type(5) {
      right: 242px;
      }
      .rating input:nth-of-type(6) {
      right: 300px;
      }
      .rating input:checked ~ .star:after, .rating input:hover ~ .star:after {
      content: '\f005';
      }
      .rating .star {
      display: inline-block;
      font-family: FontAwesome;
      font-size: 42px;
      color: black;
      cursor: pointer;
      margin: 0px;
      }
      .rating .star:after {
      content: '\f006';
      }
      .rating .star:hover ~ .star:after, .rating .star:hover:after {
      content: '\f005';
      }
  </style>

  <body>
   <!--////////// Header Start ////////////-->
   <jsp:include page="../main/mainH.jsp"></jsp:include>
   <!--////////// Header end ////////////-->

   <!--////////// Main start //////////////-->
   <div class="container">
    <main>
     <!-- <c:if test="${sessionScope.evo == null}"></c:if> -->

     <div style="display: flex; justify-content: center; margin-top: 50px;">
      <button type="button" onclick="location.href='??'">충전하기</button>
      <button type="button" onclick="location.href='??'" style="margin-left: 50px; margin-right: 50px;">현재상황</button>
      <button type="button" onclick="location.href='map'">이용내역</button>
     </div>




     <div class="text-center">
      <div class="row">
       <div class="col">
        상단영역
       </div>
       </div>
      
      <form action="//" method="post">
       <div class="row">
          <div class="col">
            <div class="rating">
              <input type="radio" name="r_score" id="r_score" value="5"/><span class="star"></span>
              <input type="radio" name="r_score" id="r_score" value="4"/><span class="star"></span>
              <input type="radio" name="r_score" id="r_score" value="3"/><span class="star"></span>
              <input type="radio" name="r_score" id="r_score" value="2"/><span class="star"></span>
              <input type="radio" name="r_score" id="r_score" value="1"/><span class="star"></span>
            </div>
          </div>
       </div>
     
     </div>
     <input type="hidden" id="s_c_idx" name="s_c_idx" />
     <input type="hidden" id="s_s_idx" name="s_s_idx" />
     <input type="hidden" id="s_sprice" name="s_sprice" />
     <input type="hidden" id="s_cprice" name="s_cprice" />
     </form>
    </main>
   </div>
   <!--////////// Main end //////////////-->
   <!--////////// Foter start //////////////-->
   <jsp:include page="../main/mainF.jsp"></jsp:include>
   <!--////////// Foter end //////////////-->
   <script>

   </script>
  </body>

  </html>