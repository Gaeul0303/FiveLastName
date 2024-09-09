package kr.co.FiveLastName.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.EstimateDTO;

@Service
public interface EsimateService {
	List<EstimateDTO> list();
	
	void register(EstimateDTO dto);
	
	List<EstimateDTO> esOne(int pp_id);
	
	EstimateDTO select(int es_id);
	
	void modify(EstimateDTO dto);
}
