package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ItemVo;

public class ItemDaoImpl implements ItemDao {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<ItemVo> selectList() {

		return sqlSession.selectList("item.item_list");
	}

	@Override
	public ItemVo selectOne(int i_idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("item.item_one", i_idx);
	}

	@Override
	public List<ItemVo> selectList_stage(String i_level) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("item.item_list_stage",  i_level);
	}
	
	

}
