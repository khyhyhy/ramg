<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>고객센터 공지사항 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="../../../css/page.css" rel="stylesheet">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
<jsp:include page="../main/mainH.jsp"></jsp:include>
<main>
    <div class="container">
        <h1>공지사항</h1>
        <form action="">
            <div style="height: 60px; float: right;">
                <c:if test="${sessionScope.mvo.m_class == 1 || sessionScope.mvo.m_class == 2}">
                    <span style="float: left; margin-right: 5px;">
                        <select name="category" class="form-select" aria-label="Default select example">
                            <c:if test="${param.category == 0}">
                            <option value="3">전체</option>
                            <option value="0" selected>일반공지</option>
                            <option value="1">사업자공지</option>
                        </c:if>
                        <c:if test="${param.category == 1}">
                            <option value="3">전체</option>
                            <option value="0">일반공지</option>
                            <option value="1" selected>사업자공지</option>
                        </c:if>
                        <c:if test="${param.category == 3}">
                            <option value="3" selected>전체</option>
                            <option value="0">일반공지</option>
                            <option value="1">사업자공지</option>
                        </c:if>
                        <c:if test="${param.category == null}">
                            <option value="3">전체</option>
                            <option value="0">일반공지</option>
                            <option value="1">사업자공지</option>
                        </c:if>
                        </select>
                    </span>
                </c:if>
                <select name="searchType" class="form-select" aria-label="Default select example" style="width: 130px; display: inline-block;">
                    <c:if test="${param.searchType == 0}">
                        <option value="0" selected>제목</option>
                        <option value="1">내용</option>
                        <option value="2">제목+내용</option>
                    </c:if>
                    <c:if test="${param.searchType == 1}">
                        <option value="0">제목</option>
                        <option value="1" selected>내용</option>
                        <option value="2">제목+내용</option>
                    </c:if>
                    <c:if test="${param.searchType == 2}">
                        <option value="0">제목</option>
                        <option value="1">내용</option>
                        <option value="2" selected>제목+내용</option>
                    </c:if>
                    <c:if test="${param.searchValue == null}">
                        <option value="0">제목</option>
                        <option value="1">내용</option>
                        <option value="2">제목+내용</option>
                    </c:if>
                </select>
                <input type="text" name="searchValue" value="${param.searchValue}"class="form-control" style="width: 200px; display: inline-block;">
                <button type="submit" class="btn btn-outline-info">검색</button>
            </div>
        </form>

        <table class="table table-hover" style="table-layout:fixed">
            <colgroup>
                <col width="100px">
                <col width="*">
                <col width="200px">
                <col width="100px">
            </colgroup>
            <thead>
                <tr class="table-info">
                    <th>번호</th>
                    <th>제목</th>
                    <th>등록일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${ar == null}">
                <tr>
                    <td colspan="4">검색 결과가 없습니다.</td>
                </tr>
                </c:if>
                <c:forEach var="vo" items="${ar}" varStatus="st">
                    <tr>
                        <td>${totalRecord - ((nowPage-1)*blockList+st.index) }</td>
                        <td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
                            <c:if test="${vo.b_to == 1}">
                                <span style="font-size: small; color: rgb(179, 179, 179);">[사업자]</span>
                            </c:if>
                            <a href="javascript:sub('${vo.b_idx}')">${vo.b_title}</a>
                            <c:if test="${vo.b_filename != null}">
                                <img src="../images/link.png" style="width: 14px;">
                            </c:if>
                        </td>
                        <td>${vo.bbslog.bl_date}</td>
                        <td>${vo.b_hit}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div style="height: 80px;" >
            ${pageCode}
        </div>
    </div>

    <form name="frm" method="post" action="/support/notice_view">
        <input type="hidden" name="b_idx">
        <input type="hidden" name="bl_date">
        <input type="hidden" name="cPage" value="${nowPage}">
        <input type="hidden" name="searchType" value="${param.searchType}">
        <input type="hidden" name="searchValue" value="${param.searchValue}">
    </form>
</main>
<jsp:include page="../main/mainF.jsp"></jsp:include>

<script>
    function sub(b_idx){
        document.frm.b_idx.value = b_idx;
        document.frm.submit();
    }
</script>
</body>
</html>