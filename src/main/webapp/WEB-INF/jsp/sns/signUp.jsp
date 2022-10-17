<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
  <!-- jquery : ajax, bootstrap, datepicker -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  

  <!-- bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

  <!-- css -->
  <link rel="stylesheet" href="/static/css/sns.css">
</head>
<body>
  <div id="wrap" class="container">
    <!-- header -->
    <div id="header" class="d-flex justify-content-between align-items-center">
      <h1 class="logo"><a href="#self">Instagram</a></h1>
      <div class="util-box d-flex justify-content-between align-items-center col-4">
        <div class="greeting"><span class="user-name">userName</span>님 안녕하세요!</div>
        <button type="button" class="btn-sign-out text-secondary">로그아웃</button>
      </div>
    </div>
    <!-- content -->
    <div id="contents">
      <div class="form-outer col-6">
        <div class="form-box">
          <div class="form-group mb-2 d-flex align-items-center">
            <label for="loginID">아이디</label>
            <input type="text" id="loginId" class="form-control">
            <button type="button" class="btn btn-dark col-3 ml-2">중복확인</button>
          </div>
          <div class="noti-box mb-3">
            <div class="noti text-success">사용 가능한 아이디입니다.</div>
            <div class="noti text-danger">사용중인 아이디입니다.</div>
          </div>
        </div>
        <div class="form-group d-flex align-items-center">
          <label for="password">비밀번호</label>
          <input type="text" id="password" class="form-control">
        </div>
        <div class="form-group d-flex align-items-center">
          <label for="password">비밀번호 확인</label>
          <input type="text" id="password" class="form-control">
        </div>
        <div class="form-group d-flex align-items-center">
          <label for="name">이름</label>
          <input type="text" id="name" class="form-control">
        </div>
        <div class="form-group d-flex align-items-center">
          <label for="email">이메일 주소</label>
          <input type="text" id="email" class="form-control">
        </div>
      </div>
      <div class="btn-box d-flex justify-content-center mt-5">
        <button type="button" class="btn btn-primary btn-block col-6">회원가입</button>
      </div>
    </div>
  </div>
</body>
</html>