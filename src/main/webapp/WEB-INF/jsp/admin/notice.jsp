<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">about:blank#blockede
<title>관리자페이지 글 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="../../../css/page.css" rel="stylesheet">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<body>
<jsp:include page="../main/mainH.jsp"></jsp:include>
<main>
<div class="container">
    <table style="width: 1100px;" class="table table-hover">
        <colgroup>
            <col width="100px">
            <col width="*">
            <col width="200px">
            <col width="200px">
            <col width="200px">
        </colgroup>
        <thead>
            <tr class="table-info">
                <th>번호</th>
                <th>제목</th>
                <th>구분</th>
                <th>등록일</th>
                <th>공개여부</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="vo" items="${ar}" varStatus="st">
                <tr>
                    <td>${totalRecord - ((nowPage-1)*blockList+st.index) }</td>
                    <td>
                        <a href="/admin/notice_view?b_idx=${vo.b_idx}&cPage=${nowPage}">${vo.b_title}</a>
                        <c:if test="${vo.b_filename != null}">
                            <img src="../images/link.png" style="width: 14px;">
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${vo.b_to == 0}">
                            전체 공지
                        </c:if>
                        <c:if test="${vo.b_to == 1}">
                            사업자 공지
                        </c:if>
                    </td>
                    <td>${vo.bbslog.bl_date}</td>
                    <td>
                        <c:if test="${vo.b_status == 0}">
                            공개
                        </c:if>
                        <c:if test="${vo.b_status == 1}">
                            비공개
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div style="width: 1100px; height: 50px;" >
        ${pageCode}
        <input type="button" style="float: right;" class="btn btn-outline-info" value="글쓰기" onclick="javascript:location.href='/admin/notice_write?cPage=${nowPage}'">
    </div>
    
</div>
</main>
<jsp:include page="../main/mainF.jsp"></jsp:include>

</body>
</html>
