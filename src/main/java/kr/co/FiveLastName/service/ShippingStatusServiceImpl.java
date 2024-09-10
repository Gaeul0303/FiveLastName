package kr.co.FiveLastName.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.PrintPODTO;
import kr.co.FiveLastName.domain.ProcurementPlanRegistrationDTO;
import kr.co.FiveLastName.domain.ShippingStatusDTO;
import kr.co.FiveLastName.persistence.ShippingStatusDAO;

@Service
public class ShippingStatusServiceImpl implements ShippingStatusService{
	
	@Inject
	private ShippingStatusDAO dao;

	@Override
	public List<ShippingStatusDTO> selectAllShippingStatus() {
		return dao.selectAllShippingStatus();
	}

	@Override
	public ShippingStatusDTO selectShippingStatus(int ss_id) {
		return dao.selectShippingStatus(ss_id);
	}

	@Override
	public ShippingStatusDTO search(int po_id) {
		return dao.search(po_id);
	}

	@Override
	public ShippingStatusDTO insert(ShippingStatusDTO ss) {
		return dao.insert(ss);
	}

	@Override
	public ShippingStatusDTO update(ShippingStatusDTO ss) {
		return dao.update(ss);
	}

	@Override
	public ShippingStatusDTO complete(int ss_id) {
		return dao.complete(ss_id);
	}

	@Override
	public int count(int po_id) {
		return dao.count(po_id);
	}

	@Override
	public PrintPODTO poComplete(int po_id) {
		return dao.poComplete(po_id);
	}
	

	
}
