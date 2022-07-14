package controller;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CharacterDao;
import dao.DungeonDao;
import dao.MopDao;
import dao.SkillDao;
import info.character.Warrior;
import vo.AttackVo;
import vo.CharacterVo;
import vo.DungeonVo;
import vo.MopVo;
import vo.SkillVo;

@Controller
@RequestMapping("/game/dungeon/")
public class DungeonController {

	@Autowired
	ServletContext application;

	@Autowired
	HttpServletRequest request;

	// 로그인 정보
	@Autowired
	HttpSession session;

	@Autowired
	DungeonDao dungeon_dao;

	@Autowired
	CharacterDao character_dao;

	@Autowired
	SkillDao skill_dao;

	MopDao mop_dao;
	
	public void setDungeon_dao(DungeonDao dungeon_dao) {
		this.dungeon_dao = dungeon_dao;
	}

	public void setSkill_dao(SkillDao skill_dao) {
		this.skill_dao = skill_dao;
	}

	public void setMop_dao(MopDao mop_dao) {
		this.mop_dao = mop_dao;
	}

	@RequestMapping("dungeon.do")
	public String dungeon(Model model, int stage_val, int[] s_idx) {

		// 캐릭터 정보랑 스킬 둘 다 넘겨야 됨
		// 스킬 mapper 만들고 s_idx 이용해서 캐릭터 정보 1개(application에 저장되어서 걍 넘기면 딤)
		// 넘어온 s_idx 4개로 선택된 스킬 이름만 main_ch에 넘겨서 jsp에서 출력
		// 몹 관한 정보는 db 구현 후 작성

		CharacterVo main_ch = (CharacterVo) application.getAttribute("main_ch");
		MopVo mop = new MopVo();
		//mop = mop_dao.selectOne(stage_val);
		///////////////////////////////////////
		//실험용 몹 정보
		mop.setM_idx(1);
		mop.setM_name("몬스터1");
		mop.setM_level("일반");
		mop.setM_hp(100);
		mop.setM_ad(20);
		mop.setM_armor(10);
		mop.setM_skill("몹 스킬");
		///////////////////////////////////////
		application.setAttribute("mop", mop);
		application.setAttribute("main_ch", main_ch);
		application.setAttribute("s_idx", s_idx);
		//*main_ch를 복사한 객체를 addAttribute 해야될듯
		model.addAttribute("mop", mop);
		model.addAttribute("main_ch", main_ch);
		model.addAttribute("s_idx", s_idx);

		return "game/dungeon/dungeon_skeleton01";
	}

	@RequestMapping(value="battle/attack.do", produces = "text/json; charset=utf-8;")
	@ResponseBody
	public String battle_attack(int s_idx) {

		Warrior main_ch = (Warrior) application.getAttribute("main_ch");
		MopVo mop = (MopVo) application.getAttribute("mop");
		AttackVo attack_mop_vo = new AttackVo();
		AttackVo attack_main_ch_vo = new AttackVo();
	
		//몬스터에게 cc, 도트뎀, 디버프 적용하기////////////
		String extra_skill_mop = mop.extra_skill();
		String extra_skill_main_ch = main_ch.extra_skill();
		
		if(!extra_skill_mop.equals("cc")) {
			//캐릭터에게 피해 입히기
			mop.attack_character(main_ch, attack_main_ch_vo);
		}
		
		if(!extra_skill_main_ch.equals("cc")) {
			//몬스터에게 피해 입히기
			main_ch.attack_mop(mop, attack_mop_vo, s_idx);
		}
		
		application.setAttribute("main_ch", main_ch);
		application.setAttribute("mop", mop);

		JSONObject json = new JSONObject();
		System.out.println("-----------AttackMopVo------------");
		System.out.println("damage: " + attack_mop_vo.getDamage());
		System.out.println("self_damage: " + attack_mop_vo.getSelf_damage());
		System.out.println("damage_reduced: " + attack_mop_vo.getDamage_reduced());
		System.out.println("damage_reduced_turn: " + attack_mop_vo.getDamage_reduced_turn());
		System.out.println("ad_increased: " + attack_mop_vo.getAd_increased());
		System.out.println("armor_increased: " + attack_mop_vo.getArmor_increased());
		System.out.println("ad_reduced: " + attack_mop_vo.getAd_reduced());
		System.out.println("armor_reduced: " + attack_mop_vo.getArmor_reduced());
		System.out.println("dot_damage: " + attack_mop_vo.getDot_damage());
		System.out.println("dot_damage_turn: " + attack_mop_vo.getDot_damage_turn());
		System.out.println("cc_turn: " + attack_mop_vo.getCc_turn());
		System.out.println("cc_name: " + attack_mop_vo.getCc_name());
		System.out.println("battle_info: " + attack_mop_vo.getBattle_info());
		
		System.out.println("-----------AttackMainChVo------------");
		System.out.println("damage: " + attack_main_ch_vo.getDamage());
		System.out.println("self_damage: " + attack_main_ch_vo.getSelf_damage());
		System.out.println("damage_reduced: " + attack_main_ch_vo.getDamage_reduced());
		System.out.println("damage_reduced_turn: " + attack_main_ch_vo.getDamage_reduced_turn());
		System.out.println("ad_increased: " + attack_main_ch_vo.getAd_increased());
		System.out.println("armor_increased: " + attack_main_ch_vo.getArmor_increased());
		System.out.println("ad_reduced: " + attack_main_ch_vo.getAd_reduced());
		System.out.println("armor_reduced: " + attack_main_ch_vo.getArmor_reduced());
		System.out.println("dot_damage: " + attack_main_ch_vo.getDot_damage());
		System.out.println("dot_damage_turn: " + attack_main_ch_vo.getDot_damage_turn());
		System.out.println("cc_turn: " + attack_main_ch_vo.getCc_turn());
		System.out.println("cc_name: " + attack_main_ch_vo.getCc_name());
		System.out.println("battle_info: " + attack_main_ch_vo.getBattle_info());
		
		System.out.println("-----------CharacterVo------------");
		System.out.println("hp: " + main_ch.getC_hp());
		System.out.println("name: " + main_ch.getC_name());
		System.out.println("ad: " + main_ch.getC_ad());
		System.out.println("ap: " + main_ch.getC_ap());
		System.out.println("armor: " + main_ch.getC_armor());
		System.out.println("critical: " + main_ch.getC_critical());
		System.out.println("avd: " + main_ch.getC_avd());
		
		System.out.println("-----------MopVo------------");
		System.out.println("name: " + mop.getM_name());
		System.out.println("hp: " + mop.getM_hp());
		System.out.println("ad: " + mop.getM_ad());
		System.out.println("armor: " + mop.getM_armor());
		System.out.println("level: " + mop.getM_level());
		
//		json.put("main_ch", main_ch);
//		json.put("mop1", mop1);
//		json.put("attack_info", attack_mop_vo);
		
		
		//main_ch 정보
		json.put("main_ch_hp", main_ch.getC_hp());
		json.put("main_ch_name", main_ch.getC_name());
		json.put("main_ch_ad", main_ch.getC_ad());
		json.put("main_ch_ap", main_ch.getC_ap());
		json.put("main_ch_armor", main_ch.getC_armor());
		json.put("main_ch_critical", main_ch.getC_critical());
		json.put("main_ch_avd", main_ch.getC_avd());
		
		//mop 정보
		json.put("mop_hp", mop.getM_hp());
		json.put("mop_name", mop.getM_name());
		json.put("mop_ad", mop.getM_ad());
		json.put("mop_armor", mop.getM_armor());
		
		//attack 정보
		json.put("name", attack_mop_vo.getName());
		json.put("damage", attack_mop_vo.getDamage());
		json.put("self_damage", attack_mop_vo.getSelf_damage());
		json.put("damage_reduced", attack_mop_vo.getDamage_reduced());
		json.put("damage_reduced_turn", attack_mop_vo.getDamage_reduced_turn());
		json.put("ad_increased", attack_mop_vo.getAd_increased());
		json.put("armor_increased", attack_mop_vo.getArmor_increased());
		json.put("ad_reduced", attack_mop_vo.getAd_reduced());
		json.put("armor_reduced", attack_mop_vo.getArmor_reduced());
		json.put("dot_damage", attack_mop_vo.getDot_damage());
		json.put("dot_damage_turn", attack_mop_vo.getDot_damage_turn());
		json.put("cc_turn", attack_mop_vo.getCc_turn());
		json.put("cc_name", attack_mop_vo.getCc_name());
		
		json.put("attack_mop_info", attack_mop_vo.getBattle_info());
		json.put("attack_main_ch_info", attack_main_ch_vo.getBattle_info());
		if(!extra_skill_mop.equals(""))
			json.put("extra_skill_mop",extra_skill_mop);
		if(!extra_skill_main_ch.equals(""))
			json.put("extra_skill_main_ch",extra_skill_main_ch);
		
		return json.toJSONString();
	}

}
