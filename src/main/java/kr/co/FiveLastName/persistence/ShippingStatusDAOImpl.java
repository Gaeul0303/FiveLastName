package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	public ShippingStatusDTO insert(ShippingStatusDTO ss) {
		return sqlSession.selectOne(namespace+".ssInsert", ss);
	}


	@Override
	public ShippingStatusDTO update(ShippingStatusDTO ss) {
		return sqlSession.selectOne(namespace+".ssUpdate", ss);
	}


	@Override
	public ShippingStatusDTO complete(int ss_id) {
		return sqlSession.selectOne(namespace+".ssComplete", ss_id);
	}
	
}
