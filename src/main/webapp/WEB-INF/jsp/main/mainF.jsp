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
    <style>
        @font-face {
            font-family: 'GoryeongStrawberry';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/GoryeongStrawberry.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        footer {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            z-index: 9999;
            padding: 10px;
        }
    </style>
</head>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <body>
        <!--////////// Foter start //////////////-->
        <div class="container-fluid">
            <footer class="bg-info d-flex flex-wrap justify-content-between align-items-center border-top " style="margin-top: 10px;">
                <p class="col-md-4 mb-0 text-white" style="font-family: 'GoryeongStrawberry';" >© 2023 RAM쥐Company, 그의 천둥을 조심해!</p>
            
                <a href="/main/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
                <svg class="bi me-2" width="50" height="35"><img src="/images/ramgi_logo.png"/></use></svg>
                </a>

            </footer>
        </div>
        <!--////////// Foter end //////////////-->
</body>
</html>
