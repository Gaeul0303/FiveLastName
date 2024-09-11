package kr.co.FiveLastName.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.PrintPODTO;
import kr.co.FiveLastName.domain.ProcurementPlanRegistrationDTO;
import kr.co.FiveLastName.domain.PurchaseOrderDTO;
import kr.co.FiveLastName.persistence.PurchaseOrderDAO;

@Service
public class PurchaseOrderServiceImpl implements PurchaseOrderService{
	
	@Inject
	PurchaseOrderDAO dao;

	@Override
	public List<PrintPODTO> poAllSelect() {
		return dao.poAllSelect();
	}
	
	@Override
	public PrintPODTO poSelect(int po_id) {
		return dao.poSelect(po_id);
	}

	@Override
	public PrintPODTO poPrev(int ppr_id) {
		return dao.poPrev(ppr_id);
	}

	@Override
	public PrintPODTO poInsert(int ppr_id) {
		return dao.poInsert(ppr_id);
	}

	@Override
	public ProcurementPlanRegistrationDTO poComplete(int ppr_id) {
		return dao.poComplete(ppr_id);
	}

	@Override
	public PrintPODTO poSearch(int ppr_id) {
		return dao.poSearch(ppr_id);
	}

	@Override
	public int pprCount() {
		return dao.pprCount();
	}

	@Override
	public List<ProcurementPlanRegistrationDTO> pprList() {
		return dao.pprList();
	}

	@Override
	public ProcurementPlanRegistrationDTO pprOne() {
		return dao.pprOne();
	}

	@Override
	public PrintPODTO ppr() {
		return dao.ppr();
	}

	@Override
	public List<PrintPODTO> pprAll() {
		return dao.pprAll();
	}

	

}
