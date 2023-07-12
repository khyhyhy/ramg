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
    <style>
    table th,table td {
      border-right: 1px #fff solid;
    }
  </style>
  </head>

  <body>
   <!--////////// Header Start ////////////-->
   <jsp:include page="../main/mainH.jsp"></jsp:include>
   <!--////////// Header end ////////////-->

   <!--////////// Main start //////////////-->
   <div class="container">
    <main>
      
      <table class="table table-dark table-striped">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">서비스유형</th>
            <th scope="col">C_IDX</th>
            <th scope="col">목표충전값</th>
            <th scope="col">결제방식</th>
            <th scope="col">결제정보</th>
            <th scope="col">서비스 이용일</th>
            <th scope="col">서비스 요금</th>
            <th scope="col">충전요금</th>
          </tr>
        </thead>
        <tbody class="table-group-divider">          
          <c:forEach items="${suar}" var="vo" varStatus="status">
            <tr>
                <th scope="row">${status.index + 1}목록</th>
                <td></td>
                <td></td>
                <td>${vo.su_percent}</td>
                <td>${vo.su_payment}</td>
                <td>${vo.su_payinfo}</td>
                <td>${vo.su_date}</td>
                <td>${vo.su_sprice}</td>
                <td>${vo.su_cprice}</td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
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