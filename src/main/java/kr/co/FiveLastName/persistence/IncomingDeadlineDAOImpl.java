package kr.co.FiveLastName.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.FiveLastName.domain.IncomingDeadlineDTO;

@Repository
public class IncomingDeadlineDAOImpl implements IncomingDeadlineDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static String namespace = "kr.co.FiveLastName.IdMapper";
	
	@Override
	public List<IncomingDeadlineDTO> id_list() {
		// 입고마감 조회
		return sqlSession.selectList(namespace+".id_list");
	}

	@Override
	public IncomingDeadlineDTO id_selectOne(String id_code) {
		// 입고마감 상세 조회
		return sqlSession.selectOne(namespace+".id_selectOne", id_code);
	}

	@Override
	public IncomingDeadlineDTO id_insert(IncomingDeadlineDTO idDTO) {
		// 입고마감 등록
		return sqlSession.selectOne(namespace+".id_insert", idDTO);
	}

	@Override
	public IncomingDeadlineDTO id_update(IncomingDeadlineDTO idDTO) {
		// 입고마감 수정
		return sqlSession.selectOne(namespace+".id_update", idDTO);
	}

}
