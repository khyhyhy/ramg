<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자페이지 글 보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<body>
<jsp:include page="mainH.jsp"></jsp:include>
<main>
    <div class="container" style="margin-top: 100px;">
        <br>
        <br>
        <table class="table table-bordered">
            <colgroup>
                <col width="150px">
                <col width="*">
            </colgroup>
            <tbody>
                <tr>
                    <th>작성일</th>
                    <td>${vo.bbslog.bl_date}</td>
                </tr>
                <tr>
                    <th>구분</th>
                    <td>
                        <c:if test="${vo.b_to == 0 && vo.b_type == 0}">
                           일반 공지
                        </c:if>
                        <c:if test="${vo.b_to == 1 && vo.b_type == 0}">
                            사업자 공지
                        </c:if>
                        <c:if test="${vo.b_type == 4}">
                            FAQ
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td>${vo.b_title}</td>
                </tr>
                <tr> 
                    <th style="height: 400px;">내용</th>
                    <td>${vo.b_content}</td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td>
                        <c:if test="${vo.b_filename != null }">
                            <a href="javascript:down('${vo.b_filename}')">${vo.b_oriname}</a>
                        </c:if>
                        <c:if test="${vo.b_filename == null }"><span style="font-size: small; color: rgb(179, 179, 179);">첨부파일이 없습니다</span></c:if>
                    </td>
                </tr>
            </table>
            
            <form name="frm" method="post">
                <input type="hidden" name="fname"/>
                <input type="hidden" name="m_idx" value="${sessionScope.mvo.m_idx}" id="m_idx">
                <input type="hidden" name="b_idx" value="${vo.b_idx}" id="b_idx"/>
                <input type="hidden" name="b_val1" value="${vo.b_val1}" id="b_val1"/>
                <input type="hidden" name="cPage" value="${param.cPage}"/>
                <input type="hidden" name="searchType" value="${param.searchType}"/>
                <input type="hidden" name="searchValue" value="${param.searchValue}"/>
                <input type="hidden" name="category" value="${param.category}">
            </form>

            <div style="height: 80px;" >
                <button type="button" class="btn btn-outline-info" onclick="javascript:sub()">목록</button>
                <button type="button"  class="btn btn-outline-info" onclick="javascript:changeStatus()" id="btn">
                    <c:if test="${vo.b_val1 == 0}">비공개로 변경하기</c:if>
                    <c:if test="${vo.b_val1 == 1}">공개로 변경하기</c:if>
                </button>
                <span style="float: right;">
                    <input type="button" class="btn btn-outline-info" value="수정" onclick="edit()">
                    <input type="button" class="btn btn-outline-info" value="삭제" onclick="notice_del()">
                </span>
            </div>

        
            
    

    </body>
</div>
</main>

<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script>
    function down(fname) {
        // 인자로 사용자가 클릭한 파일명을 받는다. 이것을 현재 문서 안에 있는 frm이라는 폼객체에 이름이 fname이라는 hidden 요소의 값으로 지정해준다.
        document.frm.fname.value = fname;
        document.frm.action = "/download";
        document.frm.submit();
    }

    function changeStatus(){

        let st = $("#b_val1").val(); // 0 아니면 1

        let b_idx = $("#b_idx").val();    

        if(st == 0){
            if(confirm("해당 글을 비공개로 변경하시겠습니까?")){
                $.ajax({
                    url: "/admin/notice_changeStatus1",
                    type: "post",
                    data: {"b_idx":b_idx},
                    dataType:"json"
                }).done(function(data){
                    if(data.res == 1){ //성공한 경우에만 수행
                        $("#b_val1").val(1);
                        $("#btn").text("공개로 변경하기");
                    }
                });
            }else{
                return;
            }

        }else if (st == 1){
            if(confirm("해당 글을 공개로 변경하시겠습니까?")){
                $.ajax({
                    url: "/admin/notice_changeStatus0",
                    type: "post",
                    data: {"b_idx":b_idx},
                    dataType:"json"
                }).done(function(data){
                    if(data.res == 1){ //성공한 경우에만 수행
                        $("#b_val1").val(0);
                        $("#btn").text("비공개로 변경하기");
                    }
                });
            }else{
                return;
            }
        }
        
    }

    function sub(){
        document.frm.action = "/admin/notice";
        document.frm.submit();
    }

    function edit(){
        if('${sessionScope.mvo}' == ""){
            alert("로그인을 먼저 해주세요");
            return;
        }
        document.frm.action = "/admin/notice_edit";
        document.frm.submit();
    }

    function notice_del(){
        if('${sessionScope.mvo}' == ""){
            alert("로그인을 먼저 해주세요");
            return;
        }

        if(confirm("정말로 삭제하시겠습니까?")){
            document.frm.action = "/admin/notice_del";
            document.frm.submit();
        }else{
            return;
        }
    }
    
</script>

</body>
</html>