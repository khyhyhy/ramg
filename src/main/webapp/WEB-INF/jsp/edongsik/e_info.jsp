<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
  <!DOCTYPE html>
  <html>

  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Insert title here</title>
   <link href="../../css/ramg.css" rel="stylesheet">
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
     <!-- <c:if test="${sessionScope.evo == null}"></c:if> -->

     <div style="display: flex; justify-content: center; margin-top: 40px; margin-bottom: 50px;">
      <button type="button" onclick="location.href='/e_nowOrder/'" class="btn btn-outline-info"
       style="margin-right: 50px; border-width: 2px;">현재상황</button>
      <button type="button" onclick="location.href='/e_orderList/'" class="btn btn-outline-info"
       style="border-width: 2px;">이용내역</button>
     </div>




     <div class="text-center">
      <div class="row">
       <div class="col">

       </div>
      </div>
      <form action="/taksong/serviceok" method="post">
       <div class="row">
        <div class="col">

         <div class="list-group">
          <c:forEach items="${c_ar}" var="c_ar" varStatus="status">
           <fieldset onclick="carinfo(this)">
            <input type="radio" class="btn-check" name="car" id='car${status.index}' autocomplete="off" />
            <label class="btn btn-outline-secondary list-group-item list-group-item-action"
             for="car${status.index}">${mvo.m_idx}/${c_ar.c_name}/${c_ar.movo.mo_name}</label>
            <input type="hidden" name="c_idx" value=${c_ar.c_idx} />
            <input type="hidden" id="tank" name="c_val3" value=${c_ar.movo.mo_bet} />
           </fieldset>
           <br />
          </c:forEach>
         </div>

        </div>
        <div class="col">
         <ul class="list-group">
          <c:if test="${fn:length(swar) eq 0}">
            <fieldset onclick="serviceinfo(this)">
             <input type="radio" class="btn-check" name="service" id='service' autocomplete="off">
             <label class="btn btn-outline-secondary list-group-item list-group-item-action" for="service">현재 신청 가능한
              서비스가 없습니다.</label>
            </fieldset>
           </c:if>
           <c:if test="${swar ne null}">
            <c:forEach items="${swar}" var="vo" varStatus="status">
             <fieldset onclick="serviceinfo(this)">
              <c:if test="${vo.svo.s_status eq 0}">
               <input type="radio" class="btn-check" name="service" id='service${status.index}' autocomplete="off">
               <label class="btn btn-outline-secondary list-group-item list-group-item-action"
                for="service${status.index}">${vo.svo.s_city}&nbsp;/&nbsp;${vo.svo.s_radius}&nbsp;M&nbsp;/&nbsp;
                ${vo.svo.s_val1} 원</label>
               <input type="hidden" name="s_idx" value=${vo.svo.s_idx} />
               <input type="hidden" name="s_price" value="${vo.svo.s_val1}">
              </c:if>
              <c:if test="${vo.svo.s_status eq 2}">
               <input type="radio" class="btn-check " name="service" id='service${status.index}' autocomplete="off"
                disabled>
               <label class="btn btn-secondary list-group-item list-group-item-action"
                for="service${status.index}">${vo.svo.s_city}&nbsp;/&nbsp;${vo.svo.s_radius}&nbsp;M&nbsp;/&nbsp;
                ${vo.svo.s_val1} 원<br />서비스 진행중</label>
              </c:if>
             </fieldset>
             <br />
            </c:forEach>
           </c:if>
          <!-- <c:forEach items="${swar}" var="swar" varStatus="status">
           <fieldset onclick="serviceinfo(this)">
            <input type="radio" class="btn-check" name="service" id='service${status.index}' autocomplete="off">
            <label class="btn btn-outline-secondary list-group-item list-group-item-action"
             for="service${status.index}">${swar.svo.s_city}${swar.svo.s_radius}/${swar.mvo.m_name}/${swar.cvo.c_name}</label>
            <input type="hidden" name="s_idx" value=${swar.svo.s_idx} />
            <input type="hidden" name="s_price" value="${swar.svo.s_val1}">
           </fieldset>
           <br />
          </c:forEach> -->
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
          <p id="sprice">서비스&nbsp;비용&nbsp;:&nbsp;원</p>
          <p id="cprice">예상&nbsp;충전&nbsp;비용&nbsp;:&nbsp;원</p>
          <p id="fprice">총&nbsp;비용&nbsp;:&nbsp;원</p>
         </div>
        </div>
        <div class="row">
         <div class="col">
          <div>
           <input type="radio" class="btn-check" name="s_payment" id="payment1" autocomplete="off" onclick="sinyoung()"
            value="신용카드">
           <label class="btn btn-outline-primary" for="payment1">신용카드</label>
           <input type="radio" class="btn-check" name="s_payment" id="payment2" autocomplete="off" onclick="tong()"
            value="무통장거래">
           <label class="btn btn-outline-primary" for="payment2">무통장거래</label>
           <select class="form-select form-select-sm" style="display: none; width: 18%;" id="sinyong" name="s_payinfo">
            <option value="gukmin">국민카드</option>
            <option value="shinhan">신한카드</option>
            <option value="bici">BC카드</option>
            <option value="woori">우리카드</option>
           </select>
           <select class="form-select form-select-sm" style="display: none; width: 18%;" id="tongjang" name="s_payinfo">
            <option value="gukmin">국민은행</option>
            <option value="shinhan">신한은행</option>
            <option value="giup">기업은행</option>
            <option value="woori">우리은행</option>
           </select>
           <input type="text" id="tongtext" name="s_payinfo" class="form-control" style=" display: none ;width: 30%"
            placeholder="계좌번호">
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
      <input type="hidden" id="s_sprice" name="s_sprice" />
      <input type="hidden" id="s_cprice" name="s_cprice" />
      <input type="hidden" id="s_cprice" name="s_type" value="1" />
      <input type="hidden" id="nowlat" name="nowlat" value="${nowlat2}" />
      <input type="hidden" id="nowlng" name="nowlng" value="${nowlng2}" />
      <input type="hidden" id="m_idx" name="m_idx" value="${mvo.m_idx}" />
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
      let serviceprice;
      let chargeprice;
      var f_price;
  
      function sinyoung() {
       var sinyongSelect = document.getElementById("sinyong");
       var tongjangSelect = document.getElementById("tongjang");
       var tongtextInput = document.getElementById("tongtext");
  
       sinyongSelect.style.display = "inline";
       tongjangSelect.style.display = "none";
       tongtextInput.style.display = "none";
       sinyongSelect.disabled = false;
       tongjangSelect.disabled = true;
       tongtextInput.disabled = true;
  
  
      }
  
      function tong() {
       var sinyongSelect = document.getElementById("sinyong");
       var tongjangSelect = document.getElementById("tongjang");
       var tongtextInput = document.getElementById("tongtext");
       sinyongSelect.style.display = "none";
       tongjangSelect.style.display = "inline";
       tongtextInput.style.display = "inline";
       sinyongSelect.disabled = true;
       tongjangSelect.disabled = false;
       tongtextInput.disabled = false;
      }
  
      function carinfo(f) {
       console.log("c_idx==/" + f.querySelector('input[name="c_idx"]').value);
       console.log("c_val3==" + f.querySelector('input[name="c_val3"]').value);
       btank = f.querySelector('input[name="c_val3"]').value
       document.getElementById("battery").innerText = btank + "kWh";
       document.getElementById("s_c_idx").value = f.querySelector('input[name="c_idx"]').value;
       if (chargeprice != null) {
        chargeprice = null;
       }
       l_price();
      }
  
      function serviceinfo(f) {
       serviceprice = f.querySelector('input[name="s_price"]').value;
       console.log("s_idx==" + f.querySelector('input[name="s_idx"]').value);
       document.getElementById("s_s_idx").value = f.querySelector('input[name="s_idx"]').value;
       document.getElementById("s_sprice").value = serviceprice;
       var serviceprice2 = serviceprice.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
       document.getElementById("sprice").innerHTML = "서비스&nbsp;비용&nbsp;:&nbsp;" + serviceprice2 + "원";
  
       l_price()
      }
  
      function muckpho(e) {
  
       document.getElementById("muckpho").innerText = e.value + "%"
       chargeprice = (btank / 100 * e.value) * khw;
       console.log(chargeprice);
       console.log(btank);
       chargeprice = Math.floor(chargeprice).toString();
       document.getElementById("s_cprice").value = chargeprice;
       var chargeprice2 = chargeprice.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  
       document.getElementById("cprice").innerHTML = "예상&nbsp;충전&nbsp;비용&nbsp;:&nbsp" + chargeprice2 + "원";
       l_price()
      }
  
      function l_price() {
       if (chargeprice != null && serviceprice != null) {
        f_price = Number(chargeprice) + Number(serviceprice);
  
        f_price = f_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        document.getElementById("fprice").innerHTML = "총&nbsp;비용&nbsp;:&nbsp;" + f_price + "원";
       }
       else {
        document.getElementById("fprice").innerHTML = "총&nbsp;비용&nbsp;:&nbsp;원"
       }
      }
     </script>
    </body>
  
    </html>