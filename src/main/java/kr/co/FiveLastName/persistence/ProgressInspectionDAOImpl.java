package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.PartnerDTO;
import kr.co.FiveLastName.domain.ProgressInspectionDTO;
import kr.co.FiveLastName.domain.ProgressInspectionRecordDTO;
import kr.co.FiveLastName.domain.ShippingStatusDTO;
import kr.co.FiveLastName.domain.StaffDTO;

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
	@Override
	public ProgressInspectionDTO piInsert(ProgressInspectionDTO pi) {
		return sqlSession.selectOne(namespace+".piInsert", pi);
	}
	@Override
	public ProgressInspectionDTO piUpdate(ProgressInspectionDTO pi) {
		return sqlSession.selectOne(namespace+".piUpdate", pi);
	}
	@Override
	public ProgressInspectionRecordDTO insertRecord(ProgressInspectionDTO pi) {
		System.out.println("insertRecord 입니다. pi = " + pi);
		return sqlSession.selectOne(namespace+".insertRecord", pi);
	}
	@Override
	public ShippingStatusDTO ssComplete(int ss_id) {
		return sqlSession.selectOne(namespace+".ssComplete", ss_id);
	}
	@Override
	public StaffDTO stSelect(int st_id) {
		return sqlSession.selectOne(namespace+".stSelect", st_id);
	}
	@Override
	public PartnerDTO paSelect(int pa_id) {
		return sqlSession.selectOne(namespace+".paSelect", pa_id);
	}
	
}
