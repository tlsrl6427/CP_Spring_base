package dao;

import java.util.List;

import vo.CharacterVo;

public interface CharacterDao {
	
	// Character 전체 조회
	public List<CharacterVo> selectList();
	
	public CharacterVo selectOne(int c_idx);

}
