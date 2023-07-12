<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <!DOCTYPE html>
  <html>
  

  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>차량 관리</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <style>
      h2{
        text-align: center;
        color: skyblue;
        font-family: 'GoryeongStrawberry';
      }
      #addCar{
        text-align: center;
        margin: auto;
      }
      label{
        color: skyblue;
        font-family: 'GoryeongStrawberry';
      }
        .container{
          margin-top: 2cm;
          margin-bottom: 2cm;
      }
        article{
          margin-bottom: 1cm;
        }

        div{
          margin: auto;
        }
  </style>
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
<jsp:include page="../main/mainH.jsp"></jsp:include>
       
<div class="row align-items-center">
           <!-- 차량 추가 -->
              <header>
               <h2>차량 추가</h2>
              </header>
                 <form action="addCar" method="post" id="addCar">
                  <input type="hidden" name="c_name" id="c_name"/>
                  <div class="card" style="width: 18rem;">
                    <div class="card-body">
                      <div class="mb-3">
                        <label for="c_num" class="form-label" >차량번호</label>
                        <input type="text" class="form-control" id="c_num" placeholder="ex) 12가3456" name="c_num" value="${car.c_num}" />
                      </div>

                      <div class="mb-3">
                        <label for="mo_idx" class="form-label" >모델명</label>
                        <select id="mo_idx" name="mo_idx" class="form-control" onchange="changeMoIdx(this)">
                          <option disabled selected value="">차량 선택</option>
                          <c:forEach items="${modelList}" var="model">
                            <option value="${model.mo_idx}">${model.mo_name}</option>
                          </c:forEach>
                        </select>
                      </div>

                      <div class="mb-3">
                        <label for="c_state" class="form-label" >광역자치단체</label>
                        <input type="text" class="form-control" id="c_state"  name="c_state" value="${car.c_state}" onclick="sample6_execDaumPostcode()" />
                        
                      </div>

                      <div class="mb-3">
                        <label for="c_city" class="form-label" >기초자치단체</label>
                        <input type="text" class="form-control" id="c_city"  name="c_city" value="${car.c_city}"  />
                      </div>

                      <div class="mb-3">
                        <label for="c_addr1" class="form-label" >행정구역</label>
                        <input type="text" class="form-control" id="c_addr1"  name="c_addr1" value="${car.c_addr1}"  />
                      </div>

                      <div class="mb-3">
                        <label for="c_val3" class="form-label" >배터리용량</label>
                        <select id="c_val3" name="c_val3" class="form-control" >
                          <option disabled selected value="">배터리용량 선택</option>
                            <c:forEach items="${modelList}" var="model">
                              <option value="${model.mo_bet}">${model.mo_name}/${model.mo_bet}</option>
                            </c:forEach>
                         </select>
                      </div>

                      <div class="mb-3">
                        <label for="c_type" class="form-label" >차종 제조사</label>
                        <select id="c_type" name="c_type" class="form-control" >
                          <option disabled selected value="">차종 제조사 선택</option>
                            <c:forEach items="${modelList}" var="model">
                              <option value="${model.mo_type}">${model.mo_name}/${model.mo_type}</option>
                            </c:forEach>
                         </select>
                      </div>

                      <div class="mb-3">
                        <label for="c_chargetype_ac" class="form-label" >완속 충전잭 타입</label>
                        <select id="c_chargetype_ac" name="c_chargetype_ac" class="form-control" >
                          <option disabled selected value="">완속 충전잭 타입 선택</option>
                          <c:forEach items="${modelList}" var="model">
                            <option value="${model.mo_chargetype_ac}">${model.mo_name}/${model.mo_chargetype_ac}</option>
                          </c:forEach>
                         </select>
                      </div>

                      <div class="mb-3">
                        <label for="c_chargetype_dc" class="form-label" >급속 충전잭 타입</label>
                        <select id="c_chargetype_dc" name="c_chargetype_dc" class="form-control" >
                          <option disabled selected value="">급속 충전잭 타입 선택</option>
                          <c:forEach items="${modelList}" var="model">
                            <option value="${model.mo_chargetype_dc}">${model.mo_name}/${model.mo_chargetype_dc}</option>
                          </c:forEach>
                         </select>
                      </div>



                    </div>
                  </div>
                  <button type="button" class="btn btn-primary" onclick="send(this.form)">추가하기</button>
                  
                 </form>
          </div> 
          <jsp:include page="../main/mainF.jsp"></jsp:include>
          <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
          <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

          <script>
          function send(frm){
             let c_num = $("#c_num").val();
             let c_name = $("#c_name").val();
             let c_state = $("#c_state").val();
             let c_city = $("#c_city").val();
             let c_addr1 = $("#c_addr1").val();
             let c_val3 = $("#c_val3").val();
             let c_type = $("#c_type").val();
             let c_chargetype_ac = $("#c_chargetype_ac").val();
             let c_chargetype_dc = $("#c_chargetype_dc").val();
       
             if(c_num.trim().length == 0){
               alert("차량번호를 입력하세요");
               $("#c_num").focus();
               return;
             }
             if(c_name.trim().length == 0){
               alert("모델명을 입력하세요");
               $("#c_name").focus();
               return;
             }
             if(c_state.trim().length == 0){
               alert("광역자치단체를 입력하세요");
               $("#c_state").focus();
               return;
             }
             if(c_city.trim().length == 0){
               alert("기초자치단체를 입력하세요");
               $("#c_city").focus();
               return;
             }
             if(c_addr1.trim().length == 0){
               alert("행정구역을 입력하세요");
               $("#c_addr1").focus();
               return;
             }
             if(c_val3.trim().length == 0){
               alert("배터리용량을 입력하세요");
               $("#c_val3").focus();
               return;
             }
             if(c_type.trim().length == 0){
               alert("차종 차량 제조사를 입력하세요");
               $("#c_type").focus();
               return;
             }
             if(c_chargetype_ac.trim().length == 0){
               alert("완속 충전잭 타입을 입력하세요");
               $("#c_chargetype_ac").focus();
               return;
             }
             if(c_chargetype_dc.trim().length == 0){
               alert("급속 충전잭 타입을 입력하세요");
               $("#c_chargetype_dc").focus();
               return;
             }
       
             frm.submit();
       
           }
       
           function sample6_execDaumPostcode() {
              new daum.Postcode({
                  oncomplete: function(data) {
                      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
      
                      // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                      var addr = ''; // 주소 변수
                      var extraAddr = ''; // 참고항목 변수
      
                      //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                      if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                          addr = data.roadAddress;
                      } else { // 사용자가 지번 주소를 선택했을 경우(J)
                          addr = data.jibunAddress;
                      }
      
                      // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                      if(data.userSelectedType === 'R'){
                          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                          if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                              extraAddr += data.bname;
                          }
                          // 건물명이 있고, 공동주택일 경우 추가한다.
                          if(data.buildingName !== '' && data.apartment === 'Y'){
                              extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                          }
                          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                          if(extraAddr !== ''){
                              extraAddr = ' (' + extraAddr + ')';
                          }
                          // 조합된 참고항목을 해당 필드에 넣는다.
                          //document.getElementById("sample6_extraAddress").value = extraAddr;
                      
                      } else {
                          //document.getElementById("sample6_extraAddress").value = '';
                      }
      
                      // 우편번호와 주소 정보를 해당 필드에 넣는다.
                      //document.getElementById('sample6_postcode').value = data.zonecode;
                      let addr_ar = addr.split(" ");
                      //for(let i=0; i<addr_ar.length; i++)
                      //  console.log(addr_ar[i]);
                      if(addr_ar.length >= 3){
                        $("#c_state").val(addr_ar[0]); //첫번째 : 서울
                        $("#c_city").val(addr_ar[1]);
                        $("#c_addr1").val(addr_ar[2]+" "+addr_ar[3]);
                      }


                      //document.getElementById("sample6_address").value = addr;
                      // 커서를 상세주소 필드로 이동한다.
                      //document.getElementById("sample6_detailAddress").focus();
                  }
              }).open();
          }

          function changeMoIdx(model_sel){
            console.log($("#mo_idx").val()+"/"+$("#mo_idx option:selected").text());
            $("#c_name").val($("#mo_idx option:selected").text());
          }
          </script>
          </body>
       
          </html>