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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="../../../css/admin.css" rel="stylesheet">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
<jsp:include page="mainH.jsp"></jsp:include>
<main>
    <div class="container" style="margin-top: 100px;">
        <h1>람쥐썬더 관리자 페이지</h1><br><br>
        <div class="container">
            <div class="row">
                <div class="col">
                    <label for="service"><a href="/admin/sales">매출 > </a></label>
                    <table id="service" class="table table-bordered">
                        <thead>
                            <tr class="table-warning">
                                <th>오늘</th>
                                <th>이번달</tr>
                        </thead>
                        <tbody>
                            <tr>
                                <c:set var="today_total" value="0" />
                                <c:forEach items="${today_sales}" var="today">
                                    <c:set var="today_total" value="${today_total + today.su_sprice + today.su_cprice}" />
                                </c:forEach>
                                <td>
                                    ${fn:length(today_sales) } 건 / <fmt:formatNumber pattern="#,###" value="${today_total}"/>원</td>
                                <c:set var="month_total" value="0" />
                                <c:forEach items="${month_sales}" var="month">
                                    <c:set var="month_total" value="${month_total + month.su_sprice + month.su_cprice}" />
                                </c:forEach>
                                <td>
                                    ${fn:length(month_sales) } 건 / <fmt:formatNumber pattern="#,###" value="${month_total}"/>원</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="col">
                    <label for="member"><a href="/admin/member">회원 현황 > </a></label>
                    <table id="member" class="table table-bordered">
                        <colgroup>
                            <col width="150px">
                            <col width="150px">
                            <col width="150px">
                            <col width="*">
                        </colgroup>
                        <thead>
                        <tr class="table-warning">
                            <th>개인 회원</th>
                            <th>사업자 회원</th>
                            <th>관리자</th>
                            <th>총 회원</th>
                        </tr>
                        </thead>
                        <tr>
                            <td><a href="/admin/member?searchType=0&searchValue=&m_class=0">${pr} 명</a></td>
                            <td><a href="/admin/member?searchType=0&searchValue=&m_class=1">${bz} 명</a></td>
                            <td><a href="/admin/member?searchType=0&searchValue=&m_class=2">${ad} 명</a></td>
                            <td style="background-color: rgb(255, 255, 229);"><a href="/admin/member">
                                ${pr+bz+ad} 명 
                                <c:if test="${tod > 0}">
                                <span style="color: red;" >( ${tod} ↑ )</span>
                                </c:if>
                                <c:if test="${tod == 0}">
                                ( - )
                                </c:if>
                                </a>
                            </td>
                        </tr>
                    </table>
                </div>
                
            </div>
            
            <div class="row">
                <div class="col">
                <label for="notice"><a href="/admin/notice">최근 공지 > </a></label>
                <table id="notice" class="table table-bordered table-hover" style="table-layout:fixed">
                    <thead>
                        <tr class="table-warning">
                            <th>제목</th>
                        </tr>
                    </thead>
                        <c:forEach var="bvo" items="${b_ar}">
                        <tr>
                            <td>
                                <c:if test="${bvo.b_val1 == 1}">
                                    <img src="../images/lock.png" style="width: 15px;">
                                </c:if>
                                <a href="/admin/notice_view?b_idx=${bvo.b_idx}&cPage=1">
                                    <c:if test="${bvo.b_to == 1}">
                                    <span style="font-size: small; color: rgb(179, 179, 179);">[사업자]</span>
                                    </c:if>${bvo.b_title}</a>
                                <c:if test="${bvo.b_filename != null}">
                                    <img src="../images/link.png" style="width: 14px;">
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
              </div>

              <div class="col">
                <label for="qna"><a href="/admin/qna">최근 문의 > </a></label>
                <table id="qna" class="table table-bordered table-hover">
                    <colgroup>
                        <col width="*">
                        <col width="130px">
                    </colgroup>
                    <thead>
                    <tr class="table-warning">
                        <th>제목</th>
                        <th>작성자</th>
                    </tr>
                    </thead>
                    <c:forEach var="qvo" items="${q_ar}">
                    <tr>
                        <td>
                            <c:if test="${qvo.b_val1 == 1}">
                                <img src="../images/lock.png" style="width: 15px;">
                            </c:if>
                            <a href="/admin/qna_view?b_idx=${qvo.b_idx}&cPage=1">${qvo.b_title}</a>
                            <c:if test="${qvo.b_filename != null}">
                                <img src="../images/link.png" style="width: 14px;">
                            </c:if>
                            <c:if test="${qvo.c_list.size() != 0}">
                                [${qvo.c_list.size()}]
                            </c:if>
                        </td>
                        <td><a href="/admin/member_view?m_idx=${qvo.bbslog.m_idx}&cPage=1">${qvo.bbslog.mvo.m_name}</a></td>
                    </tr>
                    </c:forEach>
                </table>
              </div>
              

            </div>
            <div class="row">
                
              <div class="col">
                <label for="service"><a href="/admin/review">최근 리뷰 > </a></label>
                <table id="service" class="table table-bordered table-hover">
                    <colgroup>
                        <col width="*"> 
                        <col width="130px"> 
                    </colgroup>
                    <thead>
                    <tr class="table-warning">
                        <th>내용</th>
                        <th>별점</th>
                    </tr>
                    </thead>
                    <c:forEach items="${r_ar}" var="rvo">
                    <tr>
                        <td style="word-break: break-all; text-overflow:unset; overflow:unset; white-space:unset;">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-heading${vo.b_idx}">
                                  <button class="accordion-button collapsed"  style="overflow: hidden;
                                  text-overflow: ellipsis;
                                  white-space: nowrap;" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${rvo.b_idx}" aria-expanded="false" aria-controls="flush-collapse${rvo.b_idx}">
                                  <c:if test="${rvo.b_val1 == 1}">
                                    <img src="../images/lock.png" style="width: 15px;">
                                </c:if>&nbsp;${rvo.b_content}
                                  </button>
                                </h2>
                                <div id="flush-collapse${rvo.b_idx}" class="accordion-collapse collapse" aria-labelledby="flush-heading${rvo.b_idx}" data-bs-parent="#accordionFlushExample">
                                  <div class="accordion-body"><br>${rvo.b_content}</div>
                                </div>
                              </div>
                        </td>
                        <td>
                            <c:if test="${rvo.b_score == 0}">
                            ☆☆☆☆☆
                        </c:if>
                        <c:if test="${rvo.b_score == 1}">
                            ★☆☆☆☆
                        </c:if>
                        <c:if test="${rvo.b_score == 2}">
                            ★★☆☆☆
                        </c:if>
                        <c:if test="${rvo.b_score == 3}">
                            ★★★☆☆
                        </c:if>
                        <c:if test="${rvo.b_score == 4}">
                            ★★★★☆
                        </c:if>
                        <c:if test="${rvo.b_score == 5}">
                            ★★★★★
                        </c:if>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
              </div>
              <div class="col">
                <label for="service"><a href="/admin/car">서비스 > </a></label>
                <table id="service" class="table table-bordered table-hover">
                    <thead>
                    <colgroup>
                        <col width="130px">
                        <col width="200px">
                        <col width="*">
                    </colgroup>
                    <tr class="table-warning">
                        <th>사용자</th>
                        <th>이용 서비스</th>
                        <th>진행상황</th>
                    </tr>
                    </thead>
                    <c:forEach items="${su_ar}" var="suvo">
                        <tr>
                            <td><a href="/admin/member_view?m_idx=${suvo.cwvo.mvo.m_idx}&cPage=1">${suvo.cwvo.mvo.m_name}</a></td>
                            <td><a href="/admin/car_view?su_idx=${suvo.su_idx}">
                            <c:choose>
                                <c:when test="${suvo.svo.s_type == 0}">
                                    탁송 서비스
                                </c:when>    
                                <c:when test="${suvo.svo.s_type == 1}">
                                    이동식 충전 서비스
                                </c:when>    
                            </c:choose>
                            </a></td>
                            <td>
                            <c:choose>
                                <c:when test="${suvo.su_status == 0}">
                                    주문 대기 중
                                </c:when>
                                <c:when test="${suvo.su_status == 1}">
                                    주문 접수
                                </c:when>
                                <c:when test="${suvo.su_status == 2}">
                                    탁송기사 이동 중
                                </c:when>
                                <c:when test="${suvo.su_status == 3}">
                                    차량 픽업
                                </c:when>
                                <c:when test="${suvo.su_status == 4}">
                                    충전소 이동 중
                                </c:when>
                                <c:when test="${suvo.su_status == 5}">
                                    충전 중
                                </c:when>
                                <c:when test="${suvo.su_status == 6}">
                                    도착지 이동 중
                                </c:when>
                                <c:when test="${suvo.su_status == 7}">
                                    도착 완료
                                </c:when>
                            </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
              </div>
            </div>
          </div>
        
    </div>
</main>
</body>
</html>
