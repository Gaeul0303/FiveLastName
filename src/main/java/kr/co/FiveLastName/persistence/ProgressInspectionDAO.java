package kr.co.FiveLastName.persistence;

import java.util.List;

import kr.co.FiveLastName.domain.ProgressInspectionDTO;

public interface ProgressInspectionDAO {
	
	List<ProgressInspectionDTO> piAllSelect();
	
	ProgressInspectionDTO piSelect(int pi_id);
	
	ProgressInspectionDTO piSearch(int ss_id);
	
}
