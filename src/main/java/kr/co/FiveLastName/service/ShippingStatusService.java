package kr.co.FiveLastName.service;

import java.util.List;

import kr.co.FiveLastName.domain.ShippingStatusDTO;

public interface ShippingStatusService {

	List<ShippingStatusDTO> selectAllShippingStatus();
	
	ShippingStatusDTO selectShippingStatus(int ss_id);
	
}
