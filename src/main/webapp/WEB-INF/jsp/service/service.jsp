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
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
    crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
    <link href="../../../css/ramg.css" rel="stylesheet">
  </head>

  <body>
   <!--////////// Header Start ////////////-->
   <jsp:include page="../main/mainH.jsp"></jsp:include>
   <!--////////// Header end ////////////-->

   <!--////////// Main start //////////////-->
   <div class="container">
    <main>
      <div>
        <h2 style="margin-top: 5rem!important;">고객 서비스 신청 현황</h2>
       </div>
       <br />
       <br />
       <div class="table-responsive">
        <table class="table table-hover">
         <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">서비스유형</th>
            <th scope="col">목표충전값</th>
            <th scope="col">결제방식</th>
            <th scope="col">결제정보</th>
            <th scope="col">서비스 이용일</th>
            <th scope="col">서비스 요금</th>
            <th scope="col">충전요금</th>
            <th scope="col">서비스 상태</th>
          </tr>
         </thead>
         <tbody>
          <c:forEach items="${suar}" var="vo" varStatus="status">
            <th scope="row">${status.index + 1}</th>
              <td>
                <c:choose>
                  <c:when test="${vo.s_type eq 0}">탁송 서비스</c:when>
                  <c:when test="${vo.s_type eq 1}">이동식 서비스</c:when>
                </c:choose>
              </td>
                <td>${vo.su_percent}</td>
                <td>${vo.su_payment}</td>
                <td>${vo.su_payinfo}</td>
                <td style="word-break: break-all; text-overflow:unset; overflow:unset; white-space:unset;">
                  <script>
                    var date = '${vo.su_date}'.substr(0, 10);
                    var time = '${vo.su_date}'.substr(11);
                    document.write(date+'<br/>');
                    document.write(time);
                  </script>
                </td>
                <td>${vo.su_sprice}</td>
                <td>${vo.su_cprice}</td>
                <td>
                  <c:choose>
                    <c:when test="${vo.su_status eq 0}">서비스 접수</c:when>
                    <c:when test="${vo.su_status eq 1}">이동중</c:when>
                    <c:when test="${vo.su_status eq 2}">픽업완료</c:when>
                    <c:when test="${vo.su_status eq 3}">충전소 이동</c:when>
                    <c:when test="${vo.su_status eq 4}">충전중</c:when>
                    <c:when test="${vo.su_status eq 5}">반납지 이동</c:when>
                    <c:when test="${vo.su_status eq 7}">서비스 완료</c:when>
                  </c:choose>
              </td>
              </tr>
          </c:forEach>
         </tbody>
        </table>
       </div>
    </main>
   </div>
   <!--////////// Main end //////////////-->

   <!--////////// Foter start //////////////-->
   <jsp:include page="../main/mainF.jsp"></jsp:include>
   <!--////////// Foter end //////////////-->
   <script src="https://code.jquery.com/jquery-3.6.4.min.js"
    integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>

   <script>
    
   </script>
  </body>
</html>