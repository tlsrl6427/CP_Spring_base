package dao;

import org.apache.ibatis.session.SqlSession;

public class ShopDaoImpl implements ShopDao {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
