package dao;

import java.util.List;
import java.util.Map;

import vo.ItemVo;

public interface ItemDao {

   public List<ItemVo> selectList();
   public ItemVo selectOne(int i_idx);
   
   public List<ItemVo> selectList_stage(Map map);
}