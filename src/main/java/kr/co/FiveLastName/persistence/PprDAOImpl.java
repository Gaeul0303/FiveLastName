package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.ProcurementPlanRegistrationDTO;

@Repository
public class PprDAOImpl implements PprDAO{

	@Inject
	private SqlSession sqlsession;
	
	private static final String namespace = "kr.co.FiveLastName.pprMapper";
	@Override
	public List<ProcurementPlanRegistrationDTO> ppr_selectAll() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".ppr_selectAll");
	}
	@Override
	public void ppr_insert(ProcurementPlanRegistrationDTO dto) {
		// TODO Auto-generated method stub
		sqlsession.insert(namespace + ".ppr_insert", dto);
		
	}
	@Override
	public ProcurementPlanRegistrationDTO ppr_selectOne(int ppr_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".ppr_selectOne", ppr_id);
	}
	@Override
	public int ppr_update(ProcurementPlanRegistrationDTO dto) {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace + ".ppr_update", dto);
	}

}
