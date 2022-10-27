package com.sns.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.like.dao.LikeDAO;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	public boolean existLike(int postId, int userId) {
		
		boolean like = likeDAO.existLike(postId, userId);
		if (like) {
			return true;
		}
		
		return false;
	}
}
