package kr.co.FiveLastName.service;

import java.util.List;

import kr.co.FiveLastName.domain.DeliveryDTO;

public interface DeliveryService {
	
	List<DeliveryDTO> inventoryList();
	
	DeliveryDTO inventorySelect(int in_id);
	
	int inventoryUpdate(DeliveryDTO dto);
	
	int idmInsert(DeliveryDTO dto);
	
	List<DeliveryDTO> idmReportList();
}
