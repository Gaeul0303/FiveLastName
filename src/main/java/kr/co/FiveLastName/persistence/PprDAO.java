package kr.co.FiveLastName.persistence;

import java.util.List;

import kr.co.FiveLastName.domain.ProcurementPlanRegistrationDTO;

public interface PprDAO {
	
	//조달 계획 등록 테이블 조회
	List<ProcurementPlanRegistrationDTO> ppr_selectAll();

	//조달 계획 등록 테이블 등록(계약 완료건)
	public void ppr_insert(ProcurementPlanRegistrationDTO dto);
	
	//조달 계획 등록 테이블 상세 조회
	ProcurementPlanRegistrationDTO ppr_selectOne(int ppr_id);
	
	//조달 계획 등록 테이블 수정	
	public int ppr_update(ProcurementPlanRegistrationDTO dto);
}
