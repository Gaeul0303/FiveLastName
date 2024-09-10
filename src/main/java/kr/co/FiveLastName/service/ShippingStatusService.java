package kr.co.FiveLastName.service;

import java.util.List;

import kr.co.FiveLastName.domain.PrintPODTO;
import kr.co.FiveLastName.domain.ProcurementPlanRegistrationDTO;
import kr.co.FiveLastName.domain.ShippingStatusDTO;

public interface ShippingStatusService {

	List<ShippingStatusDTO> selectAllShippingStatus();
	
	ShippingStatusDTO selectShippingStatus(int ss_id);
	
	ShippingStatusDTO search(int po_id);
	
	ShippingStatusDTO insert(ShippingStatusDTO ss);
	
	ShippingStatusDTO update(ShippingStatusDTO ss);
	
	ShippingStatusDTO complete(int ss_id);
	
	int count(int po_id);
	
	PrintPODTO poComplete(int po_id);

}
