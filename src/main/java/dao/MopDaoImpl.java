package dao;

import org.apache.ibatis.session.SqlSession;

import vo.MopVo;

public class MopDaoImpl implements MopDao {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public MopVo selectOne(int stage_val) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mop.mop_one", stage_val);
	}
	
}
