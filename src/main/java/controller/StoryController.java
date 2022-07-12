package controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.StoryDao;

@Controller
@RequestMapping("/game/story/")
public class StoryController {

	@Autowired
	ServletContext application;

	@Autowired
	HttpServletRequest request;

	// 로그인 정보
	@Autowired
	HttpSession session;

	StoryDao story_dao;
	
	public void setStory_dao(StoryDao story_dao) {
		this.story_dao = story_dao;
	}

	@RequestMapping("story_beginning.do")
	public String story_beginning() {
		
		System.out.println("stroy_beginning.do 호출 성공!");
		return "game/story/story_beginning";
	}
	
	@RequestMapping("story_ending.do")
	public String story_ending() {

		return "/game/story/story_ending";
	}

}
