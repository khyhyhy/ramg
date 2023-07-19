<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>리뷰</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="../../../css/ramg.css" rel="stylesheet">

</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<link href="../../../css/page.css" rel="stylesheet">
<body>
<jsp:include page="../main/mainH.jsp"></jsp:include>
<main>
    <div class="container">
        <div class="m-5">
            <h1 style="text-align: center; font-weight: bold; color: rgb(35, 55, 109);">리뷰 게시판</h1>
        </div>
        <form action="/support/review" method="post">
            <div style="height: 60px; float: right;">
                <select name="searchType" class="form-select" aria-label="Default select example" style="width: 130px; display: inline-block;">
                    <c:if test="${param.searchType == 1}">
                        <option value="1" selected>내용</option>
                        <option value="2">사업자명</option>
                        <option value="3">작성자</option>
                    </c:if>
                    <c:if test="${param.searchType == 2}">
                        <option value="1">내용</option>
                        <option value="2"selected>사업자명</option>
                        <option value="3">작성자</option>
                    </c:if>
                    <c:if test="${param.searchType == 3}">
                        <option value="1">내용</option>
                        <option value="2">사업자명</option>
                        <option value="3" selected>작성자</option>
                    </c:if>
                    <c:if test="${param.searchValue == null}">
                        <option value="1">내용</option>
                        <option value="2">사업자명</option>
                        <option value="3">작성자</option>
                    </c:if>
                </select>
                <input type="text" name="searchValue" value="${param.searchValue}" class="form-control" style="width: 200px; display: inline-block;">
                <button type="submit" class="btn btn-outline-info">검색</button>
            </div>
        </form>

        <table class="table table-hover" style="table-layout:fixed;">
            <colgroup>
                <col width="80px">
                <col width="150px">
                <col width="*">
                <col width="120px">
                <col width="100px">
                <col width="210px">
            </colgroup>
            <thead>
                <tr class="table-info">
                    <th>번호</th>
                    <th>이용 서비스</th>
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
                        <td>
                            <c:if test="${vo.suvo.svo.s_type == 0}">탁송</c:if>
                            <c:if test="${vo.suvo.svo.s_type == 1}">이동식</c:if>
                            ( ${vo.suvo.svo.swvo.mvo.m_name}</a> )
                        </td>
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
                        <td>${vo.bbslog.mvo.m_name}</td>
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
<jsp:include page="../main/mainF.jsp"></jsp:include>

</body>
</html>
