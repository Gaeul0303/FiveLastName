package kr.co.FiveLastName.persistence;

import java.util.List;

import kr.co.FiveLastName.domain.DeliveryDTO;

public interface DeliveryDAO {

	List<DeliveryDTO> inventoryList();
	
	DeliveryDTO inventorySelectList(int in_id);
	
	int inventoryUpdate(DeliveryDTO inven);
	
	int idmInsert(DeliveryDTO idm);
	
	List<DeliveryDTO> idmReportList();
}
