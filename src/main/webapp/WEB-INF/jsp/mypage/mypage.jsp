<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html>

  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Insert title here</title>
  </head>

  <body>
   <article>
    <h1>정보 관리</h1>
   </article>

   <h2>회원 정보</h2>
    <p>이메일: ${member.m_email}</p>
    <p>이름: ${member.m_name}</p>
    <p>연락처: ${member.m_phone}</p>
    <p>주소: ${member.m_address}</p>
    <c:if test="${member.m_class == 0}">
    <p>결제수단: ${member.m_payment}</p>
    </c:if>
    <a href="updateMember">Edit</a>
  </body>

  </html>