package kr.co.FiveLastName.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.PrintPODTO;
import kr.co.FiveLastName.domain.ProgressInspectionDTO;
import kr.co.FiveLastName.domain.ProgressInspectionRecordDTO;
import kr.co.FiveLastName.domain.PurchaseOrderDTO;
import kr.co.FiveLastName.persistence.ProgressInspectionDAO;
import kr.co.FiveLastName.persistence.PurchaseOrderDAO;

@Service
public class ProgressInspectionServiceImpl implements ProgressInspectionService{
	
	@Inject
	ProgressInspectionDAO dao;

	@Override
	public List<ProgressInspectionDTO> piAllSelect() {
		return dao.piAllSelect();
	}
	
	@Override
	public ProgressInspectionDTO piSelect(int pi_id) {
		return dao.piSelect(pi_id);
	}

	@Override
	public ProgressInspectionDTO piSearch(int ss_id) {
		return dao.piSearch(ss_id);
	}
	

	@Override
	public int pirSearch(int ss_id) {
		System.out.println("Searvice pirSearch 입니다. ss_id = " + ss_id);
		return dao.pirSearch(ss_id);
	}
	
	@Override
	public List<ProgressInspectionRecordDTO> piRecord(int ss_id) {
		return dao.piRecord(ss_id);
	}

	@Override
	public ProgressInspectionRecordDTO piRecordOne(int ss_id) {
		return dao.piRecordOne(ss_id);
	}



}
