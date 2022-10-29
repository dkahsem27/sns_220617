<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="mypage-wrap col-6">
	<div class="user-info mb-5">
		<%-- 프로필이미지 --%>
		<div class="image-box mb-5">
			<img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" alt="프로필이미지">
		</div>
		<div class="btn-box mb-5">
			<a href="/user/profile_update_view" class="btn-update btn btn-block btn-dark">프로필이미지 수정</a>
		</div>
		<%-- 유저 정보 --%>
		<div class="info-box d-flex align-items-center py-2">
			<div class="title">아이디</div>
			<div class="user-id">userId</div>
		</div>
		<div class="info-box d-flex align-items-center py-2">
			<div class="title">이름</div>
			<div class="user-name">userName</div>
		</div>
		<div class="info-box d-flex align-items-center py-2">
			<div class="title">이메일</div>
			<div class="email">email@email.com</div>
		</div>
	</div>
</div>