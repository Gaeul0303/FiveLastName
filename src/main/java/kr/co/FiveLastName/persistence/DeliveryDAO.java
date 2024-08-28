package kr.co.FiveLastName.persistence;

import java.util.List;

import kr.co.FiveLastName.domain.InventoryDTO;
import kr.co.FiveLastName.domain.InventoryDeliveryManagementDTO;

public interface DeliveryDAO {

List<InventoryDeliveryManagementDTO> idmList();
	
	InventoryDeliveryManagementDTO idmSelectList(int in_id);
	
	int idmInsert(InventoryDeliveryManagementDTO idm);
	
	int inventoryUpdate(InventoryDTO inven);
	
	InventoryDTO inventorySelectList(int in_id);
	
	List<InventoryDTO> inventoryPriceList();
	
	InventoryDeliveryManagementDTO idmReportSelectList(int in_id);
	
	List<InventoryDeliveryManagementDTO> idmReportList();
}
