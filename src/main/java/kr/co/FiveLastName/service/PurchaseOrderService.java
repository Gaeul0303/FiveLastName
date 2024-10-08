package kr.co.FiveLastName.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.PrintPODTO;
import kr.co.FiveLastName.domain.ProcurementPlanRegistrationDTO;
import kr.co.FiveLastName.domain.PurchaseOrderDTO;

@Repository
public interface PurchaseOrderService {

	List<PrintPODTO> poAllSelect(); // 구매발주서리스트에 필요한 정보 조회.

	PrintPODTO poSelect(int po_id);	// 생성된 구매발주서 조회.
	
	PrintPODTO poPrev(int ppr_id);	//	구매발주서 미리보기.
	
	void poInsert(int ppr_id);	//	구매발주서 생성하기.
	
	void poComplete(int ppr_id); // 구매발주서 발행, ppr 구매발주서 발행현황 바꾸기.
	
	PrintPODTO poSearch(int ppr_id);	//	조달계획등록 id로 구매발주서 찾기.
	
	int pprCount();
	
	List<ProcurementPlanRegistrationDTO> pprList();
	
	ProcurementPlanRegistrationDTO pprOne();
	
	PrintPODTO ppr();
	
	List<PrintPODTO> pprAll();
	
}
