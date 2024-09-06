package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.EstimateDTO;
import kr.co.FiveLastName.domain.PartnerDTO;
import kr.co.FiveLastName.domain.ProductDTO;

@Repository
public class PartnerDAOImpl implements PartnerDAO{

	@Inject
	private SqlSession sqlsession;
	private static String namespace = "kr.co.FiveLastName.partnerMapper";
	@Override
	public List<PartnerDTO> list() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".pa_selectAll");
	}
	@Override
	public PartnerDTO paOne(int pr_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".pa_selectone",pr_id);
	}
	
	
	

	
}
