<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <!DOCTYPE html>
  <html>

  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Insert title here</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <style>
      table{
          margin: 0 auto;
          width: 80%;
          border: 1px solid black;
          border-collapse: collapse;
      }
      table th, table td{
          border: 1px solid black;
      }
      
  </style>
  </head>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <body>
  <jsp:include page="../main/mainH.jsp"></jsp:include>
   <article>
    <h1>나의 리뷰</h1>
   </article>
   <div id="content">
      <table id="bl_list">
         <colgroup>
             <col width="150px"/>
             <col width="150px"/>
             <col width="100px"/>
             <col width="150px"/>
             <col width="150px"/>
             <col width="*"/>
         </colgroup>
         <thead>
             
             <tr>
                 <th>번호</th>
                 <th>제목</th>
                 <th>내용</th>
                 <th>조회수</th>
                 <th>별점</th>
                 <th>수정</th>
                 <th>삭제</th>
                 
             </tr>
         </thead>
         <tbody>
             <c:forEach var="bvo" items="${mr}">
                 <tr>
                     <td>${bvo.b_idx}</td>
                     <td>${bvo.b_title}</td>
                     <td>${bvo.b_content}</td>
                     <td>${bvo.b_hit}</td>
                     <td>${bvo.b_score}</td>
                     <td><a href="/updateReview?b_idx=${bvo.b_idx}">수정</a></td>
                     <td><a href="javascript:sub('${bvo.b_idx}')" id="sub">삭제</a></td>
                 </tr>
             </c:forEach>
         </tbody>
        </table>
      </div>
      <jsp:include page="../main/mainF.jsp"></jsp:include>
      
   
      <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
      <script>
        let table = document.getElementById("bl_list");
        function regRowNum(tr){
				// 해당 tr에 마우스가 올라가면 수행하는 이름없는 내부 함수의 영역
				// 이때!
				// 테이블에 rowIdx라는 변수를 만들어서 현재 행의 번호를 저장한다.
				table.rowIdx = tr.rowIndex;
				//console.log(table.rowIdx);
		};
        function sub(b_idx){

           // let c_idx = '${cwvo.cvo.c_idx}';
           // let m_idx = '${cwvo.m_idx}';

            let param = "";

            param += "b_idx="+encodeURIComponent(b_idx);

            if(confirm("정말로  삭제 시키겠습니까?")){
            $.ajax({
                url: "/deleteReview",
                type: "post",
                data: param,
                dataType: "json"
            }).done(function(data){
                if(data.res == 1){ // 성공했을 경우
                    //$("#sub").remove();
                    // table에 등록된 rowIdx라는 변수(속성)의 값을 가져온다. 그리고
                    //table로부터 해당 랭을 삭제한다.
                    table.deleteRow(table.rowIdx);
                }
            });
        }else{
            return;
        }
        }
      
      </script>
</body>

</html>