package kr.co.FiveLastName.persistence;

import java.util.List;

import kr.co.FiveLastName.domain.ProcurmentPlanDTO;

public interface PpDAO {
	
	//조달 계획 조회
	public List<ProcurmentPlanDTO> pp_selectAll();
	
	//조달 계획 등록
	public void pp_insert(ProcurmentPlanDTO dto);
}
