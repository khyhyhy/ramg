<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html>

  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>차량 관리</title>
  </head>

  <body>
    <article>
        <h1>차량 등록 정보</h1>
    </article>
    <br/>
    <table>
        <tr>
            <th>차량번호</th>
            <th>차량이름</th>
            <th>차종</th>
            <th>충전방식</th>
            <th>현재 자동차가 있는 도</th>
            <th>현재 자동차가 있는 도시</th>
            <th>자동차 위치</th>
	<th>차량 주인</th>
        </tr>
        <c:forEach var="car" items="${car}">
        <tr>
            <td>${car.c_num}</td>
            <td>${car.c_name}</td>
            <td>${car.c_type}</td>
            <td>${car.c_chargetype}</td>
            <td>${car.c_state}</td>
            <td>${car.c_city}</td>
            <td>${car.c_addr1}</td>
	<td>${car.m_name}</td>
        </tr>
        </c:forEach>
    </table>
    <!-- 차량 추가 -->
  <h2>차량 추가</h2>
  <form action="addCar" method="post">
        </tr>
    </table>
    <!-- 차량 추가 -->
  <h2>차량 추가</h2>
  <form action="/mypage/car_mt/addCar" method="post">
    <label for="num">차량번호:</label>
    <input type="text" id="num" name="num" required><br>
    <label for="name">차량이름:</label>
    <input type="text" id="name" name="name" required><br>
    <label for="type">차종:</label>
    <input type="text" id="type" name="type" required><br>
    <label for="ct">충전방식:</label>
    <input type="text" id="ct" name="ct" required><br>
    <label for="state">현재 자동차가 있는 도:</label>
    <input type="text" id="state" name="state" required><br>
    <label for="city">현재 자동차가 있는 도시:</label>
    <input type="text" id="city" name="city" required><br>
    <label for="addr1">자동차 위치:</label>
    <input type="text" id="addr1" name="addr1" required><br>
    <label for="m_name">차량 주인:</label>
    <input type="text" id="m_name" name="m_name" required><br>
    <input type="submit" value="추가">
  </form>

   </body>
 
   </html>