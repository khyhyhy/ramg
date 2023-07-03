<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <!DOCTYPE html>
  <html>

  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Insert title here</title>
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
   <article>
    <h1>서비스 이용 내역</h1>
   </article>
   <table id="su_list">
    <colgroup>
        <col width="150px"/>
        <col width="150px"/>
        <col width="100px"/>
        <col width="150px"/>
        <col width="150px"/>
        <col width="150px"/>
        <col width="*"/>
    </colgroup>
    <thead>
        <tr>
            <th>번호</th>
            <th>차량번호</th>
            <th>모델명</th>
            <th>서비스유형</th>
            <th>서비스상태</th>
            <th>이용날짜</th>
            <th>비고</th>
            
        </tr>
    </thead>
    <tbody>
        <c:forEach var="suvo" items="${s_list}">
            <tr>
                <td>${suvo.su_idx}</td>
                <td>${suvo.cvo.c_num}</td>
                <td>${suvo.cvo.c_name}</td>
                <td>${suvo.svo.s_type}
                    <c:choose>
                        <c:when test = "${suvo.svo.s_type eq 0}">
                            탁송
                        </c:when>
                        <c:when test = "${suvo.svo.s_type eq 1}">
                            이동식
                        </c:when>
                    </c:choose>
                </td>
                <td>
                    <c:choose>
                        <c:when test = "${suvo.svo.s_status eq 0}">
                            주문대기중
                        </c:when>
                        <c:when test = "${suvo.svo.s_status eq 1}">
                            주문접수
                        </c:when>
                        <c:when test = "${suvo.svo.s_status eq 2}">
                            탁송기사 이동중
                        </c:when>
                        <c:when test = "${suvo.svo.s_status eq 3}">
                            차량픽업
                        </c:when>
                        <c:when test = "${suvo.svo.s_status eq 4}">
                            충전소 이동중
                        </c:when>
                        <c:when test = "${suvo.svo.s_status eq 5}">
                            충전중
                        </c:when>
                        <c:when test = "${suvo.svo.s_status eq 6}">
                            도착지이동
                        </c:when>
                        <c:when test = "${suvo.svo.s_status eq 7}">
                            도착완료
                        </c:when>
                        <c:when test = "${suvo.svo.s_status eq 8}">
                            이슈발생
                        </c:when>
                    </c:choose>
                </td>
                <td>${suvo.su_date}</td>
                <td></td>
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