<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <!DOCTYPE html>
  <html>

  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Insert title here</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <link href="../../../css/ramg.css" rel="stylesheet">
   <style>
   
    table{
        text-align: center;
        margin: auto;
    }

    .container{
        margin-top: 2cm;
        margin-bottom: 2cm;
    }
    article{
        margin-bottom: 1cm;
    }
   </style>
  </head>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <body>
  <jsp:include page="../main/mainH.jsp"></jsp:include>

    <div class="container text-center" style="margin-top: 150px;">

    <article>
        <div style="margin: 50px 0 0 0;">
            <h1 style="text-align: center; font-weight: bold;">나의 정보 수정</h1>
        </div>
   </article>
   <table class="table table-striped table-hover">
    <tbody>
        <tr>
            <th><label for="m_email">이메일</label></th>
            <td><input type="text" id="m_email" name="m_email" value="${mvo.m_email}" disabled/></td>
        </tr>
        <tr>
            <th><label for="m_name">이름</label></th>
            <td><input type="text" id="m_name" name="m_name" value="${mvo.m_name}"/></td>
        </tr>
        <tr>
            <th><label for="m_phone_part1">연락처</label></th>
            <td>     
                <input type="text" id="m_phone"  name="m_phone" value="${mvo.m_phone}" disabled/>
            </td>

                    



        </tr>
        <tr>
            <td colspan="2">
                <button type="button" id="btn" class="btn btn-success">변경하기</button>
                <button type="button" class="btn btn-success" onclick="javascript:location.href='mypage'">돌아가기</button>
            </td>
        </tr>
    </tbody>
   </table>

   </div>

   <jsp:include page="../main/mainF.jsp"></jsp:include>
    

   <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
   <script>

    $(function(){

        //중복체크 버튼 눌렀을때 수행
        $('#updatePhone').click(function(){

            //연락처 값 가져오기
            var phoneNumber = $('#m_phone').val();

            //유효성 검사 - 숫자만 입력되었는지
            //유효성 검사 - 숫자 11개 입력되었는지

        }); //중복체크 부분 끝


        // 아이디가 btn인 버튼에게 클릭 이벤트를 부여하자!
        $("#btn").bind("click", function(){
            //btn이라는 버튼을 클릭할 때마다 수행하는 곳!!!!!
            //console.log("^^");

            // 사용자가 입력한 값들 모두 가져오기
            let name = $("#m_name").val();
            let phone = $("#m_phone").val();
            //let address = $("#m_address").val();
            //let payment = $("#m_payment").val();

            let param = "";

            //유효성검사(name,phone)
            if(name.trim().length == 0){
                alert("이름을 입력하세요");
                $("#m_name").focus();
                return;
            }else
                param += "m_name="+encodeURIComponent(name);

            if(phone.trim().length == 0){
                alert("연락처를 입력하세요");
                $("#m_phone").focus();
                return;
            }else
                param += "&m_phone="+encodeURIComponent(phone);

            /*if(address.trim().length > 0){
                param += "&m_address="+encodeURIComponent(address);
            }*/

            /*if(payment.trim().length > 0){
                param += "&m_payment="+encodeURIComponent(payment);
            }*/

            // 비동기식 통신으로 회원 정보 수정~~~~~~~~~~~~~~~~~~~~~~~~~
            $.ajax({
                url: "/updateMember",
                type: "post",
                data: param,
                dataType: "json"
            }).done(function(data){
                //수정완료시를 검증해야 함! (res:1이면 "변경완료", res:0이면 "변경실패")
                if(data.res == 1)
                    alert("변경완료 되었습니다.");
                else
                    alert("변경실패 했습니다.");
            });

        });
    });
   </script>

  </body>

  </html>