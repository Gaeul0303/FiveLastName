package kr.co.FiveLastName.persistence;

import java.util.List;

import kr.co.FiveLastName.domain.ShippingStatementDTO;

public interface DAO {
//	출하명세서 조회
	public List<ShippingStatementDTO> shList();
	

	
	
}
