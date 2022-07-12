package info.character;

import java.util.List;

import vo.AttackVo;
import vo.CharacterVo;
import vo.MopVo;
import vo.SkillVo;

public class Warrior extends CharacterVo{

	
	
	public void active_skill1(MopVo mopVo, AttackVo attack_mop_vo) {
		//어스 브레이크 10(1.5ad)
		System.out.println("어스 브레이크!");
		int damage = 10 + this.getC_ad() * 3 / 2;
		attack_mop_vo.setDamage(damage * (5000 / ( 50 + mopVo.getM_armor() ) ) / 100);
		mopVo.setM_hp(mopVo.getM_hp() - damage * (5000 / ( 50 + mopVo.getM_armor() ) ) / 100 );
		attack_mop_vo.setBattle_info(String.format("%s(이)가 %s에게 %s(으)로 %d의 피해를 입혔습니다.", 
																			this.getC_name(), 
																			mopVo.getM_name(),
																			attack_mop_vo.getName(),
																			damage * (5000 / ( 50 + mopVo.getM_armor() ) ) / 100));
	}
	
	public void active_skill2(MopVo mopVo, AttackVo attack_mop_vo) {
		//러닝 크래쉬 80입히고/20받기
		System.out.println("러닝 크래쉬!");
		int self_damage = 20;
		int damage = 80;
		attack_mop_vo.setSelf_damage(self_damage * (5000 / ( 50 + this.getC_armor() ) ) / 100);
		attack_mop_vo.setDamage(damage * (5000 / ( 50 + mopVo.getM_armor() ) ) / 100);
		this.setC_hp(this.getC_hp()-self_damage *  (5000 / ( 50 + this.getC_armor() ) ) / 100);
		mopVo.setM_hp(mopVo.getM_hp() - damage * (5000 / ( 50 + mopVo.getM_armor() ) ) / 100);
		attack_mop_vo.setBattle_info(String.format("%s(이)가 %s에게 %s(으)로 %d의 피해를 입혔습니다.\n%s(이)가 %s에게 %s(으)로 %d의 피해를 입혔습니다.", 
																		this.getC_name(), 
																		mopVo.getM_name(),
																		attack_mop_vo.getName(),
																		damage * (5000 / ( 50 + mopVo.getM_armor() ) ) / 100,
																		this.getC_name(), 
																		this.getC_name(), 
																		attack_mop_vo.getName(),
																		self_damage * (5000 / ( 50 + this.getC_armor() ) ) / 100));
	}
	
	public void active_skill3(MopVo mopVo, AttackVo attack_mop_vo) {
		//소울 슬래쉬 50(1.0ad)(0.6ap)
		System.out.println("소울 슬래쉬!");
		int damage = 50 + this.getC_ad() + this.getC_ap() * 3 / 5;
		attack_mop_vo.setDamage(damage * (5000 / ( 50 + mopVo.getM_armor() ) ) / 100);
		mopVo.setM_hp(mopVo.getM_hp() - damage * (5000 / ( 50 + mopVo.getM_armor() ) ) / 100 );
		attack_mop_vo.setBattle_info(String.format("%s(이)가 %s에게 %s(으)로 %d의 피해를 입혔습니다.", 
																			this.getC_name(), 
																			mopVo.getM_name(),
																			attack_mop_vo.getName(),
																			damage * (5000 / ( 50 + mopVo.getM_armor() ) ) / 100));
	}
	
	public void active_skill4(MopVo mopVo, AttackVo attack_mop_vo) {
		//심판의 검 (잃은 체력 or 총 체력 비례 ?)
		int damage = 100;
		attack_mop_vo.setDamage(100);
		mopVo.setM_hp(mopVo.getM_hp() - 100 );
		attack_mop_vo.setBattle_info(String.format("%s(이)가 %s에게 %s(으)로 %d의 피해를 입혔습니다.", 
																		this.getC_name(), 
																		mopVo.getM_name(),
																		attack_mop_vo.getName(),
																		damage * (5000 / ( 50 + mopVo.getM_armor() ) ) / 100));
	}
	
	public void active_skill5(MopVo mopVo, AttackVo attack_mop_vo) {
		//아테나의 축복 5/5 증가
		System.out.println("--아테나의 축복--!");
		int ad_increased = 5;
		int armor_increased = 5;
		this.setC_ad(this.getC_ad() + ad_increased);
		this.setC_armor(this.getC_armor() +  armor_increased);
		attack_mop_vo.setAd_increased(5);
		attack_mop_vo.setArmor_increased(5);
		attack_mop_vo.setBattle_info(String.format("%s(이)가 %s(으)로 공격력을 %d 증가시켰습니다.\n%s(이)가 %s(으)로 방어력을  %d 증가시켰습니다.", 
																			this.getC_name(), 
																			attack_mop_vo.getName(),
																			ad_increased,
																			this.getC_name(), 
																			attack_mop_vo.getName(),
																			armor_increased));
		//return 5;
	}
	
	public void active_skill6(MopVo mopVo, AttackVo attack_mop_vo) {
		//아이언 바디(받는 피해 감소)
		System.out.println("아이언 바디!");
		int damage_reduced = 5;
		int damage_reduced_turn = 5;
		this.setDamage_reduced(getDamage_reduced()+damage_reduced);
		this.setDamage_reduced_turn(damage_reduced);
		attack_mop_vo.setDamage_reduced(damage_reduced_turn);
		attack_mop_vo.setDamage_reduced_turn(damage_reduced_turn);
		//return 6;
		attack_mop_vo.setBattle_info(String.format("%s(이)가  %s(으)로 %d턴동안 %d의 데미지를 감소시킵니다.", 
																		this.getC_name(), 
																		attack_mop_vo.getName(),
																		damage_reduced_turn,
																		damage_reduced));
	}
	
	public void active_skill7(MopVo mopVo, AttackVo attack_mop_vo) {
		//오러블레이드(출혈)
		System.out.println("오러블레이드!");
		int dot_damage = 5;
		int dot_damage_turn = 5;
		attack_mop_vo.setDot_damage(dot_damage);
		attack_mop_vo.setDot_damage_turn(dot_damage_turn);
		mopVo.setDot_damage(dot_damage);
		mopVo.setDot_damage_turn(dot_damage_turn);
		attack_mop_vo.setBattle_info(String.format("%s(이)가 %s에게 %d턴동안 %d의 피해를 입힙니다.", 
																		this.getC_name(), 
																		mopVo.getM_name(),
																		dot_damage_turn,
																		dot_damage));
	}
	
	public void active_skill8(MopVo mopVo, AttackVo attack_mop_vo) {
		//사자후(상대 공격력, 방어력 감소)
		System.out.println("사자후!");
		int ad_reduced = 5;
		int armor_reduced = 5;
		attack_mop_vo.setAd_reduced(ad_reduced);
		attack_mop_vo.setArmor_reduced(armor_reduced);
		mopVo.setM_ad(mopVo.getM_ad() - ad_reduced);
		mopVo.setM_armor(mopVo.getM_armor() - armor_reduced);
		attack_mop_vo.setBattle_info(String.format("%s(이)가 %s(으)로 %s의 공격력을 %d 감소시켰습니다.\n%s(이)가 %s(으)로 %s의 방어력을 %d 감소시켰습니다.", 
																		this.getC_name(), 
																		attack_mop_vo.getName(),
																		mopVo.getM_name(),
																		ad_reduced,
																		this.getC_name(), 
																		attack_mop_vo.getName(),
																		mopVo.getM_name(),
																		armor_reduced));
	}
}
