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

        <div style="margin: 50px 0;">
            <h1 style="text-align: center; font-weight: bold;">서비스 상세보기</h1>
        </div>

        <table class="table table-hover">
            <colgroup>
                <col width="150px">
                <col width="150px">
                <col width="150px">
                <col width="*">
                <col width="150px">
                <col width="150px">
                <col width="150px">
            </colgroup>
            <thead>
                <tr class="table-warning">
                    <th>사용자</th>
                    <th>목표충전량</th>
                    <th>충전비용</th>
                    <th>결제수단</th>
                    <th>결제정보</th>
                    <th>배달팁</th>
                    <th>결제금액</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><a href="/admin/member_view?m_idx=${ar[0].cvo.cwvo.mvo.m_idx}&cPage=1">${ar[0].cvo.cwvo.mvo.m_name}</a></td>
                    <td>${ar[0].su_percent} %</td>
                    <td>${ar[0].su_payment}</td>
                    <td>${ar[0].su_payinfo}</td>
                    <td><fmt:formatNumber pattern="#,###" value="${ar[0].su_cprice}"/>원</td>
                    <td><fmt:formatNumber pattern="#,###" value="${ar[0].su_sprice}"/>원</td>
                    <td>
                        <fmt:formatNumber pattern="#,###" value="${ar[0].su_cprice + ar[0].su_sprice}"/>원
                    </td>
                </tr>
            </tbody>
        </table>


        <table class="table table-hover">
            <thead>
            <tr class="table-warning">
                <th>
                    <c:choose>
                    <c:when test="${ar[0].svo.s_type == 0}">
                        탁송 서비스
                    </c:when>    
                    <c:when test="${ar[0].svo.s_type == 1}">
                        이동식 충전 서비스
                    </c:when>    
                    </c:choose>
                </th>
                <th>${ar[0].svo.s_city} ${ar[0].svo.s_addr1}</th>
            </tr>
            </thead>
            <c:forEach items="${ar}" var="vo">
            <tr>
                <td>${vo.su_date}</td>
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
            </tr>
            </c:forEach>
        </table>

        <div style="height: 80px;">
            <button type="button" class="btn btn-outline-warning" onclick="back()">목록</button>
            <span style="float: right;">
                <button type="button" class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    상태변경
                </button>
                <!-- <button type="button" class="btn btn-outline-warning">서비스 취소</button> -->
            </span>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                    <div class="modal-body">
                        현재 상태 : 
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


                        <c:if test="${vo.svo.s_type == 0}">
                            <select name="su_status" class="form-select" aria-label="Default select example" id="su_status">
                                <option value="0">주문 대기 중</option>
                                <option value="1">주문 접수</option>
                                <option value="2">탁송기사 이동 중</option>
                                <option value="3">차량 픽업</option>
                                <option value="4">충전소 이동 중</option>
                                <option value="5">충전 중</option>
                                <option value="6">도착지 이동 중</option>
                                <option value="7">도착 완료</option>
                                <option value="8">이슈 발생</option>
                            </select>
                        </c:if>
                        <c:if test="${vo.svo.s_type == 1}">
                            <select name="su_status" class="form-select" aria-label="Default select example" id="su_status">
                                <option value="0">주문 대기 중</option>
                                <option value="1">주문 접수</option>
                                <option value="2">충전지 이동 중</option>
                                <option value="3">충전지 도착</option>
                                <option value="4">충전 중</option>
                                <option value="5">충전 완료</option>
                                <option value="6">이슈 발생</option>
                            </select>
                        </c:if>
                        
                    </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-warning" onclick="car_status()">변경</button>
                <button type="button" class="btn btn-outline-warning" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
            </div>
        </div>

        <form method="post" name="frm">
            <input type="hidden" name="su_idx" value="${vo.su_idx}" id="su_idx">
            <input type="hidden" name="cPage" value="${param.cPage}">
            <input type="hidden" name="searchType" value="${param.searchType}">
            <input type="hidden" name="searchValue" value="${param.searchValue}">
            <input type="hidden" name="search_date" value="${param.search_date}">
        </form>



    </div>
</main>
</body>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
    <script>
        function back(){
            document.frm.action = "/admin/car";
            document.frm.submit();
        }
        
        function car_status(){

            let su_idx = $("#su_idx").val();    
            let su_status = $("#su_status").val();    
            let st = $("#st").val();

            $.ajax({
                url: "/admin/car_status",
                type: "post",
                data: {"su_idx":su_idx, "su_status":su_status},
                dataType:"json"
            }).done(function(data){
                if(data.res == 1){ //성공한 경우에만 수행
                    location.reload();
                }
            });
        }
    </script>
</html>
