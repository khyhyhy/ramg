<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="../../../css/admin.css" rel="stylesheet">
<link href="../../../css/admin_page.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
<jsp:include page="mainH.jsp"></jsp:include>
<main>
    <div class="container" style="margin-top: 100px;">
       <h1>서비스 내역</h1>

        <form action="/admin/car" method="post">
            <div style="height: 60px; float: right;">
                <select name="searchType" class="form-select" aria-label="Default select example" style="width: 130px; display: inline-block;">
                    <c:if test="${param.searchType == 1}">
                        <option value="1" selected>내용</option>
                        <option value="3">작성자</option>
                    </c:if>
                    <c:if test="${param.searchType == 3}">
                        <option value="1">내용</option>
                        <option value="3" selected>작성자</option>
                    </c:if>
                    <c:if test="${param.searchValue == null}">
                        <option value="1">내용</option>
                        <option value="3">작성자</option>
                    </c:if>
                </select>
                <input type="text" name="searchValue" value="${param.searchValue}" class="form-control" style="width: 200px; display: inline-block;">
                <button type="submit" class="btn btn-outline-warning">검색</button>
            </div>
        </form>

       <table class="table table-hover">
        <colgroup>
            <col width="250px">
            <col width="150px">
            <col width="*">
            <col width="300px">
            <col width="300px">
        </colgroup>
        <thead>
            <tr class="table-warning">
                <th>신청일</th>
                <th>사용자</th>
                <th>진행상황</th>
                <th>위치</th>
                <th>결제금액</th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${ar == null}">
                <tr>
                    <td colspan="5">검색 결과가 없습니다.</td>
                </tr>
            </c:if>
            <c:forEach var="vo" items="${ar}" varStatus="st">
               <tr>
                    <td>${vo.su_date}</td>
                    <td>${vo.cwvo.mvo.m_name}</td>
                    <td>
                    <c:choose>
                        <c:when test="${vo.su_status == 0}">
                            주문 대기 중
                        </c:when>
                        <c:when test="${vo.su_status == 1}">
                            주문 접수
                        </c:when>
                        <c:when test="${vo.su_status == 2}">
                            탁송기사 이동 중
                        </c:when>
                        <c:when test="${vo.su_status == 3}">
                            차량 픽업
                        </c:when>
                        <c:when test="${vo.su_status == 4}">
                            충전소 이동 중
                        </c:when>
                        <c:when test="${vo.su_status == 5}">
                            충전 중
                        </c:when>
                        <c:when test="${vo.su_status == 6}">
                            도착지 이동 중
                        </c:when>
                        <c:when test="${vo.su_status == 7}">
                            도착 완료
                        </c:when>
                    </c:choose>
                    </td>
                    <td>${vo.svo.s_city}</td>
                    <td>${vo.su_cprice}</td>
               </tr>
            </c:forEach>
        </tbody>
    </table>
       
    <div style="height: 80px;" >
        ${pageCode}
    </div>
        
    </div>
</main>
</body>
</html>
