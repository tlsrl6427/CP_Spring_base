package dao;

import vo.SkillVo;

public interface SkillDao {

	// Character 전체 조회
	public SkillVo selectOne(int s_idx);

}
