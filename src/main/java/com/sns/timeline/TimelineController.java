package com.sns.timeline;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sns.comment.bo.CommentBO;
import com.sns.timeline.bo.TimelineBO;

@RequestMapping("/timeline")
@Controller
public class TimelineController {

	//@Autowired
	//private PostBO postBO;
	
	@Autowired
	private TimelineBO timelineBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@RequestMapping("/timeline_view")
	public String timelineView(HttpSession session, Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			// 로그인이 풀려있으면 로그인 페이지로 리다이렉트
			return "redirect:/user/sign_in_view";
		}
		
		//List<CardView> postList = postBO.getPostList();
		// model.addAttribute("postList", postList);
		List<CardView> cardViewList = timelineBO.generateCardList(userId);
		model.addAttribute("cardList", cardViewList);
		
		model.addAttribute("viewName", "timeline/timeline");
		return "template/layout";
	}
}
