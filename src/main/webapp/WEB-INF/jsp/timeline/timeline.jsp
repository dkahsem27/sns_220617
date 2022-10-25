<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="timeline-wrap">
	<section class="add-post-area col-6">
		<div class="add-post-inner py-2">
			<textarea id="content" class="px-2"></textarea>
			<div class="util-box pt-2 px-2 d-flex justify-content-between align-items-center">
				<div class="file-upload d-flex align-items-center">
					<input type="file" id="file" class="d-none" accept=".gif, .jpg, .jpeg, .png">
				    <button type="button" id="fileUploadBtn" class="btn-img-upload"><span class="material-icons-outlined c-gray">add_photo_alternate</span></button>
				    <div id="fileName" class="file-name ml-2"></div>
				</div>
			    <button type="button" id="postCreateBtn" class="btn-upload">게시</button>
		  	</div>
	  	</div>
	</section>
	<section class="post-list-area col-6 mt-4">
		<div class="util-box d-flex justify-content-between align-items-center px-2 py-2">
		    <div class="user-info d-flex align-items-center">
		      <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" alt="프로필이미지">
		      <div class="userid ml-2">userName</div>
		    </div>
		    <button type="button" class="btn-more"><span class="material-icons c-gray">more_horiz</span></button>
	  	</div>
	  	<div class="image-box">
		    <img src="https://cdn.pixabay.com/photo/2020/06/06/04/09/man-5265170__480.jpg" alt="포스트이미지">
		</div>
		<div class="like-box d-flex mt-3 px-2">
		    <button type="button" class="btn-like-empty"><span class="material-icons">favorite_border</span></button>
		    <button type="button" class="btn-like"><span class="material-icons c-red">favorite</span></button>
		    <div class="like-count ml-2">좋아요 n개</div>
	  	</div>
	  	<div class="content-box mt-5 px-2">
	  		<div class="post-content d-flex">
	  			<div class="user-name font-weight-bold">userName</div>
	  			<div class="content">포스팅 내용입니다 몇글자까지 가능?? 포스팅 내용입니다 몇글자까지 가능?? 포스팅 내용입니다.</div>
	  		</div>
	  	</div>
	  	<div class="comment-box mt-4 p-2">
	  		<div class="comment-box-title mb-2">댓글</div>
	  		<div class="comment-content d-flex align-items-center">
	  			<div class="user-name">user22</div>
	  			<div class="content">댓글 내용입니다 댓글댓글 댓글입니다요</div>
	  			<button type="button" class="btn-clear ml-2"><span class="material-icons md-18 c-gray">clear</span></button>
	  		</div>
	  		<div class="comment-content d-flex py-1">
	  			<div class="user-name">user22</div>
	  			<div class="content">댓글 내용입니다 긴댓글 글자가 길어질 때 ??댓글 내용입니다 댓글댓글 댓글입니다요</div>
	  			<button type="button" class="btn-clear ml-2"><span class="material-icons md-18 c-gray">clear</span></button>
	  		</div>
	  		<div class="comment-content d-flex align-items-center py-1">
	  			<div class="user-name">user22</div>
	  			<div class="content">댓글 내용입니다 댓글댓글 댓글입니다요</div>
	  			<button type="button" class="btn-clear ml-2"><span class="material-icons md-18 c-gray">clear</span></button>
	  		</div>
	  	</div>
	  	<div class="comment-input-box mt-4">
	  		<div class="comment-input py-2 pl-2 d-flex justify-content-between align-items-center">
	  			<input type="text" class="w-100">
	  			<button type="button" class="btn-upload">게시</button>
	  		</div>
	  	</div>
	</section>
</div>

<script>
$(document).ready(function() {
	// 파일 업로드 이미지(a, button) 클릭 => 파일 선택 창이 떠야함
	$('#fileUploadBtn').on('click', function(e) {
		e.preventDefault(); // a태그의 기본 동작 멈춤(화면 최상단으로 올라가는 것 방지)
		$('#file').click(); // input file을 클릭한 것과 같은 효과
	});
	
	// 사용자가 파일 업로드를 했을 때, 유효성 확인 및 업로드 된 파일 이름 노출
	$('#file').on('change', function(e) {
		//alert('체인지');
		
		let fileName = e.target.files[0].name; // ex) tea-ga6ab33572_640.jpg
		//alert(fileName);
		let ext = fileName.split('.').pop().toLowerCase();
		
		// 확장자 유효성 확인
		if (fileName.split('.').length < 2 || 
				(ext != 'gif' 
						&& ext != 'jpg' 
						&& ext != 'jpeg' 
						&& ext != 'png')) {
			alert("이미지 파일만 업로드 할 수 있습니다.");
			$(this).val(''); // 파일 태그의 실제 파일 제거
			$('#fileName').text(''); // 파일 이름 비우기
			return;
		}
		
		// 상자에 업로드된 이름 노출
		$('#fileName').text(fileName);
	});
	
	// 게시 버튼 클릭
	$('#postCreateBtn').on('click', function() {
		// validation
		let content = $('#content').val();
		if (content == '') {
			alert('내용을 입력하세요');
			return;
		}
		
		let file = $('#file').val();
		if (file == '') {
			alert('파일을 선택하세요');
			return;
		}
		// 파일이 업로드 된 경우 확장자 체크
		if (file != '') {
			let ext = file.split('.').pop().toLowerCase();
			if ($.inArray(ext, ['gif', 'jpg', 'jpeg', 'png']) == -1) {
				alert('gif, jpg, jpeg, png 파일만 업로드할 수 있습니다.');
				$('#file').val('');
				return;
			}
		}
		
		// 폼태그 만들기 (RequestParam 구성)
		let formData = new FormData();
		formData.append("content", content);
		formData.append("file", $('#file')[0].files[0]);
		
		// ajax
		$.ajax({
			// request
			type: "post"
			, url: "/post/create"
			, data: formData
			// 파일 업로드를 위한 필수 설정 3가지
			, enctype: "multipart/form-data"
			, processData: false
			, contentType: false
			
			// response
			, success: function(data) {
				if (data.code == 100) {
					// 성공
					alert("포스트가 저장되었습니다");
					location.href="/timeline/timeline_view";
				} else {
					// 실패
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert("포스트 저장에 실패했습니다");
			}
		});
	});
});
</script>