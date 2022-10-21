<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="add-post-area col-6">
	<div class="add-post-inner p-2">
		<textarea></textarea>
		<div class="util-box d-flex justify-content-between align-items-center">
		    <%-- <input type="file"> --%>
		    <button type="button"><span class="material-symbols-outlined">add_photo_alternate</span></button>
		    <button type="button" class="btn btn-info btn-sm">게시</button>
	  	</div>
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