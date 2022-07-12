package controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CharacterDao;
import dao.ShopDao;
import vo.CharacterVo;

@Controller
@RequestMapping("/game/shop/")
public class ShopController {

	@Autowired
	ServletContext application;

	@Autowired
	HttpServletRequest request;

	// 로그인 정보
	@Autowired
	HttpSession session;
	
	@Autowired
	ShopDao shop_dao;
	
	@Autowired
	CharacterDao character_dao;

	public void setShop_dao(ShopDao shop_dao) {
		this.shop_dao = shop_dao;
	}

	@RequestMapping("shop.do")
	public String shop(int c_idx, Model model) {

		// 캐릭터 선택에서 넘어왔으면 받은 캐릭터 정보 토대로 pageScope에 추가

		CharacterVo main_ch = null;

		if (c_idx == 1) {// 전사
			main_ch = character_dao.selectOne(c_idx);
		} else if (c_idx == 2) {// 궁수
			main_ch = character_dao.selectOne(c_idx);
		} else if (c_idx == 3) {// 법사
			main_ch = character_dao.selectOne(c_idx);
		}

		// ServletContext application = request.getServletContext();
		application.setAttribute("main_ch", main_ch);
		model.addAttribute("main_ch", main_ch);

		// 아이템 DB에서 랜덤으로 빼서 주고
		// 캐릭터 스킬정보 주기
		
		//System.out.println(main_ch.getSkill_vo().get(0).getS_name());

		return "game/shop/shop";
	}

}
