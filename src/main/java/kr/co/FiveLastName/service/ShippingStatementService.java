package kr.co.FiveLastName.service;

import java.util.List;

import kr.co.FiveLastName.domain.ShippingStatementDTO;

public interface ShippingStatementService {
//	출하명세서 등록
	public int sh_insert(ShippingStatementDTO shDTO);

//	출하명세서 전체 조회
	public List<ShippingStatementDTO> sh_List();

//	출하명세서 상세 조회
	public ShippingStatementDTO sh_selectOne(int sh_id);
	
//	출하명세서 수정
	public int sh_update(ShippingStatementDTO shDTO);

}
