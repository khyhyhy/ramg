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
    <link href="../../css/page.css" rel="stylesheet">
  </head>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
   integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

   <style>
    #myform fieldset{
        display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
        direction: rtl; /* 이모지 순서 반전 */
        border: 0; /* 필드셋 테두리 제거 */
    }
    #myform fieldset legend{
        text-align: left;
    }
    #myform input[type=radio]{
        display: none; /* 라디오박스 감춤 */
    }
    #myform label{
        font-size: 2em; /* 이모지 크기 */
        color: transparent; /* 기존 이모지 컬러 제거 */
        text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
    }
    #myform label:hover{
        text-shadow: 0 0 0 #ffbc00; /* 마우스 호버 */
    }
    #myform label:hover ~ label{
        text-shadow: 0 0 0 #ffbc00; /* 마우스 호버 뒤에오는 이모지들 */
    }
    #myform input[type=radio]:checked ~ label{
        text-shadow: 0 0 0 #ffbc00; /* 마우스 클릭 체크 */
    }
   </style>
  <body>
   <!--////////// Header Start ////////////-->
   <jsp:include page="../main/mainH.jsp"></jsp:include>
   <!--////////// Header end ////////////-->

   <!--////////// Main start //////////////-->
   <div class="container">
    <main>
     <!-- <p>"${evo.m_idx}"</p> -->
     <!-- <c:if test="${sessionScope.evo == null}"></c:if> -->

     <div style="display: flex; justify-content: center; margin-top: 40px;">
      <button type="button" onclick="location.href='??'">충전하기</button>
      <button type="button" onclick="location.href='/e_nowOrder/'" style="margin-left: 50px; margin-right: 50px;">현재상황</button>
      <button type="button" onclick="location.href='/e_orderList/'">이용내역</button>
     </div>

      
      <div class="row" style="margin-top: 100px; margin-bottom: 100px;">
        <table summary="이용내역" class="table table-hover">
					
            <colgroup>
               <col width="250px">
               <col width="130px">
               <col width="130px">
               <col width="130px">
               <col width="130px">
               <col width="130px">
               
               <col width="120px">
               <col width="120px">
           </colgroup>
           
               <thead>
                   <tr class="table-info">
                       <th style="text-align: center;">서비스 정보</th>
                       <th style="text-align: center;">업체정보</th>
                       <th style="text-align: center;">주문일자</th>
                       <th style="text-align: center;">서비스 금액</th>
                       <th style="text-align: center;">충전 금액</th>
                       <th style="text-align: center;">총 결제금액</th>
                       <th colspan="2" style="text-align: center;">서비스 상태</th>
                   </tr>
               </thead>
               
               
               <tbody>
                   <c:forEach items="${suar}" var="suar">
                       <tr style="height: 150px; margin-bottom: 100px;">

                        <td style="text-align: left; vertical-align: middle;" >
                            <c:if test="${suar.svo.s_type == 1}">
                                <a href="/e_order/?s_idx=${suar.s_idx}&su_idx=${suar.su_idx}">이동식 충전 서비스</a>
                            </c:if>
                            <c:if test="${suar.svo.s_type == 0}">
                                <a href="/e_order/?s_idx=${suar.s_idx}&su_idx=${suar.su_idx}">탁송 충전 서비스</a>
                            </c:if>
                        </td>
                           <td style="text-align: center; vertical-align: middle;">${suar.mvo.m_name} ${suar.mvo.m_phone}</td>   
                           <td style="text-align: center; vertical-align: middle;">${suar.su_date}</td>
                           <td style="text-align: center; vertical-align: middle;">${suar.su_sprice}</td>
                           <td style="text-align: center; vertical-align: middle;">${suar.su_cprice}</td>

                            <c:set var="num1" value="${suar.su_sprice}" />
                            <c:set var="num2" value="${suar.su_cprice}" />
                            <c:set var="sum" value="${(num1 + num2)}" />

                           <td style="text-align: center; vertical-align: middle;">${sum}</td>

                   
                        <c:if test="${suar.svo.s_type == 1}">
                            <c:choose>
                               <c:when test="${suar.su_status == 0}">
                                   <td colspan="2" style="text-align: center; vertical-align: middle;">주문 대기중</td>
                                </c:when>
                                <c:when test="${suar.su_status == 1}">
                                    <td colspan="2" style="text-align: center; vertical-align: middle;">주문 접수</td>
                                </c:when>
                                <c:when test="${suar.su_status == 2}">
                                    <td colspan="2" style="text-align: center; vertical-align: middle;">충전지 이동중</td>
                                </c:when>
                                <c:when test="${suar.su_status == 3}">
                                    <td colspan="2" style="text-align: center; vertical-align: middle;">충전지 도착</td>
                                </c:when>
                                <c:when test="${suar.su_status == 4}">
                                    <td colspan="2" style="text-align: center; vertical-align: middle;">충전중</td>
                                </c:when>
                                <c:when test="${suar.su_status == 5}">
                                    <td style="text-align: center; vertical-align: middle;">충전완료</td>
                                        <c:if test="${suar.bvo.b_content == null}">
                                            <td style="text-align: center; vertical-align: middle;">
                                                <button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="openModal(this)">후기 작성
                                                    <input type="hidden" id="su_idx" name="su_idx" value="${suar.su_idx}"/>
                                                </button>
                                            </td>
                                        </c:if>
                                        <c:if test="${suar.bvo.b_content != null}">
                                            <td style="text-align: center; vertical-align: middle;">
                                                <button type="button" onclick="location.href='/my_review'">작성후기 확인
                                                    
                                                </button>
                                            </td>
                                        </c:if>
                                </c:when>
                            </c:choose>
                        </c:if>

                        <c:if test="${suar.svo.s_type == 0}">
                            <c:choose>
                                   <c:when test="${suar.su_status == 0}">
                                       <td colspan="2" style="text-align: center; vertical-align: middle;">주문 대기중</td>
                                    </c:when>
                                    <c:when test="${suar.su_status == 1}">
                                        <td colspan="2" style="text-align: center; vertical-align: middle;">주문 접수</td>
                                    </c:when>
                                    <c:when test="${suar.su_status == 2}">
                                        <td colspan="2" style="text-align: center; vertical-align: middle;">탁송기사 이동중</td>
                                    </c:when>
                                    <c:when test="${suar.su_status == 3}">
                                        <td colspan="2" style="text-align: center; vertical-align: middle;">차량픽업</td>
                                    </c:when>
                                    <c:when test="${suar.su_status == 4}">
                                        <td colspan="2" style="text-align: center; vertical-align: middle;">충전소 이동중</td>
                                    </c:when>
                                    <c:when test="${suar.su_status == 5}">
                                        <td colspan="2" style="text-align: center; vertical-align: middle;">충전중</td>
                                    </c:when>
                                    <c:when test="${suar.su_status == 6}">
                                        <td colspan="2" style="text-align: center; vertical-align: middle;">도착지 이동중</td>
                                    </c:when>
                                    <c:when test="${suar.su_status == 7}">
                                        <td style="text-align: center; vertical-align: middle;">도착완료</td>
                                        <c:if test="${suar.bvo.b_content == null}">
                                        <td style="text-align: center; vertical-align: middle;">
                                            <button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="openModal(this)">후기 작성
                                                <input type="hidden" id="su_idx" name="su_idx" value="${suar.su_idx}"/>
                                            </button>
                                        </td>
                                        </c:if>
                                        <c:if test="${suar.bvo.b_content != null}">
                                        <td style="text-align: center; vertical-align: middle;">
                                            <button type="button" onclick="location.href='/my_review'">작성후기 확인
                                                
                                            </button>
                                        </td>
                                        </c:if>
                                    </c:when>
                                    <c:when test="${suar.su_status == 8}">
                                        <td colspan="2" style="text-align: center; vertical-align: middle;">문제발생</td>
                                    </c:when>
                                </c:choose>
                        </c:if>
                        
                        </tr>
                    </c:forEach>  
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="7">
                                <ol class="paging">
                                    <c:if test="${page.startPage == 1 }">
                                            <li class="disable">&lt;</li>
                                    </c:if>
                                    <c:if test="${page.startPage ne 1 }">
                                            <li><a href="/e_orderList/?cPage=${page.startPage-page.pagePerBlock }">&lt;</a></li>
                                    </c:if>		
                                    <c:forEach begin="${page.startPage }" end="${page.endPage }" varStatus="st">
                                          <c:if test="${nowPage == st.index }">
                                              <li class="now">${st.index }</li>								
                                          </c:if>
                                          <c:if test="${nowPage != st.index }">
                                              <li><a href="/e_orderList/?cPage=${st.index }">${st.index}</a></li>
                                          </c:if>
                                     </c:forEach>
                                     <c:if test="${page.endPage < page.totalPage }">
                                             <li><a href="/e_orderList/?cPage=${page.startPage + page.pagePerBlock }">&gt;</a></li>
                                     </c:if>
                                     <c:if test="${page.endPage >= page.totalPage }">
                                            <li class="disable">&gt;</li>
                                    </c:if>
                                </ol>
                            </td>
                        </tr>
                    </tfoot>
        </table>

        <!-- Modal -->
      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header" style="background-color: #0DCAF0;">
              <h5 class="modal-title" id="exampleModalLabel" style="color: white;">후기작성</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">
                
                <form name="myform" id="myform" method="post" action="">
                    <fieldset>
                        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
                        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
                        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
                        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
                        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>

                        <input type="hidden" id="modalSuIdx">
                            <script>
                                function openModal(button) {
                                    var su_idx  = document.getElementById("su_idx").value;
                                    var modalSuIdx = document.getElementById("modalSuIdx");
                                    modalSuIdx.value = su_idx;
                                }
                            </script>
                        
                    </fieldset>
                </form>
                    
                    <div class="mb-3">
                        <br/>
                        <label for="exampleFormControlTextarea1" class="form-label"> 내용</label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                    </div>
            </div>

            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
              <button type="button" class="btn btn-primary" style="background-color: #0DCAF0; border-color: #0DCAF0;" onclick="addReviewContent(this.form)">선택 확인</button>
            </div>
          </div>
        </div>
      </div>
<!-- Modal 끝-->

      </div>

      
    </main>
   </div>
   <!--////////// Main end //////////////-->
   <!--////////// Foter start //////////////-->
   <jsp:include page="../main/mainF.jsp"></jsp:include>
   <!--////////// Foter end //////////////-->
   <script>

    function addReviewContent(form){
        // 폼 요소를 가져옵니다.
        var form = document.getElementById("myform");
        

        // 폼 요소 내의 라디오 버튼들을 가져옵니다.
        var radioButtons = form.elements["rating"];

        // 선택된 값을 저장할 변수를 선언합니다.
        var selectedValue = "";

        // 라디오 버튼들을 순회하면서 선택된 값을 찾습니다.
        for (var i = 0; i < radioButtons.length; i++) {
        if (radioButtons[i].checked) {
            selectedValue = radioButtons[i].value;
            break; // 선택된 값을 찾았으면 반복문을 종료합니다.
        }
        }
        var su_idx = document.getElementById("modalSuIdx").value;
        var reviewContent = document.getElementById("exampleFormControlTextarea1").value;

        // 선택된 값을 출력합니다.
       
        <!-- alert("su_idx :"+su_idx);
        alert("reviewContent :"+reviewContent);
        alert("selectedValue :"+selectedValue); -->
		
    
    if (selectedValue === "") {
      alert("별점을 선택해주세요.");
    } else if(reviewContent === ""){
      alert("내용을 입력해주세요.");
    }else{  
      location.href="/review/?su_idx="+su_idx+"&reviewContent="+reviewContent+"&selectedValue="+selectedValue;
    }
	};

   
   </script>
  </body>

  </html>