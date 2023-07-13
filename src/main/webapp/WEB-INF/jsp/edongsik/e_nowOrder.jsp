<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html>

  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Insert title here</title>
   <link href="../../css/ramg.css" rel="stylesheet">
   <link href="../../css/page.css" rel="stylesheet">
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
      <button type="button" onclick="location.href=''" class="btn btn-primary" 
      style="background-color: #0DCAF0; border-color: #0DCAF0; margin-right: 50px; color: black;">현재상황</button>

      <button type="button" onclick="location.href='/e_orderList/'" class="btn btn-outline-info" style="border-width: 2px;">이용내역</button>
     </div>
     <!-- 이용중인 서비스가 없을때 -->
     <c:set var="list" value="${suar}" /> 
    <c:set var="count" value="0" />
    <c:forEach items="${list}" var="item">
        <c:set var="count" value="${count + 1}" />
    </c:forEach>



    <c:set var="list2" value="${suar}" /> <!-- yourList는 넘어온 리스트 변수 -->
    <c:set var="count2" value="0" />
    <c:forEach items="${list2}" var="item2">
        <c:if test="${item2.su_status == 7}">
            <c:set var="count2" value="${count2 + 1}" />
        </c:if>
    </c:forEach>
    
    <c:if test="${count == count2}">
        <div style="margin-top: 50px;">
            <p style="text-align: center;">이용중인 서비스가 없습니다.</p>
        </div>
    </c:if>
    <!-- 이용중인 서비스가 없을때 --> 


    <c:forEach items="${suar}" var="suar">
     
     <!-- 이동식 사진-->
         <c:if test="${suar.svo.s_type == 1}">
             <c:if test="${suar.su_status ne 7}">
                <div class="text-center">

                <div class="row" style="margin-top: 60px;">
                <div class="col"></div>
                <c:choose>
                    <c:when test="${suar.su_status == 0}">
                        <div class="col">
                            <img src="/images/su_status00.png"/>
                            <label style="display: flex; justify-content: center;">주문 대기중</label>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col">
                            <img src="/images/su_status0.png" />
                            <label style="display: flex; justify-content: center;">주문 대기중</label>
                        </div>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${suar.su_status == 1}">
                        <div class="col">
                            <img src="/images/su_status11.png" />
                            <label style="display: flex; justify-content: center;">주문 접수</label>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col">
                            <img src="/images/su_status1.png" />
                            <label style="display: flex; justify-content: center;">주문 접수</label>
                        </div>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${suar.su_status == 2}">
                        <div class="col">
                            <img src="/images/su_status22.png" />
                            <label style="display: flex; justify-content: center;">충전지 이동중</label>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col">
                            <img src="/images/su_status2.png" />
                            <label style="display: flex; justify-content: center;">충전지 이동중</label>
                        </div>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${suar.su_status == 3}">
                        <div class="col">
                            <img src="/images/su_status33.png" />
                            <label style="display: flex; justify-content: center;">충전지 도착</label>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col">
                            <img src="/images/su_status3.png" />
                            <label style="display: flex; justify-content: center;">충전지 도착</label>
                        </div>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${suar.su_status == 4}">
                        <div class="col">
                            <img src="/images/su_status44.png" />
                            <label style="display: flex; justify-content: center;">충전중</label>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col">
                            <img src="/images/su_status4.png" />
                            <label style="display: flex; justify-content: center;">충전중</label>
                        </div>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${suar.su_status == 7}">
                        <div class="col">
                            <img src="/images/su_status55.png" />
                            <label style="display: flex; justify-content: center;">충전완료</label>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col">
                            <img src="/images/su_status5.png" />
                            <label style="display: flex; justify-content: center;">충전완료</label>
                        </div>
                    </c:otherwise>
                </c:choose>
                <div class="col"></div>
                </div>
            </c:if>
            </c:if>

        <!-- 이동식 정보-->
        <c:if test="${suar.svo.s_type == 1}">
        <c:if test="${suar.su_status ne 7}">

            <div class="row" style="margin-top: 100px; margin-bottom: 100px;">
                 <table summary="게시판 목록" class="table table-hover">
					
                    <colgroup>
                        <col width="250px">
                        <col width="130px">
                        <col width="180px">
                        <col width="130px">
                        <col width="130px">
                        <col width="130px">
                        
                        <col width="120px">
                        <col width="120px">
                    </colgroup>
           
                    <thead>
                        <tr class="table-info">
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
                        <tr style="height: 150px; margin-bottom: 100px;">
                            <td style="text-align: left; vertical-align: middle;">이동식 충전 서비스</td>
                            <td style="text-align: center; vertical-align: middle;">${suar.mvo.m_name}<br>${suar.mvo.m_phone}</td>   
                            <td style="text-align: center; vertical-align: middle;">${suar.su_date}</td>
                            <td style="text-align: center; vertical-align: middle;">${suar.su_sprice}원</td>
                            <td style="text-align: center; vertical-align: middle;">${suar.su_cprice}원</td>

                            <c:set var="num1" value="${suar.su_sprice}" />
                            <c:set var="num2" value="${suar.su_cprice}" />
                            <c:set var="sum" value="${(num1 + num2)}" />

                            <td style="text-align: center; vertical-align: middle;">${sum}원</td>
                        
                            <c:choose>
                            <c:when test="${suar.su_status == 0}">
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
                                <c:when test="${suar.su_status == 7}">
                                    <td style="text-align: center; vertical-align: middle;">충전완료</td>
                                    <td style="text-align: center; vertical-align: middle;">
                                        <button type="button">후기 작성</button>
                                    </td>
                                </c:when>
                            </c:choose>
                        </tr>
                    </tbody>

                </table>
            </div>

        </c:if>
        </c:if>

         <!-- 탁송 그림-->
        <c:if test="${suar.svo.s_type == 0}">
            <c:if test="${suar.su_status ne 7}">
                <div>
                <div class="row" style="margin-top: 60px;">
                    <c:if test="${suar.su_status == 8}">
                        <div class="col">
                            <img src="/images/su_status55.png" />
                            <label style="display: flex; justify-content: center;">문제발생</label>
                        </div>
                    </c:if>
                  
                    <c:if test="${suar.su_status != 8}">
                    <c:choose>
                        <c:when test="${suar.su_status == 0}">
                            <div class="col">
                                <img src="/images/su_status00.png"/>
                                <label style="display: flex; justify-content: center;">주문 대기중</label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="col">
                                <img src="/images/su_status0.png" />
                                <label style="display: flex; justify-content: center;">주문 대기중</label>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${suar.su_status == 1}">
                            <div class="col">
                                <img src="/images/su_status11.png" />
                                <label style="display: flex; justify-content: center;">주문 접수</label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="col">
                                <img src="/images/su_status1.png" />
                                <label style="display: flex; justify-content: center;">주문 접수</label>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${suar.su_status == 2}">
                            <div class="col">
                                <img src="/images/su_status22.png" />
                                <label style="display: flex; justify-content: center;">탁송기사 이동중</label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="col">
                                <img src="/images/su_status2.png" />
                                <label style="display: flex; justify-content: center;">탁송기사 이동중</label>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${suar.su_status == 3}">
                            <div class="col">
                                <img src="/images/su_status33.png" />
                                <label style="display: flex; justify-content: center;">차량픽업</label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="col">
                                <img src="/images/su_status3.png" />
                                <label style="display: flex; justify-content: center;">차량픽업</label>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${suar.su_status == 4}">
                            <div class="col">
                                <img src="/images/su_status44.png" />
                                <label style="display: flex; justify-content: center;">충전소 이동중</label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="col">
                                <img src="/images/su_status4.png" />
                                <label style="display: flex; justify-content: center;">충전소 이동중</label>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${suar.su_status == 5}">
                            <div class="col">
                                <img src="/images/su_status55.png" />
                                <label style="display: flex; justify-content: center;">충전중</label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="col">
                                <img src="/images/su_status5.png" />
                                <label style="display: flex; justify-content: center;">충전중</label>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${suar.su_status == 6}">
                            <div class="col">
                                <img src="/images/su_status55.png" />
                                <label style="display: flex; justify-content: center;">도착지 이동중</label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="col">
                                <img src="/images/su_status5.png" />
                                <label style="display: flex; justify-content: center;">도착지 이동중</label>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${suar.su_status == 7}">
                            <div class="col">
                                <img src="/images/su_status55.png" />
                                <label style="display: flex; justify-content: center;">도착완료</label>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="col">
                                <img src="/images/su_status5.png" />
                                <label style="display: flex; justify-content: center;">도착완료</label>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                </div>
                </div>

            </c:if>
        </c:if>


        <!--탁송 정보-->
        <c:if test="${suar.svo.s_type == 0}">
        <c:if test="${suar.su_status ne 7}">


            <div class="row" style="margin-top: 100px; margin-bottom: 100px;">
                <table summary="게시판 목록" class="table table-hover">
					
                    <colgroup>
                        <col width="250px">
                        <col width="130px">
                        <col width="180px">
                        <col width="130px">
                        <col width="130px">
                        <col width="130px">
                        
                        <col width="120px">
                        <col width="120px">
                    </colgroup>
           
                    <thead>
                        <tr class="table-info">
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
                            
                        <tr style="height: 150px; margin-bottom: 100px;">

                            <td style="text-align: left; vertical-align: middle;">탁송 충전 서비스</td>
                            <td style="text-align: center; vertical-align: middle;">${suar.mvo.m_name}<br>${suar.mvo.m_phone}</td>   
                            <td style="text-align: center; vertical-align: middle;">${suar.su_date}</td>
                            <td style="text-align: center; vertical-align: middle;">${suar.su_sprice}원</td>
                            <td style="text-align: center; vertical-align: middle;">${suar.su_cprice}원</td>

                            <c:set var="num1" value="${suar.su_sprice}" />
                            <c:set var="num2" value="${suar.su_cprice}" />
                            <c:set var="sum" value="${(num1 + num2)}" />

                            <td style="text-align: center; vertical-align: middle;">${sum}원</td>
                        
                            <c:choose>
                                <c:when test="${suar.su_status == 0}">
                                    <td colspan="2" style="text-align: center; vertical-align: middle;">주문 대기중</td>
                                </c:when>
                                <c:when test="${suar.su_status == 1}">
                                    <td colspan="2" style="text-align: center; vertical-align: middle;">주문 접수</td>
                                </c:when>
                                <c:when test="${suar.su_status == 2}">
                                    <td colspan="2" style="text-align: center; vertical-align: middle;">탁송기사 이동중</td>
                                </c:when>
                                <c:when test="${suar.su_status == 3}">
                                    <td colspan="2" style="text-align: center; vertical-align: middle;">차량픽업</td>
                                </c:when>
                                <c:when test="${suar.su_status == 4}">
                                    <td colspan="2" style="text-align: center; vertical-align: middle;">충전소 이동중</td>
                                </c:when>
                                <c:when test="${suar.su_status == 5}">
                                    <td colspan="2" style="text-align: center; vertical-align: middle;">충전중</td>
                                </c:when>
                                <c:when test="${suar.su_status == 6}">
                                    <td colspan="2" style="text-align: center; vertical-align: middle;">도착지 이동중</td>
                                </c:when>
                                <c:when test="${suar.su_status == 7}">
                                    <td style="text-align: center; vertical-align: middle;">도착완료</td>
                                    <td style="text-align: center; vertical-align: middle;">
                                        <button type="button">후기 작성</button>
                                    </td>
                                </c:when>
                                <c:when test="${suar.su_status == 8}">
                                    <td colspan="2" style="text-align: center; vertical-align: middle;">문제발생</td>
                                </c:when>
                            </c:choose>

                        </tr>
                                    
                    </tbody>
                </table>
            </div>
        </c:if>
    </c:if>


    </c:forEach>  


      
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