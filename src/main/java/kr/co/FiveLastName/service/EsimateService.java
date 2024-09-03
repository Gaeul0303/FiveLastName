package kr.co.FiveLastName.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.EstimateDTO;

@Service
public interface EsimateService {
	List<EstimateDTO> list();
	
	void register(EstimateDTO dto);
	
	EstimateDTO esOne(int es_id);
	
	void modify(EstimateDTO dto);
}
