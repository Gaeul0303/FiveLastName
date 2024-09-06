package kr.co.FiveLastName.service;

import java.util.List;

import kr.co.FiveLastName.domain.ProgressInspectionDTO;

public interface ProgressInspectionService {
	
	List<ProgressInspectionDTO> piAllSelect();
	
	ProgressInspectionDTO piSelect(int pi_id);

	ProgressInspectionDTO piSearch(int ss_id);
	
}
