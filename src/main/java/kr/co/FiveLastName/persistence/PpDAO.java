package kr.co.FiveLastName.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.ProcurmentPlanDTO;

@Repository
public interface PpDAO {
	
	//조달 계획 조회
	List<ProcurmentPlanDTO> pp_selectAll();
	
	//조달 계획 등록
	public void pp_insert(ProcurmentPlanDTO dto);
}
