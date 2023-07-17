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
   <link href="../../../css/ramg.css" rel="stylesheet">
   <style>
      header{
        text-align: center;
      }
      .container{
        margin-top: 2cm;
        margin-bottom: 2cm;
    }

    
   </style>
  </head>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <body>
  <jsp:include page="../main/mainH.jsp"></jsp:include>
  <div class="row align-items-center" style="margin-top: 100px;">
    <header>
      <div style="margin: 50px 0 0 0;">
        <h1 style="text-align: center; font-weight: bold;">나의 정보</h1>
    </div>
    </header>
    <div class="card" style="width: 18rem; margin: auto;">
      <div class="card-body">
        <div class="mb-3">
          <p>이메일: ${mvo.m_email}</p>
        </div>
        <div class="mb-3">
          <p>이름: ${mvo.m_name}</p>
        </div>
        <div class="mb-3">
          <p>연락처: ${mvo.m_phone}</p>
        </div>
        </div>
        <button type="button" class="btn btn-success" onclick="javascript:location.href='updateMember'" style="margin: auto;">Edit</button>
      </div>
  
    
  </div>
    <jsp:include page="../main/mainF.jsp"></jsp:include>
  </body>

  </html>