package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.EstimateDTO;
import kr.co.FiveLastName.domain.ProductDTO;

@Repository
public class EstimateDAOImpl implements EstimateDAO{

	@Inject
	private SqlSession sqlsession;
	private static String namespace = "kr.co.FiveLastName.estimateMapper";
	@Override
	public List<EstimateDTO> list() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".es_selectAll");
	}
	@Override
	public void register(EstimateDTO dto) {
		// TODO Auto-generated method stub
		 sqlsession.insert(namespace+".es_insert",dto);
	}
	@Override
	public List<EstimateDTO> esOne(int pp_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".es_selectOne",pp_id);
	}
	@Override
	public void update(EstimateDTO dto) {
		// TODO Auto-generated method stub
		sqlsession.update(namespace+".es_update", dto);
	}
	@Override
	public EstimateDTO select(int es_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".es_select",es_id);
	}

	
	

	
}
