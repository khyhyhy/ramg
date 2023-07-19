<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 페이지 로그인</title>
<link href="../../../css/admin.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<body>
<main>
    <div class="container" style="margin-top: 100px;">
    <div class="m-5">
        <h1 style="text-align: center; font-weight: bold;">람쥐썬더 관리자 로그인</h1>
    </div>
    <form action="/admin/login" method="post">
        <div style="margin: 0 auto; width: 300px;">
            <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
            <input type="email" name="m_email" class="form-control">
            <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
            <input type="password" name="m_pw"class="form-control">
            <button type="submit" class="btn btn-outline-warning" style="margin-top: 30px; width: 300px;">로그인</button>
        </div>
    </form>
    
    </div>
</main>
</body>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        if ('${msg}' != "") {
            alert('${msg}');
        }
    })
</script>
</html>
