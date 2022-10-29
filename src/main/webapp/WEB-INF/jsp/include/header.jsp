<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="header" class="d-flex justify-content-between align-items-center">
  <h1 class="logo"><a href="/timeline/timeline_view">Instagram</a></h1>
  <div class="util-box d-flex justify-content-end align-items-end col-5">
  	<c:if test="${not empty userName}">
  		<div class="user-info d-flex align-items-center">
			<img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" alt="프로필이미지">
		    <div class="greeting ml-2"><span class="user-name">${userName}</span>님 안녕하세요!</div>
	    </div>
	    <a href="/user/my_page_view" class="btn-mypage ml-5 text-secondary">마이페이지</a>
	    <a href="/user/sign_out" class="btn-sign-out ml-3 text-secondary">로그아웃</a>
	</c:if>
  </div>
</div>