package kr.co.FiveLastName.service;

import java.util.List;

import kr.co.FiveLastName.domain.ProgressInspectionDTO;
import kr.co.FiveLastName.domain.ProgressInspectionRecordDTO;

public interface ProgressInspectionService {
	
	List<ProgressInspectionDTO> piAllSelect();
	
	ProgressInspectionDTO piSelect(int pi_id);

	ProgressInspectionDTO piSearch(int ss_id);
	
	List<ProgressInspectionRecordDTO> piRecord(int ss_id);
	
	int pirSearch(int ss_id);
	
	ProgressInspectionRecordDTO piRecordOne(int ss_id);
	
}
