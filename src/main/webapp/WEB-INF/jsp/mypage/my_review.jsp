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
  </head>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <body>
  <jsp:include page="../main/mainH.jsp"></jsp:include>
  <div id="content" class="container text-center">
        <div class="m-5">
            <c:if test="${s_type eq null}">
                <h1 style="text-align: center; font-weight: bold;">이용자의 리뷰</h1>
            </c:if>
            <c:if test="${s_type ne null}">
                <h1 style="text-align: center; font-weight: bold;">나의 리뷰</h1>
            </c:if>
        </div>
      <table id="bl_list" class="table table-striped table-hover">
         <colgroup>
            <col width="*">
            <col width="200px">
            <col width="200px">
            <col width="200px">
            <col width="200px">
         </colgroup>
         <thead>
             <tr>
                <th>리뷰</th>
                <th>별점</th>
                <th>서비스유형</th>
                <th>글쓴이</th>
                <th>등록일</th> 
                 
             </tr>
         </thead>
         <tbody>
            <c:if test="${ar == null}">
                <tr>
                    <td colspan="6">검색 결과가 없습니다.</td>
                </tr>
            </c:if>
            <c:forEach var="vo" items="${ar}" varStatus="st">
                <tr>
                    <!-- <td>${totalRecord - ((nowPage-1)*blockList+st.index)}</td> -->
                    <td style="word-break: break-all; text-overflow:unset; overflow:unset; white-space:unset;">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="flush-heading${vo.b_idx}">
                                <button class="accordion-button collapsed" style="overflow: hidden;
                                    text-overflow: ellipsis;
                                    white-space: nowrap;" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${vo.b_idx}" aria-expanded="false" aria-controls="flush-collapse${vo.b_idx}">
                                    ${vo.b_content}
                                </button>
                            </h2>
                            <div id="flush-collapse${vo.b_idx}" class="accordion-collapse collapse" aria-labelledby="flush-heading${vo.b_idx}" data-bs-parent="#accordionFlushExample">
                              <div class="accordion-body"><br>${vo.b_content}</div>
                            </div>
                          </div>
                    </td>
                    <td>
                        <c:if test="${vo.b_score == 0}">
                            ☆☆☆☆☆
                        </c:if>
                        <c:if test="${vo.b_score == 1}">
                            ★☆☆☆☆
                        </c:if>
                        <c:if test="${vo.b_score == 2}">
                            ★★☆☆☆
                        </c:if>
                        <c:if test="${vo.b_score == 3}">
                            ★★★☆☆
                        </c:if>
                        <c:if test="${vo.b_score == 4}">
                            ★★★★☆
                        </c:if>
                        <c:if test="${vo.b_score == 5}">
                            ★★★★★
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${s_type eq null && vo.s_type ne null}">
                            <c:choose>
                                <c:when test="${vo.s_type eq 0}"> 탁송 충전 서비스 </c:when>
                                <c:when test="${vo.s_type eq 1}"> 이동식 충전 서비스 </c:when>
                            </c:choose>
                        </c:if>
                        <c:if test="${vo.s_type eq null && s_type ne null}">
                            <c:choose>
                                <c:when test="${s_type eq 0}"> 탁송 충전 서비스 </c:when>
                                <c:when test="${s_type eq 1}"> 이동식 충전 서비스 </c:when>
                            </c:choose>
                        </c:if>
                    </td>
                    <td>
                        ${vo.mvo.m_name}
                    </td>
                    <td>
                        ${vo.bbslog.bl_date}
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <div style="height: 80px;" >
        ${pageCode}
    </div>
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