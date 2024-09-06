package kr.co.FiveLastName.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.EstimateDTO;
import kr.co.FiveLastName.persistence.EstimateDAO;


@Service
public class EstimateServiceImpl implements EsimateService{

	@Inject
	private EstimateDAO dao;
	

	@Override
	public List<EstimateDTO> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}


	@Override
	public void register(EstimateDTO dto) {
		// TODO Auto-generated method stub
		dao.register(dto);
			
	}


	@Override
	public EstimateDTO esOne(int es_id) {
		// TODO Auto-generated method stub
		return dao.esOne(es_id);
	}


	@Override
	public void modify(EstimateDTO dto) {
		// TODO Auto-generated method stub
		
	}

	
	

	

	
}
