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

        <h2>리뷰관리</h2>
        <form action="/admin/review" method="post">
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
                <col width="100px">
                <col width="100px">
                <col width="*">
                <col width="150px">
                <col width="120px">
                <col width="210px">
            </colgroup>
            <thead>
                <tr class="table-warning">
                    <th>번호</th>
                    <th>대상</th>
                    <th>리뷰</th>
                    <th>별점</th>
                    <th>작성자</th>
                    <th>작성일</th>
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
                        <td>${totalRecord - ((nowPage-1)*blockList+st.index)}</td>
                        <td>${vo.suvo.svo.swvo.mvo.m_name}</td>
                        <td style="word-break: break-all; text-overflow:unset; overflow:unset; white-space:unset;">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-heading${vo.b_idx}">
                                  <button class="accordion-button collapsed" style="overflow: hidden;
                                  text-overflow: ellipsis;
                                  white-space: nowrap;" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${vo.b_idx}" aria-expanded="false" aria-controls="flush-collapse${vo.b_idx}">
                                    ${vo.b_content}
                                  </button>
                                </h2>
                                <div id="flush-collapse${vo.b_idx}" class="accordion-collapse collapse" aria-labelledby="flush-heading${vo.b_idx}" data-bs-parent="#accordionFlushExample">
                                  <div class="accordion-body"><br>${vo.b_content}</div>
                                </div>
                              </div>
                        </td>
                        <td>
                            <c:if test="${vo.b_score == 0}">
                                ☆☆☆☆☆
                            </c:if>
                            <c:if test="${vo.b_score == 1}">
                                ★☆☆☆☆
                            </c:if>
                            <c:if test="${vo.b_score == 2}">
                                ★★☆☆☆
                            </c:if>
                            <c:if test="${vo.b_score == 3}">
                                ★★★☆☆
                            </c:if>
                            <c:if test="${vo.b_score == 4}">
                                ★★★★☆
                            </c:if>
                            <c:if test="${vo.b_score == 5}">
                                ★★★★★
                            </c:if>
                        </td>
                        <td><a href="/admin/member_view?m_idx=${vo.bbslog.m_idx}&cPage=1">${vo.bbslog.mvo.m_name}</a></td>
                        <td>${vo.bbslog.bl_date}</td>
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
