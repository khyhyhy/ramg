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
<jsp:include page="../main/mainH.jsp"></jsp:include>
<main>
    <div class="container">
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
                    <td>${param.bl_date}</td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td>
                        <c:if test="${vo.b_val1 == 1}">
                            <img src="../images/lock.png" style="width: 15px;">
                        </c:if>
                        ${vo.b_title}
                    </td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${param.m_name}</td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td>
                        <c:if test="${vo.b_filename != null }">
                            <a href="javascript:down('${vo.b_filename}')">${vo.b_filename}</a>
                        </c:if>
                        <c:if test="${vo.b_filename == null }"><span style="font-size: small; color: rgb(179, 179, 179);">첨부파일이 없습니다</span></c:if>
                    </td>
                </tr>
                <tr> 
                    <th style="height: 400px;">내용</th>
                    <td>${vo.b_content}</td>
                </tr>
            </table>

            <h2>댓글</h2>
            <table class="table table-bordered">
                <colgroup>
                    <col width="150px">
                    <col width="*">
                </colgroup>
                <c:forEach items="${ar}" var="vo">
                    <tr>
                        <th>제목</th>
                        <td>${vo.b_title}</td>
                    </tr>
                    <tr> 
                        <th style="height: 200px;">내용</th>
                        <td>${vo.b_content}</td>
                    </tr>
                </c:forEach>
            </table>
                    
            
            <div style="height: 80px;" >
                <button type="button" class="btn btn-outline-info"  onclick="javascript:back();">목록</button>
            </div>
                
            <input type="hidden" name="m_idx" value="0" id="m_idx"> <!--로그인 정보 생기면 ${session.mvo.m_idx}로 바꿔야 함-->
            <input type="hidden" name="target" value="${vo.b_idx}" id="target">
            
            <form name="frm" method="post">
                <input type="hidden" name="fname">
                <input type="hidden" name="cPage" value="${param.cPage}">
                <input type="hidden" name="searchType" value="${param.searchType}">
                <input type="hidden" name="searchValue" value="${param.searchValue}">
            </form>

    </body>
</div>
</main>
<jsp:include page="../main/mainF.jsp"></jsp:include>


<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script>
    function back(){
        document.frm.action = "/support/qna";
        document.frm.submit();
    }
    function down(fname) {
        // 인자로 사용자가 클릭한 파일명을 받는다. 이것을 현재 문서 안에 있는 frm이라는 폼객체에 이름이 fname이라는 hidden 요소의 값으로 지정해준다.
        document.frm.fname.value = fname;
        document.frm.action = "/download";
        document.frm.submit();
    }

    function sendData(){

        let m_idx = $("#m_idx").val();
        let target = $("#target").val();
        let b_title = $("#b_title").val();
        let b_content = $("#b_content").val();
        console.log(m_idx);
        console.log(target);
        console.log(b_title);
        console.log(b_content);

        $.ajax({
           url: "/admin/qna_comm_write",
           type: "post",
           data: {"m_idx" : m_idx, "target": target, "b_title":b_title, "b_content":b_content},
           dataType: "json"
        }).done(function(data){
            if(data.res == 1 && data.res2 == 1){
                alert("댓글이 등록되었습니다.");
            }
        });
    }
    
</script>

</body>
</html>