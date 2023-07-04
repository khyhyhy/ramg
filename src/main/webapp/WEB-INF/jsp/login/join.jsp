<!--일단 mainH 붙였음-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html>
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Insert title here</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  
  <!--추가-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

  <!--head 끝나기전에 style태그 넣는다-->
  <style>

    
    .form-outline {
      position: relative;
    }
  
    .form-outline input {
      border: none;
      border-bottom: 1px solid #ced4da;
      border-radius: 13px;
      padding: 7px 8px;
      width: 100%;
    }
  
    .form-outline input:focus {
      outline: none;
      border-color: #80bdff;
      box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
    }
  
    .form-outline label {
      position: relative; /* 수정: absolute에서 relative로 변경 */
      display: block; /* 수정: 블록 수준 요소로 변경 */
      margin-bottom: 5px; /* 수정: 라벨 아래쪽 여백 추가 */
      font-size: 0.9rem;
      font-weight: bold;
      color: rgb(85, 84, 84);
      transform: scale(1.00); /* 약간 크게 설정 */
      transition: transform 0.2s ease-out, font-size 0.2s ease-out;
      pointer-events: none;
      z-index: 1;
    }
  
    .form-outline input:focus + label,
    .form-outline input:not(:placeholder-shown) + label {
      transform: translateY(-35px) scale(0.85);
      color: #6c757d;
      z-index: 0;
    }
  
    .radio-btn {
      margin-bottom: 20px;
      font-size: 15px; 
      font-family: "Arial", sans-serif; 
    }

    .divider {
    border-top: 1px solid #757571;
    margin: 15px 0;
    width: 290px;
  }

  #box{
    font-size: 0.9rem;
    margin-right: 10px;
  }

  #login-link {
          margin-top : 12px;
          font-size: 13px; /* 원하는 글씨 크기로 설정 */
          font-family: "Arial", sans-serif; /* 원하는 글꼴로 설정 */
          text-align: left;
        }


  </style>
  
  
  
  
  
  
  
  </head>

  <body>
   <!--////////// Header Start ////////////-->
   <jsp:include page="../main/mainH.jsp"></jsp:include>
   <!--////////// Header end ////////////-->

  <!--////////// Main start //////////////-->
  <main>

    <section>
      <header>
        <!-- <h1 class="u-text u-text-default u-text-1">회원가입</h1> -->
      </header> 

      <!--부트스트랩 추가-->
      <div class="d-flex justify-content-center"> <!-- 가운데 정렬을 위한 d-flex와 justify-content-center 클래스 추가 -->
        <div class="card shadow p-4 mb-3 bg-body rounded" style="width: 30rem;" >
            <div class="card-body">
      <!--부트스트랩 추가-->


          <form action="join" style="padding: 15px;" source="email" name="form" method="post" class="needs-validation">
              <input type="hidden" id="m_class_hidden" name="m_class_hidden" value="" />
                
              <div class="radio-btn">
                  <input type="radio" name="m_class" value="0" checked> 개인 &nbsp;           
                  <input type="radio" name="m_class" value="1"> 사업자
              </div>

              <hr class="divider">

                  <div class="form-outline mb-4">
                      <label for="m_email" style="display: block; margin-bottom: 5px;">이메일</label>
                      <input type="email"  placeholder="carcharge@naver.com" class="form-control form-outline"  id="m_email" name="m_email" style="width: 300px;" required>
                      <span id="box"></span>
                  </div>
                

                <div class="form-outline mb-4">
                    <label for="rg_pw">비밀번호</label>
                  <input type="password"  placeholder="8자 이상(최소 숫자 1개, 문자 1개 포함)" class="form-control form-outline" required id="rg_pw" name="m_pw" style="width: 300px;">                                   
                </div>

                <div class="form-outline mb-4">
                  <label for="rg_pw_chk">비밀번호 확인</label>
                  <input type="password" id="rg_pw_chk" name="rg_pw_chk" required="" class="form-control form-outline" required placeholder="비밀번호를 다시 입력해주세요" style="width: 300px;">
                </div>

                <div class="form-outline mb-4">
                  <label for="m_name">이름</label>
                  <input type="text" id="m_name" name="m_name" placeholder="이름을 입력하세요." class="form-control form-outline" required style="width: 300px;">
                </div>

                <!--연락처 추가 // m_phone을 m_phone_part1으로 잠깐 바꿈-->
                <div class="form-outline mb-4">
                    <label for="m_phone_part1">연락처</label>
                    <div class="d-flex align-items-center">
                      <input type="text" id="m_phone_part1" name="m_phone_part1" placeholder="010" class="form-control form-outline" required style="width: 70px;" maxlength="3">
                      <span>&nbsp;-&nbsp;</span>
                      <input type="text"  id="m_phone_part2" name="m_phone_part2" placeholder="1234" class="form-control form-outline" required style="width: 80px;" maxlength="4">
                      <span> &nbsp;-&nbsp;</span>
                      <input type="text"  id="m_phone_part3" name="m_phone_part3" placeholder="5678" class="form-control form-outline" required style="width: 80px;" maxlength="4">
                      &nbsp;
                      <button type="button" id="phoneCheckBtn" class="btn btn-secondary btn-sm" >중복체크</button> <!-- 중복체크 버튼 추가 -->
                      <!-- <span id="phoneCheckResult"></span> -->
                  </div>
                </div>



                <div class="mb-3">
                <input type="checkbox" id="agree" name="rg_ok" value="On" class="u-active-palette-4-base u-border-2 u-border-grey-75 u-field-input">
                <label for="agree" class="u-field-label" style="font-size: 14px;">이용약관과 개인정보취급방침에 동의합니다.</label>
              </div>

              <div class="u-align-right u-form-group u-form-submit u-label-top">
                <button onclick="send(this.form)" type="button" class="btn btn-primary" >가입하기</button>
                <%-- <input type="submit" value="submit" class="u-form-control-hidden"> --%>
              </div>

              <div id="login-link" class="justify-content-end">
              <p>이미 계정이 있으신가요? <a href="login">로그인</a></p>
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
          </div>
        </div>
      </div>
    </section>


  </main>
    <!--////////// Main end //////////////-->

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

             //핸드폰 중복확인
             //함수 추가해봄

             let phoneNumberPart1 = $('#m_phone_part1').val();
             let phoneNumberPart2 = $('#m_phone_part2').val();
             let phoneNumberPart3 = $('#m_phone_part3').val();
            let phoneNumber = phoneNumberPart1 + phoneNumberPart2 + phoneNumberPart3 
            
            // let phoneNumber = $("#m_phone").val();
             let phoneNumberPattern = /^\d+$/; // 숫자만 포함하는 정규표현식

               
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

              //연락처 유효성 검사
              if (phoneNumberPart1.trim().length < 1 || phoneNumberPart2.trim().length < 1 || phoneNumberPart3.trim().length < 1) {
                  alert("연락처를 모두 입력하세요");
                  $("#m_phone_part1").focus();
                  return;
                }

                if (!phoneNumberPattern.test(phoneNumber)) {
              alert("연락처는 숫자만 입력해야 합니다");
              $("#m_phone_part1").focus();
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

              //핸드폰 번호 중복체크 기능
              $('#phoneCheckBtn').click(function(){
                var phoneNumberPart1 = $('#m_phone_part1').val();
                var phoneNumberPart2 = $('#m_phone_part2').val();
                var phoneNumberPart3 = $('#m_phone_part3').val();
                var phoneNumber = phoneNumberPart1 + phoneNumberPart2 + phoneNumberPart3;

                // console.log(phoneNumberPart1);
                // console.log(phoneNumberPart2);
                // console.log(phoneNumberPart3);

                  // 숫자만 입력되었는지 확인
                  var phoneNumberPattern = /^\d+$/;

                  

              //연락처 유효성 검사
              if (phoneNumberPart1.trim().length < 1 || phoneNumberPart2.trim().length < 1 || phoneNumberPart3.trim().length < 1) {
                  alert("연락처를 모두 입력하세요");
                  $("#m_phone_part1").focus();
                  return;
                }

                if (!phoneNumberPattern.test(phoneNumber)) {
              alert("연락처는 숫자만 입력해야 합니다");
              $("#m_phone_part1").focus();
              return;
            }

                //중복체크 버튼이 눌렀을때 발생하는 비동기통신
                    $.ajax({
                      url: 'checkPhone',
                      type: 'POST',
                       data:  {
                               "m_phone": phoneNumberPart1 + phoneNumberPart2 + phoneNumberPart3
                              }, //전송할 데이터

                      // data: {
                      //   "m_phone_part1": phoneNumberPart1,
                      //   "m_phone_part2": phoneNumberPart2,
                      //   "m_phone_part3": phoneNumberPart3
                      // },
                      success: function(response){
                        //요청 성공시
                            if (response.str.includes("사용 가능한 번호입니다")) {
                              alert("사용 가능한 번호입니다.");
                            } else {
                              alert("이미 등록된 번호입니다.");
                            }
                      },
                      error: function() {
                        console.error('중복 체크 요청 실패');
                      }
                    });
              });
               
               // 사용자가 id를 입력하기 위해
               // 아이디가 s_id인 솟에서 키보드를 누를 때마다 수행하는 함수를
               // 이벤트 적용시켜보자!
                $("#m_email").bind("focusout", function(){

                    var str = $(this).val();
                    //console.log(str);
                   

                    if(str.trim().length > 0){
                        // 입력된 아이디가 4자 이상 입력했을 경우
                        // 서버에 비동기식으로 보낸다.
                        $.ajax({
                            url: 'checkEmail',
                            type: 'POST',
                            data: {"m_email":str.trim()}
                        }).done(function(res){
                         // 응답이 성공적으로 도착하는 부분
                            var msg = res.msg;
                            if(msg.includes("사용가능")){
                              $("#box").html(res.msg.trim()).css("color","green");
                            }else{
                             $("#box").html(res.msg.trim()).css("color","red");
                            }
                        });
                    }else
                        $("#box").html("");
                });
            });


            


       </script>


    <!--////////// Footer start //////////////-->
    <jsp:include page="../main/mainF.jsp"></jsp:include>
    <!--////////// Foter end //////////////-->

   <!--script태그는 body 끝나기전에 넣는다-->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
   integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  </body>

  </html>