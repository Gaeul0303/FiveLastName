package kr.co.FiveLastName.service;

import java.util.List;

import kr.co.FiveLastName.domain.PartnerDTO;
import kr.co.FiveLastName.domain.ProgressInspectionDTO;
import kr.co.FiveLastName.domain.ProgressInspectionRecordDTO;
import kr.co.FiveLastName.domain.ShippingStatusDTO;
import kr.co.FiveLastName.domain.StaffDTO;

public interface ProgressInspectionService {
	
	List<ProgressInspectionDTO> piAllSelect();
	
	ProgressInspectionDTO piSelect(int pi_id);

	ProgressInspectionDTO piSearch(int ss_id);
	
	List<ProgressInspectionRecordDTO> piRecord(int ss_id);
	
	int pirSearch(int ss_id);
	
	ProgressInspectionRecordDTO piRecordOne(int ss_id);
	
	ProgressInspectionDTO piInsert(ProgressInspectionDTO pi);
	
	ProgressInspectionDTO piUpdate(ProgressInspectionDTO pi);
	
	ProgressInspectionRecordDTO insertRecord(ProgressInspectionDTO pi);
	
	ShippingStatusDTO ssComplete(int ss_id);
	
	StaffDTO stSelect(int st_id);
	
	PartnerDTO paSelect(int pa_id);
	
}
