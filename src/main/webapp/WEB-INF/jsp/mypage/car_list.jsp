<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <!DOCTYPE html>
  <html>

  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>차량 관리</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <style>
        table{
            margin: 0 auto;
            width: 80%;
            border: 1px solid black;
            border-collapse: collapse;
        }
        table th, table td{
            border: 1px solid black;
        }
        
   </style>
  </head>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <body>
  <jsp:include page="../main/mainH.jsp"></jsp:include>
   

   <h2> 차량목록</h2>
   <table id="car_list">
    <colgroup>
        <col width="150px"/>
        <col width="150px"/>
        <col width="100px"/>
        <col width="150px"/>
        <col width="150px"/>
        <col width="150px"/>
        <col width="150px"/>
        <col width="*"/>
    </colgroup>
    <thead>
        <tr><td colspan="8"><a href="/addCar">차량 추가</a></td></tr>
        <tr>
            <th>차량번호</th>
            <th>모델명</th>
            <th>유형</th>
            <th>충전방식</th>
            <th>광역자치단체</th>
            <th>기초자치단체</th>
            <th>행정구역</th>
            <th>비고</th>
            
        </tr>
    </thead>
    <tbody>
        <c:forEach var="cwvo" items="${car}">
            <tr>
                <td>${cwvo.cvo.c_num}</td>
                <td>${cwvo.cvo.c_name}</td>
                <td>${cwvo.cvo.c_type}</td>
                <td>${cwvo.cvo.c_chargetype}</td>
                <td>${cwvo.cvo.c_state}</td>
                <td>${cwvo.cvo.c_city}</td>
                <td>${cwvo.cvo.c_addr1}</td>
            </tr>
        </c:forEach>
    </tbody>
   </table>

   <jsp:include page="../main/mainF.jsp"></jsp:include>
    

   <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
   <script>

   
   </script>

  </body>

  </html>