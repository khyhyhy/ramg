<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>자주 하는 질문</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="../../../css/ramg.css" rel="stylesheet">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<body>
<jsp:include page="../main/mainH.jsp"></jsp:include>
<main>
    <div class="container">
      <div class="m-5">
        <h1 style="text-align: center; font-weight: bold; color: rgb(35, 55, 109);">자주 하는 질문</h1>
      </div>
      <div class="accordion" id="accordionExample">
        <br>
        <br>
        <div class="pb-5">
          <c:forEach var="vo" items="${ar}" varStatus="st">

            <div class="accordion-item">
              <h2 class="accordion-header" id="heading${vo.b_idx}">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${vo.b_idx}" aria-expanded="true" aria-controls="collapse${vo.b_idx}">
                  ${st.index+1}. ${vo.b_title}
                </button>
              </h2>
              <div id="collapse${vo.b_idx}" class="accordion-collapse collapse" aria-labelledby="heading${vo.b_idx}" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  ${vo.b_content}
                </div>
              </div>
            </div>
          </c:forEach>
          <a href="/support/qna_write?cPage=1" class="mt-4" style="float: right; font-size: x-large;">문의 작성하기<i class="fa fa-arrow-circle-right ms-2"
            aria-hidden="true"></i></a>
          </div>
        <br>
        <br>
      </div>
    </div>
    
</main>
<jsp:include page="../main/mainF.jsp"></jsp:include>
</body>
</html>
