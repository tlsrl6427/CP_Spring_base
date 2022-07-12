package dao;

import org.apache.ibatis.session.SqlSession;

public class MopDaoImpl implements MopDao {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
