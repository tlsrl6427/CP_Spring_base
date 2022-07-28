package vo;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class CharacterVo implements Cloneable{

   int    c_idx;
   String    c_name;
   int    c_hp;
   int    c_ad;
   int    c_ap;
   int    c_armor;
   int    c_critical;
   int    c_avd;
   String   c_auto_attack;
   String    c_p_skill;
   String  c_img;
   int    c_original_hp;
   
   int c_hp_percent;
   int c_ad_percent;
   int c_ap_percent;
   int c_armor_percent;
   
   List<SkillVo> skill_vo;
   //머리:0, 상체:1, 하체:2, 무기:3, 물약:4
   List<ItemVo>   item_list = new ArrayList<ItemVo>();
   
   public CharacterVo() {
      //super();
      item_list.add(new ItemVo());
      item_list.add(new ItemVo());
      item_list.add(new ItemVo());
      item_list.add(new ItemVo());
      item_list.add(new ItemVo());
   }
   
   int[] active_skill_level = new int[8];
   int[] active_skill_remaining_turn = new int[8];
   
   int damage_reduced = 0;// 받는 피해 감소
   int damage_reduced_turn = 0;// 받는 피해 감소 턴수
   int dot_damage = 0;// 도트뎀
   int dot_damage_turn = 0;// 도트뎀 턴수
   int cc_turn = 0;
   public static boolean wizard_passive = false;
   Random random = new Random();
   
   
   public void active_skill1(MopVo mopVo, AttackVo attack_mop_vo) {}
   public void active_skill2(MopVo mopVo, AttackVo attack_mop_vo) {}
   public void active_skill3(MopVo mopVo, AttackVo attack_mop_vo) {}
   public void active_skill4(MopVo mopVo, AttackVo attack_mop_vo) {}
   public void active_skill5(MopVo mopVo, AttackVo attack_mop_vo) {}
   public void active_skill6(MopVo mopVo, AttackVo attack_mop_vo) {}
   public void active_skill7(MopVo mopVo, AttackVo attack_mop_vo) {}
   public void active_skill8(MopVo mopVo, AttackVo attack_mop_vo) {}
   public void passive_skill1(int original_hp) {}
   
   
   //몬스터에게 데미지 입히기
   public void attack_mop(CharacterVo main_ch, MopVo mopVo, AttackVo attack_mop_vo, int s_idx) {
      
      if(s_idx == 0) {
    	  
    	  
    	// 크리티컬 터졌을 때,
          if (random.nextInt(100) < main_ch.getC_critical()) {
             
             attack_mop_vo.setDamage((2 * this.c_ad) * (5000 / ( 50 + mopVo.getM_armor() ) ) / 100);
             mopVo.setM_hp(mopVo.getM_hp() - (2 * this.c_ad) * (5000 / ( 50 + mopVo.getM_armor() ) ) / 100);
             attack_mop_vo.setBattle_info(String.format("크리티컬이 발동하여 %s(이)가 %s에게 %d의 피해를 입혔습니다.", 
                                              this.getC_name(),
                                              mopVo.getM_name(),
                                              (2 * this.c_ad) * (5000 / ( 50 + mopVo.getM_armor() ) ) / 100));
             
          } else {
          
          attack_mop_vo.setDamage(this.c_ad * (5000 / ( 50 + mopVo.getM_armor() ) ) / 100);
          mopVo.setM_hp(mopVo.getM_hp() - this.c_ad * (5000 / ( 50 + mopVo.getM_armor() ) ) / 100);
          attack_mop_vo.setBattle_info(String.format("%s(이)가 %s에게 %d의 피해를 입혔습니다.", 
                                           this.getC_name(),
                                           mopVo.getM_name(),
                                           this.c_ad * (5000 / ( 50 + mopVo.getM_armor() ) ) / 100));
          }
          
      } else {
         
         SkillVo vo = getSkill_s_idx(s_idx);
         attack_mop_vo.setName(vo.getS_name());
         //쿨 다시 늘리기
         active_skill_remaining_turn[vo.getS_num()-1] = vo.getS_turn();
         
         // 패시브 스킬 구현
         switch(main_ch.getC_idx()) {
            case 1: passive_skill1(this.getC_original_hp());
            //case 3: passive_skill3();
         }
         
         switch(vo.getS_num()) {
            case 1: active_skill1(mopVo, attack_mop_vo); break;
            case 2: active_skill2(mopVo, attack_mop_vo); break;
            case 3: active_skill3(mopVo, attack_mop_vo); break;
            case 4: active_skill4(mopVo, attack_mop_vo); break;
            case 5: active_skill5(mopVo, attack_mop_vo); break;
            case 6: active_skill6(mopVo, attack_mop_vo); break;
            case 7: active_skill7(mopVo, attack_mop_vo); break;
            case 8: active_skill8(mopVo, attack_mop_vo); break;
            default: break;
         }
         
         // 법사 패시브 구현 부분
      // 법사 패시브 구현 부분
         if (wizard_passive == true) {
            // 스킬 쿨 줄이기
            for (int i = 0; i < active_skill_remaining_turn.length; i++) {

               if (active_skill_remaining_turn[i] > 0) {
                  active_skill_remaining_turn[i]--;
               }
            }
            wizard_passive = false;
         }
      }
   }
   
   //s_idx에 해당하는 스킬 가져오기
   public SkillVo getSkill_s_idx(int s_idx) {
      
      SkillVo vo = new SkillVo();
      for(SkillVo vo1: skill_vo)
         if(vo1.getS_idx()==s_idx)
            vo = vo1;
      return vo;
   }
   
   //도트뎀, cc기 등 적용시키기, 스킬 쿨 줄이기
   public String extra_skill() {
      String extra_battle_info = "";
      
      //스킬 쿨 줄이기
      for(int i=0; i<active_skill_remaining_turn.length; i++) {
         if(active_skill_remaining_turn[i] > 0)
            active_skill_remaining_turn[i]--;
      }
      
      //cc걸렸는지 판단하기
      if(this.cc_turn!=0) {
         this.cc_turn--;
         return "cc";
      }
      
      //도트데미지
      if(this.dot_damage_turn!=0) {
         this.dot_damage_turn--;
         this.c_hp -= this.dot_damage;
         extra_battle_info = extra_battle_info + String.format("%s가 %d의 도트뎀을 받았습니다", this.c_name, this.getDot_damage());
      }
      
      //받는 피해 감소
      if(this.damage_reduced_turn!=0) {
         this.damage_reduced_turn--;
      }else if(this.damage_reduced_turn==0) {
         this.damage_reduced=0;
      }
      
      
      return extra_battle_info;
   }
   
   //아이템 적용시키기
   public void item_buy(ItemVo vo) {
      //어느 파츠인지 구분
      if(vo.getI_category().equals("머리")) {
         item_except(item_list.get(0));
         item_apply(vo);
         item_list.set(0, vo);
      }
      else if(vo.getI_category().equals("상체")){
         item_except(item_list.get(1));
         item_apply(vo);
         item_list.set(1, vo);
      }
      else if(vo.getI_category().equals("하체")){
         item_except(item_list.get(2));
         item_apply(vo);
         item_list.set(2, vo);
      }
      else if(vo.getI_category().equals("무기")){
         item_except(item_list.get(3));
         item_apply(vo);
         item_list.set(3, vo);
      }
      else {
         item_except(item_list.get(4));
         item_apply(vo);
         item_list.set(4, vo);
      }
   }

   public void item_apply(ItemVo vo) {
      System.out.println("구매한 아이템: " + vo.getI_name());
      this.c_hp += vo.i_hp;
      this.c_ad += vo.i_ad;
      this.c_ap += vo.i_ap;
      this.c_armor += vo.i_armor;
      this.c_critical += vo.i_critical;
      this.c_avd += vo.i_avd;
      this.c_hp_percent += vo.i_hp_percent;
      this.c_ad_percent += vo.i_ad_percent;
      this.c_ap_percent += vo.i_ap_percent;
      this.c_armor_percent += vo.i_armor_percent;
   }
   
   public void item_except(ItemVo vo) {
      System.out.println("판매한 아이템: " + vo.getI_name());
      this.c_hp -= vo.i_hp;
      this.c_ad -= vo.i_ad;
      this.c_ap -= vo.i_ap;
      this.c_armor -= vo.i_armor;
      this.c_critical -= vo.i_critical;
      this.c_avd -= vo.i_avd;
      this.c_hp_percent -= vo.i_hp_percent;
      this.c_ad_percent -= vo.i_ad_percent;
      this.c_ap_percent -= vo.i_ap_percent;
      this.c_armor_percent -= vo.i_armor_percent;
   }

   public void item_percent_apply() {
      
       //퍼센트 적용
      this.c_hp = this.c_hp * (100 + this.c_hp_percent) / 100;
      this.c_ad = this.c_ad * (100 + this.c_ad_percent) / 100;
      this.c_ap = this.c_ap * (100 + this.c_ap_percent) / 100;
      this.c_armor = this.c_armor * (100 + this.c_armor_percent) / 100;

    
   }

   
   
   public static boolean isWizard_passive() {
	return wizard_passive;
}
public static void setWizard_passive(boolean wizard_passive) {
	CharacterVo.wizard_passive = wizard_passive;
}
public int[] getActive_skill_level() {
      return active_skill_level;
   }
   public void setActive_skill_level(int[] active_skill_level) {
      this.active_skill_level = active_skill_level;
   }
   public int[] getActive_skill_remaining_turn() {
      return active_skill_remaining_turn;
   }
   public void setActive_skill_remaining_turn(int[] active_skill_remaining_turn) {
      this.active_skill_remaining_turn = active_skill_remaining_turn;
   }
   public int getC_hp_percent() {
      return c_hp_percent;
   }
   public void setC_hp_percent(int c_hp_percent) {
      this.c_hp_percent = c_hp_percent;
   }
   public int getC_ad_percent() {
      return c_ad_percent;
   }
   public void setC_ad_percent(int c_ad_percent) {
      this.c_ad_percent = c_ad_percent;
   }
   public int getC_ap_percent() {
      return c_ap_percent;
   }
   public void setC_ap_percent(int c_ap_percent) {
      this.c_ap_percent = c_ap_percent;
   }
   public int getC_armor_percent() {
      return c_armor_percent;
   }
   public void setC_armor_percent(int c_armor_percent) {
      this.c_armor_percent = c_armor_percent;
   }
   public List<ItemVo> getItem_list() {
      return item_list;
   }
   public void setItem_list(List<ItemVo> item_list) {
      this.item_list = item_list;
   }
   public int getDot_damage() {
      return dot_damage;
   }
   public void setDot_damage(int dot_damage) {
      this.dot_damage = dot_damage;
   }
   public int getDot_damage_turn() {
      return dot_damage_turn;
   }
   public void setDot_damage_turn(int dot_damage_turn) {
      this.dot_damage_turn = dot_damage_turn;
   }
   public int getCc_turn() {
      return cc_turn;
   }
   public void setCc_turn(int cc_turn) {
      this.cc_turn = cc_turn;
   }
   public int getDamage_reduced_turn() {
      return damage_reduced_turn;
   }
   public void setDamage_reduced_turn(int damage_reduced_turn) {
      this.damage_reduced_turn = damage_reduced_turn;
   }
   public String getC_img() {
      return c_img;
   }
   public void setC_img(String c_img) {
      this.c_img = c_img;
   }
   public int getDamage_reduced() {
      return damage_reduced;
   }
   public void setDamage_reduced(int damage_reduced) {
      this.damage_reduced = damage_reduced;
   }
   public List<SkillVo> getSkill_vo() {
      return skill_vo;
   }
   public void setSkill_vo(List<SkillVo> skill_vo) {
      this.skill_vo = skill_vo;
   }
   public int getC_idx() {
      return c_idx;
   }
   public void setC_idx(int c_idx) {
      this.c_idx = c_idx;
   }
   public String getC_name() {
      return c_name;
   }
   public void setC_name(String c_name) {
      this.c_name = c_name;
   }
   public int getC_hp() {
      return c_hp;
   }
   public void setC_hp(int c_hp) {
      this.c_hp = c_hp;
   }
   public int getC_ad() {
      return c_ad;
   }
   public void setC_ad(int c_ad) {
      this.c_ad = c_ad;
   }
   public int getC_ap() {
      return c_ap;
   }
   public void setC_ap(int c_ap) {
      this.c_ap = c_ap;
   }
   public int getC_armor() {
      return c_armor;
   }
   public void setC_armor(int c_armor) {
      this.c_armor = c_armor;
   }
   public int getC_critical() {
      return c_critical;
   }
   public void setC_critical(int c_critical) {
      this.c_critical = c_critical;
   }
   public int getC_avd() {
      return c_avd;
   }
   public void setC_avd(int c_avd) {
      this.c_avd = c_avd;
   }
   public String getC_auto_attack() {
      return c_auto_attack;
   }
   public void setC_auto_attack(String c_auto_attack) {
      this.c_auto_attack = c_auto_attack;
   }
   public String getC_p_skill() {
      return c_p_skill;
   }
   public void setC_p_skill(String c_p_skill) {
      this.c_p_skill = c_p_skill;
   }
   public void passive_skill2() {
      // TODO Auto-generated method stub
      
   }
   public int getC_original_hp() {
      return c_original_hp;
   }
   public void setC_original_hp(int c_original_hp) {
      this.c_original_hp = c_original_hp;
   }

   

   
}