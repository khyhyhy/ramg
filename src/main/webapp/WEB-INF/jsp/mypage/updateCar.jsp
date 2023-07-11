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
      font-family: 'GoryeongStrawberry';
    }
    table{
      text-align: center;
      margin: auto;
    }
    th{
      font-family: 'GoryeongStrawberry';
    }
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

<div class="text-center">
    <!-- 차량 추가 -->
    <div class="container-sm">
<header>
  <h2>차량 정보 수정</h2>
</header>
  <table class="table table-striped table-hover">
    <tbody>
        <tr>
            <th><label for="c_num" >차량번호</label></th>
            <td><input type="text" id="c_num" name="c_num" value="${cvo.c_num}" /></td>
        </tr>
        <tr>
            <th><label for="c_name">모델명</label></th>
            <td><select id="c_name" name="c_name">
              <option disabled selected value="">차량 선택</option>
              <c:forEach items="${modelList}" var="model">
                <option value="${model.mo_name}">${model.mo_name}</option>
              </c:forEach>
            </select></td>
        </tr>
        <tr>
            <th><label for="c_state">광역자치단체</label></th>
            <td><input type="text" id="c_state" name="c_state" value="${cvo.c_state}" /></td>
        </tr>
        <tr>
            <th><label for="c_city">기초자치단체</label></th>
            <td><input type="text" id="c_city" name="c_city" value="${cvo.c_city}" /></td>
        </tr>
        <tr>
            <th><label for="c_addr1">행정구역</label></th>
            <td><input type="text" id="c_addr1" name="c_addr1" value="${cvo.c_addr1}" /></td>
        </tr>
        <tr>
            <th><label for="c_val3">배터리용량</label></th>
            <td><select id="c_val3" name="c_val3">
              <option disabled selected value="">배터리용량 선택</option>
              <c:forEach items="${modelList}" var="model">
                <option value="${model.mo_bet}">${model.mo_name}/${model.mo_bet}</option>
              </c:forEach>
            </select></td>
        </tr>
        <tr>
            <th><label for="c_type">차종 제조사</label></th>
            <td><select id="c_type" name="c_type">
              <option disabled selected value="">차종 제조사 선택</option>
              <c:forEach items="${modelList}" var="model">
                <option value="${model.mo_type}">${model.mo_name}/${model.mo_type}</option>
              </c:forEach>
            </select></td>
        </tr>
        <tr>
            <th><label for="c_chargetype_ac">완속 충전잭 타입</label></th>
            <td><select id="c_chargetype_ac" name="c_chargetype_ac">
              <option disabled selected value="">완속 충전잭 타입 선택</option>
              <c:forEach items="${modelList}" var="model">
                <option value="${model.mo_chargetype_ac}">${model.mo_name}/${model.mo_chargetype_ac}</option>
              </c:forEach>
            </select></td>
        </tr>
        <tr>
            <th><label for="c_chargetype_dc">급속 충전잭 타입</label></th>
            <td><select id="c_chargetype_dc" name="c_chargetype_dc">
              <option disabled selected value="">급속 충전잭 타입 선택</option>
              <c:forEach items="${modelList}" var="model">
                <option value="${model.mo_chargetype_dc}">${model.mo_name}/${model.mo_chargetype_dc}</option>
              </c:forEach>
            </select></td>
        </tr>
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
   <script>
   
   $(function(){


// 아이디가 btn인 버튼에게 클릭 이벤트를 부여하자!
$("#btn").bind("click", function(){
      let c_idx = '${cvo.c_idx}';
      let c_num = $("#c_num").val();
      let c_name = $("#c_name").val();
      let c_state = $("#c_state").val();
      let c_city = $("#c_city").val();
      let c_addr1 = $("#c_addr1").val();
      let c_val3 = $("#c_val3").val();
      let c_type = $("#c_type").val();
      let c_chargetype_ac = $("#c_chargetype_ac").val();
      let c_chargetype_dc = $("#c_chargetype_dc").val();

      let param = "";

      if(c_num.trim().length == 0){
        alert("차량번호를 입력하세요");
        $("#c_num").focus();
        return;
      }else
                param += "c_num="+encodeURIComponent(c_num);

      if(c_name.trim().length == 0){
        alert("모델명을 입력하세요");
        $("#c_name").focus();
        return;
      }else
                param += "&c_name="+encodeURIComponent(c_name);


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

      if(c_val3.trim().length == 0){
        alert("배터리용량을 입력하세요");
        $("#c_val3").focus();
        return;
      }else
      param += "&c_val3="+encodeURIComponent(c_val3);


      if(c_type.trim().length == 0){
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
      param += "&c_chargetype_dc="+encodeURIComponent(c_chargetype_dc);
      
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

   </script>
   </body>

   </html>