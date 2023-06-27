<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<main>

     <section>
        <div>
          <h1 class="u-text u-text-default u-text-1">회원가입</h1>
        </div> 
              <form action="join" style="padding: 15px;" source="email" name="form" method="post">
                  
                <div>
                    <input type="radio" name="m_class" value="0" checked> 개인
                    <input type="radio" name="m_class" value="1"> 사업자
                    <!-- <input type="radio" name="m_class" value="2"> 사업자 -->
                  </div>

                  <input type="hidden" id="m_class_hidden" name="m_class_hidden" value="" />

                    <div>
                        <label for="m_email">이메일</label>
                        <input type="email" placeholder="carcharge@naver.com" id="m_email" name="m_email">
                    </div>
                  
                            <span id="box"></span>
                          <!-- <button onclick="checkEmail()">중복 체크</button> -->
                            <div id="message"></div>
                          </div>

                  <div>
                    <label for="rg_pw">비밀번호</label>
                    <input type="password"  placeholder="8자 이상이면서 최소한 숫자 하나와 글자 하나를 포함해야 합니다." id="rg_pw" name="m_pw">
                  </div>

                  <div>
                    <label for="rg_pw_chk">비밀번호 확인</label>
                    <input type="password" id="rg_pw_chk" name="rg_pw_chk" required="" placeholder="비밀번호를 다시 입력해주세요">
                  </div>

                  <div>
                    <label for="m_name">이름</label>
                    <input type="text" id="m_name" name="m_name" placeholder="이름을 입력하세요.">
                  </div>

                  <div>
                    <label></label>
                  <input type="checkbox" id="agree" name="rg_ok" value="On" class="u-active-palette-4-base u-border-2 u-border-grey-75 u-field-input">
                  <label for="agree" class="u-field-label">이용약관과 개인정보취급방침에 동의합니다.</label>
                </div>

                <div class="u-align-right u-form-group u-form-submit u-label-top">
                  <button onclick="send(this.form)" type="button" >가입하기</button>
                  <%-- <input type="submit" value="submit" class="u-form-control-hidden"> --%>
                </div>


                  <!-- <input type="hidden" value="" name="recaptchaResponse">
                  <input type="hidden" value="add" name="type">
                  <input type="hidden" name="formServices" value="a4e7f32e805dd745f9249c7cef4456ee"> -->
              </form>
              


            </div>

              </div>
            </div>
          </div>
        </div>
      </section>


</main>


            <!-- Jquery Plugins, main Jquery -->	

            
            <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
            <script>



                <c:if test="${cnt == 0}">
                    alert("회원가입에 실패했습니다. 다시 시도하세요");
                </c:if>



                function send(form){

                  //라디오버튼 값을 서버로 보내기
                  var mClassValue = $('input[name="m_class"]:checked').val();
                  $('#m_class_hidden').val(mClassValue);


                    // 현재 문서에서 "chk"라는 아이디를 가진 요소의 class가 success인지? 확인!
                    /*let chk = $("#chk").hasClass("success");
                    
                    //let chk = document.getElementById("chk").className;
                    
                    if(!chk){
                        alert("아이디 체크를 먼저 해주새요!");
                        return;
                    }*/
                    
                    //let id = $("#rg_id").val();
                    
                    let check1 = /^[a-z0-9]{5,}$/;
                    let check2 = /^(?=.*[a-z])(?=.*\d).{8,}$/;
                    let check3 = /^[가-힣]{2,20}$/;
                    let check5 = /^[a-zA-Z0-9]+@[a-z]+\.[a-zA-Z]{2,3}$/i;
                    
                    let email = $("#m_email").val();
                    let pw = $("#rg_pw").val();
                    let pwchk = $("#rg_pw_chk").val();
                    let name = $("#m_name").val();
                    

                    if(email.trim().length < 1){
                        alert("이메일을 입력하세요");
                        $("#m_email").focus();
                        return;
                    }
                    
                    if(!check5.test(email)){
                        alert("이메일 형식이 올바르지 않습니다.");
                        $("#m_email").focus();
                        return;
                    }
                    
                    // if(!check1.test(id)){
                    //     alert("아이디는 5자 이상 영소문자 또는 숫자로 구성해야합니다.");
                    //     $("#rg_id").focus();
                    //     return;
                    // }
                    
                    if(pw.trim().length < 1){
                        alert("비밀번호를 입력하세요");
                        $("#rg_pw").focus();
                        return;
                    }
                    
                    if(!check2.test(pw)){
                        alert("비밀번호는 최소 숫자1개, 소문자1개 포함한 8자 이상");
                        $("#rg_pw").focus();
                        return;
                    }
                    
                    if(pwchk.trim() != pw.trim()){
                        alert("비밀번호가 일치하지 않습니다");
                        $("#rg_pw_chk").focus();
                        return;
                    }
                    
                    if(name.trim().length < 1){
                        alert("이름을 입력하세요");
                        $("#m_name").focus();
                        return;
                    }
                    
                    if(!check3.test(name)){
                        alert("이름은 2자 이상 20자 이하의 한글로 입력해주세요");
                        $("#m_name").focus();
                        return;
                    }
                    
                    
                    if(!$("#agree").is(":checked")){
                        alert("약관동의를 해주세요");
                        $("#agree").focus();
                        return;
                    }
                    
                    $.ajax({
                      url: 'join',
                      type: 'POST',
                      data: $(form).serialize(), // Serialize the form data
                      success: function(response) {
                        if (response.success) {
                          alert("회원가입을 축하합니다. 로그인 해주세요.");
                          window.location.href = "/login"; // 
                       
                        } else {
                          alert("회원가입에 실패했습니다. 다시 시도해주세요.");
                        }
                      },
                      error: function() {
                        alert("회원가입에 실패했습니다. 다시 시도해주세요.");
                      }
                    });


                    //document.forms[0].action = "registry.jsp";
                    //document.forms[0].method = "post";
                    
 
                    // document.forms[0].action = "login/login.jsp";
                    
                    //document.form.submit(); //서버로 보낸다. (일단 주석처리)
                }
  	
                $(function(){
                    
                    // 사용자가 id를 입력하기 위해
                    // 아이디가 s_id인 솟에서 키보드를 누를 때마다 수행하는 함수를
                    // 이벤트 적용시켜보자!
                    $("#m_email").bind("keyup", function(){
                        //console.log("^^");
                        //사용자가 입력한 아이디가 s_id에 입력되므로
                        // 그곳에 있는 값(value)을 가져온다.
                        var str = $(this).val();
                        //console.log(str);
                        
                        //str의 값에서 공백이 있는지? 없는지? 판단하고 싶다면 정규표현식 등을 이용
                        //해야 한다. -- 일단 생략 --
                        if(str.trim().length > 4){
                            // 입력된 아이디가 4자 이상 입력했을 경우
                            // 서버에 비동기식으로 보낸다.
                            $.ajax({
                                url: 'checkEmail',
                                type: 'POST',
                                data: {"m_email":encodeURIComponent(str.trim())}
                            }).done(function(res){
                                // 응답이 성공적으로 도착하는 부분
                                $("#box").html(res.msg.trim());
                            });
                        }else
                            $("#box").html("");
                    });
                });
  
            </script>