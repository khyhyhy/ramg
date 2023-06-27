<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html>

  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Insert title here</title>
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  </head>
  <style>
    /* .card{
        width: 100px;
        height: 100px;
        margin: 50px;
        
    } */

  </style>

  <body>
    <p>"${evo.m_idx}"</p>
    <!-- <c:if test="${sessionScope.evo == null}"></c:if> -->

    <div style="display: flex; justify-content: center; margin-top: 50px;">
        <button type="button" onclick="location.href='??'">충전하기</button>
        <button type="button" onclick="location.href='??'" style="margin-left: 50px; margin-right: 50px;">현재상황</button>
        <button type="button" onclick="location.href='map'">이용내역</button>
    </div>
 
    <div style="display: flex; justify-content: center; align-items: center; min-height: 70vh;">

      <div class="card" style="width: 18rem; ">
        <img src="/images/map_icon.png" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">현재 위치 검색</h5>
          <p class="card-text"></p>
          <a href="#" class="btn btn-primary" onclick="location.href='/e_search/'">검색</a>
        </div>
      </div>
    

      <div class="card" style="width: 18rem; margin-left: 150px;">
        <img src="/images/car_icon.png" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">차량 등록 주소</h5>
          <p class="card-text"></p>
          <a href="#" class="btn btn-primary" onclick="location.href='/carAddr/?m_idx=${evo.m_idx}'">검색</a>
        </div>

      </div>
    
</div>


   

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  </body>
  </html>