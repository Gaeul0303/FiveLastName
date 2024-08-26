package kr.co.FiveLastName.service;

import java.util.List;

import kr.co.FiveLastName.domain.InventoryDTO;
import kr.co.FiveLastName.domain.InventoryDeliveryManagementDTO;

public interface DeliveryService {
	
	List<InventoryDTO> inventoryList();
	
	InventoryDTO inventorySelectList(int in_id);
	
	int inventoryInsert(InventoryDTO inven);
	
	int idmUpdate(InventoryDeliveryManagementDTO idm);
	
	InventoryDeliveryManagementDTO idmSelectList(int in_id);
	
	List<InventoryDeliveryManagementDTO> idmPriceList();
	
	InventoryDeliveryManagementDTO idmReportSelectList(int in_id);
	
	List<InventoryDeliveryManagementDTO> idmReportList();
}
