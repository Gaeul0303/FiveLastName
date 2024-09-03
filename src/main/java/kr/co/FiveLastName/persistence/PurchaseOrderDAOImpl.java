package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.PrintPODTO;
import kr.co.FiveLastName.domain.PurchaseOrderDTO;

@Repository
public class PurchaseOrderDAOImpl implements PurchaseOrderDAO{
	
	@Inject
	SqlSession SqlSession;
	private static String namespace = "kr.co.FiveLastName.mapper";
	

	@Override
	public List<PrintPODTO> poAllSelect() {
		return SqlSession.selectList(namespace+".poAllSelect");
	}
	@Override
	public PrintPODTO poSelect(int po_id) {
		return SqlSession.selectOne(namespace+".poSelect", po_id);
	}
	
	
	
}
