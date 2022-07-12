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

}
