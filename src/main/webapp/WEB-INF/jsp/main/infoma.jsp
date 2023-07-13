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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>람쥐썬더 충전소 서비스 소개</title>
<style>
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
</style>
  </head>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
        <!--////////// Header Start ////////////-->
        <jsp:include page="mainH.jsp"></jsp:include>
        <!--////////// Header end ////////////-->
        <!--////////// Main start //////////////-->
        <main> 
          <div class="container mt-5">
            <div class="text-center mb-5">
                <img src="이미지 파일 경로" alt="충전소 이미지" style="max-width: 500px;">
            </div>
            <h2 class="font-weight-bold text-center mb-4">람쥐썬더 충전소 서비스 소개</h2>
            <p class="font-size-16 text-center">
                람쥐썬더 충전소는 편리하게 충전소 위치를 알려주는 서비스입니다. 이 서비스는 두 가지 옵션을 제공합니다.
            </p>
            <ul class="font-size-16" style="margin-left: 20px;">
                <li>탁송 서비스:
                    <ul>
                        <li>이 서비스를 이용하면 고객은 충전이 필요한 위치를 지정할 수 있습니다.</li>
                        <li>고객은 충전량을 설정하여 충전을 요청할 수 있습니다.</li>
                        <li>람쥐썬더 충전소는 충전이 완료된 후에 충전된 차량을 고객이 원하는 위치로 탁송해줍니다.</li>
                        <li>이를 통해 고객은 원하는 위치에서 편리하게 차량을 충전할 수 있습니다.</li>
                    </ul>
                </li>
            </ul>
            <div class="area ellipsis">
                <ul class="font-size-16" style="margin-left: 20px;">
                    <li>이동식 서비스:
                        <ul>
                            <li>이 서비스를 이용하면 고객은 원하는 위치에서 기다리면 됩니다.</li>
                            <li>고객이 특정 장소에서 기다리면 람쥐썬더 충전소의 기사가 충전차량을 운전하여 이동합니다.</li>
                            <li>충전차량이 고객의 위치로 이동하여 충전 서비스를 제공합니다.</li>
                            <li>이를 통해 고객은 이동하지 않고도 바로 차량을 충전할 수 있으며, 편의성이 크게 향상됩니다.</li>
                        </ul>
                    </li>
                </ul>
                <p class="font-size-16">
                    람쥐썬더 충전소는 고객의 편의성을 높이기 위해 탁송 서비스와 이동식 서비스를 제공합니다. 이를 통해 고객은 원하는 위치에서 충전할 수 있으며, 이동이 필요한 경우에도 편리하게 충전 서비스를 이용할 수 있습니다.
                </p>
            </div>
        </div>
      </main>
        <!--////////// Main end //////////////-->
        <!--////////// Foter start //////////////-->
        <jsp:include page="mainF.jsp"></jsp:include>
        <!--////////// Foter end //////////////-->
</body>
</html>
