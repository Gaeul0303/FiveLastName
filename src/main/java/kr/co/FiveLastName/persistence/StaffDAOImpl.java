package kr.co.FiveLastName.persistence;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.StaffDTO;

@Repository
public class StaffDAOImpl implements StaffDAO{

	@Inject
	SqlSession sqlsession;
	private static String namespace = "kr.co.FiveLastName.staffMapper";
	
	
	@Override
	public Map<String, Object> login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".login", map);
	}


}
