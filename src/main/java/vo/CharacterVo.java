package vo;

import java.util.List;
import java.util.Map;

public class CharacterVo {

	int 	c_idx;
	String 	c_name;
	int 	c_hp;
	int 	c_ad;
	int 	c_ap;
	int 	c_armor;
	int 	c_critical;
	int 	c_avd;
	String	c_auto_attack;
	String 	c_p_skill;
	String c_img;
	
	List<SkillVo> skill_vo;
	
	int active_skill1_level =0;
	int active_skill2_level =0;
	int active_skill3_level =0;
	int active_skill4_level =0;
	int active_skill5_level =0;
	int active_skill6_level =0;
	int active_skill7_level =0;
	int active_skill8_level =0;
	
	int damage_reduced = 0;// 받는 피해 감소
	int damage_reduced_turn = 0;// 받는 피해 감소 턴수
	int dot_damage = 0;// 도트뎀
	int dot_damage_turn = 0;// 도트뎀 턴수
	int cc_turn = 0;
	
	public void active_skill1(MopVo mopVo, AttackVo attack_mop_vo) {}
	public void active_skill2(MopVo mopVo, AttackVo attack_mop_vo) {}
	public void active_skill3(MopVo mopVo, AttackVo attack_mop_vo) {}
	public void active_skill4(MopVo mopVo, AttackVo attack_mop_vo) {}
	public void active_skill5(MopVo mopVo, AttackVo attack_mop_vo) {}
	public void active_skill6(MopVo mopVo, AttackVo attack_mop_vo) {}
	public void active_skill7(MopVo mopVo, AttackVo attack_mop_vo) {}
	public void active_skill8(MopVo mopVo, AttackVo attack_mop_vo) {}
	
	public void attack_mop(MopVo mopVo, AttackVo attack_mop_vo, int s_idx) {
		
		if(s_idx==0) {
			attack_mop_vo.setDamage(this.c_ad * (5000 / ( 50 + mopVo.getM_armor() ) ) / 100);
			mopVo.setM_hp(mopVo.getM_hp() - this.c_ad * (5000 / ( 50 + mopVo.getM_armor() ) ) / 100);
			attack_mop_vo.setBattle_info(String.format("%s(이)가 %s에게 %d의 피해를 입혔습니다.", 
																				this.getC_name(),
																				mopVo.getM_name(),
																				this.c_ad * (5000 / ( 50 + mopVo.getM_armor() ) ) / 100));
		}else {
			SkillVo vo = getSkill_s_idx(s_idx);
			attack_mop_vo.setName(vo.getS_name());
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
		}
	}
	
	public SkillVo getSkill_s_idx(int s_idx) {
		
		SkillVo vo = new SkillVo();
		for(SkillVo vo1: skill_vo)
			if(vo1.getS_idx()==s_idx)
				vo = vo1;
		return vo;
	}
	
	public String extra_skill() {
		String extra_battle_info = "";
		
		if(this.cc_turn!=0) {
			this.cc_turn--;
			return "cc";
		}
		
		if(this.dot_damage_turn!=0) {
			this.dot_damage_turn--;
			this.c_hp -= this.dot_damage;
			extra_battle_info = extra_battle_info + String.format("%s가 %d의 도트뎀을 받았습니다", this.c_name, this.getDot_damage());
		}
		
		if(this.damage_reduced_turn!=0) {
			this.damage_reduced_turn--;
		}else if(this.damage_reduced_turn==0) {
			this.damage_reduced=0;
		}
		
		
		return extra_battle_info;
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

	

	
}
