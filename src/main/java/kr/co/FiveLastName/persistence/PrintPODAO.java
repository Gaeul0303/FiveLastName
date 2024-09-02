package kr.co.FiveLastName.persistence;

import java.util.List;

import kr.co.FiveLastName.domain.InventoryDTO;
import kr.co.FiveLastName.domain.InventoryDeliveryManagementDTO;
import kr.co.FiveLastName.domain.PrintPODTO;

public interface PrintPODAO {

	PrintPODTO selectPO();	// 구매발주서에 필요한 정보 조회.
	
	List<PrintPODTO> listPO(); // 구매발주서리스트에 필요한 정보 조회.
	
}
