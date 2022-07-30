package controller;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.CharacterDao;
import info.character.Archer;
import info.character.Warrior;
import info.character.Wizard;
import vo.CharacterVo;

@Controller
@RequestMapping("/game/character/")
public class CharacterController {

	@Autowired
	ServletContext application;

	@Autowired
	HttpServletRequest request;

	// 로그인 정보
	@Autowired
	HttpSession session;

	CharacterDao character_dao;

	public void setCharacter_dao(CharacterDao character_dao) {
		this.character_dao = character_dao;
	}

	@RequestMapping("character_choice.do")
	public String character_choice(int c_idx, Model model) {
		//캐릭터 선택에서 넘어왔으면 받은 캐릭터 정보 토대로 pageScope에 추가
		CharacterVo ex_c_vo = character_dao.selectOne(c_idx);
		CharacterVo main_ch = null;
		if(c_idx==1) {//전사
			main_ch = new Warrior();
			main_ch.setC_idx(ex_c_vo.getC_idx());
			main_ch.setC_name(ex_c_vo.getC_name());
			main_ch.setC_hp(ex_c_vo.getC_hp());
			main_ch.setC_ad(ex_c_vo.getC_ad());
			main_ch.setC_ap(ex_c_vo.getC_ap());
			main_ch.setC_armor(ex_c_vo.getC_armor());
			main_ch.setC_critical(ex_c_vo.getC_critical());
			main_ch.setC_avd(ex_c_vo.getC_avd());
			main_ch.setC_auto_attack(ex_c_vo.getC_auto_attack());
			main_ch.setC_p_skill(ex_c_vo.getC_p_skill());
			main_ch.setC_img(ex_c_vo.getC_img());
			main_ch.setSkill_vo(ex_c_vo.getSkill_vo());
			main_ch.setC_original_hp(ex_c_vo.getC_hp());
			main_ch.setC_auto_attack_img(ex_c_vo.getC_auto_attack_img());
			main_ch.setC_p_skill_img(ex_c_vo.getC_p_skill_img());
		}else if(c_idx==2) {//궁수
			main_ch = new Archer();
			main_ch.setC_idx(ex_c_vo.getC_idx());
			main_ch.setC_name(ex_c_vo.getC_name());
			main_ch.setC_hp(ex_c_vo.getC_hp());
			main_ch.setC_ad(ex_c_vo.getC_ad());
			main_ch.setC_ap(ex_c_vo.getC_ap());
			main_ch.setC_armor(ex_c_vo.getC_armor());
			main_ch.setC_critical(ex_c_vo.getC_critical());
			main_ch.setC_avd(ex_c_vo.getC_avd());
			main_ch.setC_auto_attack(ex_c_vo.getC_auto_attack());
			main_ch.setC_p_skill(ex_c_vo.getC_p_skill());
			main_ch.setC_img(ex_c_vo.getC_img());
			main_ch.setSkill_vo(ex_c_vo.getSkill_vo());
			main_ch.setC_original_hp(ex_c_vo.getC_hp());
			main_ch.setC_auto_attack_img(ex_c_vo.getC_auto_attack_img());
			main_ch.setC_p_skill_img(ex_c_vo.getC_p_skill_img());
		}else{//법사
			main_ch = new Wizard();
			main_ch.setC_idx(ex_c_vo.getC_idx());
			main_ch.setC_name(ex_c_vo.getC_name());
			main_ch.setC_hp(ex_c_vo.getC_hp());
			main_ch.setC_ad(ex_c_vo.getC_ad());
			main_ch.setC_ap(ex_c_vo.getC_ap());
			main_ch.setC_armor(ex_c_vo.getC_armor());
			main_ch.setC_critical(ex_c_vo.getC_critical());
			main_ch.setC_avd(ex_c_vo.getC_avd());
			main_ch.setC_auto_attack(ex_c_vo.getC_auto_attack());
			main_ch.setC_p_skill(ex_c_vo.getC_p_skill());
			main_ch.setC_img(ex_c_vo.getC_img());
			main_ch.setSkill_vo(ex_c_vo.getSkill_vo());
			main_ch.setC_original_hp(ex_c_vo.getC_hp());
			main_ch.setC_auto_attack_img(ex_c_vo.getC_auto_attack_img());
			main_ch.setC_p_skill_img(ex_c_vo.getC_p_skill_img());
		}
		
		application.setAttribute("main_ch", main_ch);
		model.addAttribute("stage_val", 1);
		
		return "redirect:../shop/shop.do";
	}

	@RequestMapping("character_choice_form.do")
	public String character_choice_form() {
		
		return "game/character/character_choice";
	}


}
