package kr.co.FiveLastName.persistence;

import java.util.List;

import kr.co.FiveLastName.domain.ShippingStatementDTO;

public interface ShippingStatementDAO {
//	출하명세서 전체 조회
	public List<ShippingStatementDTO> shList();
	
//	출하명세서 선택 조회
	public ShippingStatementDTO shSelectOne(int sh_id);
	
// 출하명세서 추가
	int shInsert(ShippingStatementDTO shDTO);
	
// 출하명세서 삭제
	int shDelete(int sh_id);
}
