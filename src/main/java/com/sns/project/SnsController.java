package com.sns.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SnsController {

	@RequestMapping("/sign_in_view")
	public String signInView() {
		return "sns/signIn";
	}
	
	@RequestMapping("/sign_up_view")
	public String signUpView() {
		return "sns/signUp";
	}
	
	@RequestMapping("/timeline_view")
	public String timelineView() {
		return "sns/timeline";
	}
}
