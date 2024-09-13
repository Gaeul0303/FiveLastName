package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.PrintPODTO;
import kr.co.FiveLastName.domain.ProcurementPlanRegistrationDTO;
import kr.co.FiveLastName.domain.ShippingStatusDTO;

@Repository
public class ShippingStatusDAOImpl implements ShippingStatusDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "kr.co.FiveLastName.shippingStatusMapper";
	
	@Override
	public List<ShippingStatusDTO> selectAllShippingStatus() {
		return sqlSession.selectList(namespace+".selectAllShippingStatus");
	}


	@Override
	public ShippingStatusDTO selectShippingStatus(int ss_id) {
		return sqlSession.selectOne(namespace+".selectShippingStatus", ss_id);
	}


	@Override
	public ShippingStatusDTO search(int po_id) {
		return sqlSession.selectOne(namespace+".search", po_id);
	}


	@Override
	public void insert(ShippingStatusDTO ss) {
		sqlSession.selectOne(namespace+".ssInsert", ss);
	}


	@Override
	public void update(ShippingStatusDTO ss) {
		sqlSession.selectOne(namespace+".ssUpdate", ss);
	}


	@Override
	public void complete(int ss_id) {
		sqlSession.selectOne(namespace+".ssComplete", ss_id);
	}


	@Override
	public int count(int po_id) {
		return sqlSession.selectOne(namespace+".count",po_id);
	}


	@Override
	public void poComplete(int po_id) {
		sqlSession.selectOne(namespace+".poComplete",po_id);
	}

}
