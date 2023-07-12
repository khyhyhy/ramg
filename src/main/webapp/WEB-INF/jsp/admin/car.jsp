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
<link href="../../../css/admin_page.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
<jsp:include page="mainH.jsp"></jsp:include>
<main>
    <div class="container" style="margin-top: 100px;">
       <h1>서비스 내역</h1>
       <br>


       <form action="/admin/car" method="post">
            <div style="height: 60px; float: left;">
                <input type="text" id="m_date" name="search_date" placeholder="날짜 검색" value="${param.search_date}" class="form-control" style="width: 200px; display: inline-block;">
                <button type="submit" class="btn btn-outline-warning">조회</button>
            </div>

            <div style="height: 60px; float: right;">
                <c:if test="${param.searchType == 9 || param.searchType == 8}">
                    <input type="text" name="searchValue" class="form-control" style="width: 200px; display: inline-block;" placeholder="사용자 이름 검색">
                </c:if>
                <c:if test="${param.searchType != 9 && param.searchType != 8}">
                    <input type="text" name="searchValue" value="${param.searchValue}" class="form-control" style="width: 200px; display: inline-block;" placeholder="사용자 이름 검색">
                </c:if>
                <button type="submit" class="btn btn-outline-warning">검색</button>
            </div>
            <input type="hidden" name="searchType" value="1">
        </form>

       <table class="table table-hover">
        <colgroup>
            <col width="250px">
            <col width="200px">
            <col width="150px">
            <col width="200px">
            <col width="*">
            <col width="200px">
        </colgroup>
        <thead>
            <tr class="table-warning">
                <th>신청일</th>
                <th>서비스</th>
                <th>사용자</th>
                <th>상태</th>
                <th>위치</th>
                <th>결제금액</th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${ar == null}">
                <tr>
                    <td colspan="6">검색 결과가 없습니다.</td>
                </tr>
            </c:if>
            <c:forEach var="vo" items="${ar}" varStatus="st">
               <tr>
                    <td>${vo.su_date}</td>
                    <td><a href="javascript:sub('${vo.su_idx}')">
                        <c:choose>
                            <c:when test="${vo.svo.s_type == 0}">
                                탁송 서비스
                            </c:when>    
                            <c:when test="${vo.svo.s_type == 1}">
                                이동식 충전 서비스
                            </c:when>    
                        </c:choose>
                    </a></td>
                    <td><a href="/admin/member_view?m_idx=${vo.cwvo.mvo.m_idx}&cPage=1">${vo.cwvo.mvo.m_name}</a></td>
                    <td>
                    <c:if test="${vo.svo.s_type == 0}">
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
                            <c:when test="${vo.su_status == 8}">
                                이슈 발생
                            </c:when>
                        </c:choose>
                    </c:if>
                    <c:if test="${vo.svo.s_type == 1}">
                        <c:choose>
                            <c:when test="${vo.su_status == 0}">
                                주문 대기 중
                            </c:when>
                            <c:when test="${vo.su_status == 1}">
                                주문 접수
                            </c:when>
                            <c:when test="${vo.su_status == 2}">
                                충전지 이동 중
                            </c:when>
                            <c:when test="${vo.su_status == 3}">
                                충전지 도착
                            </c:when>
                            <c:when test="${vo.su_status == 4}">
                                충전 중
                            </c:when>
                            <c:when test="${vo.su_status == 7}">
                                충전 완료
                            </c:when>
                            <c:when test="${vo.su_status == 8}">
                                이슈 발생
                            </c:when>
                        </c:choose>
                    </c:if>

                    </td>
                    <td>${vo.svo.s_state} ${vo.svo.s_city}</td>
                    <td>
                        <fmt:formatNumber pattern="#,###" value="${vo.su_cprice + vo.su_sprice}"/>원
                    </td>
               </tr>
            </c:forEach>
        </tbody>
    </table>

    <div style="height: 80px;" >
        ${pageCode}
    </div>

    <form action="/admin/car_view" method="post" name="frm">
        <input type="hidden" name="su_idx">
        <input type="hidden" name="cPage" value="${nowPage}">
        <input type="hidden" name="searchType" value="${param.searchType}">
        <input type="hidden" name="searchValue" value="${param.searchValue}">
        <input type="hidden" name="search_date" value="${param.search_date}">
    </form>
       
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script>
		$(function(){
			$("#m_date").datepicker({
				dateFormat: "yy-mm-dd",
				dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
				monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
				showMonthAfterYear: true,
                maxDate: 0
			});
		});

        function sub(idx){
            document.frm.su_idx.value = idx;
            document.frm.submit();
        }
	</script>
</body>
</html>
