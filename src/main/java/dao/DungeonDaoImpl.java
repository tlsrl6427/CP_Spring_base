package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.DungeonVo;

public class DungeonDaoImpl implements DungeonDao {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<DungeonVo> selectList() {

		return sqlSession.selectList("dungeon.dungeon_list");
	}

}
