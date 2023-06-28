<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">about:blank#blockede
<title>관리자페이지 글 보기</title>
<link rel="stylesheet" href="../../../css/summernote-lite.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="../../../js/summernote-lite.js"></script>
<script src="../../../js/lang/summernote-ko-KR.js"></script>
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
            <div style="height: 80px;" >
                <button type="button" class="btn btn-outline-info"  onclick="javascript:back();">목록</button>
            </div>
            
            <h2>댓글</h2>
            <textarea name="b_content" id="b_content"></textarea>

            <div style="height: 80px; margin-top: 10px;">
                <button type="button" class="btn btn-outline-info" onclick="javascript:sendData()">댓글 등록</button>
            </div>
            
            
            <table class="table table-bordered" id="comm_table">
                <tbody>
                    <c:forEach items="${ar}" var="vo">
                    <tr>
                        <th>${vo.bbslog.mvo.m_name}</th>
                        <th>${vo.bbslog.bl_date}</th>
                        <th style="text-align: right; width: 160px"><input type="button" value="수정" class="btn btn-outline-info">&nbsp;&nbsp;&nbsp;<input type="button" value="삭제" class="btn btn-outline-info"></th>
                    </tr>
                    <tr> 
                        <td colspan="4" style="height: 200px;">${vo.b_content}</th>
                    </tr>
                    <tr style="border: none;"> 
                        <td colspan="4" style="height: 50px; border: none;"></th>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
    
                    
                    
                <input type="hidden" name="m_idx" value="0" id="m_idx"> <!--로그인 정보 생기면 ${session.mvo.m_idx}로 바꿔야 함-->
                <input type="hidden" name="target" value="${vo.b_idx}" id="target">
            
            <form name="frm" method="post" action="/admin/qna">
                <input type="hidden" name="cPage" value="${param.cPage}">
                <input type="hidden" name="searchType" value="${param.searchType}">
                <input type="hidden" name="searchValue" value="${param.searchValue}">
                <input type="hidden" name="b_title" id="b_title">
            </form>

    </body>
</div>
</main>
<jsp:include page="../main/mainF.jsp"></jsp:include>


<script>

    $(function () {

    $("#b_content").summernote({
        lang: "ko-KR",
        placeholder: "댓글을 입력하세요",
        height: 200,
        callbacks: {
            onImageUpload: function (files, editor) {
                // 이미지가 에디터에 추가될 때마다 수행하는 곳 이미지를 첨부하면 배열로 인식된다. 비동기식 통신을 수행하면 서버에 업로드를 시킬 수 있다.
                for (let i = 0; i < files.length; i++) 
                    sendImg(files[i], editor); // 서버와 비동기식 통신을 하는 함수 호출
                }
            }
    });

    });

    function sendImg(file, editor) {
        // 이미지 파일을 첨부하여 서버로 보내야 하기 때문에 이미지가 아니면 {"type":1, "value":"TEST"} 이런식으로 파라미터
        // 만든다. 파일을 보낼 때는 FormData를 활용해야 한다.
        var frm = new FormData();

        // 보내고자 하는 파일을 FormData에 저장
        frm.append("s_file", file); // 나중에 서버에서 현재 파일을 받을 때는 반드시 s_file이라는 파라미터 이름으로 받아야 한다.

        $.ajax({
			url: "/saveImg.inc",
			data: frm,
			type: "post",
			contentType: false,
			processData: false,
			cache: false,
			dataType: "json"
		})
		.done(function (data) {
			let path = data.path;
			let fname = data.fname;

			$("#b_content").summernote("editor.insertImage", path + "/" + fname);

		});
    }

    function back(){
        document.frm.submit();
    }

    function sendData(){

        let m_idx = $("#m_idx").val();
        let target = $("#target").val();
        let b_content = $("#b_content").val();
        let b_idx = $("#b_idx").val();

        if(b_content.trim().length == 0){
            alert("댓글을 입력하세요");
            return;
        }


        $.ajax({
           url: "/admin/qna_comm_write",
           type: "post",
           data: {"m_idx" : m_idx, "target": target, "b_content":b_content},
           dataType: "json"
        }).done(function(data){
            if(data.res == 1 && data.res2 == 1){
                $('#comm_table > tbody:last').append('<tr><th>'+'</th><th>'+'</th></tr><tr> <td colspan="2" style="height: 200px;">'+b_content+'</th></tr>');
                $("#b_content").val("");
                alert("댓글이 등록되었습니다.");
            }
        })

    }
    
</script>

</body>
</html>