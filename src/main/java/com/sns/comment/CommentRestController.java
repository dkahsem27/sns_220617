package com.sns.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sns.comment.bo.CommentBO;

@RequestMapping("/comment")
@RestController
public class CommentRestController {

	@Autowired
	private CommentBO commentBO;
	
	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam("postId") int postId,
			@RequestParam("content") String content,
			HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		//String userLoginId = (String)session.getAttribute("userLoginId");
		
		Map<String, Object> result = new HashMap<>();
		
		// 로그인이 풀렸을 때
		if (userId == null) {
			result.put("code", 300);
			result.put("errorMessage", "로그인 상태가 아닙니다. 다시 로그인 해 주세요.");
		}
		
		// db insert
		int row = commentBO.addComment(userId, postId, content);
		
		if (row > 0) {
			result.put("code", 100);
			result.put("result", "success");
		} else {
			result.put("code", 400);
			result.put("errorMessage", "댓글 저장에 실패했습니다. 관리자에게 문의해주세요.");
		}
		
		return result;
	}
	
	@DeleteMapping("/delete")
	public Map<String, Object> delete(
			@RequestParam("commentId") int commentId,
			HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		Map<String, Object> result = new HashMap<>();
		// 로그인이 풀렸을 때
		if (userId == null) {
			result.put("code", 300);
			result.put("errorMessage", "로그인 상태가 아닙니다. 다시 로그인 해 주세요.");
		}
		
		int row = commentBO.deleteCommentByCommentId(commentId);
		if (row > 0) {
			result.put("code", 100);
			result.put("result", "success");
		} else {
			result.put("code", 400);
			result.put("errorMessage", "댓글 삭제 실패. 관리자에게 문의해주세요.");
		}
		
		return result;
	}
}
