<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="signInForm" method="post" action="/user/sign_in">
	<div class="form-outer col-4">
	  <div class="form-group d-flex align-items-center">
	    <label for="loginID">아이디</label>
	    <input type="text" id="loginId" class="form-control">
	  </div>
	  <div class="form-group d-flex align-items-center">
	    <label for="password">비밀번호</label>
	    <input type="text" id="password" class="form-control">
	  </div>
	  <div class="btn-box mt-5">
	    <button type="button" class="btn btn-primary">로그인</button>
	    <a href="#self" class="btn btn-secondary mt-2">회원가입</a>
	  </div>
	</div>
</form>