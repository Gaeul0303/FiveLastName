package kr.co.FiveLastName.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.DeliveryDTO;
import kr.co.FiveLastName.domain.InventoryDTO;
import kr.co.FiveLastName.domain.InventoryDeliveryManagementDTO;
import kr.co.FiveLastName.persistence.DeliveryDAO;

@Service

public class DeliveryServiceImpl implements DeliveryService{

	@Autowired
	DeliveryDAO dao;
	
	@Override
	public List<DeliveryDTO> inventoryList() {
		// TODO Auto-generated method stub
		return dao.inventoryList();
	}

	@Override
	public DeliveryDTO inventorySelectList(int in_id) {
		// TODO Auto-generated method stub
		return dao.inventorySelectList(in_id);
	}

	@Override
	public int inventoryUpdate(DeliveryDTO inven) {
		// TODO Auto-generated method stub
		return dao.inventoryUpdate(inven);
	}

	@Override
	public int idmInsert(DeliveryDTO idm) {
		// TODO Auto-generated method stub
		return dao.idmInsert(idm);
	}

	@Override
	public List<DeliveryDTO> idmReportList() {
		// TODO Auto-generated method stub
		return dao.idmReportList();
	}



}
