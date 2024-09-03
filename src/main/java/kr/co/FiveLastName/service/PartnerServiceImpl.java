package kr.co.FiveLastName.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import kr.co.FiveLastName.domain.PartnerDTO;
import kr.co.FiveLastName.persistence.PartnerDAO;


@Service
public class PartnerServiceImpl implements PartnerService{

	@Inject
	private PartnerDAO dao;
	

	@Override
	public List<PartnerDTO> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	
	

	

	
}
