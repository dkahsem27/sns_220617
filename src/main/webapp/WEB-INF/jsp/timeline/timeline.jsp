<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="add-post-area col-6">
	<div class="add-post-inner py-2">
		<textarea class="px-2"></textarea>
		<div class="util-box pt-2 px-2 d-flex justify-content-between align-items-center">
		    <%-- <input type="file"> --%>
		    <button type="button" class="btn-img-upload"><span class="material-symbols-outlined">add_photo_alternate</span></button>
		    <button type="button" class="btn-upload">게시</button>
	  	</div>
  	</div>
</section>
<section class="post-list-area col-6 mt-4">
	<div class="util-box d-flex justify-content-between align-items-center px-2 py-2">
	    <div class="user-info d-flex align-items-center">
	      <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" alt="프로필이미지">
	      <div class="userid ml-2">userName</div>
	    </div>
	    <button type="button" class="btn-more"><span class="material-symbols-outlined">more_horiz</span></button>
  	</div>
  	<div class="image-box">
	    <img src="https://cdn.pixabay.com/photo/2020/06/06/04/09/man-5265170__480.jpg" alt="포스트이미지">
	</div>
	<div class="like-box d-flex align-items-center mt-3 px-2">
	    <button type="button" class="btn-like"><span class="material-symbols-outlined">favorite</span></button>
	    <div class="like-count ml-2">좋아요 n개</div>
  	</div>
  	<div class="content-box mt-5 px-2">
  		<div class="post-content d-flex">
  			<div class="user-name font-weight-bold">userName</div>
  			<div class="content">포스팅 내용입니다 몇글자까지 가능?? 포스팅 내용입니다 몇글자까지 가능?? 포스팅 내용입니다.</div>
  		</div>
  	</div>
  	<div class="comment-box mt-4 px-2">
  		<div class="comment-content d-flex py-1">
  			<div class="user-name font-weight-bold">user22</div>
  			<div class="content">댓글 내용입니다 댓글댓글 댓글입니다요</div>
  		</div>
  		<div class="comment-content d-flex py-1">
  			<div class="user-name font-weight-bold">user22</div>
  			<div class="content">댓글 내용입니다 댓글댓글 댓글입니다요 댓글댓글 댓글입니다요 댓글댓글 댓글입니다요</div>
  		</div>
  		<div class="comment-content d-flex py-1">
  			<div class="user-name font-weight-bold">user22</div>
  			<div class="content">댓글 내용입니다 댓글댓글 댓글입니다요</div>
  		</div>
  	</div>
  	<div class="comment-input-box mt-4">
  		<div class="comment-input py-2 pl-2 d-flex justify-content-between align-items-center">
  			<input type="text" class="form-control">
  			<button type="button" class="btn-upload">게시</button>
  		</div>
  	</div>
</section>