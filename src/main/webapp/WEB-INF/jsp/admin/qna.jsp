<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>문의 게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="../../../css/page.css" rel="stylesheet">
<body>
<jsp:include page="../main/mainH.jsp"></jsp:include>
<main>
    <div class="container">
        <h1>문의사항 관리</h1>
        <table class="table table-hover">
            <colgroup>
                <col width="150px">
                <col width="*">
                <col width="150px">
                <col width="150px">
                <col width="250px">
            </colgroup>
            <thead>
                <tr class="table-info">
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>답변</th>
                    <th>문의작성일</th>
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
                        <td>
                            <c:if test="${vo.b_val1 == 1}">
                                <img src="../images/lock.png" style="width: 15px;">
                            </c:if>
                            <a href="javascript:sub('${vo.b_idx}','${vo.bbslog.bl_date}')">${vo.b_title}</a>
                            <c:if test="${vo.b_filename != null}">
                                <img src="../images/link.png" style="width: 14px;">
                            </c:if>
                        </td>
                        <td>${vo.bbslog.mvo.m_name}</td>
                        <td>
                            <c:if test="${vo.c_list ne null and vo.c_list.size() > 0}">완료</c:if>
                            <c:if test="${vo.c_list eq null or vo.c_list.size() == 0}">미등록</c:if>
                        </td>
                        <td>${vo.bbslog.bl_date}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div style="height: 80px;" >
            ${pageCode}
        </div>

        <form action="/admin/qna_view" name="frm" method="post">
            <input type="hidden" name="b_idx">
            <input type="hidden" name="bl_date">
            <input type="hidden" name="cPage" value="${nowPage}">
            <input type="hidden" name="searchType" value="${param.searchType}">
            <input type="hidden" name="searchValue" value="${param.searchValue}">
        </form>
        
    </div>
</main>
<jsp:include page="../main/mainF.jsp"></jsp:include>

<script>
    function sub(b_idx, bl_date){
        document.frm.b_idx.value = b_idx;
        document.frm.bl_date.value = bl_date;
        document.frm.submit();
    }
</script>
</body>
</html>
