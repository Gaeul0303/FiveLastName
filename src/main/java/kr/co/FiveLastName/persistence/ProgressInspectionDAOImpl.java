package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.ProgressInspectionDTO;

@Repository
public class ProgressInspectionDAOImpl implements ProgressInspectionDAO{

	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "kr.co.FiveLastName.progressInspectionMapper";
	
	@Override
	public List<ProgressInspectionDTO> piAllSelect() {
		return sqlSession.selectList(namespace+".piAllSelect");
	}
	@Override
	public ProgressInspectionDTO piSelect(int pi_id) {
		return sqlSession.selectOne(namespace+".piSelect", pi_id);
	}
	@Override
	public ProgressInspectionDTO piSearch(int ss_id) {
		return sqlSession.selectOne(namespace+".piSearch", ss_id);
	}
	
	
}
