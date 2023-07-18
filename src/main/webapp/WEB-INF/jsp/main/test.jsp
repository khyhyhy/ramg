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
    <link href="../../../css/ramg.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
  #wrap {border-radius: 5px; position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px; line-height: 1.5; background: #888;}
    #title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    #close {position: absolute;top: 10px;right: 10px;color: #000;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    #close:hover {cursor: pointer;}
    #body {position: relative;overflow: hidden;}
    #desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    #ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap; color: azure;}
    #jibun {font-size: 11px;color: #888;margin-top: -2px;}
    #img {border: 0px; position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 0px solid #ddd;color: #888;overflow: hidden;}
.box {
    width: 120px;
    height: 80px;
    padding: 10px;
    display: inline-block;
    flex-direction: column;
    align-items: center;
    text-align: center;
    background-color: #81F7F3;
}


.custom-btn {
    width: 40px;
    height: 40px;
    padding: 10px 25px;
    border: 2px solid #000;
    font-family: 'Lato', sans-serif;
    font-size: 15px;
    font-weight: 500;
    background: transparent;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    display: inline-block;
  }
  .plus{ position: absolute;top:0px;right: 0px; width: 31px;height:31px; background-color: #eaeaea; cursor:pointer; z-index: 1; }
  .plus:before{ position:absolute; top: 50%; left: 50%; width: 16px; height: 2px; margin: -1px 0 0 -8px; background: #fff; content: ''; }
  .plus:after{position: absolute; top: 50%; left: 50%; width: 2px; height: 16px; margin: -8px 0 0 -1px; background: #fff; content: ''; }
  .ellipsis {
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
  }

  @media (max-width: 768px) {
    .box {
      width: 100%;
      margin-bottom: 20px;
    }
  }
  
</style>
  </head>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
        <!--////////// Header Start ////////////-->
        <jsp:include page="mainH.jsp"></jsp:include>
        <!--////////// Header end ////////////-->
        <!--////////// Main start //////////////-->


      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-12">
            <div class="my-5">
              <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
                <div class="carousel-indicators">
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner" >
                  <div class="carousel-item active" >
                    <img style="object-fit: contain; width: 500px; height: 500px;" src="../images/redicon.png" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img style="object-fit: contain; width: 500px; height: 500px;" src="../images/redicon.png" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img style="object-fit: contain; width: 500px; height: 500px;"src="../images/redicon.png" class="d-block w-100" alt="...">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>

            </div>
            <div class="d-flex my-5 justify-content-center">
              <div class="col-md-5 p-5 px-3 rounded-3 ms-3 me-5" style="border:5px solid #59b9d1; color: #464646;">
                <table class="table">
                  <colgroup>
                    <col width="*">
                    <col width="210px">
                  </colgroup>
                  <thead>
                    <tr >
                      <th colspan="2" style="color: #4d4d4d; font-size: x-large;">공지사항 <a href="/support/notice" style="float: right;">공지 더보기<i class="fa fa-arrow-circle-right ms-2" aria-hidden="true"></i></a></th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="bvo" items="${b_ar}" varStatus="status">
                      <tr>
                        <td>
                          <a style="color:#4d4d4d!important;" href="/support/notice_view?b_idx=${bvo.b_idx}&cPage=1">
                            ${bvo.b_title}</a>
                        </td>
                        <td style="text-align: right; color: #4d4d4d;">${bvo.bbslog.bl_date}</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
              <div class="col-md-5 p-5 px-3 rounded-3" style="border:5px solid #59b9d1; color: #464646;">
                  <table class="table">
                    <thead>
                      <tr>
                        <th colspan="3" style="color: #4d4d4d; font-size: x-large;">전기차 충전요금</h2></td>
                      </tr>
                    </thead>
                    <tr>
                      <th>구분</th>
                      <th>완속</th>
                      <th>급속</th>
                    </tr>
                    <tr>
                      <th>연비</th>
                      <td>6.3km/kWh</td>
                      <td>6.3km/kWh</td>
                    </tr>
                    <tr>
                      <th>연료비</th>
                      <td>200원/kWh</td>
                      <td>292.9d원/kWh</td>
                    </tr>
                    <tr>
                      <th>100km당 연료비</th>
                      <td>3,175원</td>
                      <td>4,650원</td>
                    </tr>
                    <tr>
                      <th>연간 연료비</th>
                      <td>44만원</td>
                      <td>63.8만원</td>
                    </tr>
                  </table>
              </div>
              <!-- <div class="col-md-3 p-5 rounded-3 ms-3 me-5" style="border:5px solid #0DCAF0; color: #464646;">
                <h2 style="font-size: 24px; font-weight: bold;">람쥐썬더 충전소 서비스 소개</h2>
                <form id="introduceForm">
                  <button style="float: right;" class="btn btn-outline-info" type="button" onclick="redirectToIntroduce()">더보기</button>
                </form>
              </div> -->
              
            </div>
          </div><!--10-->
        </div>
      </div>
   




        <!--////////// Main end //////////////-->
        <!--////////// Foter start //////////////-->
        <jsp:include page="mainF.jsp"></jsp:include>
        <!--////////// Foter end //////////////-->        
     
</body>
</html>