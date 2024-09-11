package kr.co.FiveLastName.persistence;

import java.util.List;

import kr.co.FiveLastName.domain.ReceivingInspectionDTO;

public interface ReceivingInspectionDAO {

//	조회
	public List<ReceivingInspectionDTO> ri_list();
	
//	상세조회
	public ReceivingInspectionDTO ri_selectOne(int ri_id);
	
//	등록
	public int ri_insert(ReceivingInspectionDTO riDTO);
	
//	수정
	public int ri_update(ReceivingInspectionDTO riDTO);
	
}
