package kr.co.FiveLastName.service;

import java.util.List;

import kr.co.FiveLastName.domain.PartnerDTO;
import kr.co.FiveLastName.domain.PrintPODTO;
import kr.co.FiveLastName.domain.ProcurementPlanRegistrationDTO;
import kr.co.FiveLastName.domain.ProgressInspectionDTO;
import kr.co.FiveLastName.domain.ProgressInspectionRecordDTO;
import kr.co.FiveLastName.domain.ShippingStatusDTO;
import kr.co.FiveLastName.domain.StaffDTO;

public interface ProgressInspectionService {
	
	List<ProgressInspectionDTO> piAllSelect();
	
	ProgressInspectionDTO piSelect(int pi_id);
	
	ProgressInspectionDTO piSearch(int ss_id);
	
	int pirSearch(int ss_id);
	
	List<ProgressInspectionRecordDTO> piRecord(int ss_id);
	
	ProgressInspectionRecordDTO piRecordOne(int ss_id);
	
	void piInsert(ProgressInspectionDTO pi);
	
	void piUpdate(ProgressInspectionDTO pi);
	
	void insertRecord(ProgressInspectionDTO pi);
	
	void ssComplete(int ss_id);
	
	StaffDTO stSelect(String st_id);
	
	PartnerDTO paSelect(int pa_id);
	
}
