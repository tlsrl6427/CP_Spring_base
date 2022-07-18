package controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

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
import dao.ItemDao;
import dao.ShopDao;
import item.ItemEffect;
import netscape.javascript.JSObject;
import vo.CharacterVo;
import vo.ItemVo;

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

	ItemDao item_dao;
	
	public void setItem_dao(ItemDao item_dao) {
		this.item_dao = item_dao;
	}

	public void setShop_dao(ShopDao shop_dao) {
		this.shop_dao = shop_dao;
	}

	@RequestMapping("shop.do")
	public String shop(Model model, int stage_val) {

		
		CharacterVo main_ch = (CharacterVo) application.getAttribute("main_ch");
		model.addAttribute("main_ch", main_ch);
		
		List<ItemVo> item_list = new ArrayList<ItemVo>();
		List<ItemVo> selected_item_list = null;
		
		int stage_num = stage_val / 5 + 1;
		stage_num=2;
		
		if(stage_num==1) {//1 스테이지 일때
			item_list.addAll(item_dao.selectList_stage("일반"));
			selected_item_list = ItemEffect.effect_to_item(item_list, stage_num);
		}else if(stage_num==2) {//2 스테이지 일때
			item_list.addAll(item_dao.selectList_stage("일반"));
			item_list.addAll(item_dao.selectList_stage("고급"));
			selected_item_list = ItemEffect.effect_to_item(item_list, stage_num);
		}else if(stage_num==3) {//3 스테이지 일때
			item_list.addAll(item_dao.selectList_stage("일반"));
			item_list.addAll(item_dao.selectList_stage("고급"));
			item_list.addAll(item_dao.selectList_stage("희귀"));
			selected_item_list = ItemEffect.effect_to_item(item_list, stage_num);
		}
		
		
		
//		for(ItemVo vo : selected_item_list) {
//			System.out.println(vo.getI_name());
//		}
		
		application.setAttribute("selected_item_list", selected_item_list);
		model.addAttribute("selected_item_list", selected_item_list);
		return "game/shop/shop_test";
	}

	@RequestMapping(value="item_buy.do", produces="text/json; charset=utf-8;")
	@ResponseBody
	public String item_buy(int i_idx) {
		
//		System.out.println("item_name: "+vo.getI_name());
//		System.out.println("item_class: "+vo.getI_class());
//		System.out.println("item_category: "+vo.getI_category());
//		System.out.println("item_effect: "+vo.getI_effect());
		CharacterVo main_ch = (CharacterVo) application.getAttribute("main_ch");
		
		//i_idx를 받아서 selected_item_list와 비교해 해당하는 아이템을 받아서
		//해당하는 카테고리에 넣음
		List<ItemVo> selected_item_list =  (List<ItemVo>) application.getAttribute("selected_item_list");
		ItemVo selected_item = null;
		for(ItemVo vo : selected_item_list) {
			if(vo.getI_idx()==i_idx)
				selected_item = vo;
		}
	
		main_ch.item_buy(selected_item);
		
		application.setAttribute("main_ch", main_ch);
		
		JSONObject json = new JSONObject();
		json.put("item_name", selected_item.getI_name());
		
		return json.toJSONString();
	}
	
	@RequestMapping(value="item_shuffle.do")
	@ResponseBody
	public List<ItemVo> item_shuffle(int stage_val) {
		
		List<ItemVo> item_list = new ArrayList<ItemVo>();
		List<ItemVo> selected_item_list = null;
		
		int stage_num = stage_val / 5 + 1;
		stage_num=2;
		
		if(stage_num==1) {//1 스테이지 일때
			item_list.addAll(item_dao.selectList_stage("일반"));
			selected_item_list = ItemEffect.effect_to_item(item_list, stage_num);
		}else if(stage_num==2) {//2 스테이지 일때
			item_list.addAll(item_dao.selectList_stage("일반"));
			item_list.addAll(item_dao.selectList_stage("고급"));
			selected_item_list = ItemEffect.effect_to_item(item_list, stage_num);
		}else if(stage_num==3) {//3 스테이지 일때
			item_list.addAll(item_dao.selectList_stage("일반"));
			item_list.addAll(item_dao.selectList_stage("고급"));
			item_list.addAll(item_dao.selectList_stage("희귀"));
			selected_item_list = ItemEffect.effect_to_item(item_list, stage_num);
		}
		
		application.setAttribute("selected_item_list", selected_item_list);
		
		return selected_item_list;
	}
}
