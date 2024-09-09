package kr.co.FiveLastName.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.ContractDTO;


@Repository
public interface ContractDAO {
	void register(ContractDTO dto);
	
	List<ContractDTO> list();
	
	ContractDTO coOne(int co_id);
	
	void update(ContractDTO dto);
}
