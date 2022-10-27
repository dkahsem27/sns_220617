package com.sns.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sns.like.bo.LikeBO;

@RestController
public class LikeRestController {

	@Autowired
	private LikeBO likeBO;
	
	@RequestMapping("/like/{postId}")
	public Map<String, Object> like(
			@PathVariable int postId,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		Integer userId = (Integer)session.getAttribute("userId");
		// 로그인 여부
		if (userId == null) {
			result.put("code", 300);
			result.put("errorMessage", "로그인 상태가 아닙니다. 다시 로그인 해 주세요.");
			return result;
		}
		
		// 좋아요 있으면 삭제, 없으면 추가
		boolean like = likeBO.existLike(postId, postId);
		if (like) {
			
		}
		
		return result;
	}
}
