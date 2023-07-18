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
      header{
        text-align: center;
      }
      .container{
        margin-top: 2cm;
        margin-bottom: 2cm;
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
            <h1 style="text-align: center; font-weight: bold;">비밀번호 변경</h1>
        </div>
   </article>
   <table class="table table-striped table-hover">
    <tbody>
        <tr>
            <th><label for="pwd">변경할 비밀번호</label></th>
            <td><input type="password" id="pwd" name="pwd" placeholder="최소 8자이상, 영문자 1글자, 숫자1개를 입력해주세요."/></td>
        </tr>
        <tr>
            <th><label for="pwd2">재입력 비밀번호</label></th>
            <td><input type="password" id="pwd2" name="pwd2" placeholder="변경할 비밀번호를 입력해주세요."/></td>
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
   <script>

    $("#btn").bind("click", function(){
        //btn이라는 버튼을 클릭할 때마다 수행하는 곳!!!!!
        //console.log("^^");

        // 사용자가 입력한 값들 모두 가져오기
        let pwd1 = $("#pwd").val();
        //let phone = $("#m_phone").val();
        let pwd2 = $("#pwd2").val();
        //let address = $("#m_address").val();
        //let payment = $("#m_payment").val();

        let check = /^(?=.*[a-z])(?=.*\d).{8,}$/;

        let param = "";

        //유효성검사(name,phone)
        if(pwd1 != pwd2){
            alert("비밀번호가 서로 다릅니다.");
            $("#pwd").focus();
            return;
        }
        param += "pwd="+encodeURIComponent(pwd1);

        if(!check.test(pwd1)){
            alert("비밀번호는 최소 숫자1개, 소문자1개 포함한 8자 이상");
            $("#pwd").focus();
            return;
        }
        

        // 비동기식 통신으로 회원 정보 수정~~~~~~~~~~~~~~~~~~~~~~~~~
        $.ajax({
            url: "/changePWD",
            type: "post",
            data: param,
            dataType: "json"
        }).done(function(data){
            //수정완료시를 검증해야 함! (res:1이면 "변경완료", res:0이면 "변경실패")
            if(data.res == 1){
                alert("변경완료 되었습니다.");
                location.href="/updateMember";
            }else
                alert("변경실패 했습니다.");
        });

    });

   </script>
  </body>

  </html>