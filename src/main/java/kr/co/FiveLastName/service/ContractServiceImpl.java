package kr.co.FiveLastName.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.ContractDTO;
import kr.co.FiveLastName.persistence.ContractDAO;

@Service
public class ContractServiceImpl implements ContractService {

	@Inject
	private ContractDAO dao;
	
	@Override
	public void register(ContractDTO dto) {
		// TODO Auto-generated method stub
		dao.register(dto);
	}

	@Override
	public List<ContractDTO> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public ContractDTO coOne(int co_id) {
		// TODO Auto-generated method stub
		return dao.coOne(co_id);
	}

	@Override
	public void modify(ContractDTO dto) {
		// TODO Auto-generated method stub
		dao.update(dto);
	}

	
}
