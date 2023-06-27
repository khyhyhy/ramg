<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html>

  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>차량 관리</title>
  </head>

  <body>
    <main>
    <article>
        <h1>차량 등록 정보</h1>
    </article>
    <br/>
    <table>
        <tr>
            <!-- <th>차량번호</th>
            <th>차량이름</th>
            <th>차종</th>
            <th>충전방식</th>
            <th>현재 자동차가 있는 도</th>
            <th>현재 자동차가 있는 도시</th>
            <th>자동차 위치</th>
	          <th>차량 주인</th> -->
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
  <form action="addCar" method="post" name="form">

    <label for="c_num">차량번호:</label>
    <input type="text" id="c_num" name="c_num" required><br>

    <label for="c_name">차량이름:</label>
    <input type="text" id="c_name" name="c_name" required><br>

    <label for="c_type">차종:</label>
    <input type="text" id="c_type" name="c_type" required><br>

    <label for="c_chargetype">충전방식:</label>
    <input type="text" id="ct" name="c_chargetype" required><br>

    <label for="c_state">현재 자동차가 있는 도:</label>
    <input type="text" id="c_state" name="c_state" required><br>

    <label for="c_city">현재 자동차가 있는 도시:</label>
    <input type="text" id="c_city" name="c_city" required><br>

    <label for="car_tcol">자동차 위치:</label>
    <input type="text" id="car_tcol" name="car_tcol" required><br>

    <!-- <label for="m_name">차량 주인:</label>
    <input type="text" id="m_name" name="m_name" required><br> -->

    <!-- <input type="submit" value="추가"> -->
    <input type="hidden" value="${mvo.m_idx}" name="m_idx"/>
    <button onclick="send(this.form)" type="button">추가</button>
  </form>
</main>

      <!-- Jquery Plugins, main Jquery -->	
      <script src="./assets/js/plugins.js"></script>
      <script src="./assets/js/main.js"></script>
      
      <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
      <script>

      function send(form){
        document.form.submit(); //서버로 보낸다.
      }
      </script>

   </body>

   </html>