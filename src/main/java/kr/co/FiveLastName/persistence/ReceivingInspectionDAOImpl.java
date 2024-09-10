package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.ReceivingInspectionDTO;

@Repository
public class ReceivingInspectionDAOImpl implements ReceivingInspectionDAO {

	@Inject
	SqlSession sqlSession;
	
	private static String nameSpace = "kr.co.FiveLastName.RiMapper";
	
	@Override
	public List<ReceivingInspectionDTO> ri_list() {
		// 조회
		return sqlSession.selectList(nameSpace+".ri_list");
	}

	@Override
	public ReceivingInspectionDTO ri_selectOne(int ri_id) {
		// 상세조회
		return sqlSession.selectOne(nameSpace+".ri_selectOne");
	}

	@Override
	public ReceivingInspectionDTO ri_insert(ReceivingInspectionDTO riDTO) {
		// 등록
		return sqlSession.selectOne(nameSpace+".ri_insert", riDTO);
	}

	@Override
	public ReceivingInspectionDTO ri_update(ReceivingInspectionDTO riDTO) {
		// 수정
		return sqlSession.selectOne(nameSpace+".ri_update", riDTO);
	}


}
