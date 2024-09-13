package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.PrintPODTO;
import kr.co.FiveLastName.domain.ProcurementPlanRegistrationDTO;
import kr.co.FiveLastName.domain.PurchaseOrderDTO;

@Repository
public class PurchaseOrderDAOImpl implements PurchaseOrderDAO{
	
	@Inject
	SqlSession SqlSession;
	private static String namespace = "kr.co.FiveLastName.purchaseOrderMapper";
	

	@Override
	public List<PrintPODTO> poAllSelect() {
		return SqlSession.selectList(namespace+".poAllSelect");
	}
	@Override
	public PrintPODTO poSelect(int po_id) {
		return SqlSession.selectOne(namespace+".poSelect", po_id);
	}
	@Override
	public PrintPODTO poPrev(int ppr_id) {
		return SqlSession.selectOne(namespace+".poPrev", ppr_id);
	}
	@Override
	public void poInsert(int ppr_id) {
		SqlSession.selectOne(namespace+".poInsert", ppr_id);
	}
	@Override
	public void poComplete(int ppr_id) {
		SqlSession.selectOne(namespace+".poComplete",ppr_id);
	}
	@Override
	public PrintPODTO poSearch(int ppr_id) {
		return SqlSession.selectOne(namespace+".poSearch",ppr_id);
	}
	@Override
	public int pprCount() {
		return SqlSession.selectOne(namespace+".pprCount");
	}
	@Override
	public List<ProcurementPlanRegistrationDTO> pprList() {
		return SqlSession.selectList(namespace+".pprSearch");
	}
	@Override
	public ProcurementPlanRegistrationDTO pprOne() {
		return SqlSession.selectOne(namespace+".pprSearch");
	}

	@Override
	public PrintPODTO ppr() {
		return SqlSession.selectOne(namespace+".pprAll");
	}
	@Override
	public List<PrintPODTO> pprAll() {
		return SqlSession.selectList(namespace+".pprAll");
	}
	
	
	
}
