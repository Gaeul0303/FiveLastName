package kr.co.FiveLastName.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.ProcurmentPlanDTO;

@Service
public interface PpService {
	
	//조달 계획 전체 조회
	List<ProcurmentPlanDTO> pp_selectAll();
	
	//조달 계획 등록
	public void pp_insert(ProcurmentPlanDTO dto);
	
	//조달 상세 조회
	ProcurmentPlanDTO pp_selectOne(int pp_id);
	
	//조달 계획 수정
	public int pp_update(ProcurmentPlanDTO dto);
}
