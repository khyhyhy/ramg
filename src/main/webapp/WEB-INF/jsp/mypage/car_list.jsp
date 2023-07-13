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
        table{
            margin: 0 auto;
            width: 80%;
            border: 1px solid black;
            border-collapse: collapse;
            text-align: center;
            /* background-color: aqua; */
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
   
  <div class="align-items-center">
    <header>
        <div style="margin: 50px 0 0 0;">
            <h1 style="text-align: center; font-weight: bold;">차량 목록</h1>
        </div>
    </header>
   <div class="container-sm">
    <table id="car_list" class="table table-striped table-hover">
        <colgroup>
            <col width="150px"/>
            <col width="100px"/>
            <col width="*"/>
            <col width="150px"/>
            <col width="150px"/>
            <col width="150px"/>
            <col width="150px"/>
            <col width="70px"/>
            <col width="70px"/>
        </colgroup>
        <thead>
            <tr>
                <td colspan="9">
                    <button type="button" class="btn btn-danger" onclick="javascript:location.href='/addCar'">차량 추가</button>
                </td>
            </tr>
            <tr>
                <th>차량번호</th>
                <th>모델명</th>
                <th>주소</th>
                <th>배터리 용량</th>
                <th>차종 제조사</th>
                <th>완속 충전잭 타입</th>
                <th>급속 충전잭 타입</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="cwvo" items="${car}">
                <tr onmouseover="regRowNum(this)">
                    <td>${cwvo.cvo.c_num}</td>
                    <td>${cwvo.cvo.c_name}</td>
                    <td>${cwvo.cvo.c_state} ${cwvo.cvo.c_city} ${cwvo.cvo.c_addr1}</td>
                    <td>${cwvo.cvo.c_val3}</td>
                    <td>${cwvo.cvo.c_type}</td>
                    <td>${cwvo.cvo.c_chargetype_ac}</td>
                    <td>${cwvo.cvo.c_chargetype_dc}</td>
                    <td><button type="button" class="btn btn-danger" onclick="javascript:location.href='/updateCar?c_idx=${cwvo.cvo.c_idx}'">수정</button></td>
                    <td><button type="button" class="btn btn-danger" onclick="javascript:sub('${cwvo.cvo.c_idx}','${cwvo.m_idx}')">삭제</button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
   </div>
   <jsp:include page="../main/mainF.jsp"></jsp:include>
    

   <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
   <script>
        let table = document.getElementById("car_list");
        function regRowNum(tr){
				// 해당 tr에 마우스가 올라가면 수행하는 이름없는 내부 함수의 영역
				// 이때!
				// 테이블에 rowIdx라는 변수를 만들어서 현재 행의 번호를 저장한다.
				table.rowIdx = tr.rowIndex;
				//console.log(table.rowIdx);
		};
        function sub(c_idx, m_idx){

           // let c_idx = '${cwvo.cvo.c_idx}';
           // let m_idx = '${cwvo.m_idx}';

            let param = "";

            param += "c_idx="+encodeURIComponent(c_idx);
            param += "&m_idx="+encodeURIComponent(m_idx);

            if(confirm("정말로  삭제 시키겠습니까?")){
            $.ajax({
                url: "/deleteCar",
                type: "post",
                data: param,
                dataType: "json"
            }).done(function(data){
                if(data.res == 1){ // 성공했을 경우
                    //$("#sub").remove();
                    // table에 등록된 rowIdx라는 변수(속성)의 값을 가져온다. 그리고
                    //table로부터 해당 랭을 삭제한다.
                    table.deleteRow(table.rowIdx);
                }
            });
        }else{
            return;
        }
        }

   
   </script>

  </body>

  </html>