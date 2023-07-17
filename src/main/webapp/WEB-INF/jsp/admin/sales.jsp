<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style>
    .ui-datepicker{
        background-color: rgb(255, 255, 255);
        border: solid #fff3af 3px;
        border-radius: 5px;
    }
</style>
<body>
<jsp:include page="mainH.jsp"></jsp:include>
<main>
    <div class="container" style="margin-top: 100px;">

        <div style="margin: 50px 0 0 0;">
            <h1 style="text-align: center; font-weight: bold;">매출 관리</h1>
        </div>

        <form action="/admin/sales">
            <div style="height: 60px; float: right;">
                <input type="text" id="m_date" name="search_date" placeholder="날짜 검색" value="${param.search_date}" class="form-control" style="width: 200px; display: inline-block;">
                <button type="submit" class="btn btn-outline-warning">조회</button>
            </div>
        </form>

        <label for="day"><c:if test="${param.search_date == null}">오늘</c:if>
            <c:if test="${param.search_date != null}">${param.search_date}</c:if></label>
        <table class="table" id="day">
            <thead>
                <tr class="table-warning">
                    <th>총 이용건수</th>
                    <th>총 배달팁</th>
                    <th>총 충전비용</th>
                    <th>총 합계</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <c:if test="${param.search_date == null}">
                            <a href="/admin/car?search_date=${today_date}">
                        </c:if>
                        <c:if test="${param.search_date != null}">
                            <a href="/admin/car?search_date=${param.search_date}">
                        </c:if>
                        ${fn:length(search_sales) } 건</a></td>
                    <c:set var="search_total1" value="0" />
                    <c:set var="search_total2" value="0" />
                    <c:forEach items="${search_sales}" var="search">
                        <c:set var="search_total1" value="${search_total1 + search.su_sprice}" />
                        <c:set var="search_total2" value="${search_total2 + search.su_cprice}" />
                    </c:forEach>
                    <td><fmt:formatNumber pattern="#,###" value="${search_total1}"/>원</td>
                    <td><fmt:formatNumber pattern="#,###" value="${search_total2}"/>원</td>
                    <td><fmt:formatNumber pattern="#,###" value="${search_total1 + search_total2}"/>원</td>
                </tr>
            </tbody>
        </table>

        <label for="month"><c:if test="${param.search_date == null}">이번달</c:if>
            <c:if test="${param.search_date != null}">${param.search_date.substring(0,7)}</c:if></th></label>
        <table class="table" id="month">
            <thead>
                <tr class="table-warning">
                    <th>총 이용건수</th>
                    <th>총 배달팁</th>
                    <th>총 충전비용</th>
                    <th>총 합계</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <c:if test="${param.search_date == null}">
                            <a href="/admin/car?search_date=${fn:substring(today_date,0,7)}">
                        </c:if>
                        <c:if test="${param.search_date != null}">
                            <a href="/admin/car?search_date=${fn:substring(param.search_date,0,7)}">
                        </c:if>
                        ${fn:length(search_month_sales) } 건</a></td>
                    <c:set var="search_month_total1" value="0" />
                    <c:set var="search_month_total2" value="0" />
                    <c:forEach items="${search_month_sales}" var="search_month">
                        <c:set var="search_month_total1" value="${search_month_total1 + search_month.su_sprice }" />
                        <c:set var="search_month_total2" value="${search_month_total2 + search_month.su_cprice}" />
                    </c:forEach>
                    <td><fmt:formatNumber pattern="#,###" value="${search_month_total1}"/>원</td>
                    <td><fmt:formatNumber pattern="#,###" value="${search_month_total2}"/>원</td>
                    <td><fmt:formatNumber pattern="#,###" value="${search_month_total1 + search_month_total2}"/>원</td>
                </tr>
            </tbody>
        </table>
        
        
        <label for="total">누적</label>
        <table class="table" id="total">
            <thead>
                <tr class="table-warning">
                    <th>총 이용건수</th>
                    <th>총 배달팁</th>
                    <th>총 충전비용</th>
                    <th>총 합계</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><a href="/admin/car">${fn:length(total_sales) } 건</a></td>
                    <c:set var="total_total1" value="0" />
                    <c:set var="total_total2" value="0" />
                    <c:forEach items="${total_sales}" var="total">
                        <c:set var="total_total1" value="${total_total1 + total.su_sprice}" />
                        <c:set var="total_total2" value="${total_total2 + total.su_cprice}" />
                    </c:forEach>
                    <td><fmt:formatNumber pattern="#,###" value="${total_total1}"/>원</td>
                    <td><fmt:formatNumber pattern="#,###" value="${total_total2}"/>원</td>
                    <td><fmt:formatNumber pattern="#,###" value="${total_total1 + total_total2}"/>원</td>
                </tr>
            </tbody>
        </table>


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
	</script>

</body>
</html>
