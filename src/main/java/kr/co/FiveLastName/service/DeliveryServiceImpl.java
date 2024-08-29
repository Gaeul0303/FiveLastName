package kr.co.FiveLastName.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.InventoryDTO;
import kr.co.FiveLastName.domain.InventoryDeliveryManagementDTO;
import kr.co.FiveLastName.persistence.DeliveryDAO;

@Service
<<<<<<< HEAD
<<<<<<<< HEAD:src/main/java/kr/co/FiveLastName/service/ShippingStatementServiceImpl.java
public class ShippingStatementServiceImpl {
========
public class DeliveryServiceImpl {
>>>>>>>> 5c07796cd139c24b6d89599b6191027495ecaad6:src/main/java/kr/co/FiveLastName/service/DeliveryServiceImpl.java
=======
public class DeliveryServiceImpl implements DeliveryService{

	@Autowired
	DeliveryDAO dao;
	
	@Override
	public List<InventoryDTO> inventoryList() {
		// TODO Auto-generated method stub
		return dao.inventoryList();
	}

	@Override
	public InventoryDTO inventorySelectList(int in_id) {
		// TODO Auto-generated method stub
		return dao.inventorySelectList(in_id);
	}

	@Override
	public int inventoryUpdate(InventoryDTO inven) {
		// TODO Auto-generated method stub
		return dao.inventoryUpdate(inven);
	}

	@Override
	public int idmInsert(InventoryDeliveryManagementDTO idm) {
		// TODO Auto-generated method stub
		return dao.idmInsert(idm);
	}

	@Override
	public List<InventoryDeliveryManagementDTO> idmReportList() {
		// TODO Auto-generated method stub
		return dao.idmReportList();
	}

	
>>>>>>> 287734a74fbd0fb69fd213f5b37495038626bef9

}
