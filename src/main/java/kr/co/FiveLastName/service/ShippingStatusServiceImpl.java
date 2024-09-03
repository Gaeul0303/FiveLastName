package kr.co.FiveLastName.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

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
	
	

	
}
