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
        text-align: center;
    }
    table th, table td{
        border: 1px solid black;
    }
    h1{
            text-align: center;
        }
    div{
        text-align: center;
      }
    
</style>
</head>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <body>
  <jsp:include page="../main/mainH.jsp"></jsp:include>
   <article>
    <h1>나의 문의</h1>
   </article>

   <div id="content">
    <table id="bl_list">
        <colgroup>
            <col width="150px"/>
            <col width="150px"/>
            <col width="100px"/>
            <col width="150px"/>
            <col width="150px"/>
            <col width="*"/>
        </colgroup>
        <thead>
            
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>날짜</th>
                <th>조회수</th>
                <th>문의글 대상</th>
                <th>비고</th>
                
            </tr>
        </thead>
        <tbody>
            <c:forEach var="lvo" items="${mq}">
                <tr>
                    <td>${lvo.bvo.b_idx}</td>
                    <td>${lvo.bvo.b_title}</td>
                    <td>${lvo.bl_date}</td>
                    <td>${lvo.bvo.b_hit}</td>
                    <td>${lvo.bvo.b_target}</td>
                    <td></td>
                </tr>
            </c:forEach>
        </tbody>
       </table>
   </div>

   <jsp:include page="../main/mainF.jsp"></jsp:include>
</body>

</html>