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
     
     <c:forEach items="${c_ar}" var="cvo">
        <h1>${cvo.c_idx}</h1>
        <h1>${cvo.c_state}</h1>
        <h1>${cvo.c_name}</h1>
        <h1>${cvo.c_chargetype}</h1>
    </c:forEach>   

     <c:forEach items="${s_ar}" var="svo">
        <h1>${svo.s_idx}</h1>
        <h1>${svo.s_state}</h1>
        <h1>${svo.s_radius}</h1>
    </c:forEach>
    </article>
</body>
</html>
