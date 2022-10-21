package com.sns.post;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PostController {

	@RequestMapping("/timeline/timeline_view")
	public String timelineView(Model model) {
		model.addAttribute("viewName", "timeline/timeline");
		return "template/layout";
	}
}
