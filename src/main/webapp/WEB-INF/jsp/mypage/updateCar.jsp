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
   <link href="../../../css/ramg.css" rel="stylesheet">
   <style>
    .container{
      margin-top: 2cm;
      margin-bottom: 2cm;
  }
  article{
    margin-bottom: 1cm;
}

    
   </style>
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
<jsp:include page="../main/mainH.jsp"></jsp:include>

<div class="text-center" style="margin-top: 100px;">
    <!-- 차량 추가 -->
    <div class="container-sm">
<header>
  <div style="margin: 50px 0 0 0;">
    <h1 style="text-align: center; font-weight: bold;">차량 정보 수정</h1>
</div>
</header>
  <table class="table table-striped table-hover">
    <colgroup>
      <col width="200px">
      <col width="*">
    </colgroup>
    <tbody>
        <tr>
            <th><label for="c_num" >차량번호</label></th>
            <td><input type="text" id="c_num" name="c_num" value="${cvo.c_num}" /></td>
        </tr>
        
        <tr>
          <th><label for="c_name" >별칭</label></th>
          <td><input type="text" id="c_name" name="c_name" value="${cvo.c_name}" /></td>
        </tr>
        <tr>
            <th><label for="mo_idx">모델명</label></th>
            <td><select id="mo_idx" name="mo_idx">
              <option disabled selected value="">차량 선택</option>
              <c:forEach items="${modelList}" var="model">
                <option value="${model.mo_idx}" <c:if test="${cvo.mo_idx eq model.mo_idx}">selected</c:if>>${model.mo_name}</option>
              </c:forEach>
            </select></td>
        </tr>
        <tr>
            <th><label for="c_state">주소</label></th>
            <td><input type="text" id="c_state" name="c_state" value="${cvo.c_state}" onclick="sample6_execDaumPostcode()"/>
            <input type="text" id="c_city" name="c_city" value="${cvo.c_city}" readonly/>
            <input type="text" id="c_addr1" name="c_addr1" value="${cvo.c_addr1}" readonly/></td>
        </tr>
        <!--<tr>
            <th><label for="c_val3">모델명</label></th>
            <td><select id="mo_idx" name="mo_idx">
              <option disabled selected value="">차량 선택</option>
              <c:forEach items="${modelList}" var="model">
               <option value="${model.mo_idx}">${model.mo_name}</option>
              </c:forEach>
             </select></td>
        </tr>-->
        
        <tr>
            <td colspan="2">
              <button type="button" id="btn" class="btn btn-success">변경하기</button>&nbsp;
                <button type="button" class="btn btn-success" onclick="javascript:location.href='car_list'">돌아가기</button>
            </td>
        </tr>
    </tbody>
   </table>
   </div>

   </div>
   <jsp:include page="../main/mainF.jsp"></jsp:include>

   <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>
   
   $(function(){


// 아이디가 btn인 버튼에게 클릭 이벤트를 부여하자!
$("#btn").bind("click", function(){
      let c_idx = '${cvo.c_idx}';
      let c_num = $("#c_num").val();
      let mo_idx = $("#mo_idx").val();
      let c_name = $("#c_name").val();
      let c_state = $("#c_state").val();
      let c_city = $("#c_city").val();
      let c_addr1 = $("#c_addr1").val();
      //let c_val3 = $("#c_val3").val();
      /*let c_type = $("#c_type").val();
      let c_chargetype_ac = $("#c_chargetype_ac").val();
      let c_chargetype_dc = $("#c_chargetype_dc").val();*/

      let param = "";

      if(c_num.trim().length == 0){
        alert("차량번호를 입력하세요");
        $("#c_num").focus();
        return;
      }else
                param += "c_num="+encodeURIComponent(c_num);

      if(mo_idx.trim().length == 0){
        alert("모델명을 입력하세요");
        $("#mo_idx").focus();
        return;
      }else{
          param += "&mo_idx="+encodeURIComponent(mo_idx);
          param += "&c_name="+encodeURIComponent(c_name);
      }

      if(c_state.trim().length == 0){
        alert("광역자치단체를 입력하세요");
        $("#c_state").focus();
        return;
      }else
                param += "&c_state="+encodeURIComponent(c_state);

      if(c_city.trim().length == 0){
        alert("기초자치단체를 입력하세요");
        $("#c_city").focus();
        return;
      }else
                param += "&c_city="+encodeURIComponent(c_city);

      if(c_addr1.trim().length == 0){
        alert("행정구역을 입력하세요");
        $("#c_addr1").focus();
        return;
      }else
            param += "&c_addr1="+encodeURIComponent(c_addr1);

      /*if(c_val3.trim().length == 0){
        alert("배터리용량을 입력하세요");
        $("#c_val3").focus();
        return;
      }else
      param += "&c_val3="+encodeURIComponent(c_val3);*/


      /*if(c_type.trim().length == 0){
        alert("차종 차량 제조사를 입력하세요");
        $("#c_type").focus();
        return;
      }else
      param += "&c_type="+encodeURIComponent(c_type);


      if(c_chargetype_ac.trim().length == 0){
        alert("완속 충전잭 타입을 입력하세요");
        $("#c_chargetype_ac").focus();
        return;
      }else
      param += "&c_chargetype_ac="+encodeURIComponent(c_chargetype_ac);


      if(c_chargetype_dc.trim().length == 0){
        alert("급속 충전잭 타입을 입력하세요");
        $("#c_chargetype_dc").focus();
        return;
      }else
      param += "&c_chargetype_dc="+encodeURIComponent(c_chargetype_dc);*/
      
      param += "&c_idx="+encodeURIComponent(c_idx);

                $.ajax({
                url: "/updateCar",
                type: "post",
                data: param,
                dataType: "json"
            }).done(function(data){
                //수정완료시를 검증해야 함! (res:1이면 "변경완료", res:0이면 "변경실패")
                if(data.res == 1)
                    alert("변경완료 되었습니다.");
                else
                    alert("변경실패 했습니다.");
            });
     });

    });

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
   </script>
   </body>

   </html>