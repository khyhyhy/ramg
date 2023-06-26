<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자페이지 회원 상세보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
<jsp:include page="../main/mainH.jsp"></jsp:include>

<main>
<div class="container">
    <br>
    <br>
    <article>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>회원 번호</th>
                    <th>이메일</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <c:if test="${vo.m_class == 1}">
                        <th>주소</th>
                    </c:if>
                    <th>회원 구분</th>
                    <th>회원 상태</th>
                    <th>회원 가입일</th>
                    <th>토큰 정보</th>
                    <th>결제 정보</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${vo.m_idx}</td>
                    <td>${vo.m_email}</td>
                    <td>${vo.m_name}</td>
                    <td>${vo.m_phone}</td>
                    <c:if test="${vo.m_class == 1}">
                        <td>${vo.m_address}</td>
                    </c:if>
                    <td>
                        <c:if test="${vo.m_class == 0}">
                            개인 회원
                        </c:if>
                        <c:if test="${vo.m_class == 1}">
                            사업자 회원
                        </c:if>
                        <c:if test="${vo.m_class == 2}">
                            관리자
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${vo.m_status == 0}">
                            활동 중
                        </c:if>
                        <c:if test="${vo.m_status == 1}">
                            탈퇴
                        </c:if>
                    </td>
                    <td>${vo.m_date}</td>
                    <td><input type="button" class="btn btn-outline-info" value="토큰 정보"></td>
                    <td><input type="button" class="btn btn-outline-info" value="결제 정보"></td>
                </tr>
            </tbody>
        </table>
        <button type="button" class="btn btn-outline-info" onclick="sub()"">목록</button>
        <c:if test="${vo.m_status == 0}">
            <button type="button" class="btn btn-outline-info" onclick="member_out()" id="b_out">강제탈퇴</button>
        </c:if>
    </article>

    <form name="frm" method="post">
        <input type="hidden" name="m_idx" value="${vo.m_idx}" id="m_idx">
        <input type="hidden" name="cPage" value="${param.cPage}">
        <input type="hidden" name="searchType" value="${param.searchType}">
        <input type="hidden" name="searchValue" value="${param.searchValue}">
        <input type="hidden" name="m_status" value="${vo.m_status}" id="m_status">
    </form>

</div>
</main>
<jsp:include page="../main/mainF.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script>
    function sub(){
        document.frm.action = "/admin/member";
        document.frm.submit();
    }

    function member_out(){

        if(confirm("정말로 강제 탈퇴 시키겠습니까?")){
            $.ajax({
                url: "/admin/member_out",
                type: "post",
                data: {"m_idx": $("#m_idx").val()},
                dataType: "json"
            }).done(function(data){
                if(data.res == 1){ // 성공했을 경우
                    $("#b_out").remove();
                }
            });
        }else{
            return;
        }
    }
</script>
</body>
</html>

