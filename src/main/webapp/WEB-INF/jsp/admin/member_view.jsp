<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자페이지 회원 상세보기</title>
<link href="../../../css/admin.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
<jsp:include page="mainH.jsp"></jsp:include>

<main>
<div class="container" style="margin-top: 100px;">
    <article>
        <table class="table table-bordered">
            <colgroup>
                <col width="100px">
                <col width="150px">
                <col width="200px">
                <col width="200px">
                <col width="200px">
                <col width="200px">
                <col width="*">
            </colgroup>
            <thead>
                <tr class="table-warning">
                    <th>회원 번호</th>
                    <th>이름</th>
                    <th>이메일</th>
                    <th>전화번호</th>
                    <th>회원 구분</th>
                    <th>회원 상태</th>
                    <th>회원 가입일</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${vo.m_idx}</td>
                    <td>${vo.m_name}</td>
                    <td>${vo.m_email}</td>
                    <td>
                        ${vo.m_phone.substring(0,3) }-${vo.m_phone.substring(3,7) }-${vo.m_phone.substring(7,11) }
                    </td>
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
                </tr>
            </tbody>
        </table>

        <c:if test="${vo.m_class != 0 && vo.sw_list.size() != 0}">
        <table class="table table-bordered">
            <colgroup>
                <col width="200px">
                <col width="200px">
                <col width="*">
                <col width="200px">
                <col width="200px">
                <col width="200px">
            </colgroup>
            <thead>
                <tr class="table-warning">
                    <th>종류</th>
                    <th>범위</th>
                    <th>주소</th>
                    <th>서비스 금액</th>
                    <th>평점</th>
                    <th>매출</th>
                </tr>
            </thead>
            <c:forEach items="${vo.sw_list}" var="sw">
            <tbody>
                <tr>
                    <td>
                        <c:if test="${sw.svo.s_type == 0}">
                           탁송
                        </c:if>
                        <c:if test="${sw.svo.s_type == 1}">
                           이동식
                        </c:if>
                    </td>
                    <td><fmt:formatNumber pattern="#,###" value="${sw.svo.s_radius}"/>m</td>
                    <td>${sw.svo.s_state} ${sw.svo.s_city} ${sw.svo.s_addr1}</td>
                    <td><fmt:formatNumber pattern="#,###" value="${sw.svo.s_val1}"/>원</td>
                    <td>
                        <c:if test="${bz_r_ar != null}">
                            <c:set var="avg" value="0"/>
                            <c:forEach items="${bz_r_ar}" var="vo">
                                <c:set var="avg" value="${avg+vo.b_score}"/>
                            </c:forEach>
                            <c:set var="avg" value="${avg/fn:length(bz_r_ar)}"/>
                            <a href="javascript:review_bz()">${avg} [${fn:length(bz_r_ar)}]</a>
                        </c:if>
                        <c:if test="${bz_r_ar == null}">
                            등록된 리뷰가 없습니다.
                        </c:if>
                    </td>
                    <td>
                        <fmt:formatNumber pattern="#,###" value="${service_price + charge_price}"/>원
                    </td>
                </tr>
            </tbody>
            </c:forEach>
        </table>
        </c:if>
        
        <c:if test="${vo.m_class != 2}">
        <label for="my">바로가기</label>
        <table class="table table-bordered" id="my">
            <tr>
                <th>
                    <a href="javascript:qna()">작성한 문의 [${fn:length(q_ar)}]</a>&nbsp;&nbsp;/
                    <c:if test="${vo.m_class == 0}">
                        <a href="javascript:car()">서비스 이용 내역 [${fn:length(su_ar)}]</a>&nbsp;&nbsp;/
                        <a href="javascript:review()">작성한 리뷰 [${fn:length(r_ar)}]</a>&nbsp;&nbsp;
                    </c:if>
                    <c:if test="${vo.m_class != 0}">
                        <a href="javascript:car_bz()">판매한 서비스 목록 [${fn:length(bz_su_ar)}]</a>&nbsp;&nbsp; /
                        <a href="javascript:review_bz()">받은 리뷰 [${fn:length(bz_r_ar)}]</a>&nbsp;&nbsp;
                    </c:if>
                </th>
            </tr>
        </table>
        </c:if>

        <button type="button" class="btn btn-outline-warning" onclick="sub()">목록</button>
        <c:if test="${vo.m_status == 0}">
            <span style="float: right;"><button type="button" class="btn btn-outline-warning" onclick="member_out()" id="b_out">강제탈퇴</span></button>
        </c:if>
    </article>

    <form name="frm" method="post">
        <input type="hidden" name="m_idx" value="${vo.m_idx}" id="m_idx">
        <input type="hidden" name="cPage" value="${param.cPage}">
        <input type="hidden" name="searchType" value="${param.searchType}">
        <input type="hidden" name="searchValue" value="${param.searchValue}">
        <input type="hidden" name="m_class" value="${param.m_class}">
        <input type="hidden" name="m_status" value="${vo.m_status}" id="m_status">
    </form>

</div>
</main>

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
    function car(){
        document.frm.action = "/admin/car";
        document.frm.searchType.value = "8";
        document.frm.searchValue.value = '${vo.m_idx}';
        document.frm.submit();
    }

    function qna(){
        document.frm.action = "/admin/qna";
        document.frm.searchType.value = "9";
        document.frm.searchValue.value = "${vo.m_idx}";
        document.frm.submit();
    }

    function review(){
        document.frm.action = "/admin/review";
        document.frm.searchType.value = "8";
        document.frm.searchValue.value = "${vo.m_idx}";
        document.frm.submit();
    }

    function review_bz(){
        document.frm.action = "/admin/review";
        document.frm.searchType.value = "9";
        document.frm.searchValue.value = "${vo.m_idx}";
        document.frm.submit();
    }

    function car_bz(){
        document.frm.action = "/admin/car";
        document.frm.searchType.value = "9";
        document.frm.searchValue.value = "${vo.m_idx}";
        document.frm.submit();
    }
</script>
</body>
</html>

