package kr.co.FiveLastName.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.PurchaseOrderDTO;

@Repository
public interface PurchaseOrderService {

	List<PurchaseOrderDTO> poAllSelect();
	
	PurchaseOrderDTO poSelect(int po_id);
	
}
