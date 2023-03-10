package info.character;

import java.util.Random;

import vo.AttackVo;
import vo.CharacterVo;
import vo.MopVo;

public class Archer extends CharacterVo {

   // '더블 애로우', 'damage', 1, 0, 2);
   // '포이즌 애로우', 'dot', 1, 5, 2);
   // '스카이 애로우', 'damage', 1, 0, 2);
   // '차지드 애로우', 'damage', 4, 0, 2);
   // '블라인드', 'cc', 1, 1, 2);
   // '컨퓨전', 'cc', 1, 1, 2);
   // '포커스 온', 'buff', 1, 5, 2);
   // '오버 드라이브', 'buff', 1, 5, 2);

   @Override
   public void active_skill1(MopVo mopVo, AttackVo attack_mop_vo) {
      // 더블 애로우 10(1.5ad)
      System.out.println("더블 애로우!");
      int damage = getSkill_vo().get(0).getS_basic_damage() +  
				getSkill_vo().get(0).getS_add_damage() * getActive_skill_level()[0] +
				getSkill_vo().get(0).getS_coeff_ad() * getC_ad() + 
				getSkill_vo().get(0).getS_coeff_ap() * getC_ap();
      attack_mop_vo.setDamage(damage * (5000 / (50 + mopVo.getM_armor())) / 100);
      mopVo.setM_hp(mopVo.getM_hp() - damage * (5000 / (50 + mopVo.getM_armor())) / 100);
      attack_mop_vo.setBattle_info(String.format("%s(이)가 %s에게 %s(으)로 %d의 피해를 입혔습니다.", this.getC_name(),
            mopVo.getM_name(), attack_mop_vo.getName(), damage * (5000 / (50 + mopVo.getM_armor())) / 100));
      
      // ***********패시브***********
      // 콤보 어택 (스킬 1 ~ 4 공격시, 크리티컬이 터지면 평타를 한 번 더 칩니다.)
      Random random = new Random();
      if (random.nextInt(100) <= this.getC_critical()) {
         int p_damage = this.getC_ad();
         attack_mop_vo.setDamage(p_damage * (5000 / (50 + mopVo.getM_armor())) / 100);
         mopVo.setM_hp(mopVo.getM_hp() - p_damage * (5000 / (50 + mopVo.getM_armor())) / 100);
         System.out.println("패시브 스킬 발동!");
         attack_mop_vo.setBattle_info_p(String.format("패시브 스킬 발동!\n평타로 한 번 더 공격해서 %d의 데미지를 추가로 입힙니다.", p_damage));
      }
   }

   @Override
   public void active_skill2(MopVo mopVo, AttackVo attack_mop_vo) {
      // 포이즌 애로우 5(2ap)
      System.out.println("포이즌 애로우!");
      int dot_damage = getSkill_vo().get(1).getS_basic_damage() +  
				getSkill_vo().get(1).getS_add_damage() * getActive_skill_level()[1] +
				getSkill_vo().get(1).getS_coeff_ad() * getC_ad() + 
				getSkill_vo().get(1).getS_coeff_ap() * getC_ap();
      int dot_damage_turn = getSkill_vo().get(1).getS_turn();
      attack_mop_vo.setDot_damage(dot_damage);
      attack_mop_vo.setDot_damage_turn(dot_damage_turn);
      mopVo.setDot_damage(dot_damage);
      mopVo.setDot_damage_turn(dot_damage_turn);
      attack_mop_vo.setBattle_info(String.format("%s(이)가 %s에게 %d턴동안 %d의 피해를 입힙니다.", this.getC_name(),
            mopVo.getM_name(), dot_damage_turn, dot_damage));
      
      // ***********패시브***********
      // 콤보 어택 (스킬 1 ~ 4 공격시, 크리티컬이 터지면 평타를 한 번 더 칩니다.)
      Random random = new Random();
      if (random.nextInt(100) <= this.getC_critical()) {
         int p_damage = this.getC_ad();
         attack_mop_vo.setDamage(p_damage * (5000 / (50 + mopVo.getM_armor())) / 100);
         mopVo.setM_hp(mopVo.getM_hp() - p_damage * (5000 / (50 + mopVo.getM_armor())) / 100);
         System.out.println("패시브 스킬 발동!");
         attack_mop_vo.setBattle_info_p(String.format("패시브 스킬 발동!\n평타로 한 번 더 공격해서 %d의 데미지를 추가로 입힙니다.", p_damage));
      }
   }

   @Override
   public void active_skill3(MopVo mopVo, AttackVo attack_mop_vo) {
      // 스카이 애로우 50(1.5ad)
      System.out.println("스카이 애로우!");
      int damage = getSkill_vo().get(2).getS_basic_damage() +  
				getSkill_vo().get(2).getS_add_damage() * getActive_skill_level()[2] +
				getSkill_vo().get(2).getS_coeff_ad() * getC_ad() + 
				getSkill_vo().get(2).getS_coeff_ap() * getC_ap();
      attack_mop_vo.setDamage(damage * (5000 / (50 + mopVo.getM_armor())) / 100);
      mopVo.setM_hp(mopVo.getM_hp() - damage * (5000 / (50 + mopVo.getM_armor())) / 100);
      attack_mop_vo.setBattle_info(String.format("%s(이)가 %s에게 %s(으)로 %d의 피해를 입혔습니다.", this.getC_name(),
            mopVo.getM_name(), attack_mop_vo.getName(), damage * (5000 / (50 + mopVo.getM_armor())) / 100));
      
      // ***********패시브***********
      // 콤보 어택 (스킬 1 ~ 4 공격시, 크리티컬이 터지면 평타를 한 번 더 칩니다.)
      Random random = new Random();
      if (random.nextInt(100) <= this.getC_critical()) {
         int p_damage = this.getC_ad();
         attack_mop_vo.setDamage(p_damage * (5000 / (50 + mopVo.getM_armor())) / 100);
         mopVo.setM_hp(mopVo.getM_hp() - p_damage * (5000 / (50 + mopVo.getM_armor())) / 100);
         System.out.println("패시브 스킬 발동!");
         attack_mop_vo.setBattle_info_p(String.format("패시브 스킬 발동!\n평타로 한 번 더 공격해서 %d의 데미지를 추가로 입힙니다.", p_damage));
      }
   }

   @Override
   public void active_skill4(MopVo mopVo, AttackVo attack_mop_vo) {
      // 차지드 애로우 (고정데미지)
      System.out.println("차지드 애로우!");
      int damage = getSkill_vo().get(3).getS_basic_damage() +  
				getSkill_vo().get(3).getS_add_damage() * getActive_skill_level()[3] +
				getSkill_vo().get(3).getS_coeff_ad() * getC_ad() + 
				getSkill_vo().get(3).getS_coeff_ap() * getC_ap();
      attack_mop_vo.setDamage(damage);
      mopVo.setM_hp(mopVo.getM_hp() - damage);
      attack_mop_vo.setBattle_info(String.format("%s(이)가 %s에게 %s(으)로 %d의 피해를 입혔습니다.", this.getC_name(),
            mopVo.getM_name(), attack_mop_vo.getName(), damage * (5000 / (50 + mopVo.getM_armor())) / 100));
      
      // ***********패시브***********
      // 콤보 어택 (스킬 1 ~ 4 공격시, 크리티컬이 터지면 평타를 한 번 더 칩니다.)
      Random random = new Random();
      if (random.nextInt(100) <= this.getC_critical()) {
         int p_damage = this.getC_ad();
         attack_mop_vo.setDamage(p_damage * (5000 / (50 + mopVo.getM_armor())) / 100);
         mopVo.setM_hp(mopVo.getM_hp() - p_damage * (5000 / (50 + mopVo.getM_armor())) / 100);
         System.out.println("패시브 스킬 발동!");
         attack_mop_vo.setBattle_info_p(String.format("패시브 스킬 발동!\n평타로 한 번 더 공격해서 %d의 데미지를 추가로 입힙니다.", p_damage));
      }
   }

   @Override
   public void active_skill5(MopVo mopVo, AttackVo attack_mop_vo) {
      // 블라인드(2턴간 적의 공격력을 0으로 만든다)
      // 추후 구현 예정
      System.out.println("블라인드!");
      attack_mop_vo.setCc_turn(3);
      mopVo.setCc_turn(3);
      attack_mop_vo.setBattle_info(String.format("%s(이)가 적의 눈에 화살을 쏘아 3턴간 몬스터의 공격력을 0으로 만듭니다.", this.getC_name(),
            attack_mop_vo.getName(), mopVo.getM_ad() * (5000 / (50 + mopVo.getM_armor())) / 100));
   }

   @Override
   public void active_skill6(MopVo mopVo, AttackVo attack_mop_vo) {
      // 컨퓨전(3턴간 적이 자기 자신을 공격한다)
      System.out.println("컨퓨전!");
      attack_mop_vo.setDamage(mopVo.getM_ad() * (5000 / (50 + mopVo.getM_armor())) / 100);
      mopVo.setM_hp(mopVo.getM_hp() - mopVo.getM_ad() * (5000 / (50 + mopVo.getM_armor())) / 100);
      attack_mop_vo.setBattle_info(String.format("%s(이)가 영문도 모르고 자신을 공격하여 %s(으)로 %d의 피해를 입혔습니다.", mopVo.getM_name(),
            attack_mop_vo.getName(), mopVo.getM_ad() * (5000 / (50 + mopVo.getM_armor())) / 100));
   }

   @Override
   public void active_skill7(MopVo mopVo, AttackVo attack_mop_vo) {
      // 포커스온(캐릭터 회피율과 크리티컬 확률을 올린다.)
      System.out.println("포커스 온!");
      int avoid_increased = getSkill_vo().get(6).getS_basic_damage() +  
				getSkill_vo().get(6).getS_add_damage() * getActive_skill_level()[6] +
				getSkill_vo().get(6).getS_coeff_ad() * getC_ad() + 
				getSkill_vo().get(6).getS_coeff_ap() * getC_ap();
      int critical_increased = avoid_increased * 2;
      this.setC_avd(this.getC_avd() + avoid_increased);
      this.setC_critical(this.getC_critical() + critical_increased);
      attack_mop_vo.setBattle_info(String.format("%s(이)의 회피율이 %d만큼 상승하고, 크리티컬 확률이 %d만큼 상승하였습니다.", this.getC_name(),
            this.getC_avd(), this.getC_critical()));
   }

   @Override
   public void active_skill8(MopVo mopVo, AttackVo attack_mop_vo) {
      // 오버드라이브(평타강화) ad * 3
      System.out.println("오버드라이브!");
      int ad_increased = getSkill_vo().get(7).getS_basic_damage() +  
				getSkill_vo().get(7).getS_add_damage() * getActive_skill_level()[7] +
				getSkill_vo().get(7).getS_coeff_ad() * getC_ad() + 
				getSkill_vo().get(7).getS_coeff_ap() * getC_ap();
      this.setC_ad(ad_increased);
      attack_mop_vo.setBattle_info(String.format("%s(이)의 기본 공격력이 %d으로 상승하였습니다.", this.getC_name(), ad_increased));
   }

}