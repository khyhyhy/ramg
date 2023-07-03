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
        <h1>문의 게시판</h1>
        <form action="/support/qna" method="post">
            <div style="height: 60px; float: right;">
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
                <input type="text" name="searchValue" value="${param.searchValue}" class="form-control" style="width: 200px; display: inline-block;">
                <button type="submit" class="btn btn-outline-info">검색</button>
            </div>
        </form>
        <table class="table table-hover" style="table-layout:fixed">
            <colgroup>
                <col width="100px">
                <col width="*">
                <col width="100px">
                <col width="250px">
                <col width="100px">
            </colgroup>
            <thead>
                <tr class="table-info">
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>문의작성일</th>
                    <th>조회수</th>
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
                        <td>${totalRecord - ((nowPage-1)*blockList+st.index) }</td>
                        <td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">
                            <c:if test="${vo.b_val1 == 1}">
                                <img src="../images/lock.png" style="width: 15px;">
                            </c:if>
                            <c:if test="${vo.b_val1 == 0}"><a href="javascript:sub('${vo.b_idx}')">${vo.b_title}</a><!--공개글일 경우-->
                                <c:if test="${vo.c_list.size() != 0}">
                                    [${vo.c_list.size()}]
                                </c:if>
                            </c:if>
                            <c:if test="${vo.b_val1 == 1 && vo.bbslog.m_idx != sessionScope.mvo.m_idx}"><span style="color: rgb(179, 179, 179);">비밀글입니다.</span></c:if> <!--남이 쓴 비밀글일 경우-->
                            <c:if test="${vo.b_val1 == 1 && vo.bbslog.m_idx == sessionScope.mvo.m_idx}"><a href="javascript:sub('${vo.b_idx}')">${vo.b_title}</a><!--내가쓴 비밀글일 경우-->
                                <c:if test="${vo.c_list.size() != 0}">
                                    [${vo.c_list.size()}]
                                </c:if>
                            </c:if> 
                            <c:if test="${vo.b_filename != null}">
                                <c:if test="${vo.b_val1 == 0}">
                                    <img src="../images/link.png" style="width: 14px;">
                                </c:if>
                            </c:if>
                            
                        </td>
                        <td>${vo.bbslog.mvo.m_name}</td>
                        <td>${vo.bbslog.bl_date}</td>
                        <td>${vo.b_hit}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div style="height: 80px;" >
            ${pageCode}
            <c:if test="${sessionScope.mvo != null}">
                <input type="button" style="float: right;" class="btn btn-outline-info" value="글쓰기" onclick="sub2()">
            </c:if>
        </div>

        <form name="frm" method="post">
            <input type="hidden" name="b_idx">
            <input type="hidden" name="cPage" value="${nowPage}">
            <input type="hidden" name="searchType" value="${param.searchType}">
            <input type="hidden" name="searchValue" value="${param.searchValue}">
        </form>
        
    </div>
</main>
<jsp:include page="../main/mainF.jsp"></jsp:include>

<script>
    function sub(b_idx){

        document.frm.action = "/support/qna_view";
        document.frm.b_idx.value = b_idx;
        document.frm.submit();
    }

    function sub2(){
        document.frm.action = "/support/qna_write";
        document.frm.submit();
    }
</script>
</body>
</html>
