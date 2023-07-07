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
</head>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
        <!--////////// Header Start ////////////-->
        <jsp:include page="mainH.jsp"></jsp:include>
        <!--////////// Header end ////////////-->
        <!--////////// Main start //////////////-->
        <main> 
            <div class="container-xxl mt-4">
                <div class="row">
                  <div class="row row-cols-2">
                    <div class="col-8">
                        <!-- 점보트론-->
                        <div class="p-5 mb-4 bg-body-tertiary rounded-3" style="background-color: rgb(158, 157, 152);">
                            <div class="container-fluid py-5">
                                <div id="carouselExampleCaptions" class="carousel slide">
                                    <div class="carousel-indicators">
                                      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                      <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                    </div>
                                    <div class="carousel-inner">
                                      <div class="carousel-item active" style="text-align: center;">
                                        <img src="../images/cafe.png" class="" alt="...">
                                        <div class="carousel-caption d-none d-md-block">
                                          <h5>커피한잔</h5>
                                          <p>여러가지 커피를 맛보세용.</p>
                                        </div>
                                      </div>
                                      <div class="carousel-item " style="text-align: center;">
                                        <img src="../images/car_icon.png" class="" alt="...">
                                        <div class="carousel-caption d-none d-md-block">
                                          <h5>자동차 충전</h5>
                                          <p>개꿀띠.</p>
                                        </div>
                                      </div>
                                      <div class="carousel-item" style="text-align: center;">
                                        <img src="../images/chargeicon.png" class="" alt="...">
                                        <div class="carousel-caption d-none d-md-block">
                                          <h5>블라블라</h5>
                                          <p>블라블라블라블라블라블라블라블라</p>
                                        </div>
                                      </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                      <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                      <span class="visually-hidden">Next</span>
                                    </button>
                                  </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-4 mb-4">
                        <div class="h-100 p-5 text-bg-dark rounded-3">
                            <h2>Change the background</h2>
                            <p>Swap the background-c.</p>
                            <button class="btn btn-outline-light" type="button">Example button</button>
                        </div>
                    </div>
                  </div>
                  <div class="row row-cols-3">
                    <div class="col-4 mb-4">
                        <div class="h-100 p-5 bg-body-tertiary border rounded-3">
                            <h2>Add borders</h2>
                            <p>Or, keep it light and add a boe hood alignment and sizing of both column's content for equal-height.</p>
                            <button class="btn btn-outline-secondary" type="button">Example button</button>
                        </div>
                    </div>
                    <div class="col-4 mb-4">
                        <div class="h-100 p-5 text-bg-dark rounded-3">
                            <h2>Change the background</h2>
                            <p>Swap the background-color utility and add n, mix and match with additional component themes and more.</p>
                            <button class="btn btn-outline-light" type="button">Example button</button>
                        </div>
                    </div>
                    <div class="col-4 mb-4">
                        <div class="h-100 p-5 bg-body-tertiary border rounded-3">
                            <h2>Add borders</h2>
                            <p>Or, keep it light and add a borded the alignment and sizing of both column's content for equal-height.</p>
                            <button class="btn btn-outline-secondary" type="button">Example button</button>
                        </div>  
                    </div>
                  </div>
                  <div class="row row-cols-2">
                    <div class="col-4">
                        <div class="h-100 p-5 text-bg-dark rounded-3">
                            <h2>Change the background</h2>
                            <p>Swap the background-color utility  look. Then, mix and match with additional component themes and more.</p>
                            <button class="btn btn-outline-light" type="button">Example button</button>
                        </div>
                    </div>
                    <div class="col-8">
                        <div class="p-5 bg-body-tertiary rounded-3" style="background-color: rgb(158, 157, 152);">
                            <div class="container-fluid py-5">
                              <h1 class="display-5 fw-bold">Custom jumbotron</h1>
                              <p class="col-md-8 fs-4">Using a  the examples below for how you can remix and restyle it to your liking.</p>
                            </div>
                        </div>
                    </div>
                  </div>
                </div>
            </div>
        </main>
        <!--////////// Main end //////////////-->
        <!--////////// Foter start //////////////-->
        <jsp:include page="mainF.jsp"></jsp:include>
        <!--////////// Foter end //////////////-->
    
</body>
</html>
