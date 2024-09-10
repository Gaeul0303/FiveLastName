package kr.co.FiveLastName.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.ProcurementPlanRegistrationDTO;
import kr.co.FiveLastName.persistence.PprDAO;

@Service
public class PprServiceImpl implements PprService{

	@Inject
	private PprDAO dao;

	@Override
	public List<ProcurementPlanRegistrationDTO> ppr_selectAll() {
		// TODO Auto-generated method stub
		return dao.ppr_selectAll();
	}

	@Override
	public void ppr_insert(ProcurementPlanRegistrationDTO dto) {
		// TODO Auto-generated method stub
		dao.ppr_insert(dto);
	}

	@Override
	public ProcurementPlanRegistrationDTO ppr_selectOne(int ppr_id) {
		// TODO Auto-generated method stub
		return dao.ppr_selectOne(ppr_id);
	}

	@Override
	public int ppr_update(ProcurementPlanRegistrationDTO dto) {
		// TODO Auto-generated method stub
		return dao.ppr_update(dto);
	}
	
	
	
}
