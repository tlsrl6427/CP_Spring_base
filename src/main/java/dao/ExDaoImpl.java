package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ExVo;

public class ExDaoImpl implements ExDao {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<ExVo> selectList() {

		return sqlSession.selectList("ex.ex_list");
	}

}
