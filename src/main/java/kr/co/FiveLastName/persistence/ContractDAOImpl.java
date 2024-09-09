package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.ContractDTO;


@Repository
public class ContractDAOImpl implements ContractDAO {
	@Inject
	private SqlSession sqlsession;
	private static String namespace = "kr.co.FiveLastName.contractMapper";
	
	
	@Override
	public void register(ContractDTO dto) {
		// TODO Auto-generated method stub
		sqlsession.insert(namespace+".co_insert", dto);
	}

	@Override
	public List<ContractDTO> list() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".co_selectAll");
	}

	@Override
	public ContractDTO coOne(int co_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".co_selectOne",co_id);
	}

	@Override
	public void update(ContractDTO dto) {
		// TODO Auto-generated method stub
		sqlsession.update(namespace+".co_update",dto);
	}
	
}
