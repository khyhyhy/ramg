<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지 리뷰 관리</title>
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

        <div class="m-5">
            <h1 style="text-align: center; font-weight: bold;">리뷰 관리</h1>
        </div>
        <form action="/admin/review" method="post">
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
                    <c:if test="${param.searchType == 9 || param.searchType == 8 || param.searchValue == null}">
                        <option value="1">내용</option>
                        <option value="2">사업자명</option>
                        <option value="3">작성자</option>
                    </c:if>
                </select>

                <c:if test="${param.searchType == 9 || param.searchType == 8}">
                    <input type="text" name="searchValue" class="form-control" style="width: 200px; display: inline-block;">
                </c:if>
                <c:if test="${param.searchType != 9 && param.searchType != 8}">
                    <input type="text" name="searchValue" value="${param.searchValue}" class="form-control" style="width: 200px; display: inline-block;">
                </c:if>
                <button type="submit" class="btn btn-outline-warning">검색</button>
            </div>
        </form>

        <table class="table table-hover">
            <colgroup>
                <col width="80px">
                <col width="150px">
                <col width="*">
                <col width="120px">
                <col width="100px">
                <col width="210px">
            </colgroup>
            <thead>
                <tr class="table-warning">
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
                            <a href="/admin/car_view?su_idx=${vo.suvo.su_idx}&cPage=1">
                                <c:if test="${vo.suvo.svo.s_type == 0}">탁송</c:if>
                                <c:if test="${vo.suvo.svo.s_type == 1}">이동식</c:if>
                            </a> 
                            ( <a href="/admin/member_view?m_idx=${vo.suvo.svo.swvo.mvo.m_idx}&cPage=1">${vo.suvo.svo.swvo.mvo.m_name}</a> )
                        </td>
                        <td style="word-break: break-all; text-overflow:unset; overflow:unset; white-space:unset;">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-heading${vo.b_idx}">
                                  <button class="accordion-button collapsed" style="overflow: hidden;
                                  text-overflow: ellipsis;
                                  white-space: nowrap;" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${vo.b_idx}" aria-expanded="false" aria-controls="flush-collapse${vo.b_idx}">
                                    <c:if test="${vo.b_val1 == 1}">
                                        <img src="../images/lock.png" style="width: 15px;">&nbsp;
                                    </c:if>
                                  ${vo.b_content}
                                  </button>
                                </h2>
                                <div id="flush-collapse${vo.b_idx}" class="accordion-collapse collapse" aria-labelledby="flush-heading${vo.b_idx}" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body"><br>${vo.b_content}</div>
                                    <button id="btn" class="btn btn-outline-warning" onclick="change('${vo.b_idx}','${vo.b_val1}')">
                                        <c:if test="${vo.b_val1 == 0}">비공개로 변경하기</c:if>
                                        <c:if test="${vo.b_val1 == 1}">공개로 변경하기</c:if>
                                    </button>
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
        
        <form name="frm">
            
        </form>

        <div style="height: 80px;" >
            ${pageCode}
        </div>
    </div>
</main>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script>
    function change(b_idx, b_val1){

        let msg = "";

        if(b_val1 == '0'){
            b_val1 = '1';
            msg = "해당 글을 비공개로 변경하시겠습니까?";
        }else{
            b_val1 = '0';
            msg = "해당 글을 공개로 변경하시겠습니까?";
        }

        $.ajax({
            url: "/admin/review_change",
            type: "post",
            data: {"b_idx":b_idx, "b_val1":b_val1},
            dataType:"json"
        }).done(function(data){
            if(data.res == 1){
                location.reload();
            }
        });
    }
</script>
</body>
</html>
