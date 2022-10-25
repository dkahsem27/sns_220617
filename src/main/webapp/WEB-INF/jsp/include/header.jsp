<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="header" class="d-flex justify-content-between align-items-center">
  <h1 class="logo"><a href="/timeline/timeline_view">Instagram</a></h1>
  <div class="util-box d-flex justify-content-end align-items-end col-4">
  	<c:if test="${not empty userName}">
	    <div class="greeting"><span class="user-name">${userName}</span>님 안녕하세요!</div>
	    <a href="/user/sign_out" class="btn-sign-out ml-3 text-secondary">로그아웃</a>
	</c:if>
  </div>
</div>