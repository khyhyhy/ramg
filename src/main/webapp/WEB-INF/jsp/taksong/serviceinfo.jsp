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
  </head>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
   integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  <body>
   <!--////////// Header Start ////////////-->
   <jsp:include page="../main/mainH.jsp"></jsp:include>
   <!--////////// Header end ////////////-->

   <!--////////// Main start //////////////-->
   <div class="container">
    <main>
     <p>"${evo.m_idx}"</p>
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
      <div class="row">
       <div class="col">
        <div class="list-group">
         <c:forEach items="${evo.cw_list}" var="vo">
          <button type="button" class="list-group-item list-group-item-action"
           onclick="activate(this)">${vo.m_idx}</button>
         </c:forEach>
        </div>
       </div>
       <div class="col">
        <ul class="list-group">
         <c:forEach items="${servicear}" var="vo" varStatus="status">
          <input type="radio" class="btn-check" name="options" id='option${status.index}' autocomplete="off">
          <label class="btn btn-outline-secondary list-group-item list-group-item-action"
           for="option${status.index}">${vo.svo.s_city}${vo.svo.s_radius}/${vo.mvo.m_name}/${vo.cvo.c_name}</label>
         </c:forEach>
        </ul>
       </div>
       <div class="col">
        Column
       </div>
      </div>
     </div>

     <form action="/taksong/local" method="get">
      <input type="hidden" id="lat1" name="lat" />
      <input type="hidden" id="lng1" name="lng" />
     </form>
    </main>
   </div>
   <!--////////// Main end //////////////-->
   <!--////////// Foter start //////////////-->
   <jsp:include page="../main/mainF.jsp"></jsp:include>
   <!--////////// Foter end //////////////-->
   <script>
    function activate(e) {
     if (e.classList.contains('active')) {
      e.classList.remove('active');
     } else {
      e.classList.add('active');
     }
    }
   </script>
  </body>

  </html>