package kr.co.FiveLastName.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.ProcurmentPlanDTO;
import kr.co.FiveLastName.persistence.PpDAO;

@Service
public class PpServiceImpl implements PpService{

	@Inject
	private PpDAO dao;

	@Override
	public void pp_insert(ProcurmentPlanDTO dto) {
		// TODO Auto-generated method stub
		dao.pp_insert(dto);
		
	}

	@Override
	public List<ProcurmentPlanDTO> pp_selectAll() {
		// TODO Auto-generated method stub
		return dao.pp_selectAll();
	}
	
	
}
