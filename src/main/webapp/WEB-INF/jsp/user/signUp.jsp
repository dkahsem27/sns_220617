<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="signUpForm" method="post" action="/user/sign_up">
	<div class="form-outer col-5">
	  <div class="form-box">
	    <div class="form-group mb-2 d-flex align-items-center">
	      <label for="loginId">아이디</label>
	      <input type="text" name="loginId" id="loginId" class="form-control">
	      <button type="button" id="loginIdCheckBtn" class="btn btn-outline-secondary col-3 ml-2">중복확인</button>
	    </div>
	    <div class="noti-box mb-3">
	      <div id="idCheckLength" class="noti text-danger d-none">아이디를 4자 이상 입력하세요.</div>
	      <div id="idCheckDuplicated" class="noti text-danger d-none">사용중인 아이디입니다.</div>
	      <div id="idCheckOk" class="noti text-success d-none">사용 가능한 아이디입니다.</div>
	    </div>
	  </div>
	  <div class="form-group d-flex align-items-center">
	    <label for="password">비밀번호</label>
	    <input type="text" name="password" id="password" class="form-control">
	  </div>
	  <div class="form-group d-flex align-items-center">
	    <label for="confirmPassword">비밀번호 확인</label>
	    <input type="text" name="confirmPassword" id="confirmPassword" class="form-control">
	  </div>
	  <div class="form-group d-flex align-items-center">
	    <label for="name">이름</label>
	    <input type="text" name="name" id="name" class="form-control">
	  </div>
	  <div class="form-group d-flex align-items-center">
	    <label for="email">이메일 주소</label>
	    <input type="text" name="email" id="email" class="form-control">
	  </div>
	</div>
	<div class="btn-box d-flex justify-content-center mt-5">
	  <button type="submit" class="btn btn-dark btn-block col-5">회원가입</button>
	</div>
</form>

<script>
$(document).ready(function() {
	// 중복 확인
	$('#loginIdCheckBtn').on('click', function() {
		let loginId = $('#loginId').val().trim();
		
		if (loginId.length < 4) {
			// 4자 이하일 때 경고문구 노출
			$('#idCheckLength').removeClass('d-none'); // 경고문구 노출
			$('#idCheckDuplicated').addClass('d-none'); // 숨김
			$('#idCheckOk').addClass('d-none'); // 숨김
			return;
		}
		
		// ajax 중복 확인
		$.ajax({
			url:"/user/is_duplicated_id"
			, data:{"loginId":loginId}
		
			, success:function(data) {
				if (data.result) {
					// 중복일 때
					$('#idCheckDuplicated').removeClass('d-none'); // 경고문구 노출
					$('#idCheckLength').addClass('d-none'); // 숨김
					$('#idCheckOk').addClass('d-none'); // 숨김
				} else {
					// 중복 아닐 때
					$('#idCheckOk').removeClass('d-none'); // 사용 가능문구 노출
					$('#idCheckLength').addClass('d-none'); // 숨김
					$('#idCheckDuplicated').addClass('d-none'); // 숨김
				}
			}
			, error:function(e) {
				alert("아이디 중복확인에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
	
	// 회원 가입
	$('#signUpForm').on('submit', function(e) {
		e.preventDefault(); // submit 기능 중단
		//alert('ddd');
		
		let loginId = $('#loginId').val().trim();
		let password = $('#password').val().trim();
		let confirmPassword = $('#confirmPassword').val().trim();
		let name = $('#name').val().trim();
		let email = $('#email').val().trim();
		
		// validation
		if (loginId == "") {
			alert('아이디를 입력하세요');
			return false;
		}
		if (password == "" || confirmPassword == "") {
			alert('비밀번호를 입력하세요');
			return false;
		}
		if (password != confirmPassword) {
			alert('비밀번호가 일치하지 않습니다');
			return false;
		}
		if (name == "") {
			alert('이름을 입력하세요');
			return false;
		}
		if (email == "") {
			alert('이메일 주소를 입력하세요');
			return false;
		}
		// 아이디 중복확인이 완료 되었는지 확인 -> idCheckOk에 d-none이 없으면 사용 가능으로 본다.
		if ($('#idCheckOk').hasClass('d-none')) {
			alert('아이디 중복확인을 다시 해주세요');
			return false;
		}
		
		// 1) submit
		//$(this)[0].submit(); // submit 이후에 다른 화면으로 넘길 때 사용 (action 주소-> 뷰화면)
		
		// 2) ajax
		let url = $(this).attr('action');
		let params = $(this).serialize(); // name 속성 값들을 파라미터로 구성
		console.log(params);
		
		$.post(url, params)
		.done(function(data) {
			if (data.code == 100) {
				alert('가입을 환영합니다. 로그인 해주세요.');
				location.href = "/user/sign_in_view";
			} else {
				alert('가입에 실패했습니다.');
			}
		});
	});
});
</script>