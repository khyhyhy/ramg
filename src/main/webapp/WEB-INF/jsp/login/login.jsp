<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <article>
        <header>
            <h1>로그인</h1>
        </header>
        <div id="content"> 
            <c:if test="${sessionScope.mvo eq null}"> <!--세션에 저장된 mvo가 없을때-->
                <form action="login" method="post" name="frm">
                    Email: <input type="text" name="m_email" id="m_email"/><br/>
                    Password: <input type="password" name="m_pw" id="m_pw"/>
                    <button type="button" onclick="exe()">로그인</button>
                    <button type="button"><a href="join">회원가입</a></button>
                <p>
                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=85f3b2dbb6fdbca1b25d54627251ef3b&redirect_uri=http://localhost:8080/kakao/login&response_type=code">
                        <img src="images/kakao_login.png"/>
                    </a>
                </p>
                <p>
                    <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=DEfYVqVL7Po51QB3sjNx&state=STATE_STRING&redirect_uri=http://localhost:8080/naver/login">
                        <img src="images/naver/naver_login.png"/>
                    </a>
                </p>
            </form>

            </c:if>
        </div>
    </article>
</body>
</html>
