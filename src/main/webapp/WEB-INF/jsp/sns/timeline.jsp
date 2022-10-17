<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타임라인</title>
  <!-- jquery : ajax, bootstrap, datepicker -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  

  <!-- bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

  <!-- material icons -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
  
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
    <!-- contents -->
    <div id="contents">
      <section class="add-post-area col-6">
        <textarea></textarea>
        <div class="util-box d-flex justify-content-between mt-2">
          <input type="file">
          <button type="button" class="btn btn-primary btn-sm">업로드</button>
        </div>
      </section>
      <section class="post-list-area col-6 mt-4">
        <div class="util-box d-flex justify-content-between align-items-center px-2 py-2">
          <div class="user-info d-flex align-items-center">
            <img src="https://cdn.pixabay.com/photo/2019/06/05/08/37/dog-4253238__480.jpg" alt="프로필이미지">
            <div class="userid ml-2">userName</div>
          </div>
          <button type="button" class="btn-more"><span class="material-symbols-outlined">more_horiz</span></button>
        </div>
        <div class="image-box">
          <img src="https://cdn.pixabay.com/photo/2020/06/06/04/09/man-5265170__480.jpg" alt="포스트이미지">
        </div>
        <div class="like-box d-flex align-items-center mt-3">
          <button type="button" class="btn-like"><span class="material-symbols-outlined">favorite</span></button>
          <div class="like-count ml-2">좋아요 n개</div>
        </div>
        <div class="content-box"></div>
      </section>
    </div>
  </div>
</body>
</html>