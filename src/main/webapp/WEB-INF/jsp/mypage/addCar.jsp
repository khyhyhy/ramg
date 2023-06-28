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
  <table>
    <tbody>
        <tr>
          <th><label for="c_num">차량번호</label></th>
          <td><input type="text" id="c_num" name="c_num" value="${cvo.c_num}" required></td>
        </tr>
        <tr>
          <th>label for="c_name">모델명</label></th>
          <td><input type="text" id="c_name" name="c_name" value="${cvo.c_name}" required></td>
        </tr>
        <tr>
          <th><label for="c_type">유형</label></th>
          <td><input type="text" id="c_type" name="c_type" value="${cvo.c_type}" required></td>
        </tr>
        <tr>
          <th><label for="c_chargetype">충전방식</label></th>
          <td><input type="text" id="c_chargetype" name="c_chargetype" value="${cvo.c_chargetype}" required></td>
        </tr>
        <tr>
            <th><label for="c_state">광역자치단체</label></th>
            <td><input type="text" id="c_state" name="c_state" value="${cvo.c_state}" required></td>
        </tr>
        <tr>
            <th><label for="c_city">기초자치단체</label></th>
            <td><input type="text" id="c_city" name="c_city" value="${cvo.c_city}" required></td>
        </tr>
        <tr>
            <th><label for="c_addr1">행정구역</label></th>
            <td><input type="text" id="c_addr1" name="c_addr1" value="${cvo.c_addr1}" required></td>
        </tr>
    <input type="submit" value="추가">
    </tbody>
    </table>
   <jsp:include page="../main/mainF.jsp"></jsp:include>
   </body>

   </html>