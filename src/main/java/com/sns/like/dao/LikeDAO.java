package com.sns.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	public int selectLikeCountByPostIdOrUserId(
			@Param("postId") int postId, 
			@Param("userId") Integer userId); // null일 수도 있기 때문에 Integer
	
	public boolean existLike(
			@Param("postId") int postId, 
			@Param("userId") int userId);
	
	public int selectLikeCountByPostId(int postId);
	
	public void insertLike(
			@Param("postId") int postId, 
			@Param("userId") int userId);
	
	public void deleteLikeByPostIdUserId(
			@Param("postId") int postId, 
			@Param("userId") int userId);
	
	public void deleteLikeByPostId(int postId);
}
