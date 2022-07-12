package dao;

import org.apache.ibatis.session.SqlSession;

public class Dungeon_InfoDaoImpl implements Dungeon_InfoDao {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

}
