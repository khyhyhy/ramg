<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <article>
     <h1>초기작업중</h1>

    <P>세션m_idx: ${sessionScope.evo.m_idx}</P>
    <P>세션m_name: ${sessionScope.evo.m_name}</P>
     
    <!-- 회원 보유 차량 -->
     <c:forEach items="${cw_ar}" var="cw_ar">
        <h1>${cw_ar.cvo.c_idx}</h1>
        <h1>${cw_ar.cvo.c_state}</h1>
        <h1>${cw_ar.cvo.c_name}</h1>
        <h1>${cw_ar.cvo.c_chargetype}</h1>
    </c:forEach>   

    <!-- 충전 차량 정보 -->
     <c:forEach items="${swar}" var="swar">
        <h1>${swar.svo.s_idx}</h1>
        <h1>${swar.svo.s_state}</h1>
        <h1>${swar.svo.s_radius}</h1>
        <h1>${swar.cvo.c_name}</h1>
        <h1>${swar.mvo.m_name}</h1>
    </c:forEach>
    </article>
</body>
</html>
