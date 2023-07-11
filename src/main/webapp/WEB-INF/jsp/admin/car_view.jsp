<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="../../../css/admin.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
<jsp:include page="mainH.jsp"></jsp:include>
<main>
    <div class="container" style="margin-top: 100px;">

        <h2>서비스 상세보기</h2>

        <table class="table table-hover">
            <colgroup>
                <col width="250px">
                <col width="200px">
                <col width="100px">
                <col width="200px">
                <col width="*">
                <col width="*">
                <col width="*">
                <col width="150px">
            </colgroup>
            <thead>
                <tr class="table-warning">
                    <th>신청일</th>
                    <th>서비스</th>
                    <th>사용자</th>
                    <th>진행상황</th>
                    <th>위치</th>
                    <th>충전비용</th>
                    <th>배달팁</th>
                    <th>결제금액</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${vo.su_date}</td>
                    <td>
                        <c:choose>
                            <c:when test="${vo.svo.s_type == 0}">
                                탁송 서비스
                            </c:when>    
                            <c:when test="${vo.svo.s_type == 1}">
                                이동식 충전 서비스
                            </c:when>    
                        </c:choose>
                    </td>
                    <td><a href="/admin/member_view?m_idx=${vo.cwvo.mvo.m_idx}&cPage=1">${vo.cwvo.mvo.m_name}</a></td>
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
                    <td><fmt:formatNumber pattern="#,###" value="${vo.su_cprice}"/>원</td>
                    <td><fmt:formatNumber pattern="#,###" value="${vo.su_sprice}"/>원</td>
                    <td>
                        <fmt:formatNumber pattern="#,###" value="${vo.su_cprice + vo.su_sprice}"/>원
                    </td>
                </tr>
            </tbody>
        </table>
        <table class="table table-hover">
            <thead>
                <tr class="table-warning">
                    <th>사업자 정보</th>
                    <th>목표충전량</th>
                    <th>결제수단</th>
                    <th>결제정보</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><a href="/admin/member_view?m_idx=${vo.svo.swvo.mvo.m_idx}">${vo.svo.swvo.mvo.m_name}</a></td>
                    <td>${vo.su_percent} %</td>
                    <td>${vo.su_payment}</td>
                    <td>${vo.su_payinfo}</td>
                </tr>
            </tbody>
        </table>
        <button type="button" class="btn btn-outline-warning" >취소</button>
        <button type="button" class="btn btn-outline-warning" >변경</button>
        
    </div>
</main>
</body>
</html>
