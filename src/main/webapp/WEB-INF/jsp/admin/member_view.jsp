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
    <article>
        <table style="width: 1200px;" class="table">
            <thead>
                <tr class="table-info">
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
        <button type="button" class="btn btn-outline-info" onclick="javascript:location.href='/admin/member?cPage=${param.cPage}'">목록</button>
        <c:if test="${vo.m_status == 0}">
            <button type="button" class="btn btn-outline-info" onclick="javascript:location.href='/admin/member_out?m_idx=${vo.m_idx}'">강제탈퇴</button>
        </c:if>
    </article>
</div>
</main>
<jsp:include page="../main/mainF.jsp"></jsp:include>
</body>
</html>

