package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.ProcurmentPlanDTO;


@Repository
public class PpDAOImpl implements PpDAO{

	@Inject
	private SqlSession sqlsession;
	
	private static final String namespace = "kr.co.FiveLastName.ppMapper";
	
	//조달 계획 등록
	@Override
	public void pp_insert(ProcurmentPlanDTO dto) {
		sqlsession.insert(namespace + ".pp_insert", dto);
		
	}
	
	//조달 계획 전체 조회
	@Override
	public List<ProcurmentPlanDTO> pp_selectAll() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace + ".pp_selectAll");
	}


}
