<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="signInForm" method="post" action="/user/sign_in">
	<div class="form-outer col-5">
	  <div class="form-group d-flex align-items-center">
	    <label for="loginId">아이디</label>
	    <input type="text" name="loginId" id="loginId" class="form-control">
	  </div>
	  <div class="form-group d-flex align-items-center">
	    <label for="password">비밀번호</label>
	    <input type="text" name="password" id="password" class="form-control">
	  </div>
	  <div class="btn-box mt-5">
	    <button type="submit" class="btn btn-dark">로그인</button>
	    <a href="/user/sign_up_view" class="btn btn-outline-secondary mt-2">회원가입</a>
	  </div>
	</div>
</form>

<script>
$(document).ready(function() {
	$('#signInForm').on('submit', function(e) {
		// 서브밋 중단
		e.preventDefault();
		
		// validation
		let loginId = $('#loginId').val().trim();
		let password = $('#password').val().trim();
		
		if (loginId == "") {
			alert("아이디를 입력해주세요.");
			return false;
		}
		if (password == "") {
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		
		// ajax
		let url = $(this).attr('action');
		let params = $(this).serialize();
		
		$.post(url, params)
		.done(function(data) {
			if (data.code == 100) { // 성공
				location.href = "/timeline/timeline_view";
			} else {
				alert(data.errorMessage);
			}
		});
	});
});
</script>