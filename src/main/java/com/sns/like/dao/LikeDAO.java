package com.sns.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	public boolean existLike(
			@Param("postId") int postId, 
			@Param("userId") int userId);
}
