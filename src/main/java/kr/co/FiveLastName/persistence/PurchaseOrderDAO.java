package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.PrintPODTO;
import kr.co.FiveLastName.domain.PurchaseOrderDTO;

public interface PurchaseOrderDAO {
	
	List<PrintPODTO> poAllSelect(); // 구매발주서리스트에 필요한 정보 조회.

	PrintPODTO poSelect(int po_id);	// 구매발주서에 필요한 정보 조회.
	
}
