package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.ProgressInspectionDTO;
import kr.co.FiveLastName.domain.ProgressInspectionRecordDTO;

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
	@Override
	public int pirSearch(int ss_id) {
		System.out.println("DAO : pirSearch 입니다.ss_id = " + ss_id);
		return sqlSession.selectOne(namespace+".pirSearch", ss_id);
	}
	@Override
	public List<ProgressInspectionRecordDTO> piRecord(int ss_id) {
		return sqlSession.selectList(namespace+".piRecord", ss_id);
	}
	@Override
	public ProgressInspectionRecordDTO piRecordOne(int ss_id) {
		return sqlSession.selectOne(namespace+".piRecord", ss_id);
	}
	
}
