<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>고객센터 문의 보기</title>
<link rel="stylesheet" href="../../../css/summernote-lite.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="../../../css/ramg.css" rel="stylesheet">
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
        <div class="m-5">
            <h1 style="text-align: center; font-weight: bold; color: rgb(35, 55, 109);">문의 게시판</h1>
        </div>
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
                    <td>${vo.bbslog.mvo.m_name}</td>
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
                <tr> 
                    <th style="height: 400px;">내용</th>
                    <td>${vo.b_content}</td>
                </tr>
            </tbody>
        </table>

        <div style="height: 80px;">
            <button type="button" class="btn btn-outline-info"  onclick="javascript:back();">목록</button>
            <c:if test="${vo.bbslog.m_idx == sessionScope.mvo.m_idx}">
                <span style="float: right;" >
                    <button type="button" class="btn btn-outline-info" onclick="javascript:edit()">수정</button>
                    <button type="button" class="btn btn-outline-info" onclick="javascript:qna_del()">삭제</button>
                </span>
            </c:if>
        </div>
        <hr>   
        <p style="font-size: large; font-weight: bold;">댓글 [ ${fn:length(ar)} ]</p>
        <table class="table table-bordered" id="comm_table">
            <c:forEach items="${ar}" var="vo">
                <tr>
                    <th>${vo.bbslog.mvo.m_name}  /  ${vo.bbslog.bl_date} 
                        <c:if test="${vo.bbslog.m_idx == sessionScope.mvo.m_idx}">
                            <span style="float: right;"><input type="button" class="btn btn-outline-info" value="삭제" onclick="qna_comm_del('${vo.b_idx}')"></span>
                        </c:if>
                    </th>
                </tr>
                <tr> 
                    <td style="height: 200px;" name="b_content">${vo.b_content}</td>
                </tr>
                <tr style="border: none;"> 
                    <td style="height: 50px; border: none;"></td>
                </tr>
            </c:forEach>
        </table>
            <textarea class="mt-0" name="b_content" id="b_content"></textarea>
            <div class="mt-5" style="height: 80px;">
                <button type="button" class="btn btn-outline-info"  onclick="javascript:back();">목록</button>
                <c:if test="${sessionScope.mvo != null}">
                    <button type="button" class="btn btn-outline-info" onclick="javascript:sendData()" style="float: right;">댓글 등록</button>
                </c:if>
            </div>
                
            <input type="hidden" name="m_name" value="${sessionScope.mvo.m_name}" id="m_name">
            <input type="hidden" name="target" value="${vo.b_idx}" id="target">
            
            <form name="frm" method="post">
                <input type="hidden" name="fname">
                <input type="hidden" name="m_idx" value=" ${sessionScope.mvo.m_idx}" id="m_idx">
                <input type="hidden" name="b_idx" value="${vo.b_idx}">
                <input type="hidden" name="cPage" value="${param.cPage}">
                <input type="hidden" name="searchType" value="${param.searchType}">
                <input type="hidden" name="searchValue" value="${param.searchValue}">
            </form>

    </body>
</div>
</main>
<jsp:include page="../main/mainF.jsp"></jsp:include>


<script>

    $(function () {
        
        if('${sessionScope.mvo}'== ""){
            $("#b_content").summernote({
            lang: "ko-KR",
            placeholder: "댓글을 작성하려면 먼저 로그인 해주세요",
            height: 200,
            callbacks: {
                onImageUpload: function (files, editor) {
                    // 이미지가 에디터에 추가될 때마다 수행하는 곳 이미지를 첨부하면 배열로 인식된다. 비동기식 통신을 수행하면 서버에 업로드를 시킬 수 있다.
                    for (let i = 0; i < files.length; i++) 
                    sendImg(files[i], editor); // 서버와 비동기식 통신을 하는 함수 호출
                }
            }
            });
            $('#b_content').summernote('disable');
        }else{
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
        }
            

            
        
        
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
    
    function down(fname) {
        // 인자로 사용자가 클릭한 파일명을 받는다. 이것을 현재 문서 안에 있는 frm이라는 폼객체에 이름이 fname이라는 hidden 요소의 값으로 지정해준다.
        document.frm.fname.value = fname;
        document.frm.action = "/download";
        document.frm.submit();
    }

    function back(){
        document.frm.action = "/support/qna";
        document.frm.submit();
    }

    function sendData(){

        let m_idx = $("#m_idx").val();
        let target = $("#target").val();
        let b_content = $("#b_content").val();

        let m_name = $("#m_name").val();

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
                $('#b_content').summernote('reset');
                alert("댓글이 등록되었습니다.");
                location.reload();
            }
        })

    }

    function qna_comm_del(b_idx){

        let m_idx = $("#m_idx").val();

        if(confirm("댓글을 삭제하시겠습니까?")){
            $.ajax({
                url: "/admin/qna_comm_del",
                type: "post",
                data: {"b_idx": b_idx, "m_idx": m_idx},
                dataType: "json"
            }).done(function(data){
                if(data.res == 1 && data.res2 == 1){
                    alert("댓글이 삭제되었습니다.");
                    location.reload();
                }
            })
        }else
            return;
        }

    function edit(){
        if('${sessionScope.mvo}' == ""){
            alert("로그인을 먼저 해주세요");
            return;
        }
        document.frm.action = "/support/qna_edit";
        document.frm.submit();
    }

    function qna_del(){
        if('${sessionScope.mvo}' == ""){
            alert("로그인을 먼저 해주세요");
            return;
        }
        
        if(confirm("정말로 삭제하시겠습니까?")){
            document.frm.action = "/support/qna_del";
            document.frm.submit();
        }else{
            return;
        }
    }
    
</script>

</body>
</html>