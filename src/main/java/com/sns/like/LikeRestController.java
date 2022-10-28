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
		likeBO.likeToggle(postId, userId);
		
		result.put("code", 100);
		result.put("result", "success");
		
		// 컨트롤러에서 로직이 들어가면 좋지 않으므로 BO에서 처리한다.
		//boolean isLike = likeBO.existLike(postId, userId);
		
		//if (isLike == true) {
			//result.put("code", 100);
			//result.put("result", "success");
			//likeBO.deleteLikeByPostIdUserId(postId, userId);
		//} else if (isLike == false) {
			//result.put("code", 100);
			//result.put("result", "success");
			//likeBO.addLike(postId, userId);
		//} else {
			//result.put("errorMessage", "서버에러");
		//}
		
		return result;
	}
}
