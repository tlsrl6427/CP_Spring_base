package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CharacterVo;

public class CharacterDaoImpl implements CharacterDao {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<CharacterVo> selectList() {
		// TODO Auto-generated method stub

		return sqlSession.selectList("character.character_list");
	}

	public CharacterVo selectOne(int c_idx) {

		return sqlSession.selectOne("character.character_one", c_idx);
	}

}
