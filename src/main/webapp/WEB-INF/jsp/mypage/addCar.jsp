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
                  <div class="card" style="width: 18rem;">
                    <div class="card-body">
                      <div class="mb-3">
                        <label for="c_num" class="form-label" >차량번호</label>
                        <input type="text" class="form-control" id="c_num" placeholder="ex) 12가3456" name="c_num" value="${car.c_num}" />
                      </div>

                      <div class="mb-3">
                        <label for="c_name" class="form-label" >모델명</label>
                        <select id="c_name" name="c_name" class="form-control" >
                          <option disabled selected value="">차량 선택</option>
                          <c:forEach items="${modelList}" var="model">
                            <option value="${model.mo_name}">${model.mo_name}</option>
                          </c:forEach>
                        </select>
                      </div>

                      <div class="mb-3">
                        <label for="c_state" class="form-label" >광역자치단체</label>
                        <input type="text" class="form-control" id="c_state"  name="c_state" value="${car.c_state}"  />
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
       
          </script>
          </body>
       
          </html>