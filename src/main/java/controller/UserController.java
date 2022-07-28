package controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.UserDao;

@Controller
@RequestMapping("/user/")
public class UserController {

	@Autowired
	ServletContext application;

	@Autowired
	HttpServletRequest request;

	// 로그인 정보
	@Autowired
	HttpSession session;
	
	UserDao user_dao;

	public void setUser_dao(UserDao user_dao) {
		this.user_dao = user_dao;
	}
	
	@RequestMapping("main.do")
	public String main() {
		
		return "user/main";
	}
	
	@RequestMapping("login.do")
	public String login() {
		
		return "user/login";
	}
	
	@RequestMapping("join.do")
	public String join() {
		
		return "user/join";
	}
}
