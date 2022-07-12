package dao;

import org.apache.ibatis.session.SqlSession;

import vo.SkillVo;

public class SkillDaoImpl implements SkillDao {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public SkillVo selectOne(int s_idx) {

		return sqlSession.selectOne("skill.skill_one", s_idx);
	}

}
