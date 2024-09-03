package kr.co.FiveLastName.persistence;

import java.util.List;

import kr.co.FiveLastName.domain.ShippingStatusDTO;

public interface ShippingStatusDAO {

	List<ShippingStatusDTO> selectAllShippingStatus();
	
	ShippingStatusDTO selectShippingStatus(int ss_id);
	
}
