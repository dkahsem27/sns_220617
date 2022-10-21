package com.sns.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sns.common.EncryptUtils;
import com.sns.user.bo.UserBO;

@RequestMapping("/user")
@RestController
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	/**
	 * 아이디 중복확인 API
	 * @param loginID
	 * @return
	 */
	@RequestMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginID") String loginID) {
		
		Map<String, Object> result = new HashMap<>();
		boolean isDuplicated = userBO.existLoginID(loginID);
		
		if (isDuplicated) {
			result.put("result", true);
			result.put("code", 100);
		} else {
			result.put("result", false);
			result.put("code", 100);
		}
		
		return result;
	}
	
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("profileImagePath") String profileImagePath) {
	
		// 암호화 (해싱) md5
		String encryptPassword = EncryptUtils.md5(password);
		
		// db insert
		userBO.addUser(loginId, encryptPassword, name, email, profileImagePath);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 100);
		result.put("result", "success");
		
		return result;
	}
}
