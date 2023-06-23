<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">about:blank#blockede
<title>관리자페이지 공지쓰기</title>
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
        <form action="/admin/notice_write_ok" method="post" enctype="multipart/form-data">
        <table style="width: 1100px;" class="table" >
            <colgroup>
                <col width="100px">
                <col width="*">
                <col width="200px">
            </colgroup>
                <tr>
                    <th>공개범위</th>
                    <td>
                        <select name="b_to">
                            <option value="0">전체공개</option>
                            <option value="1">사업자공개</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" style="width: 800px;" name="b_title"></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea rows="12" cols="50" id="content" name="b_content"></textarea></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td><input type="file" name="file"/></td>
                </tr>
            </table>
            <button type="submit" class="btn btn-outline-info" >글쓰기</button>
            <button type="button" class="btn btn-outline-info"  onclick="javascript:location.href='/admin/notice?cPage=${cPage}'">목록</button>
            
            <input type="hidden" name="m_idx" value="0"> <!--로그인 정보 생기면 ${session.mvo.m_idx}로 바꿔야 함-->
        </form>
    </div>
</main>
<jsp:include page="../main/mainF.jsp"></jsp:include>

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
        // 이미지 파일을 첨부하여 서버로 보내야 하기 때문에 이미지가 아니면 {"type":1, "value":"TEST"} 이런식으로 파라미터를
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
        if (document.forms[0].subject.value.trim().length < 0) {
            alert("제목을 입력하세요");
            document
                .forms[0]
                .subject
                .focus();
            return; //수행 중단
        }
        if (document.forms[0].writer.value.trim().length < 0) {
            alert("작성자를 입력하세요");
            document
                .forms[0]
                .writer
                .focus();
            return; //수행 중단
        }
        if (document.forms[0].pwd.value.trim().length < 0) {
            alert("비밀번호를 입력하세요");
            document
                .forms[0]
                .pwd
                .focus();
            return; //수행 중단
        }

        document.forms[0].submit();
    }
</script>


</body>
</html>
