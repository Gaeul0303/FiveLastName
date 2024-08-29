package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.PurchaseOrderDTO;

@Repository
public interface PurchaseOrderDAO {

	List<PurchaseOrderDTO> poAllSelect();
	
	PurchaseOrderDTO poSelect(int po_id);
	
}
