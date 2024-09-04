package kr.co.FiveLastName.service;

import java.util.List;

import kr.co.FiveLastName.domain.ReceivingInspectionDTO;

public interface ReceivingInspectionService {
	
//	조회
	public List<ReceivingInspectionDTO> ri_list();
	
//	상세조회
	public ReceivingInspectionDTO ri_selectOne(int ri_id);
	
//	등록
	public void ri_insert(ReceivingInspectionDTO riDTO);
	
//	수정
	public void ri_update(ReceivingInspectionDTO riDTO);
}
