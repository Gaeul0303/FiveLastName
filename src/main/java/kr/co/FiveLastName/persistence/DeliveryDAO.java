package kr.co.FiveLastName.persistence;

import java.util.List;

import kr.co.FiveLastName.domain.InventoryDTO;
import kr.co.FiveLastName.domain.InventoryDeliveryManagementDTO;

public interface DeliveryDAO {

	List<InventoryDTO> inventoryList();
	
	InventoryDTO inventorySelectList(int in_id);
	
	int inventoryUpdate(InventoryDTO inven);
	
	int idmInsert(InventoryDeliveryManagementDTO idm);
	
	List<InventoryDeliveryManagementDTO> idmReportList();
}
