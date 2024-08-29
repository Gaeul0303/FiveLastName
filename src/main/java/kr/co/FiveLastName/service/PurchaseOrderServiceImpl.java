package kr.co.FiveLastName.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.PurchaseOrderDTO;
import kr.co.FiveLastName.persistence.PurchaseOrderDAO;

@Service
public class PurchaseOrderServiceImpl implements PurchaseOrderService{
	
	@Inject
	PurchaseOrderDAO dao;

	@Override
	public List<PurchaseOrderDTO> poAllSelect() {
		return dao.poAllSelect();
	}

	@Override
	public PurchaseOrderDTO poSelect(int po_id) {
		return dao.poSelect(po_id);
	}
	
}
