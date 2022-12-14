<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="mypage-wrap col-6">
	<%-- 프로필이미지 : 프로필이미지 없을 때 디폴트이미지로 설정 --%>
	<div class="image-box mb-5">
		<img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" alt="프로필이미지">
	</div>
	<%-- 파일 업로드 --%>
	<div class="file-upload-box d-flex justify-content-center align-items-center mb-5">
		<button type="button" class="btn-file"><span class="material-icons-outlined md-36 c-gray">photo_library</span></button>
		<input type="file" id="file" class="d-none" accept=".gif, .jpg, .jpeg, .png">
	</div>
	<div class="btn-box">
		<button type="button" class="btn btn-dark btn-block">저장</button>
		<a href="/account/my_page_view" class="btn btn-outline-secondary btn-block">돌아가기</a>
	</div>
</div>