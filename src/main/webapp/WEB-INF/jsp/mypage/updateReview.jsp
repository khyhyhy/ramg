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

        .starR{
            display: inline-block;
            width: 30px;
            height: 30px;
            color: transparent;
            text-shadow: 0 0 0 #ccc;
            font-size: 1.8em;
            box-sizing: border-box;
            cursor: pointer;
          }
          
          /* 별 이모지에 마우스 오버 시 */
          .starR:hover {
            text-shadow: 0 0 0 #ccc;
          }
          
          /* 별 이모지를 클릭 후 class="on"이 되었을 경우 */
          .starR.on{
            text-shadow: 0 0 0 #ffbc00;
          }
   </style>
  </head>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <body>
  <jsp:include page="../main/mainH.jsp"></jsp:include>
    <div class="container text-center">
    <article>
   <h2>리뷰수정</h2>
   </article>
   <table class="table table-striped table-hover">
    <tbody>
        <tr>
            <th><label for="bl_date">내용</label></th>
            <td><textarea id="b_content" class="form-control" name="b_content" style="height: 300px;">${bvo.b_content}</textarea></td>
        </tr>
        <tr>
            <th><label for="b_score">별점</label></th>
                
            <td class="starRev">
                <c:if test="${bvo.b_score eq 1}">
                    <span class="starR on" value="1" >⭐</span>
                    <span class="starR" value="2" >⭐</span>
                    <span class="starR" value="3" >⭐</span>
                    <span class="starR" value="4" >⭐</span>
                    <span class="starR" value="5" >⭐</span>
                </c:if>
                <c:if test="${bvo.b_score eq 2}">
                    <span class="starR on" value="1" >⭐</span>
                    <span class="starR on" value="2" >⭐</span>
                    <span class="starR" value="3" >⭐</span>
                    <span class="starR" value="4" >⭐</span>
                    <span class="starR" value="5" >⭐</span>
                </c:if>
                <c:if test="${bvo.b_score eq 3}">
                    <span class="starR on" value="1" >⭐</span>
                    <span class="starR on" value="2" >⭐</span>
                    <span class="starR on" value="3" >⭐</span>
                    <span class="starR" value="4" >⭐</span>
                    <span class="starR" value="5" >⭐</span>
                </c:if>
                <c:if test="${bvo.b_score eq 4}">
                    <span class="starR on" value="1" >⭐</span>
                    <span class="starR on" value="2" >⭐</span>
                    <span class="starR on" value="3" >⭐</span>
                    <span class="starR on" value="4" >⭐</span>
                    <span class="starR" value="5" >⭐</span>
                </c:if>
                <c:if test="${bvo.b_score eq 5}">
                    <span class="starR on" value="1" >⭐</span>
                    <span class="starR on" value="2" >⭐</span>
                    <span class="starR on" value="3" >⭐</span>
                    <span class="starR on" value="4" >⭐</span>
                    <span class="starR on" value="5" >⭐</span>
                </c:if>
            </td>

        </tr>
        <tr>
            
            <td colspan="2">
                <button type="button" id="btn" class="btn btn-success">변경하기</button>
                <button type="button" class="btn btn-success" onclick="javascript:location.href='my_review'">돌아가기</button>
            </td>
        </tr>
    </tbody>
   </table>
   </div>
   <jsp:include page="../main/mainF.jsp"></jsp:include>
    

   <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
   <script>

    $(function(){

        let b_score = '${bvo.b_score}';

        $('.starRev span').click(function(){
            $(this).parent().children('span').removeClass('on');
            $(this).addClass('on').prevAll('span').addClass('on');

            var value = $(this).attr('value');
            //alert(value);
            console.log(value);
            b_score = value;
            //alert(b_score);

            return false;
          });


        // 아이디가 btn인 버튼에게 클릭 이벤트를 부여하자!
        $("#btn").bind("click", function(){
            //btn이라는 버튼을 클릭할 때마다 수행하는 곳!!!!!
            //console.log("^^");

            // 사용자가 입력한 값들 모두 가져오기
            let b_idx = '${bvo.b_idx}';
            //let b_title = $("#b_title").val();
            
            let b_content = $("#b_content").val();
            let param = "";


            alert("b_score: "+b_score);
            
            //유효성검사(name,phone)
            /*if(b_title.trim().length == 0){
                alert("제목을 입력하세요");
                $("#b_title").focus();
                return;
            }else
                param += "b_title="+encodeURIComponent(b_title);*/

            if(b_score.trim().length == 0){
                alert("별점을 입력하세요");
                //$("#b_score").focus();
                return;
            }else
                param += "b_score="+encodeURIComponent(b_score);

            if(b_content.trim().length == 0){
                alert("내용을 입력하세요");
                $("#b_content").focus();
                return;
            }else
            alert("내용 있음");
                param += "&b_content="+encodeURIComponent(b_content);

            param += "&b_idx="+encodeURIComponent(b_idx);

            // 비동기식 통신으로 회원 정보 수정~~~~~~~~~~~~~~~~~~~~~~~~~
            $.ajax({
                url: "/updateReview",
                type: "post",
                data: param,
                dataType: "json"
            }).done(function(data){
                //수정완료시를 검증해야 함! (res:1이면 "변경완료", res:0이면 "변경실패")
                if(data.res == 1){
                    alert("변경완료 되었습니다.");
                    console.log(data.res);
                }
                else{
                    alert("변경실패 했습니다.");
                    console.log(data.res);
                }
            });

        });
    });
   </script>

  </body>

  </html>