package kr.co.FiveLastName.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.EstimateDTO;




@Repository
public interface EstimateDAO {
	List<EstimateDTO> list();
	
	void register(EstimateDTO dto);
	
	List<EstimateDTO> esOne(int pp_id);
	
	EstimateDTO select(int es_id);
	
	void update(EstimateDTO dto);
}
