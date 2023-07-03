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
      <form action="/taksong/serviceok" method="post">
       <div class="row">
        <div class="col">
         <div class="list-group">
          <c:forEach items="${evo.cw_list}" var="vo" varStatus="status">
           <fieldset onclick="carinfo(this)">
            <input type="radio" class="btn-check" name="car" id='car${status.index}' autocomplete="off" />
            <label class="btn btn-outline-secondary list-group-item list-group-item-action"
             for="car${status.index}">${vo.m_idx}/${vo.cvo.c_name}/${vo.cvo.c_type}</label>
            <input type="hidden" name="c_idx" value=${vo.cvo.c_idx} />
            <input type="hidden" id="tank" name="c_val3" value=${vo.cvo.c_val3} />
           </fieldset>
           <br />
          </c:forEach>

         </div>
        </div>
        <div class="col">
         <ul class="list-group">

          <c:forEach items="${servicear}" var="vo" varStatus="status">
           <fieldset onclick="serviceinfo(this)">
            <input type="radio" class="btn-check" name="service" id='service${status.index}' autocomplete="off">
            <label class="btn btn-outline-secondary list-group-item list-group-item-action"
             for="service${status.index}">${vo.svo.s_city}${vo.svo.s_radius}/${vo.mvo.m_name}/${vo.cvo.c_name}</label>
            <input type="hidden" name="s_idx" value=${vo.svo.s_idx} />
           </fieldset>
          </c:forEach>
         </ul>
        </div>
        <div class="col">
         <label for="chargebar">충전량</label>
         <input type="range" class="form-range custom-range" step="10" min="50" max="100" id="chargebar"
          name="chargepersent" value="50" list="tickmarks" onchange="muckpho(this)">
         <datalist id="tickmarks"></datalist>
         <label for="mukpho">목표치&nbsp;&nbsp;:&nbsp;&nbsp;</label>
         <p id="battery"></p>
         <p id="muckpho"></p>
        </div>
       </div>
       <div class="row">
        <div class="col"></div>
        <div class="col"></div>
        <div class="col">
         <p>결제정보</p>
         <p>서비스 비용 : 15.000</p>
         <p id="cprice">예상&nbsp;충전&nbsp;비용&nbsp;:&nbsp;원</p>
         <p>총 비용 : 20.000</p>
        </div>
       </div>
       <div class="row">
        <div class="col">
         <div>
          <input type="radio" class="btn-check" name="s_payment1" id="payment1" autocomplete="off" onclick="sinyoung()">
          <label class="btn btn-outline-primary" for="payment1">신용카드</label>

          <input type="radio" class="btn-check" name="s_payment1" id="payment2" autocomplete="off">
          <label class="btn btn-outline-primary" for="payment2">무통장거래</label>
          <select style="display: none;" id="sinyong" name="s_payment2">
           <option></option>
          </select>
         </div>
        </div>
       </div>
       <div class="row"><br />
       </div>
       <div class="row">
        <div class="col"><button type="submit" class="btn btn-primary btn-lg">서비스 신청하기</button></div>
       </div>
     </div>
     <input type="hidden" id="s_c_idx" name="s_c_idx" />
     <input type="hidden" id="s_s_idx" name="s_s_idx" />
     </form>
    </main>
   </div>
   <!--////////// Main end //////////////-->
   <!--////////// Foter start //////////////-->
   <jsp:include page="../main/mainF.jsp"></jsp:include>
   <!--////////// Foter end //////////////-->
   <script>

    var btank;
    var khw = 34.72;

    function sinyoung() {
     document.getElementById("sinyong").style()
    }

    function carinfo(f) {
     console.log("c_idx==/" + f.querySelector('input[name="c_idx"]').value);
     console.log("c_val3==" + f.querySelector('input[name="c_val3"]').value);
     btank = f.querySelector('input[name="c_val3"]').value
     document.getElementById("battery").innerText = btank + "kWh";
     document.getElementById("s_c_idx").value = f.querySelector('input[name="c_idx"]').value;
    }

    function serviceinfo(f) {
     console.log("s_idx==" + f.querySelector('input[name="s_idx"]').value);
     document.getElementById("s_s_idx").value = f.querySelector('input[name="s_idx"]').value;
    }

    function muckpho(e) {

     document.getElementById("muckpho").innerText = e.value + "%"
     var chargeprice = (btank / 100 * e.value) * khw
     console.log(chargeprice);
     console.log(btank);
     chargeprice = Math.floor(chargeprice).toString();
     chargeprice = chargeprice.replace(/\B(?=(\d{3})+(?!\d))/g, ",");

     document.getElementById("cprice").innerHTML = "예상&nbsp;충전&nbsp;비용&nbsp;:&nbsp" + chargeprice + "원";
    }

   </script>
  </body>

  </html>