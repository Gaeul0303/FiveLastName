package kr.co.FiveLastName.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.ContractDTO;
import kr.co.FiveLastName.domain.EstimateDTO;

@Service
public interface ContractService {

	void register(ContractDTO dto);
	
	List<ContractDTO> list();
	
	ContractDTO coOne(int co_id);
	
	void modify(ContractDTO dto);
}
