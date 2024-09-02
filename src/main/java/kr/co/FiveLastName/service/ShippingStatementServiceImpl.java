package kr.co.FiveLastName.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.FiveLastName.domain.ShippingStatementDTO;
import kr.co.FiveLastName.persistence.ShippingStatementDAO;

@Service
public class ShippingStatementServiceImpl implements ShippingStatementService{
	@Inject
	ShippingStatementDAO shDAO;
	
	@Override
	public int sh_insert(ShippingStatementDTO shDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ShippingStatementDTO> sh_List() {
		// 출하명세서 조회
		return shDAO.sh_List();
	}

	@Override
	public ShippingStatementDTO sh_selectOne(int sh_id) {
		// 출하명세서 상세 조회
		return shDAO.sh_selectOne(sh_id);
	}

	@Override
	public int sh_update(ShippingStatementDTO shDTO) {
		// TODO Auto-generated method stub
		return 0;
	}


}
