<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="timeline-wrap">
	<%-- 글쓰기: 로그인 된 사람만 보이게 --%>
	<c:if test="${not empty userId}">
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
	</c:if>
	<%-- 목록 --%>
	<c:forEach items="${cardList}" var="card">
		<section class="post-list-area col-6 mt-4">
			<%-- 글쓴이, 더보기(삭제) : 프로필이미지 없을 때 디폴트이미지로 설정 --%>
			<div class="util-box d-flex justify-content-between align-items-center px-2 py-2">
			    <div class="user-info d-flex align-items-center">
			      <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" alt="프로필이미지">
			      <div class="userid ml-2">${card.user.loginId}</div>
			    </div>
			    <%-- 더보기(모달)버튼: 내가 쓴 글일 때만 더보기 노출 --%>
			    <c:if test="${userId eq card.user.id}">
				    <button type="button" class="btn-more" data-toggle="modal" data-target="#modal" data-post-id="${card.post.id}">
				    	<span class="material-icons c-gray">more_horiz</span>
				    </button>
			    </c:if>
		  	</div>
		  	<%-- 포스트 이미지 --%>
		  	<div class="image-box mb-3">
			    <img src="${card.post.imagePath}" alt="포스트이미지">
			</div>
			<%-- 좋아요 --%>
			<div class="like-box d-flex mb-5 px-2">
				<button type="button" class="btn-like" data-post-id="${card.post.id}">
					<c:if test="${card.filledLike eq false}">
				    	<span class="like-empty material-icons">favorite_border</span>
				    </c:if>
				    <c:if test="${card.filledLike eq true}">
				    	<span class="like material-icons c-red">favorite</span>
				    </c:if>
			    </button>
			    <div class="like-count ml-2">좋아요 ${card.likeCount}개</div>
		  	</div>
		  	<%-- 포스트 내용 --%>
		  	<div class="content-box mb-3 px-2">
		  		<div class="post-content d-flex">
		  			<div class="user-name font-weight-bold">${card.user.loginId}</div>
		  			<div class="content">${card.post.content}</div>
		  		</div>
		  	</div>
		  	<%-- 댓글 --%>
		  	<c:if test="${not empty card.commentList}">
			  	<div class="comment-box mb-3 p-2">
			  		<div class="comment-box-title mb-2">댓글</div>
			  		<c:forEach items="${card.commentList}" var="commentView">
				  		<div class="comment-content d-flex align-items-start mt-2">
				  			<div class="user-name">${commentView.user.loginId}</div>
				  			<div class="content">${commentView.comment.content}</div>
				  			<%-- 댓글 삭제버튼: 내 댓글일 때만 노출 --%>
				  			<c:if test="${userId eq commentView.comment.userId}">
					  			<button type="button" class="btn-clear" data-comment-id="${commentView.comment.id}">
					  				<span class="material-icons md-18 c-gray">clear</span>
					  			</button>
				  			</c:if>
				  		</div>
			  		</c:forEach>
			  	</div>
		  	</c:if>
		  	<%-- 댓글쓰기 : 로그인 된 사람만 보이게 --%>
		  	<c:if test="${not empty userId}">
			  	<div class="comment-input-box">
			  		<div class="comment-input py-2 pl-2 d-flex justify-content-between align-items-center">
			  			<input type="text" class="w-100" placeholder="댓글 달기">
			  			<button type="button" class="btn-comment btn-upload" data-post-id="${card.post.id}">게시</button>
			  		</div>
			  	</div>
		  	</c:if>
		</section>
	</c:forEach>
</div>

<!-- Modal -->
<div class="modal fade" id="modal">
	<div class="modal-dialog modal-dialog-centered modal-sm">
		<div class="modal-content">
			<%-- 모달 창 안에 내용 넣기 --%>
			<div class="btn-box p-3">
				<button type="button" id="delPostBtn" class="btn btn-dark btn-block">삭제하기</button>
				<button type="button" class="btn btn-secondary btn-block" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
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
				if (data.code == 100) { // 성공
					alert("포스트가 저장되었습니다");
					location.reload();
				} else if(data.code == 300) { // 비로그인일 때
					alert(data.errorMessage);
					location.href = "/user/sign_in_view";
				} else { // 실패
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert("포스트 저장에 실패했습니다");
			}
		});
	});
	
	// 댓글 게시버튼 클릭
	$('.btn-comment').on('click', function() {
		//alert('댓글 게시 클릭');
		let postId = $(this).data('post-id');
		
		// 지금 클릭된 게시 버튼의 형제인 input 태그를 가져온다. (siblings)
		let comment = $(this).siblings('input').val().trim();
		
		// validation
		if (comment == '') {
			alert('댓글을 입력하세요');
			return;
		}
		
		/* let formData = new FormData();
		formData.append("postId", postId);
		formData.append("content", comment); */
		
		// ajax
		$.ajax({
			// request
			type: "post"
			, url: "/comment/create"
			, data: {"postId":postId, "content":comment}
			
			// response
			, success: function(data) {
				if (data.code == 100) { // 성공
					//alert("댓글이 저장되었습니다");
					location.reload();
				} else if (data.code == 300) { // 비로그인시
					alert(data.errorMessage);
					location.href = "/user/sign_in_view";
				} else { // 실패
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert("댓글 저장에 실패했습니다");
			}
		});
	});
	
	// 좋아요 버튼 클릭
	$('.btn-like').on('click', function() {
		let postId = $(this).data('post-id');
		
		// ajax
		$.ajax({
			// request
			type: "get"
			, url: "/like/" + postId
			, data: {"postId":postId}
			
			// response
			, success: function(data) {
				if (data.code == 100) { // 성공
					location.reload();
				} else if (data.code == 300) { // 비로그인시
					alert(data.errorMessage);
					location.href = "/user/sign_in_view";
				} else { // 실패
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert("실패했습니다");
			}
		});
	});
	
	// 더보기 버튼 클릭 - 글 삭제 위해서 => 삭제될 글 번호를 모달에 넣어준다.
	$('.btn-more').on('click', function(e) {
		e.preventDefault(); // a태그로 이벤트 잡을 경우 화면 상단으로 올라가는 걸 방지 (button을 쓰는 경우 상관x)
		
		let postId = $(this).data('post-id'); // getting
		
		$('#modal').data('post-id', postId); // setting      data-post-id="1"
	});
	
	// 모달창 안에 있는 글삭제 버튼 클릭
	$('#modal #delPostBtn').on('click', function(e) {
		e.preventDefault(); // a태그로 이벤트 잡을 경우 화면 상단으로 올라가는 걸 방지 (button을 쓰는 경우 상관x)
		
		let postId = $('#modal').data('post-id');
		
		// ajax 호출 => 글 삭제
		if (confirm("삭제 하시겠습니까?")) {
			$.ajax({
				// request
				type:"delete"
				, url: "/post/delete"
				, data: {"postId":postId}
			
				// response
				, success: function(data) {
					if (data.code == 100) {
						alert("삭제되었습니다.");
						location.reload();
					} else { // 실패
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert("삭제 실패");
				}
			});
		}
	});
	
	// 댓글 삭제 버튼 클릭
	$('.btn-clear').on('click', function() {
		let commentId = $(this).data('comment-id');
		//alert(commentId);
		
		// ajax
		$.ajax({
			// request
			type: "delete"
			, url: "/comment/delete"
			, data: {"commentId":commentId}
		
			// response
			, success: function(data) {
				if (data.code == 100) {
					alert("댓글이 삭제되었습니다.");
					location.reload();
				} else {
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert("댓글 삭제 실패");
			}
		});
	});
});
</script>