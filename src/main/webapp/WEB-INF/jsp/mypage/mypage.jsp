<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <!DOCTYPE html>
  <html>

  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Insert title here</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <style>
      article{
        text-align: center;
      }

      h2{
        text-align: center;
        font-family: 'GoryeongStrawberry';
      }
      p{
        text-align: center;
        font-family: 'GoryeongStrawberry';
      }
      #atag{
        text-align: center;
        font-family: 'GoryeongStrawberry';
      }
      .container{
        margin-top: 2cm;
        margin-bottom: 2cm;
    }
    article{
      margin-bottom: 1cm;
  }
   </style>
  </head>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <body>
  <jsp:include page="../main/mainH.jsp"></jsp:include>
  <div class="container text-center">
   
    <article>
   <h2>회원 정보</h2>
   </article>
    <p>이메일: ${mvo.m_email}</p>
    <p>이름: ${mvo.m_name}</p>
    <p>연락처: ${mvo.m_phone}</p>
    <p>주소: ${mvo.m_address}</p>
    <c:if test="${mvo.m_class == 0}">
    <p>결제수단: ${mvo.m_payment}</p>
    </c:if>
    <div id="atag">
    <a href="updateMember">Edit</a>
    </div>
  </div>
    <jsp:include page="../main/mainF.jsp"></jsp:include>
  </body>

  </html>