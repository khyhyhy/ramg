<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자페이지 공지 수정</title>
<link rel="stylesheet" href="../../../css/summernote-lite.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="../../../js/summernote-lite.js"></script>
<script src="../../../js/lang/summernote-ko-KR.js"></script>
<body>
<jsp:include page="mainH.jsp"></jsp:include>
<main>
    <div class="container">
        <br>
        <br>
        <form action="/admin/notice_edit_ok" method="post" enctype="multipart/form-data">
        <table class="table table-bordered">
            <colgroup>
                <col width="150px">
                <col width="*">
            </colgroup>
                <tr>
                    <th>공개범위</th>
                    <td>
                        <select name="b_to" id="b_to">
                            <c:if test="${vo.b_to == 0}">
                                <option value="0" selected>전체</option>
                                <option value="1">사업자</option>
                            </c:if>
                            <c:if test="${vo.b_to == 1}">
                                <option value="0">전체</option>
                                <option value="1" selected>사업자</option>
                            </c:if>
                        </select>
                        <div class="form-check" style="display: inline-block; float: right;">
                            <c:if test="${vo.b_type == 4}">
                                <input class="form-check-input" type="checkbox" id="flexCheckDefault" checked>
                            </c:if>
                            <c:if test="${vo.b_type != 4}">
                                <input class="form-check-input" type="checkbox" id="flexCheckDefault">
                            </c:if>
                            <label class="form-check-label" for="flexCheckDefault">
                              자주하는 질문
                            </label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" style="width: 800px;" name="b_title" value="${vo.b_title}"></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea rows="12" cols="50" id="content" name="b_content">${vo.b_content}</textarea></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td>
                        <input type="file" name="file"/>
                        <c:if test="${vo.b_filename != null }">
                            ${vo.b_oriname}
                            <span style="float: right;">파일을 새로 첨부하면 기존 파일은 삭제됩니다</span style="text-align: right;">
                        </c:if>
                    </td>
                </tr>
            </table>
            <div style="height: 80px;" >
                <button type="button" style="display: inline-block; float: right;" class="btn btn-outline-info" onclick="javascript:sendData()">수정하기</button>
                <button type="button" class="btn btn-outline-info"  onclick="javascript:back();">목록</button>
            </div>
                
            <input type="hidden" name="m_idx" value="${sessionScope.mvo.m_idx}">
            <input type="hidden" name="b_idx" value="${vo.b_idx}">
            <input type="hidden" name="b_type" id="b_type">
            <input type="hidden" name="cPage" value="${param.cPage}">
            <input type="hidden" name="searchType" value="${param.searchType}">
            <input type="hidden" name="searchValue" value="${param.searchValue}">
            <input type="hidden" name="bl_date" value="${param.bl_date}">
            <input type="hidden" name="category" value="${param.category}">
        </form>
    </div>

    <form name="fm" method="post" action="/admin/notice_view">
        <input type="hidden" name="b_idx" value="${vo.b_idx}">
        <input type="hidden" name="cPage" value="${param.cPage}">
        <input type="hidden" name="searchType" value="${param.searchType}">
        <input type="hidden" name="searchValue" value="${param.searchValue}">
        <input type="hidden" name="category" value="${param.category}">
    </form>

</main>
<jsp:include page="mainF.jsp"></jsp:include>

<script>
    $(function () {

        $("#content").summernote({
            lang: "ko-KR",
            placeholder: "내용을 입력하세요",
            height: 500,
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

			$("#content").summernote("editor.insertImage", path + "/" + fname);

		});
    }

    function sendData() {
        if('${sessionScope.mvo}' == ""){
            alert("로그인을 먼저 해주세요");
            return;
        }

        if($("#flexCheckDefault").is(":checked")){ 
            $("#b_type").val("4"); // 체크되었으면 자주하는 질문, b_type => 4
            $("#b_to").val("0"); // FAQ는 무조건 전체공개
            // console.log("자주하는 질문");
        }else{ 
            $("#b_type").val("0"); // 안되어있으면 그냥 공지 b_type => 0
            // console.log("공지");
        }

        if (document.forms[0].b_title.value.trim().length < 1) {
            alert("제목을 입력하세요");
            document
                .forms[0]
                .b_title
                .focus();
            return; //수행 중단
        }
        if (document.forms[0].b_content.value.trim().length < 1) {
            alert("내용을 입력하세요");
            document
                .forms[0]
                .b_content
                .focus();
            return; //수행 중단
        }
        document.forms[0].submit();
    }

    function back(){
        document.fm.submit();
        
    }
</script>


</body>
</html>
