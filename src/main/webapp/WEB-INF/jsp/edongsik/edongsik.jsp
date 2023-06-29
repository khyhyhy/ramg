<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>
  <html>

  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Insert title here</title>
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  </head>

  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
   integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  <style>
    
  </style>

<body>
  <!--////////// Header Start ////////////-->
  <jsp:include page="../main/mainH.jsp"></jsp:include>
  <!--////////// Header end ////////////-->

  <!--////////// Main start //////////////-->
  <main></main>
    
    <!-- <p>"${evo.m_idx}"</p>
    <P>"${sessionScope.evo.m_idx}"</P> -->

    <div style="display: flex; justify-content: center; margin-top: 40px;">
        <button type="button" onclick="location.href='??'">충전하기</button>
        <button type="button" onclick="location.href='??'" style="margin-left: 50px; margin-right: 50px;">현재상황</button>
        <button type="button" onclick="location.href='map'">이용내역</button>
    </div>
 
    <div style="display: flex; justify-content: center; align-items: center; min-height: 70vh;">

      <div class="card" style="width: 18rem; ">
        <img src="/images/map_icon.png" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">현재 위치 검색</h5>
          <p class="card-text"></p>
          <a href="#" class="btn btn-primary" onclick="conf()" style="background-color: #0DCAF0; border-color: #0DCAF0;">검색</a>
        </div>
      </div>
    

      <div class="card" style="width: 18rem; margin-left: 150px;">
        <img src="/images/car_icon.png" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">차량 등록 주소</h5>
          <p class="card-text"></p>
          <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="background-color: #0DCAF0; border-color: #0DCAF0;">검색</a>
        </div>
      </div>

      <!-- <c:forEach items="${carVo}" var="carVo">
                  <p>${carVo.c_name}</p>
                </c:forEach> -->
      
      <!-- Modal -->
      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header" style="background-color: #0DCAF0;">
              <h5 class="modal-title" id="exampleModalLabel" style="color: white;">차량 선택</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

              <select id="selectCar" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                <option selected>차량 선택</option>
                <c:forEach items="${carVo}" var="carVo">
                  <option value="${carVo.c_idx}">${carVo.c_name}</option>
                </c:forEach>  
                        
          
            
        </select>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" style="background-color: #0DCAF0; border-color: #0DCAF0;" onclick="selectC()">선택 확인</button>
      </div>
    </div>
  </div>
</div>

<script>
  function selectC(){
		var selectCar  = document.getElementById("selectCar");
		var value = (selectCar.options[selectCar.selectedIndex].value);
		alert("c_idx = "+value);

    

   location.href="/carAddr/?c_idx="+value;

	};
</script>

<!-- <script>
  const modal = document.querySelector('.modal');
	        const btnOpenPopup = document.querySelector('#btn-open-popup');
	        btnOpenPopup.addEventListener('click', () => {
	          modal.style.display = 'block';
	        });
	        
	        const closeBtn = modal.querySelector(".btn-close")
	        closeBtn.addEventListener("click", e => {
	            modal.style.display = "none"
	        });
	        
	        const closeBtn2 = modal.querySelector("#close_bt")
	        closeBtn2.addEventListener("click", e => {
	            modal.style.display = "none"
	        });

</script> -->
      

</div>
<form action="/local/" method="get">
  <input type="hidden" id="lat1" name="lat" />
  <input type="hidden" id="lng1" name="lng" />
 </form>
</main>
<!--////////// Main end //////////////-->
<!--////////// Foter start //////////////-->
<jsp:include page="../main/mainF.jsp"></jsp:include>
<!--////////// Foter end //////////////-->

<script>
  function conf() {
   if (confirm("현재위치를 조회하시겠습니까?")) {
    johoe();
   } else {
    alert("위치 기반 서비스를 동의해 주세요");
   }
  }
  function johoe() {
   navigator.geolocation.getCurrentPosition(function (pos) {
    console.log(pos);
    var latitude = pos.coords.latitude;
    var longitude = pos.coords.longitude;
    document.getElementById("lat1").value = latitude;
    document.getElementById("lng1").value = longitude;
    alert("현재 위치는 : " + latitude + ", " + longitude);
    document.forms[0].submit();
   });
  }

  function selectCar(form) {
				//frm.submit();
				
				 
				let selectCar = form.selectCar.value;
        console.log(selectCar);
        //form.submit();

        //location.href="/ee/?c_idx="+selectCar;
      }
    
  
 </script>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  </body>
  </html>