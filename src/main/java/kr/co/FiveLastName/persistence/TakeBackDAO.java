package kr.co.FiveLastName.persistence;

import java.util.List;

import kr.co.FiveLastName.domain.TakeBackDTO;

public interface TakeBackDAO {
//	반품 조회
	public List<TakeBackDTO> tb_list();
	
//	반품 상세 조회
	public TakeBackDTO tb_selectOne(int tb_code);
	
//	반품 등록
	public int tb_insert(TakeBackDTO tbDTO);
	
//	반품 수정
	public int tb_update(TakeBackDTO tbDTO);
	
//	반품 삭제
	void tb_delete(int tb_code)throws Exception;
}
