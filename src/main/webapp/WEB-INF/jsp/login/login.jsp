<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

</head>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
        <!--////////// Header Start ////////////-->
        <jsp:include page="../main/mainH.jsp"></jsp:include>
        <!--////////// Header end ////////////-->

        <!--////////// Main start //////////////-->
        <main>
            <div class="container">
                <article>
                    <header>
                        <h1>로그인</h1>
                    </header>
                    <div id="content"> 
                        <c:if test="${sessionScope.mvo eq null}"> <!--세션에 저장된 mvo가 없을때-->     
                            <form action="login" method="post" name="frm">

                                    <!-- 개인 로그인과 사업자 로그인 탭 -->
                                    <div>
                                        <input type="radio" id="personal" name="loginType" value="0">
                                        <label for="personal">개인 로그인</label><br>

                                        <input type="radio" id="business" name="loginType" value="1">
                                        <label for="business">사업자 로그인</label><br>
                                    </div>
                                   
                                    Email: <input type="text" name="m_email" id="m_email"/><br/>
                                    Password: <input type="password" name="m_pw" id="m_pw"/>

                                    <input type="hidden" value="{mvo.m_class}" name="m_class" id="m_class"/>
                                    
                                    <button type="button" onclick="exe()">로그인</button>
                                    <button type="button"><a href="join">회원가입</a></button>
                                <p>
                                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=85f3b2dbb6fdbca1b25d54627251ef3b&redirect_uri=http://localhost:8080/kakao/login&response_type=code">
                                        <img src="../images/kakao_login.png"/>
                                    </a>
                                </p>
                                <p>
                                    <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=DEfYVqVL7Po51QB3sjNx&state=STATE_STRING&redirect_uri=http://localhost:8080/naver/login">
                                        <img src="../images/naver_login.png"/>
                                    </a>
                                </p>
                            </form>
                        </c:if>

                                      <!-- ----------------메세지 추가-->
                                      <c:if test="${not empty message}">
                                      <input type="hidden" id="chk" value="1"/>
                                      <div class="message" id="message" title="알림창">
                                       
                                            ${message}
                                        </div>
                                        </c:if>
                                    <!------------------메세지 추가 -->
                  
            
                            <!--Jquery Plugins, main Jquery	-->
                            <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
                            <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

                           <script>

                                $(function(){
                                      //현재문서에서 id가 chk인 요소를 검색한다
                                      let v1 = $("#chk").val();  
                                    //  console.log(v1);
                                    if(v1 != undefined){
                                       // console.log(v1);
                                       $( "#message" ).dialog();
                                    }
                                });

                                function exe() {
                                    console.log("dmdkdkkdkdkdkdkdkdkd");
                                    if ($("#m_email").val() == "") {
                                        alert("이메일을 입력하세요");
                                        $("#m_email").focus();
                                        return;
                                    }
                    
                                    if ($("#m_pw").val() == "") {
                                        alert("비밀번호를 입력하세요");
                                        $("#m_pw").focus();
                                        return;
                                    }
                    
                                    document.frm.submit();
                                }

                                $(document).ready(function(){
                                    $("input[name='loginType']").change(function(){
                                        $("#m_class").val($(this).val()); // 선택된 라디오 버튼의 값을 설정합니다.
                                    });
                                });
                            </script>
                </article>
            </div>



        </main>
        <!--////////// Main end //////////////-->
        <!--////////// Foter start //////////////-->
        <jsp:include page="../main/mainF.jsp"></jsp:include>
        <!--////////// Foter end //////////////-->
    
</body>
</html>
