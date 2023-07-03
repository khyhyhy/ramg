<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html>

  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Insert title here</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  </head>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
   integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  <body>
   <!--////////// Header Start ////////////-->
   <jsp:include page="../main/mainH.jsp"></jsp:include>
   <!--////////// Header end ////////////-->

   <!--////////// Main start //////////////-->
   <div class="container">
    <main>
     <!-- <p>"${evo.m_idx}"</p> -->
     <!-- <c:if test="${sessionScope.evo == null}"></c:if> -->

     <div style="display: flex; justify-content: center; margin-top: 40px;">
      <button type="button" onclick="location.href='??'">충전하기</button>
      <button type="button" onclick="location.href='??'" style="margin-left: 50px; margin-right: 50px;">현재상황</button>
      <button type="button" onclick="location.href='map'">이용내역</button>
     </div>

     <div class="text-center">

      
        
        <div class="col"></div>
        
      </div>


      
      <div class="row" style="margin-top: 100px; margin-bottom: 100px;">
        <table summary="게시판 목록" class="table table-hover">
					
            <colgroup>
               <col width="250px">
               <col width="130px">
               <col width="130px">
               <col width="130px">
               <col width="130px">
               <col width="130px">
               
               <col width="120px">
               <col width="120px">
           </colgroup>
           
               <thead>
                   <tr>
                       <th style="text-align: center;">서비스 정보</th>
                       <th style="text-align: center;">업체정보</th>
                       <th style="text-align: center;">주문일자</th>
                       <th style="text-align: center;">서비스 금액</th>
                       <th style="text-align: center;">충전 금액</th>
                       <th style="text-align: center;">총 결제금액</th>
                       <th colspan="2" style="text-align: center;">서비스 상태</th>
                   </tr>
               </thead>
               
               
               <tbody>
                   <c:forEach items="${suar}" var="suar">
                       
                       <tr style="height: 150px; margin-bottom: 100px;">
                        <td style="text-align: left; vertical-align: middle;">이동식 충전 서비스</td>
                           <td style="text-align: center; vertical-align: middle;">${suar.mvo.m_name}</td>   
                           <td style="text-align: center; vertical-align: middle;">${suar.su_date}</td>
                           <td style="text-align: center; vertical-align: middle;">서비스 금액</td>
                           <td style="text-align: center; vertical-align: middle;">충전 금액</td>
                           <td style="text-align: center; vertical-align: middle;">총 결제금액</td>

                           <!-- <c:choose>
                               <c:when test="${suar.su_status == 5}">
                                   <td colspan="2" style="text-align: center; vertical-align: middle;">주문 대기중</td>
                                </c:when>
                                <c:when test="${suar.su_status == 1}">
                                    <td colspan="2" style="text-align: center; vertical-align: middle;">주문 접수</td>
                                </c:when>
                                <c:when test="${suar.su_status == 2}">
                                    <td colspan="2" style="text-align: center; vertical-align: middle;">충전지 이동중</td>
                                </c:when>
                                <c:when test="${suar.su_status == 3}">
                                    <td colspan="2" style="text-align: center; vertical-align: middle;">충전지 도착</td>
                                </c:when>
                                <c:when test="${suar.su_status == 4}">
                                    <td colspan="2" style="text-align: center; vertical-align: middle;">충전중</td>
                                </c:when>
                                <c:when test="${suar.su_status == 0}">
                                    <td style="text-align: center; vertical-align: middle;">충전완료</td>
                                    <td style="text-align: center; vertical-align: middle;">
                                        <button type="button">후기 작성</button>
                                    </td>
                                </c:when>
                            </c:choose> -->
                        </tr>
                    
                        
                    </c:forEach>  
                    </tbody>
        </table>

      </div>

      <!-- <div class="row">
       <div class="col">결제버튼 들어갈 곳</div>
      </div>
     </div> -->

     
    </main>
   </div>
   <!--////////// Main end //////////////-->
   <!--////////// Foter start //////////////-->
   <jsp:include page="../main/mainF.jsp"></jsp:include>
   <!--////////// Foter end //////////////-->
   <script>
    
   </script>
  </body>

  </html>