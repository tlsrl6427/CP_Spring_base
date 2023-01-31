/*
----------------------------------------[ user ]------------------------------------------

create table user
(
	u_idx				int,						-- User Index
	u_name				varchar2(100),				-- User Name
	u_id				varchar2(100),				-- User Name
	u_pwd				varchar2(100),				-- User Name
	u_score				int							-- User Score
)

-------------------------------------[ character ]----------------------------------------

create table character_info
(
	c_idx 				int,						-- Character Index					*pk
	c_name 				varchar(30),				-- Character Name
	c_hp				int,						-- Character Health Point
	c_ad				int,						-- Character Attack Damage
	c_ap 				int,						-- Character Ability Power
	c_armor 			int,						-- Character Armor
	c_critical 			int,						-- Character Critical
	c_avd				int,						-- Character Avoidability
	c_auto_attack		varchar(30),				-- Character Auto Attack
	c_p_skill			varchar(30),			-- Character Passive
	c_img				varchar(100),			-- Character Image
	c_auto_attack_img   varchar(100),
	c_p_skill_img       varchar(100)
)

alter table character_info add column c_img varchar(255)
----------------------------------------[ skill ]------------------------------------------

create table skill
(
	s_idx					int auto_increment,					-- Skill Index	(*pk)
	s_name				varchar(30),						-- Skill Name
	s_num				int,								-- Skill Num(몇번째 스킬인지)
	s_category			varchar(30),						-- Skill Category('damage', 'buff', 'cc', 'debuff', 'dot')
	s_turn				int,								-- Skill Turn(쿨타임)
	s_valid				int,								-- Skill Valid(스킬이 적용되는 턴수; 즉발데미지류 0)
	c_idx					int,								-- Character Index(*fk)	
	s_basic_damage int,								-- Skill Basic Damage
	s_add_damage 	int,								-- Skill Additional Damage
	s_coeff_ad 		double,							-- Skill AD coefficient
	s_coeff_ap 		double,							-- Skill AD coefficient
	s_info				varchar(200),					-- Skill Information
	s_img				varchar(200),					-- Skill Image
	PRIMARY KEY (s_idx)
)

alter table
	add constraint fk_skill_c_idx foreign key(c_idx) references character_info(c_idx);


----------------------------------------[ item ]------------------------------------------


create table item
(
	i_idx				int auto_increment,			-- Item Index
	i_class				varchar(30),				-- Item Class('공용', '전사', '궁수', '법사')
	i_category			varchar(30),				-- Item Category('머리', '상체', '하체', '무기', '물약')
	i_name 				varchar(30),				-- Item Name
	i_level				varchar(30),				-- Item Level('일반', '고급', '희귀', '전설')
	i_img				varchar(200),					-- Item Image
	PRIMARY KEY (i_idx)
)

----------------------------------------[ mop ]------------------------------------------

create table mop
(
	m_idx 				int auto_increment,						-- Mop Index
	m_name 				varchar(30),				-- Mop Name
	m_hp 				int,						-- Mop Health Point
	m_ad				int,						-- Mop Attack Damage
	m_armor			int,						-- Mop armor
	m_skill 			varchar(30),				-- Mop Skill
	m_level				varchar(30),		-- Mop Level('일반', '네임드', '중간보스', '보스')
	m_img				varchar(200),					-- Mop Image
	stage_val			int,						--Mop Stage Value(어느 스테이지에서 나오는지)
	PRIMARY KEY (m_idx)
)


--------------------------------------[ dungeon ]----------------------------------------

create table dungeon
(
	d_idx				int,						-- Dungeon Index
	d_name				varchar(30),				-- Dungeon Name
)


-----------------------------------[ dungeon_info ]-----------------------------------------

-- 어떤 던전에 어떤 몹이 나올지의 정보
create table dungeon_info
(
	da_idx				int,						-- Dungeon_Info Index
	d_idx				int,						-- Dungeon Index					*fk
	m_idx				int,						-- Mop Index 						*fk
)













*/