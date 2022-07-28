/*
----------------------------------------[ user ]------------------------------------------



-------------------------------------[ character ]----------------------------------------
--										idx	name	hp	  ad	ap	 armor critical	avd
insert into character_info values(1, '전사', 120, 10, 	 0, 	0,		0, 		5,
							'베기', '퓨리', '');

insert into character_info values(2, '궁수', 100, 8, 	 0, 	0,		10, 	5,
							'파워 애로우', '콤보 어택','');
						
insert into character_info values(3, '법사', 90, 5, 	 0, 	0,		0, 		15,
							'에너지볼', '매지컬 탤런트','');
							
							
----------------------------------------[ skill ]------------------------------------------							

-- Warrior
insert into skill(s_name, s_num, s_category, s_turn, s_valid, c_idx, s_basic_damage, s_add_damage, s_coeff_ad, s_coeff_ap, s_info) values('어스 브레이크', 1, 'damage', 1, 0, 1, 10, 30, 1.5, 0, 
																										'높게 도약한 후 지면을 강타하여 ?의 데미지를 입힙니다.');
insert into skill(s_name, s_num, s_category, s_turn, s_valid, c_idx, s_basic_damage, s_add_damage, s_coeff_ad, s_coeff_ap, s_info) values('러닝 크래쉬', 2, 'damage', 1, 0, 1, 80, 30, 0, 0,
																										'죽을 각오로 적과 부딫혀 ?의 데미지를 입히고 1/4의 피해를 받습니다.');
insert into skill(s_name, s_num, s_category, s_turn, s_valid, c_idx, s_basic_damage, s_add_damage, s_coeff_ad, s_coeff_ap, s_info) values('소울 슬래쉬', 3, 'damage', 1, 0, 1, 50, 40, 1, 0.6,
																										'정신을 집중한 후 검기를 날려 ?의 데미지를 입힙니다.');
insert into skill(s_name, s_num, s_category, s_turn, s_valid, c_idx, s_basic_damage, s_add_damage, s_coeff_ad, s_coeff_ap, s_info) values('심판의 검', 4, 'damage', 4, 0, 1, 40, 2, 0, 0,
																										'하늘에서 검을 떨어뜨려 ?의 데미지를 입힙니다.');
insert into skill(s_name, s_num, s_category, s_turn, s_valid, c_idx, s_basic_damage, s_add_damage, s_coeff_ad, s_coeff_ap, s_info) values('아테나의 축복', 5, 'buff', 1, 5, 1, 5, 3, 0, 0,
																										'아테나 여신의 가호를 받아 ?의 공격력과 ?의 방어력이 오릅니다.');
insert into skill(s_name, s_num, s_category, s_turn, s_valid, c_idx, s_basic_damage, s_add_damage, s_coeff_ad, s_coeff_ap, s_info) values('아이언 바디', 6, 'buff', 1, 5, 1, 5, 3, 0.05, 0.1,
																										'몸을 강철처럼 단단하게 만들어 ?의 데미지를 !턴동안 감소시킵니다.');
insert into skill(s_name, s_num, s_category, s_turn, s_valid, c_idx, s_basic_damage, s_add_damage, s_coeff_ad, s_coeff_ap, s_info) values('오러 블레이드', 7, 'dot', 1, 5, 1, 5, 5, 0.5, 0.5,
																										'검에 오러를 두르고 적을 출혈상태로 만듭니다. ?의 데미지를 !턴동안 입힙니다.');
insert into skill(s_name, s_num, s_category, s_turn, s_valid, c_idx, s_basic_damage, s_add_damage, s_coeff_ad, s_coeff_ap, s_info) values('사자후', 8, 'debuff', 1, 5, 1, 5, 3, 0, 0,
																										'함성을 질러 적을 겁에 질리게 합니다.  적의 공격력 ?과 방어력 ?를  !턴동안 감소시킵니다.');

-- Archer
insert into skill(s_name, s_category, s_turn, s_valid, c_idx) values('더블 애로우', 'damage', 1, 0, 2);
insert into skill(s_name, s_category, s_turn, s_valid, c_idx) values('포이즌 애로우', 'dot', 1, 5, 2);
insert into skill(s_name, s_category, s_turn, s_valid, c_idx) values('스카이 애로우', 'damage', 1, 0, 2);
insert into skill(s_name, s_category, s_turn, s_valid, c_idx) values('차지드 애로우', 'damage', 4, 0, 2);
insert into skill(s_name, s_category, s_turn, s_valid, c_idx) values('블라인드', 'cc', 1, 1, 2);
insert into skill(s_name, s_category, s_turn, s_valid, c_idx) values('컨퓨전', 'cc', 1, 1, 2);
insert into skill(s_name, s_category, s_turn, s_valid, c_idx) values('닷지 업', 'buff', 1, 5, 2);
insert into skill(s_name, s_category, s_turn, s_valid, c_idx) values('크리티컬 업', 'buff', 1, 5, 2);

-- Wizard
insert into skill(s_name, s_category, s_turn, s_valid, c_idx) values('아이스볼트', 'damage', 1, 0, 3);
insert into skill(s_name, s_category, s_turn, s_valid, c_idx) values('썬더볼트', 'damage', 1, 0, 3);
insert into skill(s_name, s_category, s_turn, s_valid, c_idx) values('메테오', 'dot', 1, 5, 3);
insert into skill(s_name, s_category, s_turn, s_valid, c_idx) values('리퍼', 'damage', 4, 0, 3);
insert into skill(s_name, s_category, s_turn, s_valid, c_idx) values('쉐도우 실드', 'buff', 1, 3, 3);
insert into skill(s_name, s_category, s_turn, s_valid, c_idx) values('트랜스포트', 'damage', 1, 1, 3);
insert into skill(s_name, s_category, s_turn, s_valid, c_idx) values('프로즌', 'cc', 1, 1, 3);
insert into skill(s_name, s_category, s_turn, s_valid, c_idx) values('큐어링', 'buff', 1, 1, 3);

				
----------------------------------------[ item ]------------------------------------------


insert into item(i_class, i_category, i_name, i_level) values('공용', '머리', '래더 투구', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('공용', '머리', '클로스 투구', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('공용', '머리', '브론즈 투구', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('공용', '머리', '라이트 투구', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('공용', '머리', '고블린 투구', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('공용', '머리', '카오스 투구', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('공용', '머리', '아이언 헬름', 		'고급');
insert into item(i_class, i_category, i_name, i_level) values('공용', '머리', '실버 헬름', 		'고급');
insert into item(i_class, i_category, i_name, i_level) values('공용', '머리', '헤비 헬름', 		'고급');
insert into item(i_class, i_category, i_name, i_level) values('공용', '머리', '롱 헬름', 		'고급');
insert into item(i_class, i_category, i_name, i_level) values('공용', '머리', '골든 크라운', 		'희귀');
insert into item(i_class, i_category, i_name, i_level) values('공용', '머리', '다이아몬드 크라운', 	'희귀');

insert into item(i_class, i_category, i_name, i_level) values('공용', '상체', '래더 아머', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('공용', '상체', '클로스 아머', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('공용', '상체', '코튼 아머', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('공용', '상체', '라이트 아머', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('공용', '상체', '스몰 아머', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('공용', '상체', '쇼트 아머', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('공용', '상체', '아이언 체인메일', 	'고급');
insert into item(i_class, i_category, i_name, i_level) values('공용', '상체', '실버 체인메일', 	'고급');
insert into item(i_class, i_category, i_name, i_level) values('공용', '상체', '헤비 체인메일', 	'고급');
insert into item(i_class, i_category, i_name, i_level) values('공용', '상체', '롱 체인메일', 		'고급');
insert into item(i_class, i_category, i_name, i_level) values('공용', '상체', '골드 플레이트', 	'희귀');
insert into item(i_class, i_category, i_name, i_level) values('공용', '상체', '다이아몬드 플레이트',	'희귀');

insert into item(i_class, i_category, i_name, i_level) values('공용', '하체', '래더 팬츠', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('공용', '하체', '클로스 팬츠', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('공용', '하체', '코튼 팬츠', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('공용', '하체', '라이트 팬츠', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('공용', '하체', '스몰 팬츠', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('공용', '하체', '쇼트 팬츠', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('공용', '하체', '아이언 팬츠', 		'고급');
insert into item(i_class, i_category, i_name, i_level) values('공용', '하체', '실버 팬츠', 		'고급');
insert into item(i_class, i_category, i_name, i_level) values('공용', '하체', '헤비 팬츠', 		'고급');
insert into item(i_class, i_category, i_name, i_level) values('공용', '하체', '롱 팬츠', 		'고급');
insert into item(i_class, i_category, i_name, i_level) values('공용', '하체', '골드 팬츠', 		'희귀');
insert into item(i_class, i_category, i_name, i_level) values('공용', '하체', '다이아몬드 팬츠', 	'희귀');

insert into item(i_class, i_category, i_name, i_level) values('전사', '무기', '삽', 				'일반');
insert into item(i_class, i_category, i_name, i_level) values('전사', '무기', '목검', 			'일반');
insert into item(i_class, i_category, i_name, i_level) values('전사', '무기', '장검', 			'일반');
insert into item(i_class, i_category, i_name, i_level) values('전사', '무기', '곡괭이', 			'일반');
insert into item(i_class, i_category, i_name, i_level) values('전사', '무기', '목도', 			'일반');
insert into item(i_class, i_category, i_name, i_level) values('전사', '무기', '태도', 			'일반');
insert into item(i_class, i_category, i_name, i_level) values('전사', '무기', '용창', 			'고급');
insert into item(i_class, i_category, i_name, i_level) values('전사', '무기', '데스사이드', 	'고급');
insert into item(i_class, i_category, i_name, i_level) values('전사', '무기', '금도끼', 			'고급');
insert into item(i_class, i_category, i_name, i_level) values('전사', '무기', '토마호크', 		'고급');
insert into item(i_class, i_category, i_name, i_level) values('전사', '무기', '화룡검', 			'희귀');
insert into item(i_class, i_category, i_name, i_level) values('전사', '무기', '지옥참마도', 	'희귀');

insert into item(i_class, i_category, i_name, i_level) values('궁수', '무기', '라이트 보우', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('궁수', '무기', '배틀 보우', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('궁수', '무기', '이글 크로스 보우', 	'일반');
insert into item(i_class, i_category, i_name, i_level) values('궁수', '무기', '라이트 크로스 보우', '일반');
insert into item(i_class, i_category, i_name, i_level) values('궁수', '무기', '실버 보우', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('궁수', '무기', '배틀 크로스 보우', 	'일반');
insert into item(i_class, i_category, i_name, i_level) values('궁수', '무기', '헤비 보우', 		'고급');
insert into item(i_class, i_category, i_name, i_level) values('궁수', '무기', '윈스 포스 보우', 	'고급');
insert into item(i_class, i_category, i_name, i_level) values('궁수', '무기', '헤브 크로스 보우', 	'고급');
insert into item(i_class, i_category, i_name, i_level) values('궁수', '무기', '드래곤 크로스 보우', '고급');
insert into item(i_class, i_category, i_name, i_level) values('궁수', '무기', '레전드 보우', 		'희귀');
insert into item(i_class, i_category, i_name, i_level) values('궁수', '무기', '레전드 크로스 보우', '희귀');

insert into item(i_class, i_category, i_name, i_level) values('법사', '무기', '우드 완드', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('법사', '무기', '실리 완드', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('법사', '무기', '덜 완드', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('법사', '무기', '사파이어 스태프', 	'일반');
insert into item(i_class, i_category, i_name, i_level) values('법사', '무기', '위저드 스태프', 	'일반');
insert into item(i_class, i_category, i_name, i_level) values('법사', '무기', '페탈 스태프', 		'일반');
insert into item(i_class, i_category, i_name, i_level) values('법사', '무기', '글로우 오브', 		'고급');
insert into item(i_class, i_category, i_name, i_level) values('법사', '무기', '위저드 오브', 		'고급');
insert into item(i_class, i_category, i_name, i_level) values('법사', '무기', '백의의 서', 		'고급');
insert into item(i_class, i_category, i_name, i_level) values('법사', '무기', '흑마법의 서', 		'고급');
insert into item(i_class, i_category, i_name, i_level) values('법사', '무기', '유니언 완드', 		'희귀');
insert into item(i_class, i_category, i_name, i_level) values('법사', '무기', '유니언 스태프', 	'희귀');

insert into item(i_class, i_category, i_name, i_level) values('공용', '물약', '힐포션', 			'일반');
insert into item(i_class, i_category, i_name, i_level) values('공용', '물약', '엘릭서', 			'고급');







----------------------------------------[ mop ]------------------------------------------
--Stage 1
insert into mop(m_name, m_hp, m_ad, m_armor, m_level, stage_val) values('몹1', 200, 10, 0, '일반', 1);
insert into mop(m_name, m_hp, m_ad, m_armor, m_level, stage_val) values('몹2', 300, 15, 5, '일반', 2);
insert into mop(m_name, m_hp, m_ad, m_armor, m_level, stage_val) values('몹3', 400, 20, 10, '네임드', 3);
insert into mop(m_name, m_hp, m_ad, m_armor, m_level, stage_val) values('몹4', 500, 25, 15, '중간보스', 4);

--Stage2
insert into mop(m_name, m_hp, m_ad, m_armor, m_level, stage_val) values('몹5', 600, 30, 20, '네임드', 5);
insert into mop(m_name, m_hp, m_ad, m_armor, m_level, stage_val) values('몹6', 600, 40, 20, '네임드', 6);
insert into mop(m_name, m_hp, m_ad, m_armor, m_level, stage_val) values('몹7', 600, 50, 20, '네임드', 7);
insert into mop(m_name, m_hp, m_ad, m_armor, m_level, stage_val) values('몹8', 600, 60, 20, '네임드', 8);

--Stage3
insert into mop(m_name, m_hp, m_ad, m_armor, m_level, stage_val) values('몹9', 400, 10, 50, '일반', 9);
insert into mop(m_name, m_hp, m_ad, m_armor, m_level, stage_val) values('몹10', 600, 60, 20, '네임드', 10);
insert into mop(m_name, m_hp, m_ad, m_armor, m_level, stage_val) values('몹11', 1000, 25, 25, '중간보스', 11);
insert into mop(m_name, m_hp, m_ad, m_armor, m_level, stage_val) values('몹12', 800, 60, 50, '보스', 12);
--------------------------------------[ dungeon ]----------------------------------------



-----------------------------------[ dungeon_appr ]-----------------------------------------











*/