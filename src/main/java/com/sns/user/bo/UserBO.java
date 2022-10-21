package com.sns.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.user.dao.UserDAO;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public boolean existLoginID(String loginID) {
		return userDAO.existLoginID(loginID);
	}
	
	public void addUser(String loginId, String password, String name, String email, String profileImagePath) {
		userDAO.insertUser(loginId, password, name, email, profileImagePath);
	}
}
