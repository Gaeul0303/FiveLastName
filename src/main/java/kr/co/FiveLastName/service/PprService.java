package kr.co.FiveLastName.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.ProcurementPlanRegistrationDTO;

@Service
public interface PprService {
	
	//조달 계획 등록 전체 조회
	List<ProcurementPlanRegistrationDTO> ppr_selectAll();

	//조달 계획 등록(계약 완료건)
	public void ppr_insert(ProcurementPlanRegistrationDTO dto);
	
	//조달 상세 조회
		ProcurementPlanRegistrationDTO ppr_selectOne(int ppr_id);
		
	//조달 계획 등록 테이블 수정	
	public int ppr_update(ProcurementPlanRegistrationDTO dto);
}
