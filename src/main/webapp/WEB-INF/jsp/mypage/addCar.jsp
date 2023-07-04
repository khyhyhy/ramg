<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <!DOCTYPE html>
  <html>

  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>차량 관리</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
<jsp:include page="../main/mainH.jsp"></jsp:include>

    
    <!-- 차량 추가 -->

  <h2>차량 추가</h2>
        <form action="regCar" method="post" id="regCar">
          <label for="c_num">차량번호</label>
          <input type="text" id="c_num" name="c_num" value="${car.c_num}" /><br/>
        
          <label for="c_name">모델명</label>
          <input type="text" id="c_name" name="c_name" value="${car.c_name}" /><br/>
        
        
          <label for="c_type">유형</label>
          <input type="text" id="c_type" name="c_type" value="${car.c_type}" /><br/>
        
        
          <label for="c_chargetype">충전방식</label>
          <input type="text" id="c_chargetype" name="c_chargetype" value="${car.c_chargetype}" /><br/>
        
        
            <label for="c_state">광역자치단체</label>
            <input type="text" id="c_state" name="c_state" value="${car.c_state}" /><br/>
        
        
            <label for="c_city">기초자치단체</label>
            <input type="text" id="c_city" name="c_city" value="${car.c_city}" /><br/>
        
        
            <label for="c_addr1">행정구역</label>
            <input type="text" id="c_addr1" name="c_addr1" value="${car.c_addr1}" /><br/>
        
        
            <input type="button" id="btn" value="추가하기" onclick="send(this.form)"/>
        </form>
   <jsp:include page="../main/mainF.jsp"></jsp:include>
   <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
   <script>
   function send(frm){
      let c_num = $("#c_num").val();
      let c_name = $("#c_name").val();
      let c_type = $("#c_type").val();
      let c_chargetype = $("#c_chargetype").val();
      let c_state = $("#c_state").val();
      let c_city = $("#c_city").val();
      let c_addr1 = $("#c_addr1").val();

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
      if(c_type.trim().length == 0){
        alert("유형을 입력하세요");
        $("#c_type").focus();
        return;
      }
      if(c_chargetype.trim().length == 0){
        alert("충전방식을 입력하세요");
        $("#c_chargetype").focus();
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

      frm.submit();

    }

   </script>
   </body>

   </html>