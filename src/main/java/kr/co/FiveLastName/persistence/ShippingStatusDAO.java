package kr.co.FiveLastName.persistence;

import java.util.List;

import kr.co.FiveLastName.domain.PrintPODTO;
import kr.co.FiveLastName.domain.ProcurementPlanRegistrationDTO;
import kr.co.FiveLastName.domain.ShippingStatusDTO;

public interface ShippingStatusDAO {

	List<ShippingStatusDTO> selectAllShippingStatus();
	
	ShippingStatusDTO selectShippingStatus(int ss_id);
	
	ShippingStatusDTO search(int po_id);
	
	void insert(ShippingStatusDTO ss);
	
	void update(ShippingStatusDTO ss);
	
	void complete(int ss_id);
	
	int count(int po_id);
	
	void poComplete(int po_id);
	
}
